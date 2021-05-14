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

PKG_NAME:=pixelsrv-tls
PKG_VERSION:=2.3.1
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)

PKG_BUILD_PARALLEL:=1

PKG_MAINTAINER:=Andreas Nilsen <adde88@gmail.com>

PKG_LICENSE:=GPL-2.0
PKG_LICENSE_FILES:=docs/LICENSE

PKG_USE_MIPS16:=0

PKG_FIXUP:=autoreconf

define Package/pixelsrv-tls
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Pixelserv-TLS (Custom)
  URL:=https://github.com/kvic-z/pixelserv-tls
  DEPENDS:=+libopenssl
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) -rf ./src/* $(PKG_BUILD_DIR)/
endef

define Package/pixelsrv-tls/description
  A tiny bespoke HTTP/1.1 webserver with HTTPS and SNI support.
  It acts on behalf of hundreds of thousands of advert/tracker servers
  and responds to all requests with nothing to speed up web browsing.
  pixelserv-tls supports TLSv1.0, TLSv1.2 and TLSv1.3 and thus could operate with a wide range
  of browsers and client devices. Server certificates for any given advert/tracker domains are
  generated automatically on first use and saved to disk.
  pixelserv-tls can log access and HTTP/1.1 POST contents to syslog.
  So it is also a useful tool to inspect and expose 'wrongly blocked' domains
  as well as 'rogue' domains invading user privacy.
endef

#define Build/Compile
#	$(MAKE) -C $(PKG_BUILD_DIR) \
#		all
#endef

define Package/pixelsrv-tls/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/pixelsrv-tls $(1)/usr/bin/
endef

$(eval $(call BuildPackage,pixelsrv-tls))
