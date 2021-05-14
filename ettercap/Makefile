#
# Copyright (C) 2006-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=ettercap
PKG_VERSION:=0.8.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/Ettercap/ettercap/releases/download/v$(PKG_VERSION)/
PKG_MD5SUM:=b6b20851862f55644d5f296f77b785d1

PKG_BUILD_PARALLEL:=1

PKG_MAINTAINER:=Andreas Nilsen <adde88@gmail.com>
CMAKE_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/ettercap
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libpcap +libnet-1.2.x +libopenssl +libpcre +libncurses +libltdl +libpthread +zlib +curl +libgeoip
  TITLE:=Ettercap is a suite for man in the middle attacks on LAN.
  URL:=http://ettercap.sourceforge.net
endef

define Package/ettercap/description
	It features sniffing of live connections, content filtering on the fly
	and many other interesting tricks.
	It supports active and passive dissection of many protocols (even
	ciphered ones) and includes many feature for network and host analysis.
endef

define Package/ettercap/conffiles
/etc/etter.conf
endef

define Package/ettercap/install
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_CONF) $(PKG_INSTALL_DIR)/etc/etter.conf $(1)/etc/
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/etter{cap,filter,log} $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/lib/ettercap
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/ettercap/*.so $(1)/usr/lib/ettercap/
	$(INSTALL_DIR) $(1)/usr/share/ettercap
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/share/ettercap/* $(1)/usr/share/ettercap/
endef

$(eval $(call BuildPackage,ettercap))
