#!/bin/bash

CLICKHOUSE_CLIENT="clickhouse-client"

# Wait for ClickHouse server to start
until $CLICKHOUSE_CLIENT -q 'SELECT 1'; do
  sleep 1
done

# Create database
$CLICKHOUSE_CLIENT -q "CREATE DATABASE IF NOT EXISTS ecommerce_db"

$CLICKHOUSE_CLIENT -q "CREATE DATABASE IF NOT EXISTS dwh"

# Create tables
$CLICKHOUSE_CLIENT -q "CREATE TABLE ecommerce_db.customers (
    customer_id UInt32,
    first_name String,
    last_name String,
    email String,
    phone String,
    country String,
    city String,
    address String,
    created_at DateTime,
    elt_loaded_at DateTime DEFAULT now()
) ENGINE = MergeTree() ORDER BY customer_id"

$CLICKHOUSE_CLIENT -q "CREATE TABLE ecommerce_db.returns (
    order_id UInt32,
    customer_id UInt32,
    return_reason String,
    return_status String,
    elt_loaded_at DateTime DEFAULT now()
) ENGINE = MergeTree() ORDER BY order_id"

$CLICKHOUSE_CLIENT -q "CREATE TABLE ecommerce_db.products (
    product_id UInt32,
    product_name String,
    category String,
    price Float32,
    stock_status String,
    elt_loaded_at DateTime DEFAULT now()
) ENGINE = MergeTree() ORDER BY product_id"

$CLICKHOUSE_CLIENT -q "CREATE TABLE ecommerce_db.payment_info (
    payment_id UInt32,
    order_id UInt32,
    name_on_card String,
    card_number String,
    card_expire String,
    cvv_number String,
    elt_loaded_at DateTime DEFAULT now()
) ENGINE = MergeTree() ORDER BY order_id"

$CLICKHOUSE_CLIENT -q "CREATE TABLE ecommerce_db.orders (
    order_id UInt32,
    product_id UInt32,
    customer_id UInt32,
    order_date DateTime,
    status String,
    quantity UInt32,
    unit_price Float32,
    total_price Float32,
    elt_loaded_at DateTime DEFAULT now()
) ENGINE = MergeTree() ORDER BY order_id"

$CLICKHOUSE_CLIENT -q "CREATE TABLE ecommerce_db.suppliers (
    seller_id UInt32,
    product_id UInt32,
    seller_name String,
    contact_name String,
    contact_email String,
    contact_phone String,
    country String,
    product_count UInt32,
    elt_loaded_at DateTime DEFAULT now()
) ENGINE = MergeTree() ORDER BY seller_id"

# Insert sample data from CSV files
$CLICKHOUSE_CLIENT --query="INSERT INTO ecommerce_db.customers FORMAT CSV" < /data/customers.csv
$CLICKHOUSE_CLIENT --query="INSERT INTO ecommerce_db.returns FORMAT CSV" < /data/returns.csv
$CLICKHOUSE_CLIENT --query="INSERT INTO ecommerce_db.products FORMAT CSV" < /data/products.csv
$CLICKHOUSE_CLIENT --query="INSERT INTO ecommerce_db.payment_info FORMAT CSV" < /data/payment_info.csv
$CLICKHOUSE_CLIENT --query="INSERT INTO ecommerce_db.orders FORMAT CSV" < /data/orders.csv
$CLICKHOUSE_CLIENT --query="INSERT INTO ecommerce_db.suppliers FORMAT CSV" < /data/suppliers.csv

echo "Database and tables created, and sample data inserted successfully."