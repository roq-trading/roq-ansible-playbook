#!/usr/bin/env bash

set -e

ARGS="${@:-"--flagfile={{ root }}/etc/roq/roq-ping-{{ item }}.flags"}"

"{{ root }}/miniconda/bin/roq-ping" "$ARGS"
