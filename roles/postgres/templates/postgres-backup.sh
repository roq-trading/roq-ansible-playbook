#!/usr/bin/env bash

set -e

TIMESTAMP=$(date -u +'%Y%m%d-%H%M%S')
SNAPSHOT="{{ postgres_backups }}/$TIMESTAMP.gz"

echo "Creating $POSTGRES..."

docker exec postgres.service pg_dumpall --username "{{ postgres.user }}" | gzip > "$SNAPSHOT"

echo "Done!"
