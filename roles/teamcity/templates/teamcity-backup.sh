#!/usr/bin/env bash

set -e

TIMESTAMP=$(date -u +'%s')
ROOT="{{ root }}/var/lib/teamcity"

DATA="$ROOT/backups/$TIMESTAMP.zip"

echo "Creating $DATA..."

docker exec teamcity.service \
  bash -c "cd /opt/teamcity/bin; TEAMCITY_APP_DIR=../webapps/teamcity /opt/teamcity/bin/maintainDB.sh backup --include-config --include-database --include-build-logs --include-personal-changes --include-supplementary-data --backup-file $DATA"

echo "Done!"
