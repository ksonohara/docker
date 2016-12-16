#!/bin/bash

source /.docker/config

chmod 755 /.docker
chmod 755 /.docker/*.sh

/.docker/init.sh

[ -f /.docker/setup ] || {
  /.docker/setup.sh
}

/.docker/service.sh
