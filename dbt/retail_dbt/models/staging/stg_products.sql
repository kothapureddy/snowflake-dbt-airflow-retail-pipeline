{{ config(materialized='view', schema='STAGING') }}

SELECT
    product_id,
    product_name,
    category,
    price
FROM {{ source('raw', 'products')}}