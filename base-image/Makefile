all: build

build: ; @docker build --rm --tag="dguerri/os-base-image" .

clean: ; @docker rmi -f "dguerri/os-base-image"

rebuild: clean build

.PHONY: all build clean
