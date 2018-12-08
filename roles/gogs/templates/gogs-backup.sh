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

mkdir -p {{ backups }}/gogs/{raw,native}

TIMESTAMP=$(date -u +'%Y%m%d-%H%M%S')

# raw backup
DATA="{{ root }}/var/lib/gogs"
SNAPSHOT="{{ backups }}/gogs/raw/$TIMESTAMP.tar.bz2"
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
# TODO(thraneh): if different: copy from /var/run/backups/gogs to {{ backups }}/gogs/native

echo "Done!"
exit 0
