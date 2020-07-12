#!/bin/bash

container=${1}

docker container inspect --format "{{ .NetworkSettings.IPAddress }}" ${container}
