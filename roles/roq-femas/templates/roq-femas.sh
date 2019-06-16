#!/usr/bin/env bash

set -e

# activate the conda environment
source "{{ root }}/miniconda/bin/activate"

# define the list of dynamic libraries to preload
LD_PRELOAD="${LD_PRELOAD:-}"
# ... tcmalloc, if present
if [ -e "$CONDA_PREFIX/lib/libtcmalloc.so" ]; then
  LD_PRELOAD="$LD_PRELOAD $CONDA_PREFIX/lib/libtcmalloc.so"
else
  # ... jemalloc, if present
  if [ -e "$CONDA_PREFIX/lib/libjemalloc.so" ]; then
    LD_PRELOAD="$LD_PRELOAD $CONDA_PREFIX/lib/libjemalloc.so"
  fi
fi
{% if femas_config.preload %}
# ... user specified
LD_PRELOAD="$LD_PRELOAD {{ femas_config.preload | join(" ") }}"
{% endif %}
# ... done
export LD_PRELOAD

# define logging parameters
export ROQ_v="{{ femas_config.logging.verbosity | default(0) }}"

# launch the application
"$CONDA_PREFIX/bin/roq-femas" \
    --license-file "{{ root }}/etc/roq/femas/license.conf" \
    --config-variables "{{ root }}/etc/roq/femas/variables.conf" \
    --config-file "{{ root }}/etc/roq/femas/master.conf" \
    --local-address "{{ root }}/var/tmp/femas.sock" \
    --monitor-port "{{ femas_config.metrics.port }}" \
    --monitor-path "{{ femas_config.metrics.path }}" \
{% for key, value in femas_config.options.items() %}
    --{{ key }} {{ value }} \
{% endfor %}
    --name "roq_femas"
