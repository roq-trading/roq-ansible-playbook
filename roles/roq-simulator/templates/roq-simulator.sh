#!/usr/bin/env bash

set -e

ARGS="${@:-"--flagfile={{ root }}/usr/local/etc/roq-simulator.gflags"}"

# FIXME(thraneh): need a better approach to discovering files, e.g. now-1bday
"{{ root }}/opt/miniconda3/bin/roq-simulator" "$ARGS" \
  "{{ root }}/opt/miniconda3/share/roq/data/USTP_Multi_20180223.csv"
