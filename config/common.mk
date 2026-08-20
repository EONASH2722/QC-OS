# Common identity for all QC OS products. Large AI models must never be added
# here; they belong in managed user data and are downloaded with consent.
PRODUCT_SYSTEM_PROPERTIES += \
    ro.qc.version=0.1.0-dev \
    ro.qc.codename=foundation

PRODUCT_PRODUCT_PROPERTIES += \
    ro.product.qc.name="Quantum Coder Operating System"
