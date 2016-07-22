#
# Copyright (C) 2016 The AOSParadox Project
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

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/xiaomi/gemini/gemini-vendor.mk)

# Ramdisk
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/xiaomi/gemini/ramdisk,root)

# Prebuilt
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/xiaomi/gemini/prebuilt/system,system)

# CAF Branch
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.par.branch= LA.HB.1.3.1.c1-09600-8x96.0

# CodeAurora msm8996 Tree
include device/qcom/msm8996/msm8996.mk

# System properties
-include device/yu/gemini/system_prop.mk

# Overlays
DEVICE_PACKAGE_OVERLAYS += device/yu/gemini/overlay

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Dalvik/HWUI
$(call inherit-product, frameworks/native/build/phone-xxhdpi-3072-dalvik-heap.mk)
$(call inherit-product, frameworks/native/build/phone-xxhdpi-3072-hwui-memory.mk)

# Doze mode
PRODUCT_PACKAGES += \
    XiaomiDoze

# NFC
PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    com.nxp.nfc.nq \
    libnqnfc-nci \
    libp61-jcop-kit \
    nfc_nci.nqx.default \
    NQNfcNci \
    nqnfcee_access.xml \
    nqnfcse_access.xml \
    Tag

# Power
PRODUCT_PACKAGES += \
    power.msm8996 \
    power.qcom
