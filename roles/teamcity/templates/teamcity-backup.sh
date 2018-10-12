#!/usr/bin/env bash

set -e

TIMESTAMP=$(date -u +'%Y%m%d-%H%M%S')
SNAPSHOT="/var/backups/teamcity/$TIMESTAMP.zip"

echo "Creating $SNAPSHOT..."

docker exec teamcity.service \
  bash -c "cd /opt/teamcity/bin; TEAMCITY_APP_DIR=../webapps/teamcity /opt/teamcity/bin/maintainDB.sh backup --include-config --include-database --include-build-logs --include-personal-changes --include-supplementary-data --backup-file $SNAPSHOT"

echo "Done!"
