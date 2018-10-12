#!/usr/bin/env bash

set -e

TIMESTAMP=$(date -u +'%Y%m%d-%H%M%S')
DATA="{{ root }}/var/lib/grafana"

SNAPSHOT="{{ grafana_backups }}/$TIMESTAMP"

echo "Creating $SNAPSHOT..."
tar -cjf "$SNAPSHOT.tar.bz2" -C "$DATA" .

echo "Done!"
