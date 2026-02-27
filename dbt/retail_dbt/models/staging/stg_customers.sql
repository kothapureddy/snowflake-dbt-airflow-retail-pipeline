{{ config(materialized='view', schema='STAGING') }}

SELECT
    customer_id,
    name,
    city,
    signup_date
FROM {{ source('raw','customers') }}