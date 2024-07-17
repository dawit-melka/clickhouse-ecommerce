# ClickHouse E-commerce

<div style="text-align: center;">
    <img src="https://clickhouse.com/images/media/ch_logo_mx_sm.svg" alt="clickhouse logo" width="350">
</div>
<br>
This repository provides a setup for a ClickHouse database designed to handle e-commerce data. It includes Docker configurations to initialize the database and populate it with sample data for testing and development purposes.

## Data Source

The ecommerce_db data is fetched from [E-commerce Analytics: Detailed Dataset](https://www.kaggle.com/datasets/deepowerz/e-commerce-database-100-000-product). This dataset represents a relational database schema for an e-commerce platform, including tables for products, customers, orders, payment information, suppliers, and returns. It's designed to illustrate the structure and relationships within a typical e-commerce system.

### Dataset License

This dataset is licensed under the [CC BY-NC 4.0](https://creativecommons.org/licenses/by-nc/4.0/) license, allowing for non-commercial use with attribution.

## Repository Structure

``` plaintext
.
├── Dockerfile
├── docker-compose.yml
├── init-db.sh
├── data
│   ├── customers.csv
│   ├── returns.csv
│   ├── products.csv
│   ├── payment_info.csv
│   ├── orders.csv
│   └── suppliers.csv
└── README.md
```

## Getting Started

### Step 1: Clone the Repository

Clone this repository and navigate to its directory:

``` bash
git clone https://github.com/nabilraihann/clickhouse-ecommerce.git
cd clickhouse-ecommerce
```

### Step 2: Build and Start the Docker Container

Start the ClickHouse server using Docker Compose:

``` bash
docker-compose up --build
```

### Step 3: Connect to DBMS (e.g DBeaver)

Create a new connection to the DBMS using the configuration below:

``` plaintext
Connect by      : Host
Host            : localhost
Database/schema : dwh
Port            : 8123
Username        : default
Password        : (blank)
```
