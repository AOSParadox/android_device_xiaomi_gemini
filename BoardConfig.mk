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

# inherit CodeAurora MSM8996 Board Config
-include device/qcom/msm8996/BoardConfig.mk

BOARD_VENDOR := xiaomi

# Boldly go.
USE_CLANG_PLATFORM_BUILD := true

# Include
TARGET_SPECIFIC_HEADER_PATH := device/xiaomi/gemini/include

# Assert
TARGET_OTA_ASSERT_DEVICE := gemini

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8996
TARGET_NO_BOOTLOADER := true

# Kernel
BOARD_CUSTOM_BOOTIMG_MK := device/xiaomi/gemini/mkbootimg.mk
ENABLE_CPUSETS := true
TARGET_CONFIG := msm_defconfig
KERNEL_DEFCONFIG := kernel/xiaomi/msm8996
TARGET_PREBUILT_KERNEL := device/xiaomi/gemini/prebuilt/zImage
 
# Releasetools
ADD_RADIO_FILES ?= true
TARGET_RELEASETOOLS_EXTENSIONS := device/qcom/common

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "qualcomm-uart"

# Audio
AUDIO_FEATURE_ENABLED_ACDB_LICENSE := true
AUDIO_FEATURE_ENABLED_ANC_HEADSET := true
AUDIO_FEATURE_ENABLED_AUDIOSPHERE := true
AUDIO_FEATURE_ENABLED_COMPRESS_VOIP := true
AUDIO_FEATURE_ENABLED_DEV_ARBI := true
AUDIO_FEATURE_ENABLED_EXTN_FORMATS := true
AUDIO_FEATURE_ENABLED_FLAC_OFFLOAD := true
AUDIO_FEATURE_ENABLED_FLUENCE := true
AUDIO_FEATURE_ENABLED_HFP := true
AUDIO_FEATURE_ENABLED_KPI_OPTIMIZE := true
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_ENABLED_NT_PAUSE_TIMEOUT := true
AUDIO_FEATURE_ENABLED_PCM_OFFLOAD := true
AUDIO_FEATURE_ENABLED_PCM_OFFLOAD_24 := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
AUDIO_USE_LL_AS_PRIMARY_OUTPUT := true
BOARD_USES_ALSA_AUDIO := true
USE_CUSTOM_AUDIO_POLICY := 1

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/xiaomi/gemini/bluetooth
BOARD_BLUETOOTH_BDROID_HCILP_INCLUDED := false
BOARD_HAS_QCA_BT_ROME := true
BOARD_HAVE_BLUETOOTH_QCOM := true
QCOM_BT_USE_BTNV := true

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# NFC
BOARD_NFC_CHIPSET := pn548
TARGET_USES_NQ_NFC := true

# Partitions
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_CACHEIMAGE_PARTITION_SIZE := 402653184
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3221225472
BOARD_USERDATAIMAGE_PARTITION_SIZE := 58846064640

# QCOM
BOARD_USES_QCOM_HARDWARE := false

# Recovery
TARGET_RECOVERY_FSTAB := device/xiaomi/gemini/ramdisk/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"


# SELinux
include device/qcom/sepolicy/sepolicy.mk
BOARD_SEPOLICY_DIRS += device/xiaomi/gemini/sepolicy

# Vendor init
TARGET_INIT_VENDOR_LIB := libinit_gemini
TARGET_RECOVERY_DEVICE_MODULES := libinit_gemini

# Wifi
BOARD_HAS_QCOM_WLAN := true
BOARD_HAS_QCOM_WLAN_SDK := true
BOARD_WLAN_DEVICE := qcwcn
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
HOSTAPD_VERSION := VER_0_8_X
WIFI_DRIVER_FW_PATH_AP := "ap"
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_FW_PATH_P2P := "p2p"
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME := "wlan"
WPA_SUPPLICANT_VERSION := VER_0_8_X

# Inherit from the proprietary version
-include vendor/xiaomi/gemini/BoardConfigVendor.mk
