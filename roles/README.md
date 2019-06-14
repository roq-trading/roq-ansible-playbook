# roles

Depending on group membership, the following will be executed
in order the roles are listed here.

## [all]

> Most tasks are only executed when `become_user` is defined.

* [baseline](baseline/README.md) to update and upgrade the Linux distribution
* [kernel](kernel/README.md)
* [chrony](chrony/README.md) to install and enable chrony for NTP (older Linux distributions)
* [sysstat](sysstat/README.md) to install and enable sysstat tools
* [sysadmin](sysadmin/README.md)
* [python](python/README.md)
* [docker](docker/README.md) to install Docker CE services

## [web]

* [certbot](certbot/README.md)

## [secure]

> We only provide very minimal hardening for ssh access.

* [sshd](sshd/README.md) to harden the ssh daemon
* [fail2ban](fail2band/README.md) to block brute-force login attempts

## [onload]

SolarFlare offers kernel by-pass solutions.
This role automates the installation of the onload drivers.

> Note! Drivers must be re-installed whenever the Linux kernel is updated!

* [onload](onload/README.md) to download, compile and install the SolarFlare onload driver.

## [all]

* [conda](conda/README.md) to download, install and upgrade Miniconda
* [postgres](postgres/README.md) to install Postgres

## [dev]

* [toolchain](toolchain/README.md) to install the Conda build toolchain


## [roq\_benchmark]

* [roq-benchmark](roq-benchmark/README.md) to install the Roq Benchmark Suite.


## ...


## [trading]

* [redis](redis/README.md) to install Redis
* [influxdb](influxdb/README.md) to install InfluxDB
* [prometheus](prometheus/README.md) to install Prometheus
* [grafana](grafana/README.md) to install Grafana

## [cicd]

* [gogs](gogs/README.md) to install gogs (a "private" GitHub)
* [nexus](nexus/README.md) to install Nexus
* [teamcity](teamcity/README.md) to install TeamCity

## [all]

* [nginx](nginx/README.md) to install the nginx frontend
