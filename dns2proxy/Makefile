# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=dns2proxy
PKG_VERSION:=1.0
PKG_RELEASE:=2

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)

PKG_BUILD_PARALLEL:=1
PKG_MAINTAINER:=Andreas Nilsen <adde88@gmail.com>

include $(INCLUDE_DIR)/package.mk
include ../python3-package.mk

define Package/dns2proxy
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  URL:=https://github.com/LeonardoNve/dns2proxy
  TITLE:=dns2proxy
  DEPENDS:= \
	+python3-light \
	+python3-dns \
	+python3-setuptools \
	+scapy
  VARIANT:=python3
endef

define Package/dns2proxy/description
  This tools offer a different features for post-explotation once you change the DNS server to a Victim
endef

$(eval $(call Py3Package,dns2proxy))
$(eval $(call BuildPackage,dns2proxy))
