#!/bin/bash

# Use different Linux distro versions to check 'curl' command

docker image pull ubuntu:14.04
docker image pull centos:7


docker container run --rm -it ubuntu:14.04 bash -c "apt-get update && apt-get install -y curl; curl --version"
docker container run --rm -it centos:7 bash -c "yum update curl; curl --version"
