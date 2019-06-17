#!/usr/bin/env bash

set -e

ARGS="${@:-"--flagfile={{ root }}/etc/roq/roq-simulator.flags"}"

"{{ root }}/miniconda/bin/roq-simulator" "$ARGS"
