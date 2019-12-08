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

mkdir -p "{{ backups }}/roq-deribit"

rsync -av "{{ root }}/var/lib/roq/roq-deribit/" "{{ backups }}/roq-deribit"

# TODO(thraneh): remove older files from source

echo "Done!"
