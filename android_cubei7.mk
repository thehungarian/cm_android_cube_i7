#
# Copyright (C) 2014 The Android-x86 Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#


LOCAL_PATH := $(call my-dir)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# includes the base of Android-x86 platform
$(call inherit-product, device/generic/x86_64/android_x86_64.mk)

# Overlays
PRODUCT_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay

# Overrides
PRODUCT_NAME := android_cubei7
PRODUCT_DEVICE := cubei7
PRODUCT_MODEL := Cube i7 Android
PRODUCT_CHARACTERISTICS := tablet
PRODUCT_LOCALES := en_GB en_US
PRODUCT_DEFAULT_LANGUAGE := en_GB
PRODUCT_DEFAULT_REGION := GB
PRODUCT_MANUFACTURER := Cube

PRODUCT_PROPERTY_OVERRIDES += \
    ro.radio.noril=1 \
    ro.dalvik.vm.isa.arm64=x86_64 \
	ro.enable.native.bridge.exec64=1 \
	poweroff.doubleclick=0 \
    hal.sensors.iio.accel=1 \
	hal.sensors.iio.accel.matrix=1,0,0,0,-1,0,0,0,-1 \
    ro.com.android.dateformat=dd-MM-yyyy \
	ro.wifi.channels=13 \
	ro.product.locale.region=GB \
	ro.ignore_atkbd=1 \
	net.bt.name=Cubei7

GAPPS_VARIANT := stock
GAPPS_EXCLUDED_PACKAGES := DialerFramework \
	Messenger \
	DialerGoogle \
	PixelIcons \
	PixelLauncher \
	FaceDetect \
	FaceUnlock \
	FaceLock \
	GoogleCamera

# Pre-optimization https://source.android.com/devices/tech/dalvik/configure
WITH_DEXPREOPT := true

$(call inherit-product, vendor/google/build/opengapps-packages.mk)
