#
# Copyright (C) 2009-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=mdk4
PKG_VERSION:=4.1
PKG_RELEASE:=10

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)

PKG_USE_MIPS16:=0

PKG_MAINTAINER:=Andreas Nilsen <adde88@gmail.com>

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/mdk4
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libpthread +libpcap +libpcre +libnl +libnl-genl
  TITLE:=mdk4
  URL:=https://github.com/aircrack-ng/mdk4
  SUBMENU:=Wireless
endef

define Package/mdk4/description
  Tool to exploit wireless vulnerabilities. (DEVELOPER VERSION)
endef

IGNORE_WARNINGS:= \
	-Wno-implicit-function-declaration \
	-Wno-unused-function \
	-Wno-unused-variable \
	-Wno-unused-parameter \
	-Wno-pointer-sign

TARGET_CFLAGS += \
	-I$(STAGING_DIR)/usr/include/libnl3 \
	-DCONFIG_LIBNL30 \
	-D_FILE_OFFSET_BITS=64 \
	-D_REVISION=mdk4-v1 \
	-g -W -Wall -O3

TARGET_LDFLAGS:= \
	-static-libstdc++ -Wl,--gc-sections -lnl

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) -rf ./src/* $(PKG_BUILD_DIR)/
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)/ \
		CFLAGS="$(TARGET_CFLAGS)" \
		LDFLAGS="$(TARGET_LDFLAGS)" \
		CC="$(TARGET_CC)"
endef

define Package/mdk4/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/mdk4 $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,mdk4))
