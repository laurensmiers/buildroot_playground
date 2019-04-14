# The directory in which this makefile resides is used as BR2_EXTERNAL
BR_EXTERNAL_DIR := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
# Set the buildroot output dir
BR_OUTPUT_DIR = $(BR_EXTERNAL_DIR)/output
# Set default target
BR_CONFIG?=raspberrypi_defconfig

MAKE8=$(MAKE) -j 8
MAKE_BUILDROOT = $(MAKE8) -C $(BR_EXTERNAL_DIR)/buildroot O=$(BR_OUTPUT_DIR) BR2_EXTERNAL=$(BR_EXTERNAL_DIR)

.PHONE: pi br

pi:
	BR_CONFIG=raspberrypi_defconfig $(MAKE) br

br:
	@echo "Build buildroot with config $(BR_CONFIG)"
	$(MAKE_BUILDROOT) $(BR_CONFIG)
	$(MAKE_BUILDROOT)
