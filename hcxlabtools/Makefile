#
# Copyright (C) 2019 Andreas Nilsen <adde88@gmail.com>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=hcxlabtools
PKG_VERSION:=0.1.0
PKG_RELEASE:=2

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)

PKG_MAINTAINER:=Andreas Nilsen <adde88@gmail.com>
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=license.txt

include $(INCLUDE_DIR)/package.mk

define Package/hcxlabtools
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libpcap +libopenssl
  TITLE:=hcxlabtools
  URL:=https://github.com/ZerBea/hcxdumptool
  SUBMENU:=Wireless
endef

define Package/hcxlabtools/description
  Small tool to capture packets from wlan devices. After capturing, upload
  the "uncleaned" cap here (https://wpa-sec.stanev.org/?submit)
  to see if your ap or the client is vulnerable by using common wordlists.
  Convert the cap to hccapx and/or to WPA-PMKID-PBKDF2 hashline (16800) with hcxpcaptool (hcxtools)
  and check if wlan-key or plainmasterkey was transmitted unencrypted.
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) -rf ./src/* $(PKG_BUILD_DIR)/
endef

EXTRA_CFLAGS += -O3 -Wall -Wextra


define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS) $(EXTRA_CFLAGS)" \
		all
endef

define Package/hcxlabtools/install
	$(INSTALL_DIR) $(1)/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/hcxlabgetm1	$(1)/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/hcxlabgetm2	$(1)/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/hcxlabgetm1234	$(1)/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/hcxlabgetmall	$(1)/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/hcxlabdumpall	$(1)/sbin/
endef

$(eval $(call BuildPackage,hcxlabtools))
