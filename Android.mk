LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_PATH := vendor/bootanimations


ifneq ($(MOTOROLA_DEVICE),true)
ifeq ($(IS_MOTO),1080)
     PRODUCT_COPY_FILES += $(LOCAL_PATH)/bootanimation/bootanimation_1080.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
else ifeq ($(IS_MOTO),1440)
     PRODUCT_COPY_FILES += $(LOCAL_PATH)/bootanimation/bootanimation_1440.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
else ifeq ($(IS_MOTO),720)
     PRODUCT_COPY_FILES += $(LOCAL_PATH)/bootanimation/bootanimation_720.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
else ifeq ($(IS_MOTO),burton)
     PRODUCT_COPY_FILES += $(LOCAL_PATH)/bootanimation/burton.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
else
    ifeq ($(IS_MOTOROLA),)
        $(warning "Moto bootanimations: IS_MOTO is undefined, assuming 1080p")
else
        $(warning "Moto bootanimations: Current bootanimation res is not supported, forcing 1080p (support 1080,720,1440")
endif
    PRODUCT_COPY_FILES += $(LOCAL_PATH)/bootanimation/bootanimation_1080.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
endif
else ifneq ($(MOTOROLA_DEVICE),false)
           $(warning "DexOS rom active: load boot animation for dexOS 1080p")
           PRODUCT_COPY_FILES += $(LOCAL_PATH)/bootanimation/deluxe.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
endif
     
