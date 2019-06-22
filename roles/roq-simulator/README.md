# roq-simulator

Installs Roq Simulator.

## Requirements

* Conda
* Docker (optional)

## Variables

* `roq_simulator` (dict)
  * `version` (string)
  * `docker` (dict)
    * `use` (bool)
    * `name` (string)
  * `cpu` ()
  * `logging` (dict)
    * `verbosity` (int)
  * `collect` (dict)
    * `size` (int)
    * `path` (string)
    * `sync_freq_secs` (int)


## Tasks

* Create directories
* Create run scripts
* Install roq-simulator
* Create systemd services
