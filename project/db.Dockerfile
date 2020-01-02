FROM mysql:5.7

ENV MYSQL_ROOT_PASSWORD 123

COPY ./setup.sql /docker-entrypoint-initdb.d/setup.sql
