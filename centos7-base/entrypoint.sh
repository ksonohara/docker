#!/bin/bash

if [ $DOCKER_DEBUG = 1 ]; then
  ls -lrt / | grep docker
  ls -lrt /.docker
fi
source /.docker/config

/.docker/init.sh

[ -f /.docker/setup ] || {
  /.docker/setup.sh
}

/.docker/service.sh
