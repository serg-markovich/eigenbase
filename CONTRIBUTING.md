# Contributing to eigenbase

## Adding a new role

1. `mkdir -p roles/<name>/{tasks,defaults}`
2. Create `tasks/main.yml` and `defaults/main.yml`
3. Add the role to `site.yml` with a tag
4. Add `make <name>` target to `Makefile`
5. Add to the roles table in `README.md`

## Code style

- `make lint` must pass before PRs
- All variables must have defaults in `defaults/main.yml`
- No hardcoded usernames — use `lookup('env', 'USER')` and `lookup('env', 'HOME')`
- No secrets in repo — use `.env` + Ansible Vault

## Reporting issues

Open an issue with:
- Ubuntu version (`lsb_release -a`)
- Role that failed (`make <role> ARGS=-v`)
- Full error output
