#!/usr/bin/env bash -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

export VAGRANT_DEFAULT_PROVIDER=parallels

vagrant destroy -f
vagrant up

cat <<EOF > "$DIR/.env"
export DOCKER_HOST_IP=$(vagrant ssh-config | sed -n "s/[ ]*HostName[ ]*//gp")
export DOCKER_HOST="tcp://\${DOCKER_HOST_IP}:2375"
EOF

. .env

docker version

docker build -t openstack-base-image ./openstack-base-image

ansible-playbook -i ansible/inventory/inventory \
    ansible/playbook.yml -e "docker_host=$DOCKER_HOST"
