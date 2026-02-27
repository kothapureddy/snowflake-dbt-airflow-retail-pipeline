{% snapshot customer_snapshot %}

{{
    config(
        target_schema='MART',
        unique_key='customer_id',
        strategy='check',
        check_cols=['name','city']
    )
}}

SELECT * FROM {{ source('raw','customers') }}

{% endsnapshot %}