# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.require_version ">= 1.6.3"

$auto_dns_script = <<EOS
echo Adding DNS flags to docker host...

echo 'EXTRA_ARGS="$EXTRA_ARGS --bip=172.17.42.1/16 --dns=172.17.42.1 --dns=8.8.8.8 --dns=8.8.4.4"' >> \
  /var/lib/boot2docker/profile

/etc/init.d/docker restart
EOS

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "wearableintelligence/boot2docker-parallels"

  config.vm.provider "parallels" do |p|
    p.update_guest_tools = true
    p.memory = 8192
    p.cpus = 6
    p.optimize_power_consumption = false
    p.customize [ 'set', :id, '--nested-virt', 'on' ]
    p.customize [ 'set', :id, '--adaptive-hypervisor', 'on' ]
  end

  config.vm.provision "shell", inline: $auto_dns_script

end
