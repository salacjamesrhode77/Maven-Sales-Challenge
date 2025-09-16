{{ config(
    materialized='incremental',
    unique_key='opportunity_id',
    on_schema_change='sync_all_columns'
) }}

with sp as (
  select * from {{ ref('staging_salespipeline') }}
  {% if is_incremental() %}
    where greatest(engage_date, close_date) > (
      select coalesce(max(greatest(engage_date, close_date)), '1900-01-01'::date) from {{ this }}
    )
  {% endif %}
),
da as (
  select account, account_key
  from {{ ref('dim_accounts') }}
),
dp as (
  select product, product_key, sales_price
  from {{ ref('dim_products') }}
),
dst as (
  select sales_agent, sales_agent_key
  from {{ ref('dim_salesteams') }}
)

select
  sp.opportunity_id,
  dst.sales_agent_key,
  dp.product_key,
  da.account_key,
  sp.deal_stage,
  sp.engage_date,
  sp.close_date,
  sp.close_value,
  case
    when sp.close_date is not null and sp.engage_date is not null
      then sp.close_date - sp.engage_date
    else null
  end as days_closed,
  dp.sales_price,
  case
    when sp.close_value is not null and sp.close_value > 0
      then round(((dp.sales_price - sp.close_value) / dp.sales_price)/ 5)* 5
    else null
  end as price_deviation
from sp
left join dst on sp.sales_agent = dst.sales_agent
left join dp  on sp.product      = dp.product
left join da  on sp.account      = da.account
