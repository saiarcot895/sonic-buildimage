SHELL = /bin/bash
.ONESHELL:
.SHELLFLAGS += -e

MAIN_TARGET = libsnmp-base_$(SNMPD_VERSION_FULL)_all.deb
DERIVED_TARGETS = snmptrapd_$(SNMPD_VERSION_FULL)_$(CONFIGURED_ARCH).deb \
		  snmp_$(SNMPD_VERSION_FULL)_$(CONFIGURED_ARCH).deb \
		  snmpd_$(SNMPD_VERSION_FULL)_$(CONFIGURED_ARCH).deb \
		  snmp-dbgsym_$(SNMPD_VERSION_FULL)_$(CONFIGURED_ARCH).deb \
		  snmpd-dbgsym_$(SNMPD_VERSION_FULL)_$(CONFIGURED_ARCH).deb \
		  libsnmp40_$(SNMPD_VERSION_FULL)_$(CONFIGURED_ARCH).deb \
		  libsnmp40-dbgsym_$(SNMPD_VERSION_FULL)_$(CONFIGURED_ARCH).deb \
		  libsnmp-dev_$(SNMPD_VERSION_FULL)_$(CONFIGURED_ARCH).deb \
		  libsnmp-perl_$(SNMPD_VERSION_FULL)_$(CONFIGURED_ARCH).deb \
		  tkmib_$(SNMPD_VERSION_FULL)_all.deb

$(addprefix $(DEST)/, $(MAIN_TARGET)): $(DEST)/% :
	rm -rf net-snmp-$(SNMPD_VERSION)

	# download debian net-snmp
	dget -u https://sonicstorage.blob.core.windows.net/debian/pool/main/n/net-snmp/net-snmp_$(SNMPD_VERSION)-3.dsc

	pushd net-snmp-$(SNMPD_VERSION)
	git init
	git add -f *
	git commit -m "unmodified snmpd source"

	# Looks like Debian did a binNMU (binary non-maintainer upload), so the latest dsc
	# file that we can get doesn't actually have the exact version number that Debian's
	# repos have.
	DEBEMAIL="$(shell git config --get user.name) <$(shell git config --get user.email)>" dch --bin-nmu "Rebuild against perl 5.32.0"
	dch -r ""
	git add debian/changelog
	git commit -m "fix package version"

	# Apply patches
	stg init
	stg import -s ../patch-$(SNMPD_VERSION)/series

	dpkg-buildpackage -rfakeroot -b -d -us -uc -j1 --admindir $(SONIC_DPKG_ADMINDIR)
	popd

	mv $(DERIVED_TARGETS) $* $(DEST)/

$(addprefix $(DEST)/, $(DERIVED_TARGETS)): $(DEST)/% : $(DEST)/$(MAIN_TARGET)
