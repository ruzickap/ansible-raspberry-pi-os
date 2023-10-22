# Changelog

## 0.2.0 (2023-10-22)

## What's Changed
* feat(rpi): upgrade to debian bookworm by @ruzickap in https://github.com/ruzickap/ansible-raspbian/pull/146
* fix(renovate): add renovate config file by @ruzickap in https://github.com/ruzickap/ansible-raspbian/pull/154


**Full Changelog**: https://github.com/ruzickap/ansible-raspbian/compare/v0.1.1...v0.2.0

## [v0.1.1](https://github.com/ruzickap/ansible-raspbian/compare/v0.1.0...v0.1.1)

- feat(gh-actions): add lint-pr-title [`#143`](https://github.com/ruzickap/ansible-raspbian/pull/143)
- feat(grafana-agent): Improve grafana-agent installation [`#137`](https://github.com/ruzickap/ansible-raspbian/pull/137)
- Add Home Assistant, haas_proxy, cloudflared; Remove Plex [`#127`](https://github.com/ruzickap/ansible-raspbian/pull/127)
- Update GH Actions, disable firewall logs [`#125`](https://github.com/ruzickap/ansible-raspbian/pull/125)
- Remove raspi1, improve Plex, add grafana-agent, pihole, hostapd [`#124`](https://github.com/ruzickap/ansible-raspbian/pull/124)
- Remove old roles [`#123`](https://github.com/ruzickap/ansible-raspbian/pull/123)
- Move to Raspberry Pi OS and Kodi 19 [`#122`](https://github.com/ruzickap/ansible-raspbian/pull/122)
- Move from master to main [`#117`](https://github.com/ruzickap/ansible-raspbian/pull/117)
- Add plex [`#116`](https://github.com/ruzickap/ansible-raspbian/pull/116)
- Use super-linter:slim [`#110`](https://github.com/ruzickap/ansible-raspbian/pull/110)
- Upgrade GH Actions versions [`#106`](https://github.com/ruzickap/ansible-raspbian/pull/106)

## [v0.1.0](https://github.com/ruzickap/ansible-raspbian/compare/v0.0.1...v0.1.0) (2020-09-17)

- Add veto files to smb.conf to prevent MacOS to write garbage [`#53`](https://github.com/ruzickap/ansible-raspbian/pull/53)
- Add mode and delays [`#51`](https://github.com/ruzickap/ansible-raspbian/pull/51)
- Change SMB params, change file locations (Documents, Pictures) [`#47`](https://github.com/ruzickap/ansible-raspbian/pull/47)
- Send emails from unattended-upgrades only in case of errors [`#45`](https://github.com/ruzickap/ansible-raspbian/pull/45)
- Use latest container version of super-linter [`#44`](https://github.com/ruzickap/ansible-raspbian/pull/44)
- Add fzf [`#42`](https://github.com/ruzickap/ansible-raspbian/pull/42)
- Add super-linter + fix related issues [`#35`](https://github.com/ruzickap/ansible-raspbian/pull/35)
- Add Automatic-Reboot to unattended-upgrade [`#27`](https://github.com/ruzickap/ansible-raspbian/pull/27)
- Move to GitHub's Dependabot [`#26`](https://github.com/ruzickap/ansible-raspbian/pull/26)
- Use shell-linter in latest version [`#18`](https://github.com/ruzickap/ansible-raspbian/pull/18)
- Bump roles/cloudalchemy.prometheus from `4bf158b` to `a36ffcc` [`#14`](https://github.com/ruzickap/ansible-raspbian/pull/14)
- Add ansible-lint config file .ansible-lint [`19d27e3`](https://github.com/ruzickap/ansible-raspbian/commit/19d27e39ce99faeac0eef1b2ce9f9c78fb7819f1)
- Change yaml files to pass yamllint [`f73438b`](https://github.com/ruzickap/ansible-raspbian/commit/f73438b60ee7e57a7fab631f67eebdb35aa5c8a6)
- Add GH Action checks [`24c59ed`](https://github.com/ruzickap/ansible-raspbian/commit/24c59ed678a00b0b61207a62f9c99f6fc714b422)

## v0.0.1 (2020-05-09)

- Bump roles/cloudalchemy.prometheus from `c67a3e3` to `4bf158b` [`#13`](https://github.com/ruzickap/ansible-raspbian/pull/13)
- Bump roles/cloudalchemy.node-exporter from `bde46a6` to `042e068` [`#12`](https://github.com/ruzickap/ansible-raspbian/pull/12)
- Fix yaml in main.yml to pass yamllint [`8ca4383`](https://github.com/ruzickap/ansible-raspbian/commit/8ca4383599d98b3e92af23ec89baf6eb7b9f256c)
- Add .release-it.yml to .gitignore [`5b433d0`](https://github.com/ruzickap/ansible-raspbian/commit/5b433d047c0fb144320af6123f5ac26a6fb07bf9)
- Add firewall ports for raspi1 [`1d64d2d`](https://github.com/ruzickap/ansible-raspbian/commit/1d64d2d07d6e3291ae1c251a4e2f6603d35287bf)
- Change hosts in inventory/hosts file [`bac9132`](https://github.com/ruzickap/ansible-raspbian/commit/bac91327c6680cb39911910d92b997b6f9118b7c)
- Move pre_tasks before roles in main ansible playbook [`250f5cb`](https://github.com/ruzickap/ansible-raspbian/commit/250f5cb81c2ce4bb639da331a9c01f5f0f5f61d2)
- Improve error handling when accessing the Kodi sqlite db [`198b058`](https://github.com/ruzickap/ansible-raspbian/commit/198b058417f5b11c524b0dc1ebbe452f7342a779)
- Add Transmission web interface to firewall rules [`6a7039b`](https://github.com/ruzickap/ansible-raspbian/commit/6a7039ba546230092fda6a9d5dce65d7084756d2)
- Change SMTP password [`f59d66f`](https://github.com/ruzickap/ansible-raspbian/commit/f59d66f7c4c684df60908fd8ecfb89e81ccae741)
- Improve datasource parameter definition [`4f3d415`](https://github.com/ruzickap/ansible-raspbian/commit/4f3d415b420f536c5a3db4c0ec9e6d5dc02bc8a0)
- Add roles, remove InfluxDB, collectd, Telegraf [`a0b2bb6`](https://github.com/ruzickap/ansible-raspbian/commit/a0b2bb6e2b7650132b550973328d3a34b7142717)
- Add comments to .gitignore + .pre-commit-config.yaml [`0ec4b4a`](https://github.com/ruzickap/ansible-raspbian/commit/0ec4b4abec926f4a4c13742d9fe63cb65c376b6f)
- Many changes / rewrites [`7d6c312`](https://github.com/ruzickap/ansible-raspbian/commit/7d6c31241d01a674b86b793dd622f0eb2f392a77)
- Initial commit [`d862b6f`](https://github.com/ruzickap/ansible-raspbian/commit/d862b6f8b1156be6b9dd0e8871f242a39e2600ae)
