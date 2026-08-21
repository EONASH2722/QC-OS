# QC OS

**Quantum Coder Operating System** is an AOSP-derived Android custom ROM. This
repository is the QC-owned integration layer; it is designed to be checked out
as `vendor/qc` inside a pinned AOSP tree. It is not a launcher, theme, APK, or
web simulation.

## Current status

| Area | Status |
| --- | --- |
| Repository and MORICE audit | Host tested |
| Cuttlefish product definition | Implemented; host validated |
| AOSP image build | Not tested in this checkout (AOSP source is absent) |
| Emulator boot | Not tested |
| Physical device | Awaiting a selected device |
| QC Glass, Motion, Control Center, MORICE services | Architecture only |

No MORICE implementation or voice/TTS source was present at the initial audit.
Nothing has been replaced by a reduced assistant.

## Reference target

The first target is `qc_cf_x86_64_phone-userdebug`, inheriting AOSP's
Cuttlefish phone product. It adds only QC identity at this stage, retaining the
real Android framework, runtime, package manager, Binder, SELinux policy, HALs,
and Cuttlefish hardware support.

```bash
# From a complete AOSP checkout with this repository at vendor/qc:
source build/envsetup.sh
lunch qc_cf_x86_64_phone-userdebug
m -j"$(nproc)"
launch_cvd --daemon
adb wait-for-device
adb shell getprop ro.qc.version
```

See [the build guide](docs/AOSP_BUILD.md), [architecture](docs/ARCHITECTURE.md),
and [known limitations](docs/KNOWN_LIMITATIONS.md). Run the checkout-level
validation with `./tools/validate.sh`.

## Repository layout

- `products/`: Soong/Make product registration and Cuttlefish product.
- `config/`: common QC product identity inherited by every future target.
- `docs/`: architecture decisions, subsystem boundaries, test and port plans.
- `tools/`: host validation that does not pretend to build or boot Android.

## Project rules

- Feature status must be evidence-based: implemented, host tested, emulator
  tested, physical-device tested, awaiting device, or not implemented.
- AI output never receives unrestricted shell or Binder privileges.
- QC remains usable when MORICE is unavailable.
- High refresh rate is discovered from Android/display hardware, never faked.
- Third-party app identity and licensing are preserved; Brave binaries are not
  redistributed by this repository.
