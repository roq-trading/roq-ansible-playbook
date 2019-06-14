# docker

Install Docker CE services.

## Requirements

None

## Variables

* `install_container_selinux` (bool) (RedHat, only)
  * `true` = yes (default)
  * `false` = no

None

## Tasks

* Install dependencies
* Download and install Docker CE
* Install the docker Python module
* Initialize Docker Swarm
* Create the roq-network (Overlay Network)
