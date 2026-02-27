CREATE OR REPLACE TABLE STAGING.ORDERS_INCREMENTAL (
    order_id INT,
    customer_id INT,
    order_date DATE,
    status STRING
);

CREATE OR REPLACE PROCEDURE STAGING.LOAD_ORDERS_FROM_STREAM()
RETURNS STRING
LANGUAGE SQL
AS
$$
DECLARE rows_loaded INTEGER;
BEGIN

    INSERT INTO STAGING.ORDERS_INCREMENTAL
    SELECT order_id, customer_id, order_date, status
    FROM RAW.ORDERS_STREAM;

    rows_loaded := SQLROWCOUNT;

    RETURN 'Rows loaded: ' || rows_loaded;

END;
$$;