{{ config(materialized='view', schema = 'STAGING') }}

SELECT
    order_id,
    product_id,
    quantity
FROM {{ source('raw', 'order_items') }}