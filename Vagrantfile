#Configurando Vagrant
Vagrant.configure("2") do |config|
#Definindo a imagem ISO
  config.vm.box = "ubuntu/bionic64"
#Fazendo a comunicação da por 80 da maquina virtual com a porta 8080 da maquina host
  config.vm.network :forwarded_port, guest: 80, host: 8080
#Definindo o IP da maquina virtual
  config.vm.network :private_network, ip: "192.168.33.10"
#Sincronizando diretório da maquina Host com a maquina virtual
  config.vm.synced_folder "~", "/vagrant", owner: "vagrant", group: "vagrant"
#Defindo o virtualbox como provider da maquiona
  config.vm.provider "virtualbox" do |machine|
#Definindo a quantidade de memoria da maquina virtual
    machine.memory = 1024
#Definindo nome da maquina virtual
    machine.name = "maquina-apollo"
  end
#Definindo que o script setup.sh ira rodar ao iniciar a maquina
  config.vm.provision :shell, path: "setup.sh"
end
