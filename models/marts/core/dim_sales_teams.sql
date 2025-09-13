{{ config(materialized='table') }}

with base as (
  select * from {{ ref('staging_salesteams') }}
)
select
  {{ dbt_utils.generate_surrogate_key(['sales_agent']) }} as sales_agent_key,  -- surrogate
  sales_agent, manager, regional_office
from base