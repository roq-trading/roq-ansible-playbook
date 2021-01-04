# roq-ansible


Ansible roles for server provisioning.

Features

* Typical server configuration
  * Keep kernel up to date
  * Install Docker
  * Install Miniforge
  * Install ClickHouse
  * Install InfluxDB
  * Install Redis
  * Install Prometheus
  * Install Grafana
  * Install NGINX
* Roq Gateways
  * Install binaries (Conda or Docker)
  * Generate config files (using YAML)
  * Install systemd service and timer scripts


Direct third-party dependencies

* [Ansible](https://github.com/ansible/ansible) (GPL 3.0 License)


## Operating Systems

* Linux


## Prerequisites

Ansible 2.7 (or higher) is required.

This is how to install Ansible using Conda

```bash
wget -N https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh

bash Miniforge3-Linux-x86_64.sh -b -u -p ~/conda

source ~/conda/bin/activate

conda install -y \
    ansible-playbook
```


## Using

Create inventory file

```bash
cat > server << EOF
[SERVER]
server ansible_host="localhost" ansible_user="ansible" become_user="root"

[trading]
server

[clickhouse]
server

[roq_clickhouse]
server

[roq_coinbase_pro]
server

[roq_deribit]
server
EOF
```

> This assumes you want to install to `localhost` and that the `ansible` user
> can get root access.

Run the playbook

```
ansible-playbook -i server site.yml --ask-become-pass
```

Further details can be found
[here](https://roq-trading.com/docs/using/deployment/index.html).


## License

The project is released under the terms of the MIT license.


## Links

* [Roq GmbH](https://roq-trading.com/)
* [Documentation](https://roq-trading.com/docs/)
* [Contact us](mailto:info@roq-trading.com)
