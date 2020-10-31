# Change Log

All notable changes will be documented in this file.

## Head

### Added

* roq-clickhouse
* roq-redis

## 0.4.4 &ndash; 2020-09-20

### Changed

* All gateways are now installed by re-using common tasks and templates

## 0.4.3 &ndash; 2020-09-02

### Changed

* NGINX config has been simplified
* As a result of removing the Postgres dependency:
  * Grafana now uses sqlite3
  * Gogs now uses sqlite3
  * TeamCity now uses HSQLDB

### Added

* ClickHouse as a new (experimental) time-series database

### Removed

* The following roles have been removed
  * certbot
  * fail2ban
  * netdata
  * nexus
  * sshd
  * sysadmin
  * sysstat
* The Postgres dependency was removed due to hard-to-automate complexities
  around database upgrades

## 0.4.2 &ndash; 2020-07-27

## 0.4.1 &ndash; 2020-07-17

## 0.4.0 &ndash; 2020-06-30

## 0.3.9 &ndash; 2020-06-09

## 0.3.8 &ndash; 2020-06-06

### Changed

* Documentation has been reviewed

## 0.3.7 &ndash; 2020-05-27

### Changed

* Gateway options (flags) haved been simplified (by removing artificial data structures)

## 0.3.6 &ndash; 2020-05-02

## 0.3.5 &ndash; 2020-04-22

## 0.3.4 &ndash; 2020-04-08

## 0.3.3 &ndash; 2020-03-04