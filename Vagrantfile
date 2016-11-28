Vagrant.configure(2) do |config|

  config.vm.box = "debian/jessie64"

  config.vm.host_name = "register.smokeyfeet.test"

  config.vm.provider "virtualbox" do |v|
     v.memory = 512
     v.cpus = 1
  end

  config.vm.network :private_network, ip: "10.0.0.200"

  config.ssh.insert_key = false
 
  config.vm.provision "ansible" do |ansible|
    ansible.inventory_path = "./env_local/"
    ansible.playbook = "site.yml"
    #ansible.verbose = true
    ansible.limit = "all"
    ansible.vault_password_file = "~/.vault-smokeyfeet"
  end

  config.vm.provision "shell", inline: <<-SHELL
    #cd ~smartpr/smartpr2/smartpr-api && source ./venv/bin/activate
    #cd ./venv/src/smartpr-api/smartpr/api
    #./manage.py loaddata fixtures/vagrant/accounts.json
    #./manage.py loaddata fixtures/vagrant/templates.json
  SHELL
end
