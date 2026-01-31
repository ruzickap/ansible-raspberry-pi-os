#!/bin/bash

# install -m 600 files/01-wifi.yaml "${ROOTFS_DIR}/etc/netplan/"

echo "dtoverlay=disable-wifi" >> "${ROOTFS_DIR}/boot/firmware/config.txt"
