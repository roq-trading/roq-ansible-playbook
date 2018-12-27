[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

# Ansible playbook

Copyright (c) 2017-2019, Hans Erik Thrane


## What is it?

An Ansible playbook implementing the reference server configuration described
[here](https://roq-trading.com/docs/introduction/overview/index.html).


## Requirements

The playbook requires Ansible version 2.7 (or higher).

Please refer to Ansible's
[Installation Guide](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
for best practices.

We recommend using Ansible from a Conda virtual environment.

## Using

You can follow these steps if you don't already have a compatible Ansible installation.

	# Download miniconda for Linux (see https://conda.io/miniconda.html for other platforms)
	wget -N https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh

	# Install miniconda (to your home directory)
	bash Miniconda3-latest-Linux-x86_64.sh -b -u -p ~/miniconda3

	# Activate your conda environment
	source ~/miniconda3/bin/activate

	# Install ansible
	pip install ansible

	# Check the installed version
	conda list | grep ansible

Using playbook is to some extent dependent on your specific host configuration.

Please [contact us](mailto:info@roq-trading.com) for further details.


## Disclaimer

Please refer to the LICENSE, in particular:

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
	SOFTWARE.
