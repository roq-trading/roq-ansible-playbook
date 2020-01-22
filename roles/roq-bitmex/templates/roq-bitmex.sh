#!/usr/bin/env bash

set -e

BIN="{{ root }}/miniconda/bin/roq-bitmex"

ARGS="${@:-"--flagfile={{ root }}/etc/roq/roq-bitmex.gflags"}"

if [[ $- == *i* ]]; then
  exec "$BIN" "$ARGS"
else
  "$BIN" "$ARGS"
fi
