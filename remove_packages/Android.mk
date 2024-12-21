LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := remove_packages
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_OVERRIDES_PACKAGES := \
    Drive \
    Gmail2 \
    Maps \
    PrebuiltGmail \
    QuickSearchBox \
    YouTube
ifeq ($(FUNNY_SLIM),true)
LOCAL_OVERRIDES_PACKAGES += \
    Calendar \
    Contacts \
    DeskClock \
    Dialer \
    Gallery \
    Gallery2 \
    LocalMediaPlayer \
    Music \
    MusicKotlin \
    QuickAccessWallet \
    Stk \
    messaging
endif
ifeq ($(NUKE_AUDIOFX),true)
TARGET_EXCLUDES_AUDIOFX := true
LOCAL_OVERRIDES_PACKAGES += \
    AudioFX \
    MusicFX
endif
ifeq ($(TARGET_SHIP_LATINIME),true)
LOCAL_OVERRIDES_PACKAGES += \
    Gboard
endif
LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_SRC_FILES := /dev/null
include $(BUILD_PREBUILT)
