#!/usr/bin/env bash

set -e

CONDA_DIR="{{ root }}/miniconda"
LOG_DIR="{{ root }}/var/log"
CONFIG_DIR="{{ root }}/etc/roq/femas"

LICENSE="$CONFIG_DIR/license.conf"
VARIABLES="$CONFIG_DIR/variables.conf"
CONFIG="$CONFIG_DIR/master.conf"

SOCKET="{{ root }}/var/tmp/femas.sock"

source "$CONDA_DIR/bin/activate"

if [ -e "$CONDA_PREFIX/lib/libtcmalloc.so" ]; then
  export LD_PRELOAD="$CONDA_PREFIX/lib/libtcmalloc.so"
fi

{% if femas.use_log_dir %}
export ROQ_log_dir="$LOG_DIR"
{% endif %}
export ROQ_v="{{ femas.verbosity | default(0) }}"

"$CONDA_PREFIX/bin/roq-femasapi" \
    --socket-buffer-size 10485760 \
    --spin-usecs 1000 \
    --timer-refresh-usecs 100 \
    --license-file "$LICENSE" \
    --config-variables "$VARIABLES" \
    --config-file "$CONFIG" \
    --local-address "$SOCKET" \
    --monitor-port "12345" \
    --name "roq_femas"
