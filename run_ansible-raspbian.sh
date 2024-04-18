#!/usr/bin/env bash

set -eux

cd ansible
ansible-galaxy install -r requirements.yml
ansible-playbook --diff --user root -i inventory/hosts main.yml
