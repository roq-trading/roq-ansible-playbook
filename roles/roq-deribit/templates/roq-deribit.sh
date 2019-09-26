#!/usr/bin/env bash

set -e

ARGS="${@:-"--flagfile={{ root }}/etc/roq/roq-deribit.gflags"}"

"{{ root }}/miniconda/bin/roq-deribit" "$ARGS"
