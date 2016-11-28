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
    ansible.limit = "all"
    ansible.vault_password_file = "~/.vault-smokeyfeet"
  end

  config.vm.provision "shell", privileged: false, inline: <<-SHELL
    cd ~/smokeyfeet-registration
    ~/venv/bin/python manage.py loaddata registration/fixtures/pass_types.json
    ~/venv/bin/python manage.py loaddata registration/fixtures/lunch_types.json
  SHELL
end
