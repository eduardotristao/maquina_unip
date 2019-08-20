Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.box_version = "20190801.01"
  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network :private_network, ip: "192.168.33.10"
  config.vm.synced_folder "~", "/vagrant", owner: "vagrant", group: "vagrant"
  config.vm.provider "virtualbox" do |machine|
    machine.memory = 1024
    machine.name = "maquina-apollo"
  end
  config.vm.provision :shell, path: "setup.sh"
end
