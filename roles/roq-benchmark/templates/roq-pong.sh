#!/usr/bin/env bash

set -e

# variables
NAME="client-{{ item }}"
SERVER_1="server-1"
SERVER_2="server-2"

# activate the conda environment
source "{{ root }}/miniconda/bin/activate" ""

# verbosity (logging)
export ROQ_v="{{ config.logging.verbosity | default(0) }}"

# launch the application
"$CONDA_PREFIX/bin/roq-pong" \
    --name "$NAME" \
    --dispatcher-affinity {{ (item | int - 1) + 5 }} \
    --metrics "{{ root }}/var/tmp/${NAME}_metrics.sock" \
    "{{ root }}/var/tmp/$SERVER_1.sock" \
    "{{ root }}/var/tmp/$SERVER_2.sock" \
    $@
