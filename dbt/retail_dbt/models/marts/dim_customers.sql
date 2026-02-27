{{ config( materialized = 'table', schema = 'MART') }}

SELECT DISTINCT *
    FROM {{ ref('stg_customers')}}