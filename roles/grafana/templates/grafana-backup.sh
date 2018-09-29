#!/usr/bin/env bash

set -e

TIMESTAMP=$(date -u +'%s')
ROOT="{{ root }}/var/lib/grafana"

DATA="$ROOT/backups/$TIMESTAMP.zip"

echo "Creating $DATA..."
tar -cjf "$DATA.tar.bz2" -C "$ROOT/data" .

echo "Done!"
