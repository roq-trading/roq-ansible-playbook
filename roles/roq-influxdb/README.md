# roq-influxdb

Installs the Roq InfluxDB Feed Handler.

## Requirements

* Conda
* Docker (optional)

## Variables

* `influxdb_use_docker` (bool)
  * `false` = Conda installation
  * `true` = Docker installation

## Tasks

* Create directories
* Create run scripts
* Install roq-influxdb
* Create systemd services
