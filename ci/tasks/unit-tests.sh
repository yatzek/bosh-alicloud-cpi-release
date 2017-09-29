#!/usr/bin/env bash

set -e

: ${ALICLOUD_ACCESS_KEY_ID:?}
: ${ALICLOUD_SECRET_ACCESS_KEY:?}
: ${ALICLOUD_DEFAULT_REGION:?}

source bosh-cpi-src/ci/tasks/utils.sh

export GOPATH=${PWD}/bosh-cpi-src
export PATH=${GOPATH}/bin:$PATH

export ACCESS_KEY_ID=${ALICLOUD_ACCESS_KEY_ID}
export ACCESS_KEY_SECRET=${ALICLOUD_SECRET_ACCESS_KEY}

check_go_version $GOPATH
check_go_version $ACCESS_KEY_ID
check_go_version $ACCESS_KEY_SECRET
export GOPATH=${PWD}/bosh-cpi-src

cd ${PWD}/bosh-cpi-src


# logs
echo "begin unit test..."
ls -ll

make
make test
