#!/usr/bin/env bash

set -eux

# Dues to prometheus.prometheus role
# https://github.com/ansible/ansible/issues/32499
# export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Used by grafana debug
# export CI=true

cd ansible || exit
ansible-galaxy install -r requirements.yml
ansible-playbook --diff --user root -i inventory/hosts main.yml
