#!/usr/bin/env bash

set -e

BIN="{{ root }}/miniconda/bin/roq-{{ config.options.name }}"

ARGS="${@:-"--flagfile={{ root }}/etc/roq/roq-{{ config.options.name }}.gflags"}"

if [[ $- == *i* ]]; then
  exec "$BIN" "$ARGS"
else
  "$BIN" "$ARGS"
fi
