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


## Links

* [Documentation](https://roq-trading.com/docs)
* [Contact us](mailto:info@roq-trading.com)
