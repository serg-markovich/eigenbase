# Changelog

## [Unreleased]

### Fixed
- Correct mode parameter placement in kubernetes role
- Resolve community.general.ufw missing collection in CI
- Replace curl | bash for Helm with idempotent get_url + unarchive
- Replace Ollama curl | sh with get_url pattern
- Resolve ansible-lint violations (34 → 0)
- Add requirements.yml for CI collection resolution

### Added
- GitHub Actions CI with lint + syntax-check jobs
- requirements.yml with community.general and ansible.posix
- Makefile targets: install, lint, syntax, run
