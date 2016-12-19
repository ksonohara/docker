#!/bin/bash

source /.docker/config

chmod 755 /.docker/init.sh
chmod 755 /.docker/setup.sh
chmod 755 /.docker/service.sh

/.docker/init.sh

[ -f /.docker/setup ] || {
  /.docker/setup.sh
}

/.docker/service.sh
