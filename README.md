# ClickHouse E-commerce

<img src="https://clickhouse.com/images/media/ch_logo_wht_md_vert.svg" alt="drawing" width="350"/><br>
This repository provides a setup for a ClickHouse database designed to handle e-commerce data. It includes Docker configurations to initialize the database and populate it with sample data for testing and development purposes.

## Data Source
The ecommerce_db data is fetched from [E-commerce Analytics: Detailed Dataset](https://www.kaggle.com/datasets/deepowerz/e-commerce-database-100-000-product). This dataset represents a relational database schema for an e-commerce platform, including tables for products, customers, orders, payment information, suppliers, and returns. It's designed to illustrate the structure and relationships within a typical e-commerce system.
### Dataset License
This dataset is licensed under the [CC BY-NC 4.0](https://creativecommons.org/licenses/by-nc/4.0/) license, allowing for non-commercial use with attribution.
## Repository Structure
```
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
