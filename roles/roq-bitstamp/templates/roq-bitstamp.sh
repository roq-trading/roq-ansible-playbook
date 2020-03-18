#!/usr/bin/env bash

set -e

BIN="{{ root }}/miniconda/bin/roq-bitstamp"

ARGS="${@:-"--flagfile={{ root }}/etc/roq/roq-bitstamp.gflags"}"

if [[ $- == *i* ]]; then
  exec "$BIN" "$ARGS"
else
  "$BIN" "$ARGS"
fi
