PROJECT=PTerm

all: build

../makefiles/%.gmk:
	git clone https://github.com/janvrany/smalltalk-makefiles.git $(dir $@)

-include GNUmakefile.local
include ../makefiles/pharo.gmk

build: prereq $(PROJECT).image
	@echo ""
	@echo "To open Pharo $(PROJECT) image run:"
	@echo ""
	@echo "    make run"
	@echo ""

$(PROJECT).image: ../*/*.st
	$(call pharo-copy-image, $(PHARO_IMAGE), $@)
	$(call pharo-load-local, $@, $(PROJECT), ..)

run: build
	$(PHARO_VM) $(PROJECT).image

test: build
	$(PHARO_VM_HEADLESS) $(PROJECT).image test --fail-on-failure \
		"$(PROJECT)-Tests"

clean::
	rm -f $(PROJECT).image $(PROJECT).changes

mrproper:: clean

.PHONY: all build run test clean mrproper
