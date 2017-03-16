# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/xenial64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  config.vm.provider "virtualbox" do |v|
      v.name = "prism"
      # v.memory = "1024"
	end

  config.vm.hostname = "prism"

  config.vm.provision "shell", path: "./vm/bootstrap.sh"
  config.vm.provision "shell", path: "./vm/install-python.sh"
  config.vm.provision "shell", path: "./vm/install-singularity.sh"
  config.vm.provision "shell", path: "./vm/install-docker.sh"

end