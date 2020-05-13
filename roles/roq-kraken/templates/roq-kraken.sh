#!/usr/bin/env bash

set -e

BIN="{{ root }}/miniconda/bin/roq-kraken"

ARGS="${@:-"--flagfile={{ root }}/etc/roq/roq-kraken.gflags"}"

if [[ $- == *i* ]]; then
  exec "$BIN" "$ARGS"
else
  "$BIN" "$ARGS"
fi
