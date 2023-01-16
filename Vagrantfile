Vagrant.configure("2") do |config|
  config.vm.box = "rockylinux/9"
  #config.disksize.size = "50GB"

  config.vm.synced_folder ".", "/vagrant"
  
  config.vm.define "node01" do |node01|
    node01.vm.network "public_network", ip: "192.168.1.100"
    node01.vm.hostname = "node01"
    node01.vm.provider "virtualbox" do |vb|
      vb.memory = 2048
      vb.cpus = 2
      vb.name = "node01"
    end
    node01.vm.provision "shell", path: "./scripts/docker_rl9.sh"
  end

  config.vm.define "node02" do |node02|
    node02.vm.network "public_network", ip: "192.168.1.101"
    node02.vm.hostname = "node02"
    node02.vm.provider "virtualbox" do |vb|
      vb.memory = 1024
      vb.cpus = 1
      vb.name = "node02"
    end
    node02.vm.provision "shell", path: "./scripts/docker_rl9.sh"
  end

  config.vm.define "node03" do |node03|
    node03.vm.network "public_network", ip: "192.168.1.102"
    node03.vm.hostname = "node03"
    node03.vm.provider "virtualbox" do |vb|
      vb.memory = 1024
      vb.cpus = 1
      vb.name = "node03"
    end
    node03.vm.provision "shell", path: "./scripts/docker_rl9.sh"
  end
end