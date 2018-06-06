#!/usr/bin/env bash
#
# Build a builder-image that can be used by google cloud builder.
# See kbh-billeder/cloudbuild.yaml
#
set -euo pipefail
IFS=$'\n\t'

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

docker build -t eu.gcr.io/kbh-billeder/kbhbilleder-container-builder -f "${SCRIPT_DIR}/../docker/builder/Dockerfile-builder" "${SCRIPT_DIR}/../"
docker push eu.gcr.io/kbh-billeder/kbhbilleder-container-builder
