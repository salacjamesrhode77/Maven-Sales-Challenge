{{ config(materialized='table') }}

with sales_teams_staging as (
    select
        cast(sales_agent as text)           as sales_agent,
        cast(manager as text)               as manager,
        cast(regional_office as text)       as regional_office
    from {{ source('maventech', 'maventech_sales_teams') }}
)

select
    {{ dbt_utils.generate_surrogate_key(['sales_agent']) }} as sales_agent_key,
    sales_agent, manager, regional_office
from sales_teams_staging
