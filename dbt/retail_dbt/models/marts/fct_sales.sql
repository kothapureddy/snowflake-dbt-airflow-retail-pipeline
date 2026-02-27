{{ config(
    materialized = 'incremental',
    schema = 'MART',
    unique_key = 'order_id'
) }}

SELECT
    order_id,
    customer_id,
    product_id,
    order_date,
    total_amount
FROM {{ ref('int_order_details') }}

{% if is_incremental() %}
WHERE order_date > (
    SELECT COALESCE(MAX(order_date),'1900-01-01')
    FROM {{ this }})
{% endif %}
