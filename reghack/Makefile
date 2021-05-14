#
# Copyright (C) 2009-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=reghack
PKG_VERSION:=1.0
PKG_RELEASE:=4

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)

PKG_MAINTAINER:=Andreas Nilsen <adde88@gmail.com>

include $(INCLUDE_DIR)/package.mk

define Package/reghack
  SECTION:=net
  CATEGORY:=Network
  TITLE:=reghack
  URL:=https://github.com/adde88/reghack-openwrt.git
  SUBMENU:=Wireless
endef

define Package/reghack/description
  Reghack modifies the regulatory domain rules
  within the driver binaries with less restrictive ones.
  The current version also lifts the 5GHz radar channel restrictions in ath9k.
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) -rf ./src/* $(PKG_BUILD_DIR)/
endef

define Package/reghack/postinst
#!/bin/sh
echo -e "\nFinished installing reghack. Now let's hack the driver binaries!"
reghack `find /lib -name cfg80211.ko`
reghack `find /lib -name ath.ko`
echo -e "\nRebooting is required to properly reload the modified drivers."
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)/ \
		CC="$(TARGET_CC)" \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)"
endef

define Package/reghack/install
	$(INSTALL_DIR) $(1)/sbin
	$(CP) $(PKG_BUILD_DIR)/reghack $(1)/sbin/
endef

$(eval $(call BuildPackage,reghack))
