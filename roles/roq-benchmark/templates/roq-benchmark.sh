#!/usr/bin/env bash

set -e

# activate the conda environment
source "{{ root }}/miniconda/bin/activate" ""

# launch the application
"$CONDA_PREFIX/bin/roq-benchmark"
