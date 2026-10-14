#
# KiroOS Developer Beta 2 product: lunch kiro_zenlte-userdebug
# Galaxy S6 edge+ (SM-G928F), device tree device/samsung/zenltexx
#

# Device configuration (noble hardware family) with the KiroOS S6 family layer
$(call inherit-product, device/samsung/zenltexx/device.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

TARGET_SCREEN_HEIGHT := 2560
TARGET_SCREEN_WIDTH := 1440

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME="zenltexx" \
    TARGET_DEVICE="zenlte"

PRODUCT_NAME := kiro_zenlte
PRODUCT_DEVICE := zenltexx
PRODUCT_BRAND := KiroOS
PRODUCT_MODEL := Galaxy S6 edge+
PRODUCT_MANUFACTURER := samsung

# Model facts read by Settings (About phone, Edge screen) and init (palm rejection)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.kiroos.model=SM-G928F \
    ro.kiroos.battery_mah=3000 \
    ro.kiroos.ram_gb=4 \
    ro.kiroos.edge=1 \
    persist.sys.kiroos.edge_zone=3
