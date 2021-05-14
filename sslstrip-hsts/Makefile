# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=sslstrip-hsts
PKG_VERSION:=1.0
PKG_RELEASE:=2

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)

PKG_BUILD_PARALLEL:=1
PKG_MAINTAINER:=Andreas Nilsen <adde88@gmail.com>

include $(INCLUDE_DIR)/package.mk
include ../python3-package.mk

define Package/sslstrip-hsts
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  URL:=https://github.com/byt3bl33d3r/sslstrip2
  TITLE:=sslstrip-hsts
  DEPENDS:= \
	+python3-light \
	+python3-twisted \
	+python3-pyopenssl \
	+python3-zope-interface \
	+python3-setuptools
  VARIANT:=python3
endef

define Package/sslstrip-hsts/description
  SSLstrip that includes the new feature to avoid 'HTTP Strict Transport Security' (HSTS.
endef

$(eval $(call Py3Package,sslstrip-hsts))
$(eval $(call BuildPackage,sslstrip-hsts))
