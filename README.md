[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

# Ansible playbook

Copyright (c) 2017-2018, Hans Erik Thrane


## What is it?

Reference server configuration.

The Ansible playbook is a set of scripts useful to provision servers.
The scripts are designed around this system architecture.

![overview](https://github.com/roq-trading/roq-doc/blob/master/source/overview/architecture.png)


## Requirements

There are a number of ways to install Ansible.
Please refer to Ansible's [Installation Guide](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
for best practices.

We recommend using Ansible from a Conda virtual environment.

	conda install -c conda-forge ansible


## Configuration

The default configuration allows you to install the software, but it will most likely not be the correct configuration.

These are the values you can override (notice, you will have to override the entire tree when the values nest).

* `anaconda`
    * `url` | anaconda package repository (url)
    * `sources` | list of anaconda sources (the `.condarc file`)
* `roq`
    * `url` | roq conda package repository (url)
* `roq_user` | an optional user (default is to install using the ansible user)
* `femas`
    * `cpu_affinity` | optional parameter for the systemd service (`CPUAffinity`)

TO BE COMPLETED...
