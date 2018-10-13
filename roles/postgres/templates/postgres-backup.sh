#!/usr/bin/env bash

set -e

TIMESTAMP=$(date -u +'%Y%m%d-%H%M%S')

# mounted volume

DATA="{{ root }}/var/lib/postgres"
SNAPSHOT="{{ postgres_backups }}/raw/$TIMESTAMP.tar.bz2"
echo "Creating $SNAPSHOT..."
tar -cjf "$SNAPSHOT" -C "$DATA" .

# native backup

SNAPSHOT="{{ postgres_backups }}/native/$TIMESTAMP.gz"
echo "Creating $POSTGRES..."
docker exec postgres.service pg_dumpall --username "{{ postgres.user }}" | gzip > "$SNAPSHOT"

echo "Done!"
