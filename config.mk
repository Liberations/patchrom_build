#
# Copyright (C) 2016 The Miui Patchrom
#

include $(PORT_BUILD)/localvar.mk

ifeq ($(USE_ANDROID_OUT),true)
# Prebuilt dirs
PREBUILT_SYS_DIR := $(ANDROID_OUT)/system
PREBUILT_DATA_DIR := $(ANDROID_OUT)/data
PREBUILT_CUST_DIR := $(ANDROID_OUT)/cust_variants_intermedia
PREBUILT_RES_DIR := $(PREBUILT_SYS_DIR)/framework
PREBUILT_BOOT_DIR := $(ANDROID_OUT)/root

# Release dirs
RELEASE_DIR := $(PORT_ROOT)/miui
RELEASE_SYS_DIR := $(RELEASE_DIR)/system
RELEASE_JAR_DIR := $(RELEASE_SYS_DIR)/framework
RELEASE_RES_DIR := $(RELEASE_SYS_DIR)/framework-res/$(RELEASE_DENSITY)
RELEASE_APP_DIR := $(RELEASE_SYS_DIR)/app
RELEASE_APP_APK_DIR := $(RELEASE_APP_DIR)/$(RELEASE_DENSITY)
RELEASE_APP_LIB_DIR := $(RELEASE_APP_DIR)/$(RELEASE_BIT)
RELEASE_PRIV_APP_DIR := $(RELEASE_SYS_DIR)/priv-app
RELEASE_PRIV_APP_APK_DIR := $(RELEASE_PRIV_APP_DIR)/$(RELEASE_DENSITY)
RELEASE_PRIV_APP_LIB_DIR := $(RELEASE_PRIV_APP_DIR)/$(RELEASE_BIT)
RELEASE_BIN_DIR := $(RELEASE_SYS_DIR)/bin/$(RELEASE_BIT)
RELEASE_XBIN_DIR := $(RELEASE_SYS_DIR)/xbin/$(RELEASE_BIT)
RELEASE_LIB_DIR := $(RELEASE_SYS_DIR)/lib
RELEASE_LIB64_DIR := $(RELEASE_SYS_DIR)/lib64
RELEASE_ETC_DIR := $(RELEASE_SYS_DIR)/etc
RELEASE_MEDIA_DIR := $(RELEASE_SYS_DIR)/media/$(RELEASE_DENSITY)
RELEASE_FONTS_DIR := $(RELEASE_SYS_DIR)/fonts
RELEASE_BOOT_DIR := $(RELEASE_DIR)/boot


# Src dirs
MIUI_SRC_DIR := $(ANDROID_TOP)/miui
else
# Prebuilt dirs
PREBUILT_SYS_DIR := $(PORT_ROOT)/miui/system
PREBUILT_DATA_DIR := $(PORT_ROOT)/miui/data
PREBUILT_CUST_DIR := $(PORT_ROOT)/miui/cust
PREBUILT_RES_DIR := $(PREBUILT_SYS_DIR)/framework-res/$(PREBUILT_DENSITY)
PREBUILT_BOOT_DIR := $(PORT_ROOT)/miui/boot

# Src dirs
MIUI_SRC_DIR := $(PORT_ROOT)/miui/src
endif

# Prebuilt dirs
PREBUILT_JAR_DIR := $(PREBUILT_SYS_DIR)/framework
PREBUILT_LIB_DIR := $(PREBUILT_SYS_DIR)/lib
PREBUILT_LIB64_DIR := $(PREBUILT_SYS_DIR)/lib64
PREBUILT_BIN_DIR := $(PREBUILT_SYS_DIR)/bin/$(PREBUILT_BIT)
PREBUILT_XBIN_DIR := $(PREBUILT_SYS_DIR)/xbin/$(PREBUILT_BIT)
PREBUILT_APP_DIR := $(PREBUILT_SYS_DIR)/app
PREBUILT_APP_APK_DIR := $(PREBUILT_APP_DIR)/$(PREBUILT_DENSITY)
PREBUILT_APP_LIB_DIR := $(PREBUILT_APP_DIR)/$(PREBUILT_BIT)
PREBUILT_PRIV_APP_DIR := $(PREBUILT_SYS_DIR)/priv-app
PREBUILT_PRIV_APP_APK_DIR := $(PREBUILT_PRIV_APP_DIR)/$(PREBUILT_DENSITY)
PREBUILT_PRIV_APP_LIB_DIR := $(PREBUILT_PRIV_APP_DIR)/$(PREBUILT_BIT)
PREBUILT_ETC_DIR := $(PREBUILT_SYS_DIR)/etc
PREBUILT_MEDIA_DIR := $(PREBUILT_SYS_DIR)/media/$(PREBUILT_DENSITY)
PREBUILT_FONTS_DIR := $(PREBUILT_SYS_DIR)/fonts

# Target dirs
TARGET_OUT_DIR := out
TARGET_SYS_DIR := $(TARGET_OUT_DIR)/ZIP/system
TARGET_DATA_DIR := $(TARGET_OUT_DIR)/ZIP/data
TARGET_APP_DIR := $(TARGET_SYS_DIR)/app
TARGET_PRIV_APP_DIR := $(TARGET_SYS_DIR)/priv-app
TARGET_FRAMEWORK_DIR := $(TARGET_SYS_DIR)/framework
TARGET_LIB_DIR := $(TARGET_SYS_DIR)/lib
TARGET_LIB64_DIR := $(TARGET_SYS_DIR)/lib64
TARGET_BIN_DIR := $(TARGET_SYS_DIR)/bin
TARGET_XBIN_DIR := $(TARGET_SYS_DIR)/xbin
TARGET_ETC_DIR := $(TARGET_SYS_DIR)/etc
TARGET_MEDIA_DIR := $(TARGET_SYS_DIR)/media
TARGET_FONTS_DIR := $(TARGET_SYS_DIR)/fonts
TARGET_BOOT_DIR := $(TARGET_OUT_DIR)/boot

# Tools
TOOLS_DIR                  := $(PORT_ROOT)/tools
AAPT                       := $(TOOLS_DIR)/$(HOST_OS)-x86/aapt
UNPACKBOOTIMG              := $(TOOLS_DIR)/$(HOST_OS)-x86/unpackbootimg
MKBOOTFS                   := $(TOOLS_DIR)/$(HOST_OS)-x86/mkbootfs
MKBOOTIMG                  := $(TOOLS_DIR)/$(HOST_OS)-x86/mkbootimg
APKTOOL                    := $(TOOLS_DIR)/apktool $(APK_VERBOSE)
PATCH_BOOTIMG_SH           := $(TOOLS_DIR)/patch_bootimg.sh
UNIQ_FIRST_PY              := $(TOOLS_DIR)/uniq_first.py

# Config files
BUILD_PROP  := $(TARGET_SYS_DIR)/build.prop
MIUI_PROP   := $(PORT_BUILD)/miui.prop
KEYS_CONF   := $(TOOLS_DIR)/keys.conf

# Apktool include
APKTOOL_INCLUDE_RES_DIR := $(TARGET_OUT_DIR)/apktool
APKTOOL_INCLUDE_VENDOR_RES := $(APKTOOL_INCLUDE_RES_DIR)/1.apk
APKTOOL_INCLUDE_MIUI_RES := $(APKTOOL_INCLUDE_RES_DIR)/1-miui.apk

include $(PORT_BUILD)/miui_apps.mk

MIUI_JARS := framework services telephony-common wifi-service
MIUI_EXT_RES_APKS := $(PREBUILT_APP_APK_DIR)/miui/miui.apk \
	$(PREBUILT_RES_DIR)/framework-ext-res/framework-ext-res.apk \
	$(PREBUILT_APP_APK_DIR)/miuisystem/miuisystem.apk
