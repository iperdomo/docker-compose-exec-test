#!/usr/bin/env bash

set -eux

docker-compose config
docker-compose up -d

docker-compose exec -T alpine touch /bind/bind.txt
docker-compose exec -T alpine touch /default/default.txt
docker-compose exec -T alpine touch /delegated/delegated.txt

[[ -f "bind.txt" ]] || { echo "bind.txt not found"; exit 1; }
[[ -f "default.txt" ]] || { echo "default.txt not found"; exit 1; }
[[ -f "delegated.txt" ]] || { echo "delegated.txt not found"; exit 1; }

echo "Done"
