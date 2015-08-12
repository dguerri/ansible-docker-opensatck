all: build

build: ; @docker build --rm --tag="dguerri/openstack-keystone" .

clean: ; @docker rmi -f "dguerri/openstack-keystone"

rebuild: clean build

.PHONY: all build clean
