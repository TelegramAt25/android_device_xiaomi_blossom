#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Enable userspace reboot
$(call inherit-product, $(SRC_TARGET_DIR)/product/userspace_reboot.mk)

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_SUPER_PARTITION := false

# Properties
include $(LOCAL_PATH)/vendor_logtag.mk

# Shipping API Level
PRODUCT_SHIPPING_API_LEVEL := 29

# Always preopt extracted APKs to prevent extracting out of the APK
# for gms modules.
PRODUCT_ALWAYS_PREOPT_EXTRACTED_APK := true
PRODUCT_DEX_PREOPT_BOOT_IMAGE_PROFILE_LOCATION := frameworks/base/config/boot-image-profile.txt
PRODUCT_USE_PROFILE_FOR_BOOT_IMAGE := true
USE_DEX2OAT_DEBUG := false
WITH_DEXPREOPT_DEBUG_INFO := false
DONT_DEXPREOPT_PREBUILTS := true

# Do not generate libartd.
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false

# Strip the local variable table and the local variable type table to reduce
# the size of the system image. This has no bearing on stack traces, but will
# leave less information available via JDWP.
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true

# Speed profile services and wifi-service to reduce RAM and storage
PRODUCT_SYSTEM_SERVER_COMPILER_FILTER := speed-profile

# Preopt critical applications
PRODUCT_DEXPREOPT_SPEED_APPS += \
    Settings \
    SystemUI

# Boot animation
TARGET_SCREEN_HEIGHT := 1600
TARGET_SCREEN_WIDTH := 720
TARGET_BOOT_ANIMATION_RES := 720
TARGET_BOOTANIMATION_HALF_RES := true

# Screen density
PRODUCT_AAPT_CONFIG := xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi
PRODUCT_AAPT_PREBUILT_DPI := xhdpi hdpi

# GMS
ifeq ($(WITH_GMS),true)
GMS_MAKEFILE=gms_minimal.mk
endif

# HACK: Avoid usb crash
PRODUCT_DEFAULT_PROPERTY_OVERRIDES := \
    persist.adb.nonblocking_ffs=0 \
    ro.adb.nonblocking_ffs=0

# Rootdir
PRODUCT_PACKAGES += \
    fstab.mt6765 \
    fstab.mt6762 \
    fstab.mt6765_ramdisk \
    fstab.mt6762_ramdisk \
    init.blossom.power.rc \
    init.connectivity.rc \
    init.modem.rc \
    init.mt6765.rc \
    init.mt6762.rc \
    init.mt6765.usb.rc \
    init.project.rc \
    init.sensor_1_0.rc \
    ueventd.mtk.rc \
    init.mt6765.volte.rc \
    init.target.rc

# Recovery
PRODUCT_PACKAGES += \
    init.recovery.mt6765.rc \
    init.recovery.mt6762.rc

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl.custom \
    fastbootd

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.3-service.basic \
    android.hardware.usb@1.0.vendor:64

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio.service.mediatek \
    android.hardware.audio.common-util.vendor \
    android.hardware.audio.common@5.0 \
    android.hardware.audio.common@6.0.vendor \
    android.hardware.audio.common@6.0-util.vendor \
    android.hardware.audio.effect@6.0-util.vendor \
    android.hardware.audio.effect@6.0.vendor \
    android.hardware.audio.effect@6.0-impl \
    android.hardware.audio@6.0.vendor \
    android.hardware.audio@6.0-impl \
    android.hardware.audio@6.0-util.vendor \
    android.hardware.bluetooth.audio-impl \
    android.hardware.bluetooth.audio@2.0 \
    android.hardware.bluetooth.audio@2.1 \
    audio.bluetooth.default \
    audio.primary.default \
    audio.r_submix.default \
    audio.usb.default \
    audio_policy.stub \
    libtinycompress \
    libtinyxml \
    libaudiofoundation \
    libaudiofoundation.vendor \
    libaudioroute.vendor

PRODUCT_PACKAGES += \
    BesLoudness \
    MtkInCallService

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/audio/,$(TARGET_COPY_OUT_VENDOR)/etc)

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light-service.blossom

# Display
PRODUCT_PACKAGES += \
    android.hardware.graphics.composer@2.1.vendor \
    android.hardware.graphics.composer@2.1-service \
    android.hardware.graphics.composer@2.1-resources.vendor \
    android.hardware.graphics.common-V2-ndk.vendor:32 \
    android.hardware.graphics.common-V2-ndk_platform.vendor:32 \
    android.hardware.memtrack@1.0-service \
    android.hardware.memtrack@1.0-impl \
    disable_configstore

# Charger
PRODUCT_PACKAGES += \
    libsuspend

# Charger
PRODUCT_PACKAGES += \
    charger_res_images_vendor

# Certs
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,system/ca-certificates/files/,$(TARGET_COPY_OUT_VENDOR)/etc/security/cacerts)

# PowerOffAlarm
PRODUCT_PACKAGES += \
    PowerOffAlarm

# Radio
PRODUCT_PACKAGES += \
    android.hardware.radio.config@1.0.vendor \
    android.hardware.radio.config@1.1.vendor \
    android.hardware.radio.config@1.2.vendor \
    android.hardware.radio.deprecated@1.0.vendor \
    android.hardware.radio@1.2.vendor \
    android.hardware.radio@1.3.vendor \
    android.hardware.radio@1.4.vendor \
    android.hardware.radio@1.5.vendor \
    libpcap.vendor \
    android.hardware.radio-V1.4-java

# IMS
PRODUCT_BOOT_JARS += \
    mediatek-common \
    mediatek-framework \
    mediatek-ims-base \
    mediatek-ims-common \
    mediatek-telecom-common \
    mediatek-telephony-base \
    mediatek-telephony-common

# IncFS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.incremental.enable=yes

# Watchdog
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hw_timeout_multiplier=6

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/permissions/privapp-permissions-com.mediatek.ims.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-com.mediatek.ims.xml

# Device properties
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/props/odm,$(TARGET_COPY_OUT_ODM)/etc/properties) \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/props/product,$(TARGET_COPY_OUT_PRODUCT)/etc/properties) \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/props/system,$(TARGET_COPY_OUT_SYSTEM)/etc/properties) \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/props/system_ext,$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/properties) \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/props/vendor,$(TARGET_COPY_OUT_VENDOR)/etc/properties)

# VNDK
PRODUCT_COPY_FILES += \
    prebuilts/vndk/v32/arm64/arch-arm-armv8-a/shared/vndk-sp/libhidlbase.so:$(TARGET_COPY_OUT_VENDOR)/lib/libhidlbase-v32.so \
    prebuilts/vndk/v32/arm64/arch-arm64-armv8-a/shared/vndk-sp/libhidlbase.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libhidlbase-v32.so

# Wi-Fi
PRODUCT_PACKAGES += \
    wpa_supplicant \
    hostapd \
    libwifi-hal-wrapper \
    android.hardware.wifi-service

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/wifi/,$(TARGET_COPY_OUT_VENDOR)/etc/wifi)

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0.vendor \
    android.hardware.bluetooth@1.1.vendor

# Biometrics
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1.vendor:32

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.0.vendor \
    android.hardware.nfc@1.1.vendor \
    android.hardware.nfc@1.2.vendor \
    android.hardware.nfc@1.2-service.samsung \
    com.android.nfc_extras \
    Tag \
    NfcNci

# Camera
PRODUCT_PACKAGES += \
    android.frameworks.sensorservice@1.0 \
    android.frameworks.sensorservice@1.0.vendor \
    android.hardware.camera.common@1.0.vendor \
    android.hardware.camera.device@1.0.vendor \
    android.hardware.camera.device@3.2.vendor \
    android.hardware.camera.device@3.3.vendor \
    android.hardware.camera.device@3.4.vendor \
    android.hardware.camera.device@3.5.vendor \
    android.hardware.camera.device@3.6.vendor \
    android.hardware.camera.provider@2.4.vendor \
    android.hardware.camera.provider@2.5.vendor \
    android.hardware.camera.provider@2.6.vendor \
    libutils-v30 \
    libutils-v32

PRODUCT_PACKAGES += \
    libcamera_metadata.vendor \
    libpng.vendor \
    libutilscallstack.vendor

# Media
PRODUCT_PACKAGES += \
    libavservices_minijail.vendor

PRODUCT_PACKAGES += \
    libui-v32

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/media/,$(TARGET_COPY_OUT_VENDOR)/etc)

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal@1.0.vendor \
    android.hardware.thermal@2.0.vendor \
    android.hardware.thermal@1.0-impl

# Power
PRODUCT_PACKAGES += \
    android.hardware.power-service.blossom-libperfmgr \
    android.hardware.power@1.0.vendor \
    android.hardware.power@1.1.vendor \
    android.hardware.power@1.2.vendor \
    android.hardware.power@1.3.vendor

PRODUCT_PACKAGES += \
    libmtkperf_client_vendor \
    libmtkperf_client

PRODUCT_PACKAGES += \
    vendor.mediatek.hardware.mtkpower@1.2-service.stub \
    vendor.mediatek.hardware.mtkpower@1.0.vendor \
    vendor.mediatek.hardware.mtkpower@1.1.vendor

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/powerhint.json:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.json

# Health
PRODUCT_PACKAGES += \
    android.hardware.health-V1-ndk \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-impl.recovery \
    android.hardware.health@2.1-service \
    android.hardware.health@1.0

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.verified_boot.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version.xml \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2020-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.ipsec_tunnels.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.ipsec_tunnels.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.faketouch.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.faketouch.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.nfc.ese.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.ese.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.nfc.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.uicc.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.nxp.mifare.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.ims.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.xml \

# Prebuilts - Kernel
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)-kernel/dtb.img:dtb.img \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)-kernel/modules,$(TARGET_COPY_OUT_VENDOR)/lib/modules)

# Prebuilts - Touch screen (For recovery)
PRODUCT_COPY_FILES += \
    vendor/xiaomi/blossom/proprietary/vendor/firmware/chipone-tddi-tianma.bin:recovery/root/vendor/firmware/chipone-tddi-tianma.bin \
    vendor/xiaomi/blossom/proprietary/vendor/firmware/chipone-tddi-truly.bin:recovery/root/vendor/firmware/chipone-tddi-truly.bin \
    vendor/xiaomi/blossom/proprietary/vendor/firmware/focaltech_aa_ts_fw_helitai.bin:recovery/root/vendor/firmware/focaltech_aa_ts_fw_helitai.bin \
    vendor/xiaomi/blossom/proprietary/vendor/firmware/focaltech_ab_ts_fw_helitai.bin:recovery/root/vendor/firmware/focaltech_ab_ts_fw_helitai.bin \
    vendor/xiaomi/blossom/proprietary/vendor/firmware/gt1151_default_firmware2.img:recovery/root/vendor/firmware/gt1151_default_firmware2.img \
    vendor/xiaomi/blossom/proprietary/vendor/firmware/hdl_firmware.img:recovery/root/vendor/firmware/hdl_firmware.img \
    vendor/xiaomi/blossom/proprietary/vendor/firmware/Himax_firmware.bin:recovery/root/vendor/firmware/Himax_firmware.bin \
    vendor/xiaomi/blossom/proprietary/vendor/firmware/Himax_mpfw.bin:recovery/root/vendor/firmware/Himax_mpfw.bin \
    vendor/xiaomi/blossom/proprietary/vendor/firmware/hx_criteria.csv:recovery/root/vendor/firmware/hx_criteria.csv \
    vendor/xiaomi/blossom/proprietary/vendor/firmware/ilitek_fw.bin:recovery/root/vendor/firmware/ilitek_fw.bin \
    vendor/xiaomi/blossom/proprietary/vendor/firmware/novatek_ts_djn_fw.bin:recovery/root/vendor/firmware/novatek_ts_djn_fw.bin \
    vendor/xiaomi/blossom/proprietary/vendor/firmware/novatek_ts_djn_mp.bin:recovery/root/vendor/firmware/novatek_ts_djn_mp.bin \
    vendor/xiaomi/blossom/proprietary/vendor/firmware/novatek_ts_ebbg_fw.bin:recovery/root/vendor/firmware/novatek_ts_ebbg_fw.bin \
    vendor/xiaomi/blossom/proprietary/vendor/firmware/novatek_ts_ebbg_mp.bin:recovery/root/vendor/firmware/novatek_ts_ebbg_mp.bin \
    vendor/xiaomi/blossom/proprietary/vendor/firmware/novatek_ts_hlt_fw.bin:recovery/root/vendor/firmware/novatek_ts_hlt_fw.bin \
    vendor/xiaomi/blossom/proprietary/vendor/firmware/novatek_ts_hlt_mp.bin:recovery/root/vendor/firmware/novatek_ts_hlt_mp.bin \
    vendor/xiaomi/blossom/proprietary/vendor/firmware/novatek_ts_truly_fw.bin:recovery/root/vendor/firmware/novatek_ts_truly_fw.bin \
    vendor/xiaomi/blossom/proprietary/vendor/firmware/novatek_ts_truly_mp.bin:recovery/root/vendor/firmware/novatek_ts_truly_mp.bin

# FM Radio
PRODUCT_PACKAGES += \
    RevampedFMRadio

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.allocator@1.0 \
    android.hidl.base@1.0.vendor \
    android.hidl.allocator@1.0.vendor \
    libhidltransport \
    libhidltransport.vendor \
    libhwbinder \
    libhwbinder.vendor

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0.vendor \
    android.hardware.drm@1.1.vendor \
    android.hardware.drm@1.2.vendor \
    android.hardware.drm@1.3.vendor \
    android.hardware.drm@1.4.vendor \
    libmockdrmcryptoplugin \
    libdrm \
    libdrm.vendor

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0.vendor \
    android.hardware.gatekeeper@1.0-impl \
    android.hardware.gatekeeper@1.0-service

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0.vendor \
    android.hardware.keymaster@4.0.vendor \
    libkeymaster4.vendor \
    libkeymaster4support.vendor \
    libkeymaster_messages.vendor \
    libkeymaster_portable.vendor \
    libpuresoftkeymasterdevice.vendor \
    libsoft_attestation_cert.vendor

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator-service.mediatek

# Sensors
PRODUCT_PACKAGES += \
    android.frameworks.sensorservice@1.0 \
    android.hardware.sensors@1.0.vendor \
    android.hardware.sensors@2.0.vendor \
    libsensorndkbridge

# GNSS
PRODUCT_PACKAGES += \
    android.hardware.gnss.measurement_corrections@1.0.vendor \
    android.hardware.gnss.measurement_corrections@1.1.vendor \
    android.hardware.gnss.visibility_control@1.0.vendor \
    android.hardware.gnss@1.0.vendor \
    android.hardware.gnss@1.1.vendor \
    android.hardware.gnss@2.0.vendor \
    android.hardware.gnss@2.1.vendor

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/keylayout/uinput-focaltech.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-focaltech.kl \
    $(LOCAL_PATH)/configs/keylayout/uinput-fpc.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-fpc.kl

# Protobuf
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full-3.9.1-vendorcompat \
    libprotobuf-cpp-lite-3.9.1-vendorcompat

PRODUCT_PACKAGES += \
    libcurl.vendor \
    libgralloctypes.vendor \
    libion.vendor \
    libjsoncpp.vendor \
    libpower.vendor \
    libprocessgroup.vendor \
    libsqlite.vendor \
    libssl.vendor \
    libui.vendor

# Shims
PRODUCT_PACKAGES += \
    libshim_audio \
    libshim_beanpod \
    libshim_sensors \
    libshim_ui \
    libshim_vtservice

# Cgroup
PRODUCT_COPY_FILES += \
    system/core/libprocessgroup/profiles/cgroups_30.json:$(TARGET_COPY_OUT_VENDOR)/etc/cgroups.json \
    $(LOCAL_PATH)/configs/task_profiles.json:$(TARGET_COPY_OUT_VENDOR)/etc/task_profiles.json

# Additional native libraries
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/public.libraries.vendor.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt

# Remove unwanted packages
PRODUCT_PACKAGES += \
    remove_packages

# Disable async MTE on system_server
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    persist.arm64.memtag.system_server=off

# Updater
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.recovery_update=false

# Mobile data
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.android.mobiledata=false

# Seccomp
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/seccomp/,$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy)

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    hardware/google/interfaces \
    hardware/google/pixel \
    hardware/mediatek \
    hardware/mediatek/libmtkperf_client \
    $(LOCAL_PATH)/power-libperfmgr \
    $(LOCAL_PATH)

# Runtime Resource Overlays
PRODUCT_PACKAGES += \
    CarrierConfigOverlayBlossom \
    DialerOverlayBlossom \
    FrameworksResOverlayBlossom \
    SettingsOverlayBlossom \
    SystemUIOverlayBlossom \
    TelephonyOverlayBlossom \
    WifiResOverlayBlossom

# Inherit the proprietary files
$(call inherit-product, vendor/xiaomi/blossom/blossom-vendor.mk)
