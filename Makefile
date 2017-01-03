ANSIBLE=ansible
ANSIBLE_PLAYBOOK=ansible-playbook
PRIVATE_KEY=$(HOME)/.vagrant.d/insecure_private_key
VAULT_PWD_FILE=~/.vault-smokeyfeet

default:
	@echo "Useful targets: local staging production"

local:
	$(ANSIBLE_PLAYBOOK) \
		--inventory-file=$(CURDIR)/env_local/ \
		--private-key=$(PRIVATE_KEY) \
		--user=vagrant \
		--vault-password-file=$(VAULT_PWD_FILE) \
		$(CURDIR)/site.yml

staging:
	$(ANSIBLE_PLAYBOOK) \
		--inventory-file=$(CURDIR)/env_staging/ \
		--vault-password-file=$(VAULT_PWD_FILE) \
		$(CURDIR)/site.yml

production:
	$(ANSIBLE_PLAYBOOK) \
		--inventory-file=$(CURDIR)/env_production/ \
		--vault-password-file=$(VAULT_PWD_FILE) \
		$(CURDIR)/site.yml
