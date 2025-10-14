#!/bin/bash
set -euxo pipefail

# Install cloud-init configuration
mkdir -p "${ROOTFS_DIR}/etc/cloud/cloud.cfg.d"
install -m 644 files/99_nocloud.cfg "${ROOTFS_DIR}/etc/cloud/cloud.cfg.d/99_nocloud.cfg"

# Install cloud-init user-data and meta-data to boot partition
mkdir -p "${ROOTFS_DIR}/boot/firmware"
install -m 600 files/user-data "${ROOTFS_DIR}/boot/firmware/user-data"
install -m 600 files/meta-data "${ROOTFS_DIR}/boot/firmware/meta-data"
install -m 600 files/network-config "${ROOTFS_DIR}/boot/firmware/network-config"

# Generate network-config with WiFi credentials
# : "${WIFI_SSID:?WIFI_SSID not set}"
# : "${WIFI_PASSWORD:?WIFI_PASSWORD not set}"
# export WIFI_PSK="${WIFI_PASSWORD}"
# envsubst < files/network-config > "${ROOTFS_DIR}/boot/firmware/network-config"
# chmod 600 "${ROOTFS_DIR}/boot/firmware/network-config"
