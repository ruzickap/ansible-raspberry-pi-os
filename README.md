# ansible-raspberry-pi-os

Configure Raspbian (RPi) using Ansible

## Preparation

1. Build the Raspberry Pi OS image using [create-rpi-image GitHub Action](.github/workflows/create-rpi-image.yml)

1. Unpack the image with `7z x` (AES-encrypted zip, the password is the Wi-Fi
   password) and flash it to the SD card

1. Boot the RPi with the SD card
   1. Initial user is `pi` with password `raspberry`

1. Run the ansible playbook. The first run needs the initial password
   (`raspberry`), so Ansible asks for it. The fresh image also has a new SSH
   host key, so the first run skips the check against `ansible/known_hosts`:

   ```bash
   cd ansible || exit
   ansible-galaxy install -r requirements.yml
   ANSIBLE_SSH_ARGS="-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null" \
     fnox exec -- ansible-playbook --diff -i inventory/hosts main.yml \
     --ask-pass --ask-become-pass
   ```

   Later runs use the SSH key and check the pinned host key: `mise run run`

## Notes

Variables are stored in AWS SSM Parameter Store and injected via
[fnox](https://github.com/jdx/fnox) (`fnox exec` in the
[mise](https://mise.jdx.dev/) task). See `fnox.toml` and `mise.toml`.

Bluetooth - To connect a headset in pairing mode:

```bash
su - kodi
bluetoothctl
# power on
# pair 08:C8:C2:85:EF:57
# trust 08:C8:C2:85:EF:57
# connect 08:C8:C2:85:EF:57
```
