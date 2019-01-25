#!/usr/bin/env bash

set -e

source "{{ root }}/miniconda/bin/activate" ""

NAME="pong_2"

SERVER_1="roq_ping_1"
SERVER_2="roq_ping_2"

"$CONDA_PREFIX/bin/roq-pong" \
    --name "$NAME" \
    --dispatcher-affinity 5 \
    "{{ root }}/var/tmp/$SERVER_1.sock" \
    "{{ root }}/var/tmp/$SERVER_2.sock" \
    $@
