#!/usr/bin/env bash -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

vagrant box list | grep wearableintelligence/boot2docker-parallels >/dev/null 2>&1
if [ $? -ne 0 ]; then
  curl -LO https://github.com/wearableintelligence/boot2docker-vagrant-box/releases/download/docker%2Fv1.5.0/boot2docker-parallels.box
  vagrant box add --name wearableintelligence/boot2docker-parallels boot2docker-parallels.box
  rm boot2docker-parallels.box
fi

export VAGRANT_DEFAULT_PROVIDER=parallels

vagrant destroy -f
vagrant up --no-provision

. .env

docker build -t base-image ./base-image

ansible-playbook -i ansible/inventory ansible/playbook.yml -e "docker_host_ip=$DOCKER_HOST_IP"
