#!/bin/sh
set -e

# Source config
FILES_HOST="${FILES_HOST:-https://files.tutum.co}"
DOCKER_BINARY_FILENAME="docker-${DOCKER_VERSION}"
DOCKER_BINARY_URL="${DOCKER_BINARY_URL:-${FILES_HOST}/packages/docker/${DOCKER_BINARY_FILENAME}}"
DOCKER_BINARY_SIGNATURE_URL="${DOCKER_BINARY_SIGNATURE_URL:-${FILES_HOST}/packages/docker/${DOCKER_BINARY_FILENAME}.sig}"
DOCKER_BINARY_MD5_URL="${DOCKER_BINARY_MD5_URL:-${FILES_HOST}/packages/docker/${DOCKER_BINARY_FILENAME}.md5}"

# Target config
DOCKER_DIR="${DOCKER_DIR:-/usr/lib/tutum}"
TARGET_DOCKER_BINARY="${TARGET_DOCKER_BINARY:-${DOCKER_DIR}/docker.new}"
TARGET_DOCKER_SIGNATURE="${TARGET_DOCKER_SIGNATURE:-${DOCKER_DIR}/docker.new.sig}"

echo "=> Downloading docker binary"
curl -OL $DOCKER_BINARY_URL

echo "=> Checking MD5 of docker binary"
curl -L $DOCKER_BINARY_MD5_URL | md5sum -c -
echo "=> MD5 matched"

echo "=> Downloading docker signature"
curl -OL $DOCKER_BINARY_SIGNATURE_URL

mkdir -p ${DOCKER_DIR}
chmod +x ${DOCKER_BINARY_FILENAME}
echo "=> Copy docker binary signature to ${TARGET_DOCKER_SIGNATURE}"
cp -f ${DOCKER_BINARY_FILENAME}.sig ${TARGET_DOCKER_SIGNATURE}
echo "=> Copy docker binary to ${TARGET_DOCKER_BINARY}"
cp -f ${DOCKER_BINARY_FILENAME} ${TARGET_DOCKER_BINARY}
echo "=> Done"
