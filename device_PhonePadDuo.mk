# Copyright (C) 2013 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

$(call inherit-product-if-exists, vendor/mediacom/PhonePadDuo/PhonePadDuo-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay/

# prebuilt kernel modules
MOD_TGT := /system/lib/modules
MOD_SRC := $(LOCAL_PATH)/prebuilt/modules
PRODUCT_COPY_FILES += \
	$(MOD_SRC)/ccci.ko:$(MOD_TGT)/ccci.ko \
	$(MOD_SRC)/ccci_plat.ko:$(MOD_TGT)/ccci_plat.ko \
	$(MOD_SRC)/devapc.ko:$(MOD_TGT)/devapc.ko \
	$(MOD_SRC)/devinfo.ko:$(MOD_TGT)/devinfo.ko \
	$(MOD_SRC)/mtk_fm_drv.ko:$(MOD_TGT)/mtk_fm_drv.ko \
	$(MOD_SRC)/mtk_hif_sdio.ko:$(MOD_TGT)/mtk_hif_sdio.ko \
	$(MOD_SRC)/mtk_stp_bt.ko:$(MOD_TGT)/mtk_stp_bt.ko \
	$(MOD_SRC)/mtk_stp_gps.ko:$(MOD_TGT)/mtk_stp_gps.ko \
	$(MOD_SRC)/mtk_stp_uart.ko:$(MOD_TGT)/mtk_stp_uart.ko \
	$(MOD_SRC)/mtk_stp_wmt.ko:$(MOD_TGT)/mtk_stp_wmt.ko \
	$(MOD_SRC)/mtk_wmt_wifi.ko:$(MOD_TGT)/mtk_wmt_wifi.ko \
	$(MOD_SRC)/mtklfb.ko:$(MOD_TGT)/mtklfb.ko \
	$(MOD_SRC)/pvrsrvkm.ko:$(MOD_TGT)/pvrsrvkm.ko \
	$(MOD_SRC)/scsi_tgt.ko:$(MOD_TGT)/scsi_tgt.ko \
	$(MOD_SRC)/scsi_wait_scan.ko:$(MOD_TGT)/scsi_wait_scan.ko \
	$(MOD_SRC)/sec.ko:$(MOD_TGT)/sec.ko \
	$(MOD_SRC)/vcodec_kernel_driver.ko:$(MOD_TGT)/vcodec_kernel_driver.ko \
	$(MOD_SRC)/wlan_mt6628.ko:$(MOD_TGT)/wlan_mt6628.ko

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/fstab.mt6589:root/fstab.mt6589

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/root/init:root/init \
	$(LOCAL_PATH)/root/init.rc:root/init.rc \
	$(LOCAL_PATH)/root/init.charging.rc:root/init.charging.rc \
	$(LOCAL_PATH)/root/init.usb.rc:root/init.usb.rc \
	$(LOCAL_PATH)/root/ueventd.rc:root/ueventd.rc \
	$(LOCAL_PATH)/root/init.modem.rc:root/init.modem.rc \
	$(LOCAL_PATH)/root/init.mt6589.rc:root/init.mt6589.rc \
	$(LOCAL_PATH)/root/init.pro.rc:root/init.pro.rc \
	$(LOCAL_PATH)/root/init.xlog.rc:root/init.xlog.rc \
	$(LOCAL_PATH)/root/init.aee.customer.rc:root/init.aee.customer.rc

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml



PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/media_codecs.xml:system/etc/media_codecs.xml \
	$(LOCAL_PATH)/media_profiles.xml:system/etc/media_profile.xml

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/keylayout/ACCDET.kl:system/usr/keylayout/ACCDET.kl \
	$(LOCAL_PATH)/keylayout/hid-keyboard.kl:system/usr/keylayout/hid-keyboard.kl \
	$(LOCAL_PATH)/keylayout/mtk-kpd.kl:system/usr/keylayout/mtk-kpd.kl \
	$(LOCAL_PATH)/keylayout/hid-keyboard.kcm:system/usr/keychars/hid-keyboard.kcm

PRODUCT_PROPERTY_OVERRIDES := \
	persist.service.adb.enable=1 \
	persist.sys.usb.config=mass_storage,adb

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PACKAGES += \
	gsm0710muxd \
	hwcomposer.mt6589 \
	gralloc.mt6589 \
	lights.default \
	camera.default \
	com.android.future.usb.accessory

# audio
PRODUCT_PACKAGES += \
	audio.primary.default \
	audio.a2dp.default \
	audio.usb.default \
	audio.r_submix.default \
	libblisrc
# wifi
PRODUCT_PACKAGES += \
	lib_driver_cmd_mtk \
	libnetcmdiface

# torch
PRODUCT_PACKAGES += \
	Torch

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_PhonePadDuo
PRODUCT_DEVICE := PhonePadDuo

