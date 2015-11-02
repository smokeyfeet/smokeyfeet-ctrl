ANSIBLE_PLAYBOOK=ansible-playbook
PRIVATE_KEY=$(HOME)/.vagrant.d/insecure_private_key
VAULT_PWD_FILE=~/.smokeyfeet-vault

default:
	@echo "Useful targets: vagrant production"

vagrant:
	$(ANSIBLE_PLAYBOOK) \
		--inventory-file=$(CURDIR)/inventories/vagrant \
		--private-key=$(PRIVATE_KEY) \
		--user=vagrant \
		--vault-password-file=$(VAULT_PWD_FILE) \
		$(CURDIR)/site.yml

production:
	$(ANSIBLE_PLAYBOOK) \
		--inventory-file=$(CURDIR)/inventories/production \
		--vault-password-file=$(VAULT_PWD_FILE) \
		$(CURDIR)/site.yml
