# QC OS reference image: real AOSP Cuttlefish phone, with QC-owned layers added
# incrementally. Keep hardware/runtime policy inherited from the AOSP target.
$(call inherit-product, device/google/cuttlefish/vsoc_x86_64/phone/aosp_cf.mk)
$(call inherit-product, vendor/qc/config/common.mk)

PRODUCT_NAME := qc_cf_x86_64_phone
PRODUCT_DEVICE := vsoc_x86_64
PRODUCT_BRAND := QC
PRODUCT_MODEL := QC OS Cuttlefish
PRODUCT_MANUFACTURER := Quantum Coder
