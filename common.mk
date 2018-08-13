PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Disable excessive dalvik debug messages
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.debug.alloc=0

# Default Theme
PRODUCT_PROPERTY_OVERRIDES += \
    ro.boot.vendor.overlay.theme=com.cosmic.overlay.base.stockfixed

# Backup tool
PRODUCT_COPY_FILES += \
    vendor/cos/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/cos/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/cos/prebuilt/common/bin/50-cos.sh:system/addon.d/50-cos.sh \
    vendor/cos/prebuilt/common/bin/clean_cache.sh:system/bin/clean_cache.sh

ifeq ($(AB_OTA_UPDATER),true)
PRODUCT_COPY_FILES += \
    vendor/cos/prebuilt/common/bin/backuptool_ab.sh:system/bin/backuptool_ab.sh \
    vendor/cos/prebuilt/common/bin/backuptool_ab.functions:system/bin/backuptool_ab.functions \
    vendor/cos/prebuilt/common/bin/backuptool_postinstall.sh:system/bin/backuptool_postinstall.sh
endif

# Backup services whitelist
PRODUCT_COPY_FILES += \
    vendor/cos/config/permissions/backup.xml:system/etc/sysconfig/backup.xml

# Signature compatibility validation
PRODUCT_COPY_FILES += \
    vendor/cos/prebuilt/common/bin/otasigcheck.sh:install/bin/otasigcheck.sh

# Cos-specific init file
PRODUCT_COPY_FILES += \
    vendor/cos/prebuilt/common/etc/init.local.rc:root/init.cos.rc

# Copy LatinIME for gesture typing
PRODUCT_COPY_FILES += \
    vendor/cos/prebuilt/common/lib/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so

# SELinux filesystem labels
PRODUCT_COPY_FILES += \
    vendor/cos/prebuilt/common/etc/init.d/50selinuxrelabel:system/etc/init.d/50selinuxrelabel

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Don't export PS1 in /system/etc/mkshrc.
PRODUCT_COPY_FILES += \
    vendor/cos/prebuilt/common/etc/mkshrc:system/etc/mkshrc \
    vendor/cos/prebuilt/common/etc/sysctl.conf:system/etc/sysctl.conf

# Fix Dialer
#PRODUCT_COPY_FILES +=  \
#    vendor/cos/prebuilt/common/sysconfig/dialer_experience.xml:system/etc/sysconfig/dialer_experience.xml

# Cos-specific startup services
PRODUCT_COPY_FILES += \
    vendor/cos/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/cos/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit \
    vendor/cos/prebuilt/common/bin/sysinit:system/bin/sysinit

# Power whitelist
PRODUCT_COPY_FILES += \
    vendor/cos/config/permissions/cos-power-whitelist.xml:system/etc/sysconfig/cos-power-whitelist.xml

# Required packages
PRODUCT_PACKAGES += \
    CellBroadcastReceiver \
    Development \
    SpareParts \
    LockClock \
    su

# Optional packages
PRODUCT_PACKAGES += \
    Basic \
    LiveWallpapersPicker \
    PhaseBeam

# Include explicitly to work around GMS issues
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full \
    librsjni

# Markup Libs
PRODUCT_COPY_FILES += \
    vendor/cos/prebuilt/common/lib/libsketchology_native.so:system/lib/libsketchology_native.so \
    vendor/cos/prebuilt/common/lib64/libsketchology_native.so:system/lib64/libsketchology_native.so

# AudioFX
PRODUCT_PACKAGES += \
    AudioFX

# Extra Optional packages
PRODUCT_PACKAGES += \
    Calculator \
    LatinIME \
    BluetoothExt \
    Launcher3Dark

# Custom packages
PRODUCT_PACKAGES += \
    CosmicWalls \
    Galaxy \
    Retro

# Extra tools
PRODUCT_PACKAGES += \
    openvpn \
    e2fsck \
    mke2fs \
    tune2fs \
    fsck.exfat \
    mkfs.exfat \
    ntfsfix \
    ntfs-3g

# Accent and Base packages
PRODUCT_PACKAGES += \
    AmberTheme \
    BlueTheme \
    CyanTheme \
    DeepOrangeTheme \
    DeepPurpleTheme \
    GreenTheme \
    IndigoTheme \
    LightBlueTheme \
    LightGreenTheme \
    LimeTheme \
    OrangeTheme \
    PinkTheme \
    PixelBaseTheme \
    PixelTheme \
    PurpleTheme \
    RedTheme \
    StockBaseTheme \
    StockFixedBaseTheme \
    StockTheme \
    YellowTheme \
    MintGreenTheme \
    FadedPink \
    DeepRed \
    PinkRed \
    KindaIndigo \
    ArmyGreen \
    Grey

# Black/DarkUI Packages
PRODUCT_PACKAGES += \
    GBoardDarkTheme \
    SettingsDarkTheme \
    SystemDarkTheme \
    SysuiQsDarkTheme \
    SettingsBlackTheme \
    SystemBlackTheme \
    SysuiQsBlackTheme

# QS Accent Packages
PRODUCT_PACKAGES += \
    QsAccentBlack \
    QsAccentWhite

PRODUCT_PACKAGES += \
    charger_res_images

# Stagefright FFMPEG plugin
PRODUCT_PACKAGES += \
    libffmpeg_extractor \
    libffmpeg_omx \
    media_codecs_ffmpeg.xml

PRODUCT_PROPERTY_OVERRIDES += \
    media.sf.omx-plugin=libffmpeg_omx.so \
    media.sf.extractor-plugin=libffmpeg_extractor.so

# Storage manager
PRODUCT_PROPERTY_OVERRIDES += \
    ro.storage_manager.enabled=true

# easy way to extend to add more packages
-include vendor/extra/product.mk

PRODUCT_PACKAGE_OVERLAYS += vendor/cos/overlay/common

# Bootanimation
PRODUCT_COPY_FILES += \
    vendor/cos/prebuilt/common/media/bootanimation.zip:system/media/bootanimation.zip


# Google sounds
include vendor/cos/google/GoogleAudio.mk

EXTENDED_POST_PROCESS_PROPS := vendor/cos/tools/cos_process_props.py

# Fonts
PRODUCT_COPY_FILES += \
    vendor/cos/fonts/GoogleSans-Regular.ttf:system/fonts/GoogleSans-Regular.ttf \
    vendor/cos/fonts/GoogleSans-Medium.ttf:system/fonts/GoogleSans-Medium.ttf \
    vendor/cos/fonts/GoogleSans-MediumItalic.ttf:system/fonts/GoogleSans-MediumItalic.ttf \
    vendor/cos/fonts/GoogleSans-Italic.ttf:system/fonts/GoogleSans-Italic.ttf \
    vendor/cos/fonts/GoogleSans-Bold.ttf:system/fonts/GoogleSans-Bold.ttf \
    vendor/cos/fonts/GoogleSans-BoldItalic.ttf:system/fonts/GoogleSans-BoldItalic.ttf

ADDITIONAL_FONTS_FILE := vendor/cos/fonts/google-sans.xml

# COS Versioning
ANDROID_VERSION = 9.0
COSMIC_VERSION_CODENAME = REL

ifeq ($(KBUILD_BUILD_USER),Savitar)
    ifeq ($(KBUILD_BUILD_HOST),Saturn)
      COS_RELEASE=true
    endif
else
    COS_RELEASE=false
endif

ifeq ($(COS_RELEASE),true)
      COS_BUILD_TYPE := OFFICIAL
      COSMIC_VERSION_CODENAME := OFFICIAL
else
    COS_BUILD_TYPE := UNOFFICIAL
    COSMIC_VERSION_CODENAME := UNOFFICIAL
endif

ifneq ($(TARGET_UNOFFICIAL_BUILD_ID),)
    COS_BUILD_TYPE := $(TARGET_UNOFFICIAL_BUILD_ID)
endif

COS_VERSION_NUMBER := 4.0
COS_CODENAME := Corona
COS_VER := $(COS_VERSION_NUMBER)-$(COS_CODENAME)-$(COS_BUILD_TYPE)
COS_BUILD_DATE := $(shell date +%Y%m%d)

# Set all versions
COS_VERSION := Cosmic-OS_$(COS_CODENAME)_$(COS_BUILD)_$(ANDROID_VERSION)_$(COS_BUILD_DATE)_$(COS_VERSION_NUMBER)-$(COS_BUILD_TYPE)
COS_MOD_VERSION := Cosmic-OS_$(COS_CODENAME)_$(COS_BUILD)_$(ANDROID_VERSION)_$(COS_BUILD_DATE)_$(COS_VERSION_NUMBER)-$(COS_BUILD_TYPE)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_DISPLAY_ID="$(BUILD_ID)-$(shell whoami)@$(shell hostname)"

PRODUCT_PROPERTY_OVERRIDES += \
    ro.cosmic.version=$(COS_VER) \
    ro.modversion=Cosmic-OS_$(COS_VER) \
    ro.romstats.url=https://stats.cosmic-os.org \
    ro.romstats.name=Cosmic-OS \
    ro.romstats.version=$(COS_VER)
