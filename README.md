# roq-ansible


Ansible roles for server provisioning.

Features

* Typical server configuration
  * Keep kernel up to date
  * Install Docker
  * Install Miniconda
  * Install Redis
  * Install InfluxDB
  * Install ClickHouse
  * Install Prometheus
  * Install Grafana
  * Install NGINX
* Gateways
  * Install binaries (using Conda or Docker)
  * Auto-generate config files from YAML
  * Install systemd service and timer scripts


Direct third-party dependencies

* [Ansible](https://github.com/ansible/ansible) (GPL 3.0 License)


## Operating Systems

* Linux
* macOS
* Windows (?)


## Prerequisites

Ansible 2.7 (or higher) is required.

This is how to install Ansible using Conda

```bash
wget -N https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh

bash Miniconda3-latest-Linux-x86_64.sh -b -u -p ~/miniconda3

source ~/miniconda3/bin/activate

conda install -y \
    ansible-playbook
```


## Using

Create an inventory file

```bash
cat > server << EOF
[SERVER]
server ansible_host="localhost" ansible_user="ansible" become_user="root"

[trading]
server

[roq_samples]
server

[roq_coinbase_pro]
server

[roq_deribit]
server

[roq_influxdb]
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
