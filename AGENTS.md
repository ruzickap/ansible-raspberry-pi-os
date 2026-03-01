# AI Agent Guidelines

## Project Overview

Ansible infrastructure-as-code repository that configures a Raspberry Pi
running Raspberry Pi OS. Provisions Kodi, Docker containers (Zigbee2MQTT,
ESPHome, Home Assistant), Grafana/Prometheus monitoring, Cloudflared
tunnels, and more. No traditional build system -- quality is enforced
through MegaLinter (CI) and ansible-lint.

## Build / Lint / Test Commands

```bash
# Install Ansible Galaxy dependencies (run from repo root)
cd ansible && ansible-galaxy install -r requirements.yml

# Run the full playbook (requires target host + vault password)
cd ansible && ansible-playbook --diff --user root \
  -i inventory/hosts main.yml

# Lint Ansible playbooks and tasks
ansible-lint -c ansible/.ansible-lint ansible/

# Lint a single Ansible file
ansible-lint -c ansible/.ansible-lint ansible/tasks/apps.yml

# Shell script linting and formatting
shellcheck --exclude=SC2317 run_ansible-raspbian.sh
shfmt --case-indent --indent 2 --space-redirects -d \
  run_ansible-raspbian.sh

# Markdown linting (exclude CHANGELOG.md)
rumdl README.md

# Link checking
lychee --config lychee.toml .

# GitHub Actions workflow validation
actionlint
```

There are no unit tests. Quality assurance relies on linting and CI scans.

## Ansible Code Style

- **FQCN required**: Always use fully qualified collection names
  (e.g., `ansible.builtin.copy`, `community.general.timezone`,
  `community.docker.docker_container`). Never use short module names.
- **File permissions**: Use symbolic mode notation
  (e.g., `mode: u=rw,g=r,o=r`), not octal.
- **Sensitive data**: Mark tasks exposing secrets with `no_log: true`.
  All secrets must use Ansible Vault (`!vault` tag) in `group_vars/`.
- **Idempotency**: Use `changed_when: false` on read-only commands.
  Use `changed_when: true` when a shell task always modifies state.
- **Retries on apt**: Use `register: result` with
  `until: result is succeeded` for package installation tasks.
- **Handlers**: Use `notify:` to trigger service restarts defined
  in `ansible/handlers/main.yml`.
- **Task names**: Every task must have a descriptive `name:` field.
- **Section headers**: Use `#####` comment blocks to separate logical
  sections in task files (see `ansible/tasks/apps.yml`).
- **Commented-out code**: Preserved with `#` prefix for reference
  (disabled features like Home Assistant backup).
- **Docker images**: Pin with `@sha256:` digests, include `# renovate:`
  comments for automated version tracking.
- **Version pinning**: Ansible collections pinned to exact versions in
  `ansible/requirements.yml`. Use `# keep-sorted` directives.
- **ansible-lint skips**: `package-latest`, `yaml[comments]`,
  `yaml[document-start]`, `yaml[line-length]` are skipped.
- **Inline noqa**: Use `# noqa: <rule>` when suppressing lint rules
  (e.g., `# noqa: command-instead-of-module`).

## Shell Script Style

- **Shebang**: Always use `#!/usr/bin/env bash`
- **Strict mode**: Start scripts with `set -eux` or `set -e`
- **Variables**: Use uppercase with braces: `${MY_VARIABLE}`
- **Formatting**: `shfmt --case-indent --indent 2 --space-redirects`
- **Linting**: `shellcheck --exclude=SC2317`
- Shell code blocks in Markdown (tagged `bash`, `shell`, `sh`) are
  extracted and validated during CI

## YAML Style

- Two-space indentation, no tabs
- Use `# keep-sorted` directives to maintain alphabetical ordering
  in lists (collections, packages, etc.)
- Jinja2 templates use `.j2` suffix and `{{ variable }}` syntax

## Markdown Style

- Must pass `rumdl` checks (CHANGELOG.md excluded)
- Wrap lines at 72 characters
- Use proper heading hierarchy (no skipped levels)
- Include language identifiers in code fences (e.g., `bash`, `json`)
- URLs must be reachable (validated by `lychee`)

## GitHub Actions Workflows

- **Permissions**: Always set `permissions: read-all` at top level;
  elevate per-job only as needed
- **Pin actions**: Use full SHA commits, not tags
  (e.g., `actions/checkout@de0fac2...  # v6.0.2`)
- **Timeouts**: Set `timeout-minutes` on every job
- **Validate**: Run `actionlint` after modifying any workflow file

## Security Scanning (CI)

- **Checkov**: IaC scanner (skip `CKV_GHA_7`)
- **DevSkim**: Ignore DS162092, DS137138; exclude CHANGELOG.md
- **KICS**: Fail on HIGH severity only
- **Trivy**: HIGH/CRITICAL only, ignore unfixed vulnerabilities
- **CodeQL**: Runs on GitHub Actions code

## Version Control

### Commit Messages

Conventional commit format: `<type>: <description>`

- Types: `feat`, `fix`, `docs`, `chore`, `refactor`, `test`, `style`,
  `perf`, `ci`, `build`, `revert`
- Subject: imperative mood, lowercase, no period, max 72 characters
- Body: wrap at 72 characters, explain what and why
- Reference issues: `Fixes`, `Closes`, `Resolves`

```text
feat: add automated dependency updates

- Implement Dependabot configuration
- Configure weekly security updates

Resolves: #123
```

### Branching

Follow Conventional Branch format: `<type>/<description>`

- `feature/` or `feat/`, `bugfix/` or `fix/`, `hotfix/`,
  `release/`, `chore/`
- Lowercase, hyphens, no consecutive/leading/trailing hyphens

### Pull Requests

- Always create as **draft** initially
- Title must follow conventional commit format
- Include clear description and link related issues
