FROM clickhouse/clickhouse-server:24.6

# Create and initialize the database with tables
COPY init-db.sh /docker-entrypoint-initdb.d/
COPY data /data