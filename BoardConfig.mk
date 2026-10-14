#
# KiroOS: Samsung Galaxy S6 edge+ (SM-G928F, zenltexx)
#
# Hardware family: noble (Note5 / S6 edge+: BCM4359 Wi-Fi, clearwater audio, MAX77833 PMIC,
# FTS5AD56 touch, S6E3HF3 panel), common tree device/samsung/noblelte-common.
# Kernel: the unified exynos7420 kernel with the zenlte DTS and kiroos_zenltexx_defconfig.
#

LOCAL_PATH := device/samsung/zenltexx

# Include path: our headers first (samsung_dtbh.h carries the zenlte DTBH platform codes the
# bootloader matches the dt.img against), the noble common ones are appended below.
TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

# Inherit common board flags
include device/samsung/noblelte-common/BoardConfigCommon.mk

# Kernel
TARGET_KERNEL_SOURCE := kernel/samsung/exynos7420
TARGET_KERNEL_CONFIG := kiroos_zenltexx_defconfig

# RIL
BOARD_MODEM_TYPE := ss333

# Recovery / OTA
TARGET_OTA_ASSERT_DEVICE := zenltexx,zenlte

# Partitions: /proc/partitions blocks * 1024
BOARD_BOOTIMAGE_PARTITION_SIZE := 29360128
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE := 209715200
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 35651584
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 4404019200
BOARD_USERDATAIMAGE_PARTITION_SIZE := 27032289280

# Boot animation (1440x2560 portrait)
TARGET_SCREEN_HEIGHT := 2560
TARGET_SCREEN_WIDTH := 1440

# Proprietary
-include vendor/samsung/zenltexx/BoardConfigVendor.mk
