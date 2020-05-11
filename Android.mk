LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_PATH := vendor/bootanimations



ifeq ($(IS_MOTO),1080)
     PRODUCT_COPY_FILES += $(LOCAL_PATH)/bootanimation/bootanimation_1080.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
else ifeq ($(IS_MOTO),1440)
     PRODUCT_COPY_FILES += $(LOCAL_PATH)/bootanimation/bootanimation_1440.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
else ifeq ($(IS_MOTO),720)
     PRODUCT_COPY_FILES += $(LOCAL_PATH)/bootanimation/bootanimation_720.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
else
    ifeq ($(IS_MOTOROLA),)
        $(warning "Moto bootanimations: IS_MOTO is undefined, assuming 1080p")
    else
        $(warning "Moto bootanimations: Current bootanimation res is not supported, forcing 1080p (support 1080,720,1440")
    endif
    PRODUCT_COPY_FILES += $(LOCAL_PATH)/bootanimation/bootanimation_1080.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
endif