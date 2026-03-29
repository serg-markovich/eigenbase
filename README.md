# eigenbase

> ⚡ One command to bootstrap a complete DevOps workstation on Ubuntu 24.04

[![CI](https://github.com/serg-markovich/eigenbase/actions/workflows/ci.yml/badge.svg)](https://github.com/serg-markovich/eigenbase/actions)
![Ansible](https://img.shields.io/badge/Ansible-2.16+-red?logo=ansible)
![Ubuntu](https://img.shields.io/badge/Ubuntu-24.04-orange?logo=ubuntu)
![License](https://img.shields.io/github/license/serg-markovich/eigenbase)

## Quick Start

```bash
curl -fsSL https://raw.githubusercontent.com/serg-markovich/eigenbase/main/bootstrap.sh | bash
```

Or step by step:

```bash
git clone https://github.com/serg-markovich/eigenbase.git
cd eigenbase
cp .env.example .env && nano .env
make all
```

## Roles

| Role | Installs |
|------|----------|
| `base` | zsh, Oh My Zsh, tmux, fzf, ripgrep, bat, jq, git |
| `docker` | Docker Engine, Compose plugin, rootless mode |
| `kubernetes` | kubectl, helm, k9s, kubectx/kubens, kind |
| `azure_enterprise` | Azure CLI + subscription setup |
| `terraform_backend` | Terraform + Azure remote state |
| `eigenstack_dev` | Local kind cluster for eigenstack dev |
| `monitoring` | node_exporter + systemd service |
| `security` | ufw, fail2ban, pre-commit hooks |
| `devtools` | VS Code + extensions, yq, direnv, git-crypt |
| `ollama` | Ollama + systemd user service |
| `dotfiles` | .zshrc, .gitconfig, .tmux.conf symlinks |

## Selective install

```bash
make docker           # Docker only
make k8s              # Kubernetes tools only
make azure            # Azure CLI only
make eigenstack       # Local eigenstack dev cluster
make check            # Dry-run — no changes
make help             # All targets
```

## Security

- No usernames or paths are hardcoded — auto-detected at runtime via `$USER` / `$HOME`
- Secrets go in `.env` (gitignored) — see `.env.example`
- Sensitive vars can be encrypted with Ansible Vault

## Part of the eigenstack ecosystem

eigenbase is the local foundation of [eigenstack](https://github.com/serg-markovich/eigenstack) —
a self-hosted, privacy-first infrastructure stack.

## License

[MIT](LICENSE)
