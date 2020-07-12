#!/bin/bash

containers=`docker container ls -aq`

docker container rm ${containers}
