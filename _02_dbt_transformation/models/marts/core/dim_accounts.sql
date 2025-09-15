{{ config(materialized='table') }}

with base as (
    select
        cast(account as text)               as account,
        cast(sector as text)                as sector,
        cast(revenue as numeric(18,2))      as revenue
    from {{ source('maventech', 'maventech_accounts') }}
)

select
    {{ dbt_utils.generate_surrogate_key(['account']) }} as account_key,
    account, sector, revenue
from base