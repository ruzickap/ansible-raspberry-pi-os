#!/usr/bin/env bash

set -eux

cd ansible
ansible-playbook --diff --user root -i inventory/hosts main.yml
