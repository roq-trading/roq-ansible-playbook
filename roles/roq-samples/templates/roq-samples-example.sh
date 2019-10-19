#!/usr/bin/env bash

set -e

ARGS="${@:-"--flagfile={{ root }}/etc/roq/roq-samples-example-{{ item }}.gflags"}"

"{{ root }}/miniconda/bin/roq-samples-example-{{ item }}" "$ARGS"
