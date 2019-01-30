#!/usr/bin/env bash

set -e

source "{{ root }}/miniconda/bin/activate" ""

NAME="server-{{ item }}"

"$CONDA_PREFIX/bin/roq-ping" \
    --name "$NAME" \
    --dispatcher-affinity {{ 2 * (item | int - 1) + 1 }} \
    --market-data-affinity {{ 2 * (item | int - 1) + 2 }} \
    --metrics "{{ root }}/var/tmp/${NAME}_metrics.sock" \
    --listen "{{ root }}/var/tmp/$NAME.sock" \
    $@
