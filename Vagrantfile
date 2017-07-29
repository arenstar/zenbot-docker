# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.ssh.forward_x11 = true
  config.ssh.forward_agent = true

  config.vm.provider :virtualbox do |v|
     v.memory = 1024
     v.cpus = 2
     v.customize ["modifyvm", :id, "--natdnshostresolver1", "on", "--name", "zenbot"]
  end

  config.vm.define "zenbot", primary: true, autostart: true do |zenbot|
    zenbot.vm.synced_folder ".", "/vagrant"
    zenbot.vm.box = "ubuntu/xenial64"
    zenbot.vm.hostname = 'zenbot.vagrant'
    zenbot.vm.network :private_network, ip: "192.168.22.10"
    #zenbot.vm.network "forwarded_port", guest: 8888, host: 8888, auto_correct: true
    zenbot.vm.provision :hosts do |provisioner|
      provisioner.add_host '127.0.0.1', ['zenbot.vagrant']
      provisioner.add_host '192.168.22.10', ['zenbot.vagrant']
    end
    config.vm.provider :virtualbox do |v|
     v.customize ["modifyvm", :id, "--name", "zenbot"]
    end
    zenbot.vm.provision :shell, :inline => "echo 'Defaults    env_keep+=SSH_AUTH_SOCK' >> /etc/sudoers.d/ssh_auth_sock"
    zenbot.vm.provision :shell, :inline => "cd /vagrant; make install run"
  end

end
