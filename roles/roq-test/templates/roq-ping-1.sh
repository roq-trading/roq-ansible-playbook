#!/usr/bin/env bash

set -e

source "{{ root }}/miniconda/bin/activate" ""

NAME="roq_ping_1"

"$CONDA_PREFIX/bin/roq-ping" \
    --name "$NAME" \
    --dispatcher-affinity 0 \
    --market-data-affinity 1 \
    --listen "{{ root }}/var/tmp/$NAME.sock" \
    --metrics "{{ root }}/var/tmp/$NAME-metrics.sock" \
    $@
