# Inherit common stuff
$(call inherit-product, vendor/cos/common.mk)
$(call inherit-product, vendor/cos/config/common_apn.mk)

# Telephony 
PRODUCT_PACKAGES += \
    Stk 

# SMS
PRODUCT_PACKAGES += \
	messaging
