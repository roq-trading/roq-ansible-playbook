#!/usr/bin/env bash

set -e

BIN="{{ root }}/miniconda/bin/roq-hitbtc"

ARGS="${@:-"--flagfile={{ root }}/etc/roq/roq-hitbtc.gflags"}"

if [[ $- == *i* ]]; then
  exec "$BIN" "$ARGS"
else
  "$BIN" "$ARGS"
fi
