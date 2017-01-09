# Summary

CentOS 7 base docker container.

# Description

Include centos:7 image.

# Changelog

## 1

    Add [ yum install curl ]

# Usage

## Configuration

### --env

    DOCKER_DEBUG 0

### --port

    None

### --volume

    None

## Examples

### Pull docker container

    docker pull sonohara/centos7-base

### Start docker container

    It's base container. this not run.

### Entrypoint

    /.docker/config Source First and alway.
    /.docker/init.sh Run first and alway.
    /.docker/service.sh Run alway.
    /.docker/setup.sh Run First only.

# Other

## Copyright and license

- Code released under [GNU GENERAL PUBLIC LICENSE Version 3](https://github.com/ksonohara/docker/blob/master/LICENSE)

## Author

K.Sonohara
- GitHub: https://github.com/ksonohara
- Homepage: [ExpertSoftware Inc.](https://www.e-software.company "ExpertSoftware Inc.")
