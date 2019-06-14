# baseline

Creates a baseline for all other roles.

## Requirements

None

## Variables

* `upgrade_system` (bool) -- upgrade system packages?
  * `true` = yes (default)
  * `false` = no
* `install_epel_release` (bool) -- install EPEL (on RedHat, only)
  * `true` = yes (default)
  * `false` = no

## Tasks

* Create directories
* Update/upgrade the Linux system
