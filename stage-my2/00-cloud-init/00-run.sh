#!/bin/bash

install -m 600 files/90_network-config.cfg "${ROOTFS_DIR}/etc/cloud/cloud.cfg.d/"
