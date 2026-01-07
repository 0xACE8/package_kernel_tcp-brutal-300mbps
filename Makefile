include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=tcp-brutal-300mbps
PKG_VERSION:=1.0.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/0xACE8/tcp-brutal-300mbps/tar.gz/v$(PKG_VERSION)?
PKG_HASH:=c6f4c46785c901a3114d1ac0b25e61d86037d03732aa3e5e69bf833f0507bb2f

PKG_LICENSE:=GPL-3.0
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=0xACE8

include $(INCLUDE_DIR)/package.mk

define KernelPackage/tcp-brutal-300mbps
  TITLE:=TCP Brutal congestion control (300mbps)
  SUBMENU:=Network Support
  FILES:=$(PKG_BUILD_DIR)/tcp-brutal-300mbps.ko
  AUTOLOAD:=$(call AutoProbe,tcp-brutal-300mbps)
endef

define KernelPackage/tcp-brutal-300mbps/Description
  TCP Brutal congestion control algorithm (Custom 300mbps Mod).
endef

define Build/Compile
	+$(KERNEL_MAKE) M=$(PKG_BUILD_DIR) modules
endef

$(eval $(call KernelPackage,tcp-brutal-300mbps))
