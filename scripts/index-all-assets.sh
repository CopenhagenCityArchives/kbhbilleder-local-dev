#!/usr/bin/env bash
set -euo pipefail

docker-compose exec node npm run index all
