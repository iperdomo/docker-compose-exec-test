#!/usr/bin/env bash

set -eux

docker-compose up --detach
docker-compose exec client npm ci --no-progress
find client/
