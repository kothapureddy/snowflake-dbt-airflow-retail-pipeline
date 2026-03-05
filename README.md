# Snowflake + dbt + Airflow Retail Pipeline

End-to-end CDC pipeline using:

* Snowflake Streams, Tasks, Stored Procedures
* dbt (staging → intermediate → marts)
* Incremental processing
* SCD Type-2 Snapshots
* Airflow orchestration → inprogress

## Flow

RAW → Stream → Task → Procedure → STAGING
→ dbt → MART
→ Snapshot (history)
→ Airflow scheduling → inprogress

## Setup

1. Run Snowflake scripts in order:
   snowflake/01 → 06

2. Configure dbt profile

3. Run:
   dbt run
   dbt snapshot
   dbt test

4. Deploy Airflow DAG → inprogress

## Test Incremental

Run:
snowflake/07_test_data_generator.sql

Then:
dbt run --select fct_sales

## Dynamic Data Generation

Generate initial data:
python data_generator/generate_initial_data.py

Generate incremental data:
python data_generator/generate_incremental_data.py

Upload CSVs to Snowflake stage and run COPY commands.
