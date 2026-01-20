#!/bin/bash
set -e

echo "Enabling contrib, non-free and non-free-firmware"

sed -i 's/ main$/ main contrib non-free non-free-firmware/' /etc/apt/sources.list
