#!/usr/bin/env bash

set -e

ARGS="${@:-"--flagfile={{ root }}/etc/roq/roq-ping-{{ item }}.gflags"}"

"{{ root }}/miniconda/bin/roq-ping" "$ARGS"
