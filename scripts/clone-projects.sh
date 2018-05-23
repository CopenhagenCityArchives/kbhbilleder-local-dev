#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source ${SCRIPT_DIR}/../development.env

docker run -ti --rm \
  -e GITHUB_TOKEN=$GITHUB_TOKEN \
  -e KBH_BILLEDER_BRANCH=$KBH_BILLEDER_BRANCH \
  -e COLLECTIONS_ONLINE_BRANCH=$COLLECTIONS_ONLINE_BRANCH \
  -e COLLECTIONS_ONLINE_CUMULUS_BRANCH=$COLLECTIONS_ONLINE_CUMULUS_BRANCH \
  -v "$SCRIPT_DIR/../projects/":/git \
  -v "$SCRIPT_DIR/../docker/scripts/do-clone.sh":/do-clone.sh \
  --entrypoint=/do-clone.sh \
  alpine/git 
