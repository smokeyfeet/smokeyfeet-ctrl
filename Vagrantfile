Vagrant.configure(2) do |config|

  config.vm.box = "debian/jessie64"

  config.vm.host_name = "smokeyfeet-dev"

  config.vm.provider "virtualbox" do |v|
     v.memory = 1024
     v.cpus = 1
  end

  config.vm.network :private_network, ip: "10.0.0.200"

  config.ssh.insert_key = false

end
