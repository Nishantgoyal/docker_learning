#!/bin/bash

image=${1}

docker image history ${image}
