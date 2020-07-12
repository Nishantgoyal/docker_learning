#!/bin/bash

network=${1}

docker network inspect ${network}
