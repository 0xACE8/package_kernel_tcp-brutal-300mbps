include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=tcp-brutal-300Mbps
PKG_VERSION:=1.0.3-300Mbps
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/0xACE8/tcp-brutal.git
PKG_SOURCE_BRANCH:=v1.0.3-300Mbps
PKG_SOURCE_VERSION:=f5e40f12efa62c929dc8bff30f4c73d3b8ed55af
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz
PKG_MIRROR_HASH:=skip

PKG_LICENSE:=GPL-3.0
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=0xACE8

include $(INCLUDE_DIR)/package.mk

PKG_BUILD_DIR:=$(KERNEL_BUILD_DIR)/$(PKG_NAME)-v$(PKG_VERSION)

define KernelPackage/tcp-brutal-300Mbps
  TITLE:=TCP Brutal congestion control (Custom 300Mbps)
  SUBMENU:=Network Support
  FILES:= $(PKG_BUILD_DIR)/brutal.ko
  AUTOLOAD:=$(call AutoProbe,brutal)
  CONFLICTS:=kmod-tcp-brutal kmod-tcp-brutal-500Mbps kmod-tcp-brutal-1Gbps kmod-tcp-brutal-5Gbps
endef

define KernelPackage/tcp-brutal-300Mbps/Description
  TCP Brutal congestion control algorithm (Custom 300Mbps Mod).
endef

define Build/Compile
	+$(KERNEL_MAKE) M=$(PKG_BUILD_DIR) modules
endef

$(eval $(call KernelPackage,tcp-brutal-300Mbps))
