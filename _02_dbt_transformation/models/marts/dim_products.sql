{{ config(materialized='table') }}

with product_staging as (
    select
        cast(product as text)                       as product,
        cast(series as text)                        as series,
        cast(sales_price as numeric(18,2))          as sales_price
    from {{ source('maventech', 'maventech_products') }}
)

select
    {{ dbt_utils.generate_surrogate_key(['product']) }} as product_key,
    product, series, sales_price
from product_staging
