# Roq Trading Solutions

*A C++ HFT Toolkit for Algo Traders*


## What is it?

Ansible roles (scripts) useful for

* Server provisioning
* Market gateway configuration and deployment
* Auxiliary tooling, e.g. InfluxDB exporter
* Service scripts and start/stop timers

> In short, you can define your host configuration
> as code and apply this to
> * Install a server
> * Update the server
> * Ensure your server configuration is correct


## Requirements

Ansible version 2.7 (or higher).


## Ansible

> This step is only useful if you don't already
> have a recent version of Ansible.
> This is also just one of many ways to get Ansible.
>
> We use Conda because
> * You don't need root access
> * We're using Conda for many other examples

Download the Miniconda Installer

```
wget -N https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
```

Install Miniconda

```
bash Miniconda3-latest-Linux-x86_64.sh -b -u -p ~/miniconda3
```

Activate Miniconda

```
source ~/miniconda3/bin/activate
```

Install Ansible

```
conda install -c conda-forge ansible
```

## Using

> This is the absolutely simplest use-case using
> only the default configurations.
>
> Please refer to
> [roq-client-template](https://github.com/roq-trading/roq-client-template)
> for a more detailed example using custom configurations.

Create an inventory

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

> This assumes you want to install to `localhost`
> and that the `ansible` user has root access.
> You will should replace these with your server's
> hostname and an appropriate username.

Run the playbook

```
ansible-playbook -i server site.yml --ask-become-pass
```


## Description

Depending on **group membership**, the following
roles will be executed in order listed here.

### [all]

> Most tasks here are only executed when
> `become_user` has been defined.

* [baseline](roles/baseline/README.md) to update and upgrade the Linux distribution
* [kernel](roles/kernel/README.md) to update Linux kernel parameters
* [chrony](roles/chrony/README.md) to install and enable chrony for NTP (older Linux distributions)
* [sysstat](roles/sysstat/README.md) to install and enable sysstat tools
* [sysadmin](roles/sysadmin/README.md) to install useful sysadmin tools
* [python](roles/python/README.md) to ensure a baseline Python environment
* [docker](roles/docker/README.md) to install Docker services

### [web]

* [certbot](roles/certbot/README.md) to install a Let's Encrypt certificate

### [secure]

> We only provide very minimal hardening for ssh access.

* [sshd](roles/sshd/README.md) to harden the ssh daemon
* [fail2ban](roles/fail2band/README.md) to block brute-force login attempts

### [onload]

SolarFlare offers kernel by-pass solutions.
This role automates the installation of the
OnLoad drivers.

* [onload](roles/onload/README.md) to download, compile and install the SolarFlare OnLoad driver.

> Drivers must be re-installed whenever
> the Linux kernel is updated!

### [all]

* [conda](roles/conda/README.md) to download, install and upgrade Miniconda
* [postgres](roles/postgres/README.md) to install Postgres

### [dev]

* [toolchain](roles/toolchain/README.md) to install the Conda build toolchain
* [virtualbox](roles/toolchain/README.md) to install VirtualBox
* [vagrant](roles/toolchain/README.md) to install Vagrant

### [trading]

* [redis](roles/redis/README.md) to install Redis
* [influxdb](roles/influxdb/README.md) to install InfluxDB

### [roq\_simulator]

* [roq-simulator](roles/roq-simulator/README.md) to install the Roq Simulator

### [roq\_influxdb]

* [roq-influxdb](roles/roq-influxdb/README.md) to install the Roq InfluxDB Feed Handler

### [roq\_binance]

* [roq-binance](roles/roq-coinbase-pro/README.md) to install the Roq Binance Gateway

### [roq\_bitmex]

* [roq-bitmex](roles/roq-bitmex/README.md) to install the Roq BitMEX Gateway

### [roq\_bitstamp]

* [roq-bitstamp](roles/roq-bitstamp/README.md) to install the Roq BitStamp Gateway

### [roq\_coinbase\_pro]

* [roq-coinbase-pro](roles/roq-coinbase-pro/README.md) to install the Roq Coinbase/Pro Gateway

### [roq\_deribit]

* [roq-deribit](roles/roq-deribit/README.md) to install the Roq Deribit Gateway

### [roq\_ftx]

* [roq-ftx](roles/roq-ftx/README.md) to install the Roq FTX Gateway

### [roq\_gemini]

* [roq-gemini](roles/roq-gemini/README.md) to install the Roq Gemini Gateway

### [roq\_hitbtc]

* [roq-hitbtc](roles/roq-hitbtc/README.md) to install the Roq HitBTC Gateway

### [roq\_kraken]

* [roq-kraken](roles/roq-kraken/README.md) to install the Roq Kraken Gateway


### [trading]

* [prometheus](roles/prometheus/README.md) to install Prometheus
* [grafana](roles/grafana/README.md) to install Grafana

### [cicd]

> Useful tools, if you want to automate build and
> deployment.

* [gogs](roles/gogs/README.md) to install gogs (a "private GitHub")
* [nexus](roles/nexus/README.md) to install Nexus
* [teamcity](roles/teamcity/README.md) to install TeamCity

### [all]

* [nginx](roles/nginx/README.md) to install the nginx front-end
* [roq-backup](roles/roq-backup/README.md) to install Roq backup


## Links

* [Documentation](https://roq-trading.com/docs)
* [Contact us](mailto:info@roq-trading.com)
