#!/usr/bin/env bash

set -eux

docker-compose config
docker-compose up --detach
docker-compose exec --no-TTY client npm ci --no-progress

# Check for `node_modules` folder under `client`
[[ -d "client/node_modules" ]] || { echo "node_modules not present"; exit 1; }
