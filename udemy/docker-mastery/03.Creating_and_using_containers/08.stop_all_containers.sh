#!/bin/bash

containers=`docker container ls -q`

docker container stop ${containers}
