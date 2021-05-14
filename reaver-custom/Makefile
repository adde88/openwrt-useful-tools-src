#
#
# Copyright (C) 2012-2015 OpenWrt.org
# Copyright (C) 2019 Andreas Nilsen
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/package.mk

PKG_NAME:=reaver-custom
PKG_VERSION:=1.6.6
PKG_RELEASE:=4

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)

PKG_BUILD_PARALLEL:=1

PKG_MAINTAINER:=Andreas Nilsen <adde88@gmail.com>

PKG_LICENSE:=GPL-2.0
PKG_LICENSE_FILES:=docs/LICENSE

PKG_USE_MIPS16:=0

PKG_AUTOMAKE_PATHS:=src
PKG_FIXUP:=autoreconf

CONFIGURE_PATH:=src
MAKE_PATH:=src

CONFIGURE_ARGS += --enable-savetocurrent

define Package/reaver-custom
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Wireless
  TITLE:=Reaver (Custom)
  URL:=https://github.com/t6x/reaver-wps-fork-t6x
  DEPENDS:=+libpcap +libpthread
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) -rf ./src/* $(PKG_BUILD_DIR)/
endef

define Package/reaver-custom/description
  Reaver has been designed to be a robust and practical attack against Wi-Fi
  Protected Setup (WPS) registrar PINs in order to recover WPA/WPA2
  passphrases. It has been tested against a wide variety of access points and
  WPS implementations.

  This is reaver-wps-fork-t6x, a community forked version, which has included
  various bug fixes and additional attack method (the offline Pixie Dust
  attack).
endef

define Package/reaver-custom/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/{reaver,wash} $(1)/usr/bin/
endef

$(eval $(call BuildPackage,reaver-custom))
