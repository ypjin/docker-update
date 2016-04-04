#!/bin/sh
set -e

[ -z "${DOCKER_VERSION}" ] && echo "=> DOCKER_VERSION must be set !!!" && false
# Source config
FILES_HOST="${FILES_HOST:-https://files.cloud.docker.com}"
DOCKER_TAR_FILENAME="docker-${DOCKER_VERSION}.tgz"
DOCKER_TAR_URL="${DOCKER_TAR_URL:-${FILES_HOST}/packages/docker/${DOCKER_TAR_FILENAME}}"
DOCKER_TAR_SIGNATURE_URL="${DOCKER_TAR_SIGNATURE_URL:-${FILES_HOST}/packages/docker/${DOCKER_TAR_FILENAME}.sig}"
DOCKER_TAR_MD5_URL="${DOCKER_TAR_MD5_URL:-${FILES_HOST}/packages/docker/${DOCKER_TAR_FILENAME}.md5}"

# Target config
DOCKER_DIR="${DOCKER_DIR:-/usr/lib/dockercloud}"
TARGET_DOCKER_TAR="${TARGET_DOCKER_TAR:-${DOCKER_DIR}/docker.tgz}"
TARGET_DOCKER_SIGNATURE="${TARGET_DOCKER_SIGNATURE:-${DOCKER_DIR}/docker.sig}"

echo "=> Downloading docker tarball"
curl -OL ${DOCKER_TAR_URL}

echo "=> Checking MD5 of docker tarball"
curl -L ${DOCKER_TAR_MD5_URL} | md5sum -c -
echo "=> MD5 matched"

echo "=> Downloading docker signature"
curl -OL ${DOCKER_TAR_SIGNATURE_URL}

mkdir -p ${DOCKER_DIR}

echo "=> Copy docker tarball signature to ${TARGET_DOCKER_SIGNATURE}"
cp -f ${DOCKER_TAR_FILENAME}.sig ${TARGET_DOCKER_SIGNATURE}
echo "=> Copy docker tarball to ${TARGET_DOCKER_TAR}"
cp -f ${DOCKER_TAR_FILENAME} ${TARGET_DOCKER_TAR}
echo "=> Done"
