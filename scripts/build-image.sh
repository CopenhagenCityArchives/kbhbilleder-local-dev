#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd ${SCRIPT_DIR}/../

# check for directories
time docker build --tag eu.gcr.io/kbh-billeder/kbhbilleder-docker:latest -f "${SCRIPT_DIR}/../docker/dev-env-Dockerfile" "${SCRIPT_DIR}/.."
