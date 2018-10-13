#!/usr/bin/env bash

set -e

TIMESTAMP=$(date -u +'%Y%m%d-%H%M%S')

# mounted volume

DATA="{{ root }}/var/lib/gogs"
SNAPSHOT="{{ gogs_backups }}/raw/$TIMESTAMP.tar.bz2"
echo "Creating $SNAPSHOT..."
tar -cjf "$SNAPSHOT" -C "$DATA" .

# native backup
# FIXME(thraneh): backup from inside the container
# https://discuss.gogs.io/t/how-to-backup-restore-and-migrate/991/1
# issue:
#   this command:
# $ su - git -c "USER=git /app/gogs/gogs backup --config=/data/gogs/conf/app.ini"
#   fails like this:
# 2018/09/26 11:28:59 [ INFO] Backup root directory: /tmp/gogs-backup-382462351
# 2018/09/26 11:28:59 [ INFO] Packing backup files to: gogs-backup-20180926112859.zip
# 2018/09/26 11:28:59 [FATAL] Fail to include 'custom': open /app/gogs/custom: no such file or directory

echo "Done!"
