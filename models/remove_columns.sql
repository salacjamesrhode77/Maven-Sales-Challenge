{{ config(materialized='table', alias='removed_columns') }}

select
  account,
  sector,
  year_established,
  revenue,
  employees
from {{ source('public', 'maventech_accounts') }}
