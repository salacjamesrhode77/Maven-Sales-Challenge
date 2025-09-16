{{ config(materialized='table') }}

with bounds as (
  select
    min(engage_date)::date as min_date,
    max(engage_date)::date as max_date
  from {{ ref('staging_salespipeline') }}
)

select
  gs.date::date                           as date,
  extract(year from gs.date)::int         as "Year",
  to_char(gs.date, 'Mon')                 as "Month",
  concat('Q', extract(quarter from gs.date)::int) as "Quarter"
from bounds
cross join lateral generate_series(bounds.min_date, bounds.max_date, interval '1 day') as gs(date)
where bounds.min_date is not null
