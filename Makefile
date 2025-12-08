include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=tcp-brutal-300Mbps
PKG_VERSION:=1.0.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/0xACE8/tcp-brutal-300Mbps/tar.gz/v$(PKG_VERSION)?
PKG_HASH:=5b4e6510afd480776d1bd487abdd3aed0b2a7edc2718c1a85716e0f9828d23c1

PKG_LICENSE:=GPL-3.0
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=0xACE8

include $(INCLUDE_DIR)/package.mk

define KernelPackage/tcp-brutal-300Mbps
  TITLE:=TCP Brutal congestion control (300Mbps)
  SUBMENU:=Network Support
  FILES:=$(PKG_BUILD_DIR)/brutal.ko
  AUTOLOAD:=$(call AutoProbe,brutal)
endef

define KernelPackage/tcp-brutal-300Mbps/Description
  TCP Brutal congestion control algorithm (Custom 300Mbps Mod).
endef

define Build/Compile
	+$(KERNEL_MAKE) M=$(PKG_BUILD_DIR) modules
endef

$(eval $(call KernelPackage,tcp-brutal-300Mbps))
