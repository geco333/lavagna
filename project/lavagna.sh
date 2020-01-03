#!/bin/bash

echo "Waiting for database start."

while ! nc -z db 3306; do
	sleep 1;
done


java \
	-Ddatasource.dialect="MYSQL" \
        -Ddatasource.url="jdbc:mysql://db:3306/lavagna?useUnicode=true&characterEncoding=utf-8&useSSL=false" \
	-Ddatasource.username="root" \
	-Ddatasource.password="123" \
	-Dspring.profiles.active="dev" \
	-jar $PWD/target/lavagna-jetty-console.war \
