.PHONY: install lint syntax run

install:
	ansible-galaxy collection install -r requirements.yml

lint:
	ansible-lint site.yml

syntax:
	ansible-playbook site.yml -i inventory/localhost.yml --syntax-check

run:
	ansible-playbook site.yml -i inventory/localhost.yml --ask-become-pass
