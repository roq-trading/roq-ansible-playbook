#!/usr/bin/env bash

set -e

BIN="{{ root }}/miniconda/bin/roq-ftx"

ARGS="${@:-"--flagfile={{ root }}/etc/roq/roq-ftx.gflags"}"

if [[ $- == *i* ]]; then
  exec "$BIN" "$ARGS"
else
  "$BIN" "$ARGS"
fi
