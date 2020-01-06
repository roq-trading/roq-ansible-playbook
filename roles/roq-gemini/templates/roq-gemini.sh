#!/usr/bin/env bash

set -e

BIN="{{ root }}/miniconda/bin/roq-gemini"

ARGS="${@:-"--flagfile={{ root }}/etc/roq/roq-gemini.gflags"}"

if [[ $- == *i* ]]; then
  exec "$BIN" "$ARGS"
else
  "$BIN" "$ARGS"
fi
