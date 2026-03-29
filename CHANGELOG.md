# Changelog

## [v0.1.0] — 2026-03-29

### Added
- Core roles: base, devtools, kubernetes, docker, ollama, monitoring, security, eigenstack_dev
- GitHub Actions CI: ansible-lint + syntax-check on every push
- requirements.yml with community.general >=8.0.0 and ansible.posix >=1.5.0
- Makefile targets: install, lint, syntax, run

### Fixed
- Replaced curl | bash for Helm and Ollama with get_url + unarchive
- Correct mode parameter placement in kubernetes and monitoring roles
- Resolved community.general.ufw missing collection in CI
- Reduced ansible-lint violations from 34 to 0

## [Unreleased]

### Planned for v0.2.0
- Multi-host inventory
- Secrets management via SOPS or Ansible Vault
- Molecule tests for roles/base
- Kubernetes service layer (eigenstack)
