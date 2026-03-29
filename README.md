# eigenbase

[![CI](https://github.com/serg-markovich/eigenbase/actions/workflows/ci.yml/badge.svg)](https://github.com/serg-markovich/eigenbase/actions/workflows/ci.yml)

Ansible-based workstation provisioning for the Eigenstack — a self-hosted, privacy-first infrastructure stack.

## Roles

| Role | Description |
|---|---|
| `base` | Core packages, locales, timezone |
| `devtools` | kubectl, Helm, k9s, Docker |
| `kubernetes` | kubectl, Helm, k9s |
| `monitoring` | node_exporter |
| `security` | UFW, SSH hardening |
| `docker` | Docker CE + Compose |
| `ollama` | Local LLM runtime |
| `eigenstack_dev` | Kind cluster for local dev |

## Usage

```bash
ansible-playbook site.yml -i inventory/localhost.yml --ask-become-pass
```

## Requirements

```bash
ansible-galaxy collection install -r requirements.yml
```

## Linting

```bash
ansible-lint site.yml
```
