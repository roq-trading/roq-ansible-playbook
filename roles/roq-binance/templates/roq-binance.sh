#!/usr/bin/env bash

set -e

BIN="{{ root }}/miniconda/bin/roq-binance"

ARGS="${@:-"--flagfile={{ root }}/etc/roq/roq-binance.gflags"}"

if [[ $- == *i* ]]; then
  exec "$BIN" "$ARGS"
else
  "$BIN" "$ARGS"
fi
