#!/usr/bin/env bash

set -e

BIN="{{ root }}/miniconda/bin/roq-deribit"

ARGS="${@:-"--flagfile={{ root }}/etc/roq/roq-deribit.gflags"}"

if [[ $- == *i* ]]; then
  exec "$BIN" "$ARGS"
else
  "$BIN" "$ARGS"
fi
