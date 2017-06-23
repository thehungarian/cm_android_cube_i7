#
# Product-specific compile-time definitions.
#

# The generic product target doesn't have any hardware-specific pieces.
#TARGET_NO_BOOTLOADER := true
#TARGET_NO_KERNEL := true
#TARGET_CPU_ABI := x86_64
#TARGET_ARCH := x86_64
#TARGET_ARCH_VARIANT := x86_64
TARGET_CPU_VARIANT := broadwell
#TARGET_PRELINK_MODULE := false

#TARGET_2ND_CPU_ABI := x86
#TARGET_2ND_ARCH := x86
#TARGET_2ND_ARCH_VARIANT := x86
TARGET_2ND_CPU_VARIANT := broadwell

# Disable emulator for "make dist" until there is a 64-bit qemu kernel
BUILD_EMULATOR := false
# Some framework code requires this to enable BT
BOARD_HAVE_BLUETOOTH := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/generic/common/bluetooth

USE_OPENGL_RENDERER := true
BOARD_USES_WACOMINPUT := true

#TARGET_CPU_ABI_LIST_64_BIT := $(TARGET_CPU_ABI) $(TARGET_CPU_ABI2) $(NATIVE_BRIDGE_ABI_LIST_64_BIT)
#TARGET_CPU_ABI_LIST_32_BIT := $(TARGET_2ND_CPU_ABI) $(TARGET_2ND_CPU_ABI2) $(NATIVE_BRIDGE_ABI_LIST_32_BIT)
#TARGET_CPU_ABI_LIST := $(TARGET_CPU_ABI) $(TARGET_CPU_ABI2) $(TARGET_2ND_CPU_ABI) $(TARGET_2ND_CPU_ABI2) $(NATIVE_BRIDGE_ABI_LIST_64_BIT) $(NATIVE_BRIDGE_ABI_LIST_32_BIT)
#TARGET_CPU_ABI_LIST := $(TARGET_CPU_ABI) $(TARGET_CPU_ABI2) $(NATIVE_BRIDGE_ABI_LIST_64_BIT)

TARGET_USES_64_BIT_BINDER := true

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_USERDATAIMAGE_PARTITION_SIZE := 576716800
BOARD_CACHEIMAGE_PARTITION_SIZE := 69206016
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 4096
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true
TARGET_SYSTEMIMAGES_USE_EXT4 := true

# use a different compression for initrd
#INITRD_COMPRESSOR := lz4

LOCAL_PATH := $(call my-dir)


TARGET_KERNEL_SOURCE := kernel
TARGET_KERNEL_CONFIG := android-cube_i7_defconfig
#TARGET_KERNEL_CONFIG := $(LOCAL_PATH)/android-cube_i7_defconfig

.PHONY: ${TARGET_KERNEL_SOURCE}/arch/x86/configs/${TARGET_KERNEL_CONFIG}
${TARGET_KERNEL_SOURCE}/arch/x86/configs/${TARGET_KERNEL_CONFIG} : 
	${TARGET_KERNEL_SOURCE}/scripts/kconfig/merge_config.sh -m -n \
		kernel/arch/x86/configs/android-x86_64_defconfig \
		device/cube/cubei7/${TARGET_KERNEL_CONFIG} \
#		${TARGET_KERNEL_SOURCE}/kernel/configs/android-base.config \
#		${TARGET_KERNEL_SOURCE}/kernel/configs/android-recommended.config \
	&& \
	cp .config ${TARGET_KERNEL_SOURCE}/arch/x86/configs/${TARGET_KERNEL_CONFIG}

BOARD_GPU_DRIVERS := i965 i915g i915 gallium
TARGET_HARDWARE_3D := true
#BOARD_EGL_CFG := device/generic/common/gpu/egl_mesa.cfg
BOARD_KERNEL_CMDLINE := root=/dev/ram0 quiet usbcore.autosuspend=2 androidboot.selinux=permissive

include device/generic/x86_64/BoardConfig.mk
