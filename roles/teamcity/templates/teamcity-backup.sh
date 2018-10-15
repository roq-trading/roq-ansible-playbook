#!/usr/bin/env bash

set -e

if [ ! -d "{{ backups }}" ]; then
  echo "{{ backups }} not ready!"
  exit 1
fi

mkdir -p {{ backups }}/teamcity/{raw,native}

TIMESTAMP=$(date -u +'%Y%m%d-%H%M%S')

# raw backup

DATA="{{ root }}/var/lib/teamcity"
SNAPSHOT="{{ backups }}/teamcity/raw/$TIMESTAMP.tar.bz2"
echo "Creating $SNAPSHOT..."
tar -cjf "$SNAPSHOT" -C "$DATA" .

# native backup

SNAPSHOT="/var/backups/teamcity/native/$TIMESTAMP.zip"
echo "Creating $SNAPSHOT..."
docker exec teamcity.service \
  bash -c "cd /opt/teamcity/bin; TEAMCITY_APP_DIR=../webapps/teamcity /opt/teamcity/bin/maintainDB.sh backup --include-config --include-database --include-build-logs --include-personal-changes --include-supplementary-data --backup-file $SNAPSHOT"

echo "Done!"
