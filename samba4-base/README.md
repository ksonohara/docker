# Summary

Samba 4 base docker container.

# Description

Include sonohara/centos7-base:latest image.

# Usage

## Configuration

### --env

### --port

### --volume

    /.docker

## Examples

### Pull docker container

    docker pull sonohara/samba4-base

### Start Docker Container

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
