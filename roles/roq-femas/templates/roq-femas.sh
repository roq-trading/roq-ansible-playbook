#!/usr/bin/env bash

set -e

# activate the conda environment
source "{{ root }}/miniconda/bin/activate"

# define the list of dynamic libraries to preload
LD_PRELOAD="${LD_PRELOAD:-}"
# ... tcmalloc, if present
if [ -e "$CONDA_PREFIX/lib/libtcmalloc.so" ]; then
  LD_PRELOAD="$LD_PRELOAD $CONDA_PREFIX/lib/libtcmalloc.so"
fi
{% if femas_config.preload %}
# ... user specified
LD_PRELOAD="$LD_PRELOAD {{ femas_config.preload | join(" ") }}"
{% endif %}
# ... done
export LD_PRELOAD

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
