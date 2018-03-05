#
# Copyright (C) 2007-2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=tinc
PKG_VERSION:=1.1-pre15
PKG_RELEASE=$(PKG_SOURCE_VERSION)

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/excogitation/tinc.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=fbf2b70435e01cf9a14e34c6f80f44fbe4107f1d
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz
PKG_MIRROR_MD5SUM:=

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/tinc
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+kmod-tun +liblzo +libopenssl +librt +zlib
  TITLE:=VPN tunneling daemon
  URL:=http://www.tinc-vpn.org/
# MAINTAINER:=Saverio Proto <zioproto@gmail.com>
  MAINTAINER:=Anton Voyl <awiouy@gmail.com>
  SUBMENU:=VPN
endef

define Package/tinc/description
  tinc is a Virtual Private Network (VPN) daemon that uses tunnelling and
  encryption to create a secure private network between hosts on the Internet.
endef

TARGET_CFLAGS += -std=gnu99

CONFIGURE_ARGS += \
	--disable-curses \
	--disable-readline \
	--with-lzo-include="$(STAGING_DIR)/usr/include/lzo" \
	--with-zlib="$(STAGING_DIR)/usr"

define Package/tinc/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/sptps_speed $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/tinc $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/tincd $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/init.d/
	$(INSTALL_BIN) files/$(PKG_NAME).init $(1)/etc/init.d/$(PKG_NAME)
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) files/$(PKG_NAME).config $(1)/etc/config/$(PKG_NAME)
	$(INSTALL_DIR) $(1)/etc/tinc
	$(INSTALL_DIR) $(1)/lib/upgrade/keep.d
	$(INSTALL_DATA) files/tinc.upgrade $(1)/lib/upgrade/keep.d/tinc
endef

define Package/tinc/conffiles
/etc/config/tinc
endef

$(eval $(call BuildPackage,tinc))
