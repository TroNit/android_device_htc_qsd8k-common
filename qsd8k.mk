#
# Copyright (C) 2009 The Android Open Source Project
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

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distict.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

DEVICE_PACKAGE_OVERLAYS += device/htc/qsd8k-common/overlay

# Audio
PRODUCT_PACKAGES += \
    libaudioutils \
    audio.a2dp.default \
    audio.primary.qsd8k \
    audio_policy.qsd8k

# GPU
PRODUCT_PACKAGES += \
    copybit.qsd8k \
    gralloc.qsd8k \
    hwcomposer.qsd8k \
    libgenlock \
    libmemalloc \
    libtilerenderer \
    libQcomUI

# Camera
PRODUCT_PACKAGES += \
    camera.qsd8k \
    Camera

# Omx
PRODUCT_PACKAGES += \
    libOmxCore \
    libOmxVidEnc \
    libOmxVdec \
    libstagefrighthw \
    libmm-omxcore \

# Live Wallpapers
PRODUCT_PACKAGES += \
    Basic \
    HoloSpiralWallpaper \
    MagicSmokeWallpapers \
    NoiseField \
    Galaxy4 \
    PhaseBeam \
    LiveWallpapers \
    VisualizationWallpapers

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs

# Misc
PRODUCT_PACKAGES += \
    Torch \
    com.android.future.usb.accessory

# Hardware Rendering Properties
PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.hw=1 \
    debug.composition.type=mdp \
    debug.gr.numframebuffers=2

# dirty_regions: "false" to disable partial invalidates, override if enabletr=true
PRODUCT_PROPERTY_OVERRIDES += \
    hwui.render_dirty_regions=false \
    hwui.disable_vsync=true \
    hwui.print_config=choice \
    debug.enabletr=false

# Dalvik Properties
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y \
    dalvik.vm.checkjni=false

# Default heap settings for 512mb device
include frameworks/base/build/phone-hdpi-512-dalvik-heap.mk

# Camera (video recording)
PRODUCT_PROPERTY_OVERRIDES += \
    debug.camcorder.disablemeta=1 \
    rw.media.record.hasb=0

# Wifi
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=45

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
    com.qc.hardware=1 \
    dev.pm.dyn_samplingrate=1 \
    ro.vendor.extension_library=/system/lib/libqc-opt.so

# Init post-boot script
PRODUCT_COPY_FILES += \
    device/htc/qsd8k-common/prebuilt/etc/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh

# Prebuilt Encoder
PRODUCT_COPY_FILES += \
    device/htc/qsd8k-common/prebuilt/lib/libOmxVidEnc.so:system/lib/libOmxVidEnc.so

# We have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi
PRODUCT_LOCALES := en
