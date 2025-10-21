#!/bin/bash

install -m 600 files/network-config.template "${ROOTFS_DIR}/etc/cloud/cloud.cfg.d/"
