#!/bin/bash
set -e

sed -i 's/^Components: main$/Components: main contrib non-free non-free-firmware/' "${ROOTFS_DIR}/etc/apt/sources.list.d/debian.sources"
