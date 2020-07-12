#!/bin/bash

echo "Assignment: Manage multiple containers"

docker container run -d --name lb -p 80:80 nginx

docker container run --name db -p 3306:3306 -e MYSQL_RANDOM_ROOT_PASSWORD=yes -d mysql

docker container run -d --name web -p 8080:80 httpd
