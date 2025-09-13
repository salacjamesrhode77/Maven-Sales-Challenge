{{ config(materialized='table') }}

with base as (
  select * from {{ ref('staging_accounts') }}
)
select
  {{ dbt_utils.generate_surrogate_key(['account']) }} as account_key,  -- surrogate
  account, sector, year_established, revenue, employees
from base