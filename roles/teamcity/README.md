# teamcity

Install TeamCity.

## Requirements

* Docker
* Postgres

## Variables

* `teamcity_agent_count` (int)
  * 2 (default)

## Tasks

* Create directories
* Create Postgres database
* TeamCity Server:
  * Pull latest Docker image
  * Create systemd services
* TeamCity Agents:
  * Pull latest Docker image
  * Create new Docker image with specific tools added
  * Create systemd services
