#!/usr/bin/env bash

set -e

TIMESTAMP=$(date -u +'%s')
ROOT="{{ root }}/var/lib/postgres"
POSTGRES="$ROOT/backups/$TIMESTAMP.gz"

echo "Creating $POSTGRES..."

docker exec postgres.service pg_dumpall --username "{{ postgres.user }}" | gzip > "$POSTGRES"

echo "Done!"
