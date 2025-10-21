#!/bin/bash

install -m 600 files/00-network-manager-all.yaml "${ROOTFS_DIR}/lib/netplan/"
install -m 600 files/*.nmconnection "${ROOTFS_DIR}/etc/NetworkManager/system-connections/"
install -m 644 files/wifi-powersave-off.conf "${ROOTFS_DIR}/etc/NetworkManager/conf.d/"
