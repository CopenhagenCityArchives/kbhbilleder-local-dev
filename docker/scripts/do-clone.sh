#!/usr/bin/env ash
set -euo pipefail

git clone --branch="$KBH_BILLEDER_BRANCH" https://$GITHUB_TOKEN@github.com/CopenhagenCityArchives/kbh-billeder.git kbh-billeder
git clone --branch="$COLLECTIONS_ONLINE_BRANCH" https://$GITHUB_TOKEN@github.com/CopenhagenCityArchives/collections-online.git collections-online
git clone --branch="$COLLECTIONS_ONLINE_CUMULUS_BRANCH" https://$GITHUB_TOKEN@github.com/CopenhagenCityArchives/collections-online-cumulus.git collections-online-cumulus

# This file is required to exist
touch kbh-billeder/google-key.json
