# roq-influxdb

Installs the Roq InfluxDB Feed Handler.

## Requirements

* Conda
* Docker (optional)

## Variables

* `roq_influxdb` (dict)
  * `version` (string)
  * `docker` (dict)
    * `use` (bool)
    * `name` (string)
  * `cpu` ()
  * `logging` (dict)
    * `verbosity` (int)

## Tasks

* Create directories
* Create run scripts
* Install roq-influxdb
* Create systemd services
