{{ config(materialized='view') }}

select
  CAST(sales_agent AS TEXT) as sales_agent,
  CAST(manager AS TEXT) as manager,
  CAST(regional_office AS TEXT) as regional_office
from {{ source('public', 'maventech_sales_teams') }}
