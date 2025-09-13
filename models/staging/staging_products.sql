{{ config(materialized='view') }}

with src as (
  select
    cast(product as text)       as product_raw,
    cast(series as text)        as series,
    cast(sales_price as numeric(19,4)) as sales_price
  from {{ source('public', 'maventech_products') }}
)
select
  -- join key: uppercase + no spaces
  upper(regexp_replace(btrim(product_raw), '\s+', '', 'g')) as product_join_key,
  -- cleaned display name
  btrim(regexp_replace(product_raw, '\s+', ' ', 'g'))        as product,
  series,
  sales_price
from src
