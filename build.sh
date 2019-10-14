#!/bin/bash

set -e

BUILD_PATH=$1

if [[ -z "${BUILD_PATH}" ]]; then
    echo "=== path to build directory is required"
    echo "Usage: $0 ./path/to/build/directory"
    exit 1
fi

pushd ${BUILD_PATH} > /dev/null

CONFIG=$(cat ./config.json)
IMAGE=$(cat Dockerfile | grep 'LABEL image' | sed 's/LABEL image=//g')

TAG=$(echo ${CONFIG} | jq -r '.tag')
BUILD_ARGS=$(echo ${CONFIG} | jq -r '.args | map("--build-arg \(.)") | join(" ")')

docker build -t ${IMAGE}:${TAG} --build-arg TAG=${TAG} ${BUILD_ARGS} .

popd > /dev/null
