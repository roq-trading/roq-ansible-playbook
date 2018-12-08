#!/usr/bin/env bash

set -e

for i in {1..10}; do
  if [ -d "{{ backups }}" ]; then
    echo "{{ backups }} is ready!"
    break
  fi
  if [ "$i" -eq "10" ]; then
    echo "{{ backups }} is *not* ready!"
    exit 1
  fi
  sleep 2
done

mkdir -p {{ backups }}/postgres/{raw,native}

TIMESTAMP=$(date -u +'%Y%m%d-%H%M%S')

# raw backup

DATA="{{ root }}/var/lib/postgres"
SNAPSHOT="{{ backups }}/postgres/raw/$TIMESTAMP.tar.bz2"
echo "Creating $SNAPSHOT..."
tar -cjf "$SNAPSHOT" -C "$DATA" .

# native backup

SNAPSHOT="{{ backups }}/postgres/native/$TIMESTAMP.gz"
echo "Creating $POSTGRES..."
docker exec postgres.service pg_dumpall --username "{{ postgres.user }}" | gzip > "$SNAPSHOT"

echo "Done!"
