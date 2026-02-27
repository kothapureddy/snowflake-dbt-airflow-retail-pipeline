{{ config(materialized='table', schema = 'STAGING') }}

SELECT
    oi.order_id,
    o.customer_id,
    o.order_date,
    oi.product_id,
    p.price,
    oi.quantity,
    oi.quantity * p.price AS total_amount
FROM {{ ref('stg_order_items') }} oi
JOIN {{ ref('stg_orders') }} o
    ON oi.order_id=o.order_id
JOIN {{ ref('stg_products') }} p
    ON oi.product_id = p.product_id
WHERE o.status = 'Completed'