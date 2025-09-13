{{ config(materialized='view') }}

select
  cast(opportunity_id as text) as opportunity_id,
  trim(cast(sales_agent as text)) as sales_agent,
  trim(cast(product as text)) as product,
  trim(cast(account as text)) as account,
  cast(deal_stage as text) as deal_stage,
  cast(engage_date as date) as engage_date,
  cast(close_date as date) as close_date,
  cast(close_value as numeric(19,4)) as close_value
from {{ source('public', 'maventech_sales_pipeline') }}
