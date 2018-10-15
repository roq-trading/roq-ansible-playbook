#!/usr/bin/env bash

set -e

TIMESTAMP=$(date -u +'%Y%m%d-%H%M%S')

# mounted volume

DATA="{{ root }}/var/lib/nexus/blobs"
SNAPSHOT="{{ nexus_backups }}/raw/$TIMESTAMP.tar.bz2"
echo "Creating $SNAPSHOT..."
tar -cjf "$SNAPSHOT" -C "$DATA" .

# native backup

echo "Done!"
