#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/motorola/fogo

# Inherit from motorola sm6375-common
include device/motorola/sm6375-common/BoardConfigCommon.mk

# Audio
AUDIO_FEATURE_ENABLED_EXT_AMPLIFIER := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := fogo

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml
ODM_MANIFEST_SKUS += dn n
ODM_MANIFEST_DN_FILES := $(DEVICE_PATH)/sku/manifest_dn.xml
ODM_MANIFEST_N_FILES := $(DEVICE_PATH)/sku/manifest_n.xml

# Kernel
BOARD_KERNEL_CMDLINE += androidboot.hab.product=fogo
TARGET_KERNEL_CONFIG += vendor/ext_config/moto-holi-fogo.config

# Kernel Modules
BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules.load))
BOARD_VENDOR_KERNEL_MODULES_BLOCKLIST_FILE := $(DEVICE_PATH)/modules.blocklist
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules.load.recovery))
BOOT_KERNEL_MODULES := $(BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD)

# Partitions
BOARD_MOT_DP_GROUP_SIZE := 6706692096 # (BOARD_SUPER_PARTITION_SIZE - 4MB)
BOARD_SUPER_PARTITION_SIZE := 6710886400

# Properties
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/product.prop
TARGET_SYSTEM_EXT_PROP += $(DEVICE_PATH)/system_ext.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Recovery
TARGET_RECOVERY_DENSITY := hdpi
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 90

# Security
BOOT_SECURITY_PATCH := 2026-04-01
VENDOR_SECURITY_PATCH := $(BOOT_SECURITY_PATCH)

# Calyx
PLATFORM_SECURITY_PATCH := $(VENDOR_SECURITY_PATCH)
PLATFORM_SECURITY_PATCH_TIMESTAMP := $(shell date -d 'TZ="GMT" $(PLATFORM_SECURITY_PATCH)' +%s)

# Verified Boot
BOARD_AVB_ROLLBACK_INDEX := 25
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := 25

# inherit from the proprietary version
include vendor/motorola/fogo/BoardConfigVendor.mk

# Added based on Copilot recommendations
# Recovery base
TARGET_RECOVERY_FSTAB := device/motorola/fogo/recovery.fstab
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_CRYPTO_FBE_METADATA := true
TW_INCLUDE_FASTBOOTD := true
TW_USE_NEW_MINADBD := true

# OrangeFox core
FOX_BUILD_DEVICE := fogo
FOX_USE_TWRP_RECOVERY := true
FOX_USE_NANO_EDITOR := true
FOX_USE_TAR_BINARY := true
FOX_USE_XZ_UTILS := true
FOX_USE_BASH := true
FOX_USE_BUSYBOX := true

# DO I need these?
#BOARD_USES_RECOVERY_AS_BOOT := false
#BOARD_USES_INIT_BOOT := true
BOARD_BOOT_HEADER_VERSION := 4  # or whatever fogo actually uses
