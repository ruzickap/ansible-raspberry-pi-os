# ansible-raspbian

Configure Raspbian (RPi) using Ansible

## Preparation

Insert the SD card to some Linux based OS and run:

```bash
#!/usr/bin/env bash

set -euxo pipefail

RPI_USER="pi"
# shellcheck disable=SC2016
RPI_PASSWORD_YESCRYPT_HASH='$y$j9T$teBQF20fiZEV5K3NZbwZ30$kIlVP6po2p43KH17C/26cmDN1i./cQriWj9Wp4rSHq2' # raspberry
DEVICE="mmcblk0"

wget -c "https://downloads.raspberrypi.org/raspios_lite_arm64/images/raspios_lite_arm64-2023-10-10/2023-10-10-raspios-bookworm-arm64-lite.img.xz"

cat > owner.txt << EOF
Petr Ruzicka - petr.ruzicka@gmail.com
EOF

lsblk --output NAME,MODEL,MODEL | grep ${DEVICE}

umount "/dev/${DEVICE}p1" "/dev/${DEVICE}p2" || true

read -r -p "Press enter to remove everything from ${DEVICE} !!!"

xzcat ./*raspios*.xz | dd of=/dev/${DEVICE} bs=4M
partprobe /dev/${DEVICE}

MYTMP=$(mktemp --directory)
mount /dev/${DEVICE}p1 "${MYTMP}"
touch "${MYTMP}/ssh"
echo "${RPI_USER}:${RPI_PASSWORD_YESCRYPT_HASH}" > "${MYTMP}/userconf.txt"
cp owner.txt "${MYTMP}/"
umount "${MYTMP}"

mount "/dev/${DEVICE}p2" "${MYTMP}"
bash -c "cat >> ${MYTMP}/etc/network/interfaces.d/eth0" << EOF
auto eth0
iface eth0 inet static
    address 192.168.1.2
    netmask 255.255.255.0
    gateway 192.168.1.1
    dns-nameservers 1.1.1.1
EOF
cp owner.txt "${MYTMP}/"
umount "${MYTMP}"
```

## Notes

Decrypt variables:

```bash
cd ansible
ansible localhost -m ansible.builtin.debug -a var="cloudflared_token" -e "@host_vars/raspi.xvx.cz"
```
