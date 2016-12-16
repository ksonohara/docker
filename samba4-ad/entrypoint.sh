#!/bin/bash

ls -lrta / .docker/*
source /.docker/config

/.docker/init.sh

[ -f /.docker/setup ] || {
  /.docker/setup.sh
}

/.docker/service.sh
