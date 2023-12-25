# ansible-raspbian

Configure Raspbian (RPi) using Ansible

## Preparation

Insert the SD card to some Linux based OS and run as root:

```bash
set -euxo pipefail

RPI_USER="pi"
# shellcheck disable=SC2016
RPI_PASSWORD_YESCRYPT_HASH='$y$j9T$teBQF20fiZEV5K3NZbwZ30$kIlVP6po2p43KH17C/26cmDN1i./cQriWj9Wp4rSHq2' # raspberry
DEVICE="mmcblk0"

wget -c "https://downloads.raspberrypi.org/raspios_lite_arm64/images/raspios_lite_arm64-2023-10-10/2023-10-10-raspios-bookworm-arm64-lite.img.xz"
echo "Petr Ruzicka - petr.ruzicka@gmail.com" > owner.txt

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

cat > "${MYTMP}/etc/NetworkManager/system-connections/ruzickovi 2.4 GHz.nmconnection" << EOF
[connection]
id=ruzickovi 2.4 GHz
uuid=5a62d13a-fdf8-4737-8f7d-f43764685207
type=wifi
interface-name=wlan0
autoconnect=true

[wifi]
mode=infrastructure
ssid=ruzickovi 2.4 GHz

[wifi-security]
auth-alg=open
key-mgmt=wpa-psk
psk=Sxxxxxxxxxxx

[ipv4]
method=manual
dns=8.8.8.8;1.1.1.1;
address1=192.168.1.2/24,192.168.1.1

[ipv6]
method=auto
EOF

chmod 600 "${MYTMP}/etc/NetworkManager/system-connections/ruzickovi 2.4 GHz.nmconnection"
cp owner.txt "${MYTMP}/"

umount "${MYTMP}"
```

## Notes

Decrypt variables:

```bash
cd ansible
ansible localhost -m ansible.builtin.debug -a var="cloudflared_token" -e "@host_vars/raspi.xvx.cz"
```
