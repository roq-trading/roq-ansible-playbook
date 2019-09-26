#!/usr/bin/env bash

set -e

ARGS="${@:-"--flagfile={{ root }}/etc/roq/roq-pong-{{ item }}.gflags"}"

# FIXME(thraneh): we don't need add sockets for $# > 0
"{{ root }}/miniconda/bin/roq-pong" "$ARGS" \
    "{{ root }}/var/tmp/roq-ping-1.sock" \
    "{{ root }}/var/tmp/roq-ping-2.sock"
