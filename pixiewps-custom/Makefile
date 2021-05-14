# Copyright (C) 2017-2018 Yousong Zhou
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME:=pixiewps-custom
PKG_VERSION:=1.4.2
PKG_RELEASE:=3
PKG_MAINTAINER:=Andreas Nilsen <adde88@gmail.com>

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)

PKG_LICENSE:=GPL-3.0
PKG_LICENSE_FILES:=LICENSE.md

include $(INCLUDE_DIR)/package.mk

define Package/pixiewps-custom
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Wireless
  TITLE:=An offline WPS bruteforce utility
  URL:=https://github.com/wiire-a/pixiewps
  DEPENDS:=+libpthread +libopenssl
endef

define Package/pixiewps-custom/description
  Pixiewps is a tool written in C used to bruteforce offline the WPS PIN
  exploiting the low or non-existing entropy of some Access Points, the so-called
  "pixie-dust attack" discovered by Dominique Bongard in summer 2014.  It is
  meant for educational purposes only.
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) -rf ./src/* $(PKG_BUILD_DIR)/
endef

# override flags by pixiewps' own Makefile
MAKE_FLAGS += \
	OPENSSL=1 \
	CFLAGS="$(TARGET_CFLAGS) $(EXTRA_CFLAGS) -DPIXIE_BIN=\\'pixie-core\\' " \
#	CFLAGS="$(TARGET_CFLAGS) $(EXTRA_CFLAGS)" \
	CPPFLAGS="$(TARGET_CPPFLAGS) $(EXTRA_CPPFLAGS)" \
	LDFLAGS="$(TARGET_LDFLAGS) $(EXTRA_LDFLAGS)"

define Package/pixiewps-custom/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/pixiewps $(1)/usr/bin/pixie-core
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/pixiewrapper  $(1)/usr/bin/pixiewps
endef

$(eval $(call BuildPackage,pixiewps-custom))
