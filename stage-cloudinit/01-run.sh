#!/bin/bash
set -euxo pipefail

install -m 644 files/99_nocloud.cfg "${ROOTFS_DIR}/etc/cloud/cloud.cfg.d/99_nocloud.cfg"

install -m 600 files/user-data "${BOOTFS_DIR}/user-data"
install -m 600 files/meta-data "${BOOTFS_DIR}/meta-data"

: "${WIFI_SSID:?WIFI_SSID not set}"
: "${WIFI_PSK:?WIFI_PSK not set}"
envsubst < files/network-config > "${BOOTFS_DIR}/network-config"
chmod 600 "${BOOTFS_DIR}/network-config"
