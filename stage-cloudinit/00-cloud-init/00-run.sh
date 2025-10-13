#!/bin/bash
set -euxo pipefail

# Install cloud-init configuration
install -m 644 files/99_nocloud.cfg "${ROOTFS_DIR}/etc/cloud/cloud.cfg.d/99_nocloud.cfg"

# Install cloud-init user-data and meta-data to boot partition
install -m 600 files/user-data "${BOOTFS_DIR}/user-data"
install -m 600 files/meta-data "${BOOTFS_DIR}/meta-data"

# Generate network-config with WiFi credentials
: "${WIFI_SSID:?WIFI_SSID not set}"
: "${WIFI_PASSWORD:?WIFI_PASSWORD not set}"
export WIFI_PSK="${WIFI_PASSWORD}"
envsubst < files/network-config > "${BOOTFS_DIR}/network-config"
chmod 600 "${BOOTFS_DIR}/network-config"
