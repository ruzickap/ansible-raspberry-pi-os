#!/bin/bash
set -euxo pipefail

install -m 600 files/*.nmconnection "${ROOTFS_DIR}/etc/NetworkManager/system-connections/"
install -m 644 files/wifi-powersave-off.conf "${ROOTFS_DIR}/etc/NetworkManager/conf.d/"
