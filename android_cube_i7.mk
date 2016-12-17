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


$(call inherit-product,$(SRC_TARGET_DIR)/product/core_64_bit.mk)

# includes the base of Android-x86 platform
$(call inherit-product,device/generic/common/x86_64.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay

# Overrides
PRODUCT_NAME := cm_i7
PRODUCT_BRAND := Android-x86
PRODUCT_DEVICE := i7
PRODUCT_MODEL := Cube i7 Android-x86_64
PRODUCT_CHARACTERISTICS := tablet
PRODUCT_LOCALES += en_GB
PRODUCT_MANUFACTURER := cube

PRODUCT_PROPERTY_OVERRIDES += \
    ro.radio.noril=1 \
    ro.dalvik.vm.isa.arm64=x86_64 \
	ro.enable.native.bridge.exec64=1