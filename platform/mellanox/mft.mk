# Mellanox SAI

MFT_VERSION = 4.17.0
MFT_REVISION = 106

export MFT_VERSION MFT_REVISION

MFT = mft_$(MFT_VERSION)-$(MFT_REVISION)_amd64.deb
$(MFT)_SRC_PATH = $(PLATFORM_PATH)/mft
ifeq ($(DISTRO), bullseye)
$(MFT)_DEPENDS += $(LINUX_HEADERS) $(LINUX_HEADERS_COMMON)
endif
SONIC_MAKE_DEBS += $(MFT)

ifeq ($(DISTRO), bullseye)
KERNEL_MFT = kernel-mft-dkms-modules-$(KVERSION)_$(MFT_VERSION)_amd64.deb
$(eval $(call add_derived_package,$(MFT),$(KERNEL_MFT)))
endif

MFT_OEM = mft-oem_$(MFT_VERSION)-$(MFT_REVISION)_amd64.deb
$(eval $(call add_derived_package,$(MFT),$(MFT_OEM)))
