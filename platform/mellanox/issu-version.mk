# ISSU version

ISSU_VERSION_FILE = issu-version
$(ISSU_VERSION_FILE)_SRC_PATH = $(PLATFORM_PATH)/issu-version
$(ISSU_VERSION_FILE)_DEPENDS += $(APPLIBS)
SONIC_MAKE_FILES += $(ISSU_VERSION_FILE)

# TODO: Disable because the base OS version (bullseye) doesn't match what the
# SDK app packages are built for (buster), and this target assumes that they
# are available.
#MLNX_FILES += $(ISSU_VERSION_FILE)

export ISSU_VERSION_FILE
