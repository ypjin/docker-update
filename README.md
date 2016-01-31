tutum/docker-update
=========================

System container used by [Tutum](http://www.tutum.co/) to upgrade Docker on user nodes. System containers are launched, configured and managed automatically by Tutum.

## Usage

    docker run \
      --privileged \
      --rm \
      -v /usr/lib/tutum:/usr/lib/tutum:rw \
      -e DOCKER_VERSION=1.9.1
      tutum/docker-update

## Arguments

* The volume on the host (`/usr/lib/tutum`) is the place you want to copy docker binary to.
* `$DOCKER_VERSION` is the docker version you want to upgrade to, e.g. `1.9.1`
