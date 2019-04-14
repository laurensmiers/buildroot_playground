HELLOWORLD_VERSION = v1.0
HELLOWORLD_SITE = $(TOPDIR)/../package/helloworld/src
HELLOWORLD_SITE_METHOD = local

define HELLOWORLD_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
endef

define HELLOWORLD_INSTALL_TARGET_CMDS
	rsync -a $(@D) $(TARGET_DIR)/root/
endef

$(eval $(generic-package))
