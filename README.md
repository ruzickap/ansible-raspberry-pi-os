# ansible-raspberry-pi-os

Configure Raspbian (RPi) using Ansible

## Preparation

1. Build the Raspberry Pi OS image using [create-rpi-image GitHub Action](.github/workflows/create-rpi-image.yml)
1. Flash the image to the SD card
1. Boot the RPi with the SD card
   1. Initial user is `pi` with password `raspberry`
1. Run the ansible playbook from shell script [run_ansible-raspbian.sh](run_ansible-raspbian.sh)

## Notes

Decrypt variables:

```bash
cd ansible || exit
ansible localhost -m ansible.builtin.debug -a var="cloudflared_token" -e "@host_vars/raspi.xvx.cz"
```

Bluetooth - To connect a headset in pairing mode:

```bash
su - kodi
bluetoothctl
power on
pair 08:C8:C2:85:EF:57
trust 08:C8:C2:85:EF:57
connect 08:C8:C2:85:EF:57
```
