#!/usr/bin/env bash

set -e

if [ ! -d "{{ backups }}" ]; then
  echo "{{ backups }} not ready!"
  exit 1
fi

mkdir -p {{ backups }}/nexus/{raw,native}

TIMESTAMP=$(date -u +'%Y%m%d-%H%M%S')

# raw backup

DATA="{{ root }}/var/lib/nexus/blobs"
SNAPSHOT="{{ backups }}/nexus/raw/$TIMESTAMP.tar.bz2"
echo "Creating $SNAPSHOT..."
tar -cjf "$SNAPSHOT" -C "$DATA" .

# native backup

echo "Done!"
