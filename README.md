# Roq Trading Solutions

Solutions focused on development, testing and deployment of
algorithmic trading strategies.


## Overview

An Ansible playbook implementing the reference server configuration described
[here](https://roq-trading.com/docs/introduction/overview/index.html).

The following examples will install the roq-benchmark suite.

> The playbook extensively use groups to drive the installation.

> Defining a `become_user` (typically `root`) will allow the playbook
> to harden the system for low latency trading.

You can find further details about the playbook [here](roles/README.md).


## Requirements

The playbook requires Ansible version 2.7 (or higher).


## Install Ansible

> If you don't already have a compatible Ansible installation.

```bash
# download the miniconda installer
wget -N https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh

# install miniconda (to your home directory)
bash Miniconda3-latest-Linux-x86_64.sh -b -u -p ~/miniconda3

# activate conda environment
source ~/miniconda3/bin/activate

# install ansible
conda install -y ansible

# check the installed version
conda list | grep ansible
```

## Install to HOME

```bash
# create inventory file
cat > dev << EOF
[DEV]
dev ansible_host="localhost" root="$HOME/roq"

[roq_benchmark]
dev
EOF

# run the playbook
ansible-playbook -i dev site.yml
```

## Install to Server

```bash
# create inventory
cat > server << EOF
[SERVER]
server ansible_host="localhost" ansible_user="ansible" become_user="root"

[roq_benchmark]
server
EOF

# run the playbook
ansible-playbook -i server site.yml --ask-become-pass
```

## Next Steps

* [Contact us](mailto:info@roq-trading.com)
* [Roq Trading Solutions (website)](https://roq-trading.com)
* [Online documentation](https://roq-trading.com/docs)
* [Development samples](https://github.com/roq-trading/roq-samples)
* [Ansible playbook](https://github.com/roq-trading/roq-ansible)
* [Grafana dashboards](https://github.com/roq-trading/roq-grafana)
* [Vagrant development environments](https://github.com/roq-trading/roq-vagrant)
