#!/bin/bash
set -e

echo "Enabling contrib, non-free and non-free-firmware"

sed -i 's/^Components: main$/Components: main contrib non-free non-free-firmware/' /etc/apt/sources.list.d/debian.sources
