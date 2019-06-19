#!/usr/bin/env bash

set -e

ARGS="${@:-"--flagfile={{ root }}/etc/roq/roq-simulator.gflags"}"

# FIXME(thraneh): need a better approach to discovering files, e.g. now-1bday
"{{ root }}/miniconda/bin/roq-simulator" "$ARGS" \
  "{{ root }}/miniconda/share/roq/data/USTP_Multi_20180223.csv"
