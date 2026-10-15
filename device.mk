#
# KiroOS: Samsung Galaxy S6 edge+ (SM-G928F, zenltexx)
#

LOCAL_PATH := device/samsung/zenltexx

# Overlays: power profile (3000 mAh), memory killer for 4 GB
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# 5.7" WQHD dual edge: 560 dpi (AAPT density set by noblelte-common)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=560

# 4 GB RAM
$(call inherit-product, frameworks/native/build/phone-xxxhdpi-4096-dalvik-heap.mk)
$(call inherit-product-if-exists, frameworks/native/build/phone-xxxhdpi-4096-hwui-memory.mk)

# Ramdisk: Shannon 333 modem baseband init
PRODUCT_PACKAGES += \
    init.baseband.rc

# Radio: cpboot daemon that loads the modem firmware (stock SM-G928F)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ril/sbin/cbd:root/sbin/cbd

# Bluetooth (BCM4359)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

# Noble hardware family (includes the KiroOS S6 family layer)
$(call inherit-product, device/samsung/noblelte-common/noblelte.mk)

# Model specific blobs: RIL and native feature library
$(call inherit-product, vendor/samsung/zenltexx/zenltexx-vendor.mk)

# KiroOS: Vulkan version of the noble Mali blob, 1.0.26 (measured on the S6, same GPU and kernel
# driver; the HAL link is in vulkan/Android.mk)
PRODUCT_COPY_FILES += \
    device/samsung/universal7420-common/kiroos/permissions/android.hardware.vulkan.version-1_0_26.xml:system/etc/permissions/android.hardware.vulkan.version.xml
