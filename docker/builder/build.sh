#!/usr/bin/env bash
#
# Clone repositories needed to do a build and build a dev-env image.
set -euo pipefail
IFS=$'\n\t'

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $SCRIPT_DIR
mkdir projects
git clone --branch="$KBH_BILLEDER_BRANCH" https://github.com/CopenhagenCityArchives/kbh-billeder.git projects/kbh-billeder
git clone --branch="$COLLECTIONS_ONLINE_BRANCH" https://github.com/CopenhagenCityArchives/collections-online.git projects/collections-online
git clone --branch="$COLLECTIONS_ONLINE_CUMULUS_BRANCH" https://github.com/CopenhagenCityArchives/collections-online-cumulus.git projects/collections-online-cumulus

# This file is required to exist
touch projects/kbh-billeder/google-key.json

docker build --tag eu.gcr.io/kbh-billeder/kbhbilleder-docker -f "Dockerfile-dev-env" .
