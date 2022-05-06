#!/usr/bin/env bash

set -eux

docker-compose config
docker-compose up -d

node-exec() {
	docker-compose exec -T node "$@"
}

test-file() {
	if [[ -f "${1}" ]]; then
		echo "${1} found"
	else
        echo "${1} not found"
        exit 1
	fi
}

node-exec npm ci --no-progress
test-file client/node_modules/.package-lock.json

node-exec npm run build
test-file client/build/index.html
echo "Done"
