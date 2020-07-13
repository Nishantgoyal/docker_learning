#!/bin/bash

# Create new virtual network

# docker network create dns_test

# Create two containers from 'elasticsearch:2' image
# docker image pull elasticsearch:2
# docker image pull ubuntu:14.04

running_containers=`docker container ls -q`
docker container stop ${running_containers}

# all_containers=`docker container ls -aq`
# docker container rm ${all_containers}

docker container run --net dns_test --rm -d --network-alias search elasticsearch:2
docker container run --net dns_test --rm -d --network-alias search elasticsearch:2

docker container run --net dns_test --rm -it alpine nslookup search
echo "docker container run --net dns_test --rm -it centos:7 curl -s search:9200"
