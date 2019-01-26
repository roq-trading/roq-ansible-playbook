#!/usr/bin/env bash

set -e

source "{{ root }}/miniconda/bin/activate" ""

NAME="client-{{ item }}"

SERVER_1="server-1"
SERVER_2="server-2"

"$CONDA_PREFIX/bin/roq-pong" \
    --name "$NAME" \
    --dispatcher-affinity {{ (item | int - 1) + 5 }} \
    --metrics "{{ root }}/var/tmp/${NAME}_metrics.sock" \
    "{{ root }}/var/tmp/$SERVER_1.sock" \
    "{{ root }}/var/tmp/$SERVER_2.sock" \
    $@
