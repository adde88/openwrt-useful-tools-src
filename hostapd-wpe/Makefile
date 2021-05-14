#
# Copyright (C) 2021 Andreas Nilsen <adde88@gmail.com> https://github.com/adde88
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=hostapd-wpe
PKG_VERSION:=1
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)

PKG_MAINTAINER:=Andreas Nilsen <adde88@gmail.com>

PKG_BUILD_PARALLEL:=1

PKG_CONFIG_DEPENDS:= \
	CONFIG_PACKAGE_kmod-ath9k \
	CONFIG_PACKAGE_kmod-cfg80211 \
	CONFIG_PACKAGE_hostapd \
	CONFIG_PACKAGE_hostapd-mini \
	CONFIG_WPE_RFKILL_SUPPORT \
	CONFIG_WPE_WEXT_SUPPORT \
	CONFIG_WPE_11N_SUPPORT \
	CONFIG_WPE_11AC_SUPPORT \
	CONFIG_WPE_TAXONOMY_SUPPORT

include $(INCLUDE_DIR)/package.mk

STAMP_CONFIGURED:=$(STAMP_CONFIGURED)_$(CONFIG_WPE_MSG_MIN_PRIORITY)

ifneq ($(CONFIG_WPE_11N_SUPPORT),)
  HOSTAPD_IEEE80211N:=y
endif

ifneq ($(CONFIG_WPE_11AC_SUPPORT),)
  HOSTAPD_IEEE80211AC:=y
endif

ifneq ($(CONFIG_WPE_TAXONOMY_SUPPORT),)
  CONFIG_WPE_TAXONOMY_SUPPORT:=y
endif

DRIVER_MAKEOPTS= \
	CONFIG_ACS=$(CONFIG_PACKAGE_kmod-cfg80211) \
	CONFIG_DRIVER_NL80211=$(CONFIG_PACKAGE_kmod-cfg80211) \
	CONFIG_IEEE80211N=$(HOSTAPD_IEEE80211N) \
	CONFIG_IEEE80211W=$(HOSTAPD_IEEE80211W) \
	CONFIG_DRIVER_WEXT=$(CONFIG_WPE_WEXT_SUPPORT) \
	CONFIG_DRIVER_TAXONOMY=$(CONFIG_WPE_TAXONOMY_SUPPORT) \
	CONFIG_DRIVER_ROBOSWITCH=$(CONFIG_PACKAGE_kmod-switch)

ifdef CONFIG_WPE_RFKILL_SUPPORT
  DRIVER_MAKEOPTS += NEED_RFKILL=y
endif

ifdef CONFIG_USE_EGLIBC
  TARGET_LDFLAGS += -lrt
  TARGET_LDFLAGS_C += -lrt
endif

define Package/hostapd-wpe/config
  source "$(SOURCE)/Config.in"
endef

define Package/hostapd-wpe
  SECTION:=net
  CATEGORY:=Network
  TITLE:=IEEE 802.1x Authenticator with WPE support
  DEPENDS:=+libubus +libnl-tiny
endef

define Package/hostapd-wpe/description
 This package contains a full featured IEEE 802.1x/WPA/EAP/RADIUS Authenticator with WPE patch support.
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) -rf ./src/* $(PKG_BUILD_DIR)/
endef


ifneq ($(wildcard $(PKG_BUILD_DIR)/.config_*),$(subst .configured_,.config_,$(STAMP_CONFIGURED)))
  define Build/Configure/rebuild
	$(FIND) $(PKG_BUILD_DIR) -name \*.o -or -name \*.a | $(XARGS) rm -f
	rm -f $(PKG_BUILD_DIR)/hostapd/hostapd
	#rm -f $(PKG_BUILD_DIR)/wpa_supplicant/wpa_supplicant
	rm -f $(PKG_BUILD_DIR)/.config_*
	touch $(subst .configured_,.config_,$(STAMP_CONFIGURED))
  endef
endif

define Build/Configure
	$(Build/Configure/rebuild)
	$(if $(wildcard ./files/hostapd-wpe.config), \
		$(CP) ./files/hostapd-wpe.config $(PKG_BUILD_DIR)/hostapd/.config \
	)
endef

TARGET_CPPFLAGS := \
	-I$(STAGING_DIR)/usr/include/libnl-tiny \
	-I$(PKG_BUILD_DIR)/src/crypto \
	$(TARGET_CPPFLAGS) \
	-DCONFIG_LIBNL20 \
	-D_GNU_SOURCE \
	$(if $(CONFIG_WPE_MSG_MIN_PRIORITY),-DCONFIG_MSG_MIN_PRIORITY=$(CONFIG_WPE_MSG_MIN_PRIORITY))

TARGET_CFLAGS += -ffunction-sections -fdata-sections -flto
TARGET_LDFLAGS += -Wl,--gc-sections -flto=jobserver -fuse-linker-plugin -lubox -lubus -lm -lnl-tiny

define Build/RunMake
	CFLAGS="$(TARGET_CPPFLAGS) $(TARGET_CFLAGS)" \
	$(MAKE) $(PKG_JOBS) -C $(PKG_BUILD_DIR)/$(1) \
		CC="$(TARGET_CC)" \
		$(TARGET_CONFIGURE_OPTS) \
		$(DRIVER_MAKEOPTS) \
		LIBS="$(TARGET_LDFLAGS)" \
		LIBS_c="$(TARGET_LDFLAGS_C)" \
		AR="$(TARGET_CROSS)gcc-ar" \
		BCHECK= \
		$(2)
endef

define Build/Compile/hostapd
	$(call Build/RunMake,hostapd, \
		hostapd-wpe hostapd-wpe_cli \
	)
endef

define Build/Compile
	echo "Compiling $(PKG_NAME)-$(PKG_VERSION)"
	$(Build/Compile/hostapd)
	$(Build/Compile/full)
endef

config_files=hostapd-wpe-bgn.conf hostapd-wpe-an.conf hostapd-wpe.eap_user
cert_config_files=ca.der ca.key ca.pem dh server.key server.pem server_no_pass.key

define Install/hostapd-wpe
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_DIR) $(1)/etc/hostapd-wpe
	$(INSTALL_DIR) $(1)/etc/hostapd-wpe/certs
endef

define Package/hostapd-wpe/install
	$(call Install/hostapd-wpe,$(1))
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/hostapd/hostapd-wpe $(1)/usr/sbin/
	$(INSTALL_DATA) $(addprefix $(PKG_BUILD_DIR)/hostapd/etc/,$(config_files)) $(1)/etc/hostapd-wpe/
	$(INSTALL_DATA) $(addprefix $(PKG_BUILD_DIR)/hostapd/etc/certs/,$(cert_config_files)) $(1)/etc/hostapd-wpe/certs/
endef

$(eval $(call BuildPackage,hostapd-wpe))
