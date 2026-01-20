#!/bin/bash

install -m 600 files/01-wifi.yaml "${ROOTFS_DIR}/etc/netplan/"
