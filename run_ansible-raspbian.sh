#!/usr/bin/env bash

set -eux

ansible-playbook --diff --user root -i inventory/hosts main.yml
