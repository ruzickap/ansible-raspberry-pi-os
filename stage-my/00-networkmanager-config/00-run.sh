#!/bin/bash
set -euxo pipefail

install -m 600 files/*.nmconnection "${ROOTFS_DIR}/etc/NetworkManager/system-connections/"
