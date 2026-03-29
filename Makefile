.PHONY: all base docker k8s azure terraform-backend eigenstack monitoring security devtools ollama dotfiles check lint update help

ARGS     ?=
PLAYBOOK  = ansible-playbook site.yml -i inventory/localhost.yml

all: base docker k8s devtools dotfiles ## Full workstation setup

base:              ## Base packages + zsh + git
	$(PLAYBOOK) --tags base $(ARGS)

docker:            ## Docker engine + compose + rootless
	$(PLAYBOOK) --tags docker $(ARGS)

k8s:               ## kubectl, helm, k9s, kubectx, kind
	$(PLAYBOOK) --tags kubernetes $(ARGS)

azure:             ## Azure CLI + enterprise setup
	$(PLAYBOOK) --tags azure_enterprise $(ARGS)

terraform-backend: ## Terraform + Azure remote state
	$(PLAYBOOK) --tags terraform_backend $(ARGS)

eigenstack:        ## Local eigenstack dev cluster (kind)
	$(PLAYBOOK) --tags eigenstack_dev $(ARGS)

monitoring:        ## node_exporter + systemd service
	$(PLAYBOOK) --tags monitoring $(ARGS)

security:          ## ufw + fail2ban + pre-commit
	$(PLAYBOOK) --tags security $(ARGS)

devtools:          ## VS Code + jq + yq + direnv
	$(PLAYBOOK) --tags devtools $(ARGS)

ollama:            ## Ollama + systemd user unit
	$(PLAYBOOK) --tags ollama $(ARGS)

dotfiles:          ## .zshrc .gitconfig .tmux.conf symlinks
	$(PLAYBOOK) --tags dotfiles $(ARGS)

check:             ## Dry-run — no changes made
	$(PLAYBOOK) --check --diff $(ARGS)

lint:              ## ansible-lint
	ansible-lint site.yml

update:            ## Re-run all (idempotent upgrade)
	$(PLAYBOOK) $(ARGS)

help:              ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*##' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*##"}; {printf "\033[36m%-22s\033[0m %s\n", $$1, $$2}'

verify: ## Check all tools are installed
	@echo "Checking installed tools..."
	@for tool in zsh docker kubectl helm k9s kubectx kind terraform az pre-commit; do \
		which $$tool > /dev/null 2>&1 && echo "  ✅ $$tool" || echo "  ❌ $$tool missing"; \
	done
