tutum/docker-update
=========================

```
    docker run \
      --privileged \
      --rm \
      -v /usr/lib/tutum:/usr/lib/tutum:rw \
      -e DOCKER_VERSION=1.2.0
      tutum/docker-update   

```

**Notices**

```
Volume is the place you want to copy docker binary to.

`DOCKER_VERSION` is the docker version you want to update, e.g. `1.2.0

```
