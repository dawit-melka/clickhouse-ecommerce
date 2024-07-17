FROM clickhouse/clickhouse-server:24.6

RUN apt-get update

RUN apt-get -y install dos2unix

# Create and initialize the database with tables
COPY init-db.sh /docker-entrypoint-initdb.d/
COPY data /data

RUN dos2unix /docker-entrypoint-initdb.d/*.sh