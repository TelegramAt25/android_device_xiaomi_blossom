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
    Dialer \
    Gallery \
    Gallery2 \
    LocalMediaPlayer \
    QuickAccessWallet \
    Stk \
    messaging
endif
ifeq ($(NUKE_AUDIOFX),true)
LOCAL_OVERRIDES_PACKAGES += \
    AudioFX \
    MusicFX
endif
LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_SRC_FILES := /dev/null
include $(BUILD_PREBUILT)
