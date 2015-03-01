# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.require_version ">= 1.6.3"

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

end
