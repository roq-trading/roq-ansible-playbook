#!/usr/bin/env bash

set -e

ARGS="${@:-"--flagfile={{ root }}/etc/roq/roq-coinbase-pro.gflags"}"

"{{ root }}/miniconda/bin/roq-coinbase-pro" "$ARGS"
