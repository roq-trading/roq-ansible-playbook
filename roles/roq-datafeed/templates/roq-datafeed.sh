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
{% if datafeed_config.preload %}
# ... user specified
LD_PRELOAD="$LD_PRELOAD {{ datafeed_config.preload | join(" ") }}"
{% endif %}
# ... done
export LD_PRELOAD

# define logging parameters
{% if datafeed_config.logging.use_log_dir is defined and datafeed_config.logging.use_log_dir %}
export ROQ_log_dir="{{ root }}/var/log/roq"
{% endif %}
export ROQ_v="{{ datafeed_config.logging.verbosity | default(0) }}"

# launch the application
"$CONDA_PREFIX/bin/roq-datafeed" \
    --license-file "{{ root }}/etc/roq/datafeed/license.conf" \
    --config-variables "{{ root }}/etc/roq/datafeed/variables.conf" \
    --config-file "{{ root }}/etc/roq/datafeed/master.conf" \
    --local-address "{{ root }}/var/tmp/datafeed.sock" \
    --monitor-port "{{ datafeed_config.metrics.port }}" \
    --monitor-path "{{ datafeed_config.metrics.path }}" \
{% for key, value in datafeed_config.options.items() %}
    --{{ key }} {{ value }} \
{% endfor %}
    --name "roq_datafeed"
