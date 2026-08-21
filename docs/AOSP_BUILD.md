# AOSP Build and Emulator Baseline

## Baseline

Use a reviewed, pinned AOSP release manifest in the build environment; record
its manifest revision and build fingerprint with every result. Do not build a
moving `main` branch for release artifacts. This small repository intentionally
does not vendor the multi-hundred-gigabyte AOSP checkout.

Place this checkout at `vendor/qc`. The reference lunch target is
`qc_cf_x86_64_phone-userdebug`, which inherits the AOSP x86_64 Cuttlefish phone
product. Cuttlefish is the reference until a real device is explicitly selected.

## Build

```bash
source build/envsetup.sh
lunch qc_cf_x86_64_phone-userdebug
m -j"$(nproc)"
```

The inherited product path is validated by `tools/validate.sh`. When syncing a
new AOSP release, verify that `device/google/cuttlefish/vsoc_x86_64/phone/aosp_cf.mk`
still exists; update through a dedicated compatibility change if upstream moves
it rather than adding silent fallbacks.

## Boot and evidence

```bash
launch_cvd --daemon
adb wait-for-device
adb shell getprop sys.boot_completed
adb shell getprop ro.product.name
adb shell getprop ro.qc.version
adb shell getenforce
```

A successful build is not a successful boot. Preserve build logs, Cuttlefish
logs, fingerprint, `getprop` output, screenshot, and elapsed boot time. Stop with
`stop_cvd`. This checkout currently has no AOSP source or emulator artifacts, so
no build or boot is claimed.
