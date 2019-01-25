#!/usr/bin/env bash

set -e

source "{{ root }}/miniconda/bin/activate" ""

NAME="roq_ping_2"

"$CONDA_PREFIX/bin/roq-ping" \
    --name "$NAME" \
    --dispatcher-affinity 2 \
    --market-data-affinity 3 \
    --listen "{{ root }}/var/tmp/$NAME.sock" \
    --metrics "{{ root }}/var/tmp/$NAME-metrics.sock" \
    $@
