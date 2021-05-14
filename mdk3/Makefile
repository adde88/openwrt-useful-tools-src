#
# Copyright (C) 2009 OpenWrt.org
# Copyright (C) 2019 Andreas Nilsen <adde88@gmail.com>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=mdk3
PKG_VERSION:=8.1
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)

PKG_MAINTAINER:=Andreas Nilsen <adde88@gmail.com>

include $(INCLUDE_DIR)/package.mk

define Package/mdk3
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libpthread +libnl +libpcap
  TITLE:=MDK3
  URL:=http://homepages.tu-darmstadt.de/~p_larbig/wlan/
  SUBMENU:=Wireless
endef

define Package/mdk3/description
  Tool to exploit wireless vulnerabilities
endef

TARGET_CFLAGS="-fPIC"

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) -rf ./src/* $(PKG_BUILD_DIR)/
endef

define Package/mdk3/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/mdk3 $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,mdk3))
