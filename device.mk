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

# Call the proprietary setup
$(call inherit-product-if-exists, vendor/xiaomi/gemini/gemini-vendor.mk)

# Ramdisk
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/xiaomi/gemini/ramdisk,root)

# Prebuilt
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/xiaomi/gemini/prebuilt/system,system)

# Dalvik/HWUI
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapstartsize=8m \
    dalvik.vm.heapgrowthlimit=256m \
    dalvik.vm.heapsize=512m \
    dalvik.vm.heaptargetutilization=0.75 \
    dalvik.vm.heapminfree=512k \
    dalvik.vm.heapmaxfree=8m

PRODUCT_PROPERTY_OVERRIDES += \
    ro.hwui.texture_cache_size=72 \
    ro.hwui.layer_cache_size=48 \
    ro.hwui.path_cache_size=32 \
    ro.hwui.gradient_cache_size=1 \
    ro.hwui.drop_shadow_cache_size=6 \
    ro.hwui.r_buffer_cache_size=8 \
    ro.hwui.texture_cache_flushrate=0.4 \
    ro.hwui.text_small_cache_width=1024 \
    ro.hwui.text_small_cache_height=1024 \
    ro.hwui.text_large_cache_width=2048 \
    ro.hwui.text_large_cache_height=1024

# Overlays
DEVICE_PACKAGE_OVERLAYS += device/xiaomi/gemini/overlay
PRODUCT_PACKAGE_OVERLAYS += device/xiaomi/gemini/overlay

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG += xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# CAF Branch
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.par.branch= LA.HB.1.3.1.c1-09600-8x96.0

# CodeAurora MSM8996 Device Tree
$(call inherit-product, device/qcom/msm8996/msm8996.mk)

# System properties
-include device/yu/gemini/system_prop.mk

# USB
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

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

# Call the proprietary setup
$(call inherit-product-if-exists, vendor/xiaomi/gemini/gemini-vendor.mk)
