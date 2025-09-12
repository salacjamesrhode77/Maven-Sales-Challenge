{{ config(materialized='view') }}

select
  cast(account as text) as account,
  cast(sector as text) as sector,
  cast(year_established as bigint) as year_established,
  cast(revenue as numeric(19,4)) as revenue,
  cast(employees as bigint) as employees
from {{ source('public', 'maventech_accounts') }}
