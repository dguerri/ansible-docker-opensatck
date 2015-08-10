# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'

Vagrant.require_version '>= 1.6.3'

setup_boot2docker = <<EOS
echo Adding DNS flags to docker host...

echo 'EXTRA_ARGS="$EXTRA_ARGS --bip=172.17.42.1/16 --dns=172.17.42.1 \
  --dns=8.8.8.8 --dns=8.8.4.4"' >> /var/lib/boot2docker/profile

/etc/init.d/docker restart
EOS

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  if Vagrant.has_plugin?('vagrant-cachier')
    config.cache.auto_detect = false
    config.cache.enable nil
  end

  config.vm.box = 'parallels/boot2docker'

  config.ssh.insert_key = false

  config.vm.synced_folder '.', '/vagrant', disabled: true

  config.vm.provider 'parallels' do |p|
    p.update_guest_tools = true
    p.memory = 8192
    p.cpus = 6
    p.optimize_power_consumption = true
    p.customize ['set', :id, '--nested-virt', 'on']
    p.customize ['set', :id, '--adaptive-hypervisor', 'on']
  end

  config.vm.provision 'shell', inline: setup_boot2docker
end
