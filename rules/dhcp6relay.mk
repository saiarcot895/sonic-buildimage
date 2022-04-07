# SONiC DHCPV6 RELAY Package

SONIC_DHCP6RELAY_VERSION = 1.0.0-0
SONIC_DHCP6RELAY_PKG_NAME = dhcp6relay

SONIC_DHCP6RELAY = sonic-$(SONIC_DHCP6RELAY_PKG_NAME)_$(SONIC_DHCP6RELAY_VERSION)_$(CONFIGURED_ARCH).deb
$(SONIC_DHCP6RELAY)_DEPENDS = $(LIBSWSSCOMMON) $(LIBHIREDIS) $(LIBSWSSCOMMON_DEV) $(LIBHIREDIS_DEV)
$(SONIC_DHCP6RELAY)_SRC_PATH = $(SRC_PATH)/$(SONIC_DHCP6RELAY_PKG_NAME)
SONIC_DPKG_DEBS += $(SONIC_DHCP6RELAY)

ifeq ($(ENABLE_ASAN), y)
    $(SONIC_DHCP6RELAY)_BUILD_ENV += DEB_BUILD_PROFILES=asan
endif

SONIC_DHCP6RELAY_DBG = sonic-$(SONIC_DHCP6RELAY_PKG_NAME)-dbgsym_$(SONIC_DHCP6RELAY_VERSION)_$(CONFIGURED_ARCH).deb
$(eval $(call add_derived_package,$(SONIC_DHCP6RELAY),$(SONIC_DHCP6RELAY_DBG)))
