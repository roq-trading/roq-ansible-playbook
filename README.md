[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

# Ansible playbook

Copyright (c) 2017-2018, Hans Erik Thrane


## Disclaimer

Please refer to the LICENSE.

In particular, *it is your own responsibility to ensure the correct operation for your own environment!*


## What is it?

Reference server configuration.

The Ansible playbook is a set of scripts useful to provision servers.
The scripts are designed around this system architecture.

![overview](https://github.com/roq-trading/roq-readthedocs/blob/master/source/overview/architecture.png)


## Requirements

There are a number of ways to install Ansible.
Please refer to Ansible's [Installation Guide](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
for best practices.

We recommend using Ansible from a Conda virtual environment.

	conda install -c conda-forge ansible


## Configuration

The default configuration allows you to install the software, but it will not be your desired configuration.

You can define your specific configuration to either of these locations (in order of precedence)

* inventory file
* group\_vars
* host\_vars

Please refer to Ansible's [Variables](https://docs.ansible.com/ansible/2.6/user_guide/playbooks_variables.html)
documentation for further details.

These are the playbook variables you can override.

* `root` | root path for installation (defaults to `/` if `become_user` is defined and otherwise the home directory)
* `anaconda` | dictionary
    * `url` | conda package repository (url)
    * `sources` | override list for conda sources (the `.condarc file`)
* `roq` | dictionary
    * `user` | an optional user (default is to install using the ansible user)
* `license` | base 64 encoded license
* `collector` | dictionary
    * `cpu_affinity` | optional parameter for the systemd service (`CPUAffinity`)
    * `use_log_dir` | boolean
    * `verbosity` | integer
* `femas` | dictionary
    * `cpu_affinity` | optional parameter for the systemd service (`CPUAffinity`)
    * `use_log_dir` | boolean
    * `verbosity` | integer
    * `datafeed`
        * Please refer to the [defaults](https://github.com/roq-trading/roq-ansible-playbook/blob/master/roles/femas/defaults/main.yml)
    * `md_user` | dictionary
        * `front` | connection string for the front server
        * `account` | account id
        * `password` | password
        * `broker` | broker id
    * `trader` | dictionary
        * `front` | connection string for the front server
    * `symbols` | dictionary
        * `exchange` | exchange (key)
            * `symbol` | list of symbols (as regular expressions)
    * `accounts` | dictionary
        * `alias` | key of dict, an alias for the account
            * `user` | user id
            * `broker` | broker id
            * `password` | password
            * `symbols` | dictionary
                * `exchange` | exchange (key)
                    * `symbol` | list of symbols (as regular expressions)
    * `users` | dictionary
        * `password` | password
        * `accounts` | list of account aliases
        * `symbols` | dictionary
            * `exchange` | exchange
                * `symbol` | list of symbols (as regular expressions)
        * `limits` | dictionary
            * `create_order` | dictionary
                * `max` | count (integer)
                * `monitor_period` | period, e.g. 60s
                * `ban_period` | period, e.g. 300s

## Miscellany

HTTP proxy can be defined by host.
Please refer to [Setting the Environment (and Working with Proxies)](https://docs.ansible.com/ansible/2.6/user_guide/playbooks_environment.html)
for further details.
