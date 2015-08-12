CONTAINERS := os-base-image
CLEAN_JOBS := $(addprefix clean-,${CONTAINERS})
BUILD_JOBS := $(addprefix build-,${CONTAINERS})

all: ${BUILD_JOBS}

clean: ${CLEAN_JOBS}

${CLEAN_JOBS}: clean-%: ; $(MAKE) -C $* clean

${BUILD_JOBS}: build-%: ; $(MAKE) -C $* build

.PHONY: all ${CLEAN_JOBS} ${BUILD_JOBS}
