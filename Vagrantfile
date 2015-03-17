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
  if Vagrant.has_plugin?('vagrant-cachier')
    config.cache.auto_detect = false
    config.cache.enable :apt
    config.cache.scope = CACHE_SCOPE
    config.cache.synced_folder_opts = {
      type: 'rsync'
    }
  end

  config.vm.provider "parallels" do |p|
  config.vm.synced_folder '.', '/vagrant', disabled: true


    p.update_guest_tools = true
    p.memory = 8192
    p.cpus = 6
    p.optimize_power_consumption = false
    p.customize [ 'set', :id, '--nested-virt', 'on' ]
    p.customize [ 'set', :id, '--adaptive-hypervisor', 'on' ]
  end

  config.vm.provision "shell", inline: $auto_dns_script

end
