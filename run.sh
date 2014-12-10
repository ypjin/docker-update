#!/bin/bash

set -e

DOCKER_DIR="/usr/lib/tutum/"
DOCKER_FILENAME="docker.new"
DOCKER_SIG_FILENAME="docker.new.sig"
if [ "${DOCKER_VERSION}" == "**ChangeMe**" ]; then
    echo "=> Need to specify docker verion using DOCKER_VERSION enviornment variable. Exit(1)"
    exit 1
fi

echo "=> Downloading docker version ${DOCKER_VERSION}"
curl -OL https://files.tutum.co/packages/docker/docker-${DOCKER_VERSION}

echo "=> Downloading docker signature"
curl -OL https://files.tutum.co/packages/docker/docker-${DOCKER_VERSION}.sig

echo "=> Checking MD5 of docker binary"
curl -L https://files.tutum.co/packages/docker/docker-${DOCKER_VERSION}.md5 | md5sum -c -
echo "=> MD5 matched"

mkdir -p ${DOCKER_DIR}
mv docker-${DOCKER_VERSION} ${DOCKER_FILENAME}
mv docker-${DOCKER_VERSION}.sig ${DOCKER_SIG_FILENAME}
chmod +x ${DOCKER_FILENAME}
echo "=> Copy docker binary to ${DOCKER_DIR}"
cp -f ${DOCKER_FILENAME} ${DOCKER_DIR}
echo "=> Copy docker binary signature to ${DOCKER_DIR}"
cp -f ${DOCKER_SIG_FILENAME} ${DOCKER_DIR}
echo "=> Done"
