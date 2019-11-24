#!/bin/bash -eux

ansible-playbook --diff --user root -i inventory/hosts main.yml
