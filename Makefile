ANSIBLE=ansible
ANSIBLE_PLAYBOOK=ansible-playbook
PRIVATE_KEY=$(HOME)/.vagrant.d/insecure_private_key
VAULT_PWD_FILE=~/.vault-smokeyfeet

default:
	@echo "Useful targets: vagrant production"

local-vars:
	$(ANSIBLE) \
		-m debug -a var=hostvars \
		-i $(CURDIR)/env_local/ \
		--vault-password-file $(VAULT_PWD_FILE) \
		all

local:
	$(ANSIBLE_PLAYBOOK) \
		--inventory-file=$(CURDIR)/env_local/ \
		--private-key=$(PRIVATE_KEY) \
		--user=vagrant \
		--vault-password-file=$(VAULT_PWD_FILE) \
		$(CURDIR)/site.yml

staging-vars:
	$(ANSIBLE) \
		-m debug -a var=hostvars \
		-i $(CURDIR)/env_staging/ \
		--vault-password-file $(VAULT_PWD_FILE) \
		all

staging:
	$(ANSIBLE_PLAYBOOK) \
		--inventory-file=$(CURDIR)/env_staging/ \
		--vault-password-file=$(VAULT_PWD_FILE) \
		$(CURDIR)/site.yml

production-vars:
	$(ANSIBLE) \
		-m debug -a var=hostvars \
		-i $(CURDIR)/env_production/ \
		--vault-password-file $(VAULT_PWD_FILE) \
		all

production:
	$(ANSIBLE_PLAYBOOK) \
		--inventory-file=$(CURDIR)/env_production/ \
		--vault-password-file=$(VAULT_PWD_FILE) \
		$(CURDIR)/site.yml
