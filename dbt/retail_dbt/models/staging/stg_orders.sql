{{ config(materialized='view', schema = 'STAGING') }}

SELECT
    order_id,
    customer_id,
    order_date,
    status
FROM {{ source('staging', 'orders_incremental') }}