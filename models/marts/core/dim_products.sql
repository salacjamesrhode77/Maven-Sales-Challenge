{{ config(materialized='table') }}

with base as (
  select * from {{ ref('staging_products') }}
)
select
  {{ dbt_utils.generate_surrogate_key(['product']) }} as product_key,  -- surrogate
  product, series, sales_price
from base