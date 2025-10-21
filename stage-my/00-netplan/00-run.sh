#!/bin/bash

install -m 600 files/01-wifi.yaml "${ROOTFS_DIR}/etc/netplan/"
install -m 644 files/wifi-powersave-off.conf "${ROOTFS_DIR}/etc/NetworkManager/conf.d/"
