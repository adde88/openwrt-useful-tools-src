#
# Copyright (C) 2021 Andreas Nilsen <adde88@gmail.com> https://github.com/adde88
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

PKG_CONFIG_DEPENDS += \
	CONFIG_MANA_DRIVER_11AX_SUPPORT \
	CONFIG_MANA_WPA_ENABLE_WEP


ifneq ($(CONFIG_MANA_DRIVER_11AX_SUPPORT),)
  HOSTAPD_IEEE80211AX:=y
endif

DRIVER_MAKEOPTS += \
	CONFIG_IEEE80211W=$(CONFIG_MANA_DRIVER_11W_SUPPORT)

define Build/Prepare
        mkdir -p $(PKG_BUILD_DIR)
        $(CP) -rf ./src2.9/* $(PKG_BUILD_DIR)/
endef
