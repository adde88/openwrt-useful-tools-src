include $(TOPDIR)/rules.mk

PKG_NAME:=evilginx2
PKG_VERSION:=2.4.0
PKG_RELEASE:=1

GO_PKG:=github.com/kgretzky/evilginx2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/kgretzky/evilginx2/tar.gz/${PKG_VERSION}?
PKG_HASH:=6860f2cc185dd8463f9900341519b72a4615a21dc707328545011125c2ec1a93
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

PKG_LICENSE:=GPL-3.0
PKG_LICENSE_FILES:=LICENSE.md
PKG_MAINTAINER:=Andreas Nilsen <adde88@gmail.com>

PKG_BUILD_DEPENDS:=golang/host
PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/../feeds/packages/lang/golang/golang-package.mk

define Package/evilginx2/Default
  TITLE:=Standalone man-in-the-middle attack framework used for phishing login credentials
  URL:=https://github.com/kgretzky/evilginx2
  DEPENDS:=$(GO_ARCH_DEPENDS)
endef

define Package/evilginx2
$(call Package/evilginx2/Default)
  SECTION:=net
  CATEGORY:=Network
endef

define Package/evilginx2/description
  Evilginx2 is a man-in-the-middle attack framework used for phishing login credentials
  along with session cookies, which in turn allows to bypass 2-factor authentication protection.
endef

define Build/Compile
	echo "Compiling evilginx2!"
	$(Build/Compile/full)
endef

define Package/evilginx2/install
	$(call GoPackage/Package/Install/Bin,$(PKG_INSTALL_DIR))
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/evilginx2  $(1)/usr/bin/evilginx2
endef

$(eval $(call GoBinPackage,evilginx2))
$(eval $(call BuildPackage,evilginx2))
