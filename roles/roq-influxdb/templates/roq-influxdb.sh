#!/usr/bin/env bash

set -e

ARGS="${@:-"--flagfile={{ root }}/etc/roq/roq-influxdb.gflags"}"

"{{ root }}/miniconda/bin/roq-influxdb" "$ARGS" \
  "{{ root }}/var/tmp/roq-simulator.roq"
