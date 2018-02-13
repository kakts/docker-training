# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "centos"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.

  # modified akutsu
  #config.vm.network :private_network, ip: "192.168.33.10"
  #config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder "./lib", "/vagrant_data"

    # 1台目管理マシン（マシン名：master）
  config.vm.define "node01" do |atomic|
     atomic.vm.hostname = "node01.atomichost"
     atomic.vm.synced_folder ".", "/vagrant", disabled: true
     atomic.vm.network :forwarded_port, id: "ssh", guest: 22, host: 2223
     atomic.vm.network "private_network", ip: "192.168.33.10", virtualbox__intnet: "intra"
  end
  # 2台目 コンテナホスト（マシン名：node01）
  config.vm.define "node02" do |atomic|
     atomic.vm.hostname = "node02.atomichost"
     atomic.vm.synced_folder ".", "/vagrant", disabled: true
     atomic.vm.network :forwarded_port, id: "ssh", guest: 22, host: 2224
     atomic.vm.network "private_network", ip: "192.168.33.101", virtualbox__intnet: "intra"
  end
end
