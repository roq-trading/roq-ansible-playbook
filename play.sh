#!/usr/bin/env bash

if [[ $# == 0 ]]; then
	(>&2 echo -e "\033[1;31mERROR: \033[0;35msyntax: [--private-key <...>] --inventory <...> site.yml\033[0m") && exit 1
fi

ansible-playbook $@
