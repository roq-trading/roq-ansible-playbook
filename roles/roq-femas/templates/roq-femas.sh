#!/usr/bin/env bash

set -e

# activate the conda environment
source "{{ root }}/miniconda/bin/activate"

# preload tcmalloc, if present
if [ -e "$CONDA_PREFIX/lib/libtcmalloc.so" ]; then
  export LD_PRELOAD="$CONDA_PREFIX/lib/libtcmalloc.so"
fi

# define logging parameters
{% if femas_config.use_log_dir %}
export ROQ_log_dir="{{ root }}/var/log/roq"
{% endif %}
export ROQ_v="{{ femas_config.verbosity | default(0) }}"

# launch the application
"$CONDA_PREFIX/bin/roq-femas" \
    --socket-buffer-size 10485760 \
    --spin-usecs 1000 \
    --timer-refresh-usecs 100 \
    --license-file "{{ root }}/etc/roq/femas/license.conf" \
    --config-variables "{{ root }}/etc/roq/femas/variables.conf" \
    --config-file "{{ root }}/etc/roq/femas/master.conf" \
    --local-address "{{ root }}/var/tmp/femas.sock" \
    --monitor-port "{{ roq_femas.metrics.port }}" \
    --name "roq_femas"
