#
# KiroOS: Vulkan HAL of the S6 edge+.
#
# The noble Mali blob (DDK r15p0) has the Vulkan driver inside libGLES_mali.so, but unlike the
# zero blob it ships no vulkan.exynos5.so HAL next to it: the Vulkan loader found no driver while
# the Vulkan features were declared, so apps that chose Vulkan could not start it. The HAL is a
# link to the GLES library, as on the S6 / S6 edge. This driver reports Vulkan 1.0.26 (measured
# on the S6: same Mali-T760 and same kernel driver).
#

LOCAL_PATH := $(call my-dir)

KIRO_VULKAN_HAL_LINKS := \
    $(TARGET_OUT_VENDOR)/lib/hw/vulkan.exynos5.so \
    $(TARGET_OUT_VENDOR)/lib64/hw/vulkan.exynos5.so

$(KIRO_VULKAN_HAL_LINKS):
	@echo "Vulkan HAL link: $@ -> ../egl/libGLES_mali.so"
	@mkdir -p $(dir $@)
	$(hide) ln -sf ../egl/libGLES_mali.so $@

ALL_DEFAULT_INSTALLED_MODULES += $(KIRO_VULKAN_HAL_LINKS)
