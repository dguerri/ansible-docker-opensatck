#!/usr/bin/env bash -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

export VAGRANT_DEFAULT_PROVIDER=parallels

vagrant destroy -f
vagrant up --no-provision

. .env

docker build -t base-image ./base-image

ansible-playbook -i ansible/inventory ansible/playbook.yml -e "docker_host_ip=$DOCKER_HOST_IP"
