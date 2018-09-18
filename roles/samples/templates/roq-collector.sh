#!/usr/bin/env bash

set -e

# activate the conda environment
source "{{ root }}/miniconda/bin/activate"

# preload tcmalloc, if present
if [ -e "$CONDA_PREFIX/lib/libtcmalloc.so" ]; then
  export LD_PRELOAD="$CONDA_PREFIX/lib/libtcmalloc.so"
fi

# define logging parameters
{% if collector_config.use_log_dir %}
export ROQ_log_dir="{{ root }}/var/log/roq"
{% endif %}
export ROQ_v="{{ collector_config.verbosity | default(0) }}"

# launch the application
"$CONDA_PREFIX/bin/roq-samples-collector" \
    --gateways "femas=test:1234@{{ root }}/var/tmp/femas.sock" \
    >> "{{ root }}/var/lib/roq/femas_$(date +%Y-%m-%d).csv"
