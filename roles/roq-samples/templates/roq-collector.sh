#!/usr/bin/env bash

set -e

# activate the conda environment
source "{{ root }}/miniconda/bin/activate" ""

# preload tcmalloc, if present
if [ -e "$CONDA_PREFIX/lib/libtcmalloc.so" ]; then
  export LD_PRELOAD="$CONDA_PREFIX/lib/libtcmalloc.so"
fi

# verbosity (logging)
export ROQ_v="{{ config.logging.verbosity | default(0) }}"

# launch the application
"$CONDA_PREFIX/bin/roq-samples-collector" \
    --gateways "femas=test:1234@{{ root }}/var/tmp/femas.sock" $@
