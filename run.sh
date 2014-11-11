#!/bin/bash

set -e

DOCKER_DIR="/usr/lib/tutum/"
DOCKER_FILENAME="docker.new"

if [ "${DOCKER_VERSION}" == "**ChangeMe**" ]; then
    echo "=> Need to specify docker verion using DOCKER_VERSION enviornment variable. Exit(1)"
    exit 1
fi

echo "=> Downloading docker version ${DOCKER_VERSION}"
curl -OL https://files.tutum.co/packages/docker/docker-${DOCKER_VERSION}

echo "=> Checking MD5 of docker binary"
curl -L https://files.tutum.co/packages/docker/docker-${DOCKER_VERSION}.md5 | md5sum -c -
echo "=> MD5 matched"

echo "=> Copy docker binary to ${DOCKER_DIR}"
mkdir -p ${DOCKER_DIR}
mv docker-${DOCKER_VERSION} ${DOCKER_FILENAME}
chmod +x ${DOCKER_FILENAME}
cp -f ${DOCKER_FILENAME} ${DOCKER_DIR}
echo "=> Done"
