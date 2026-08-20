#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$root"

required=(
  Android.bp Android.mk config/common.mk products/AndroidProducts.mk
  products/qc_cf_x86_64_phone.mk README.md
  docs/ARCHITECTURE.md docs/AOSP_BUILD.md docs/QC_DESIGN_SYSTEM.md
  docs/QC_GLASS.md docs/QC_MOTION.md docs/CONTROL_CENTER.md
  docs/MORICE_ARCHITECTURE.md docs/MORICE_ACTIONS.md docs/VOICE.md
  docs/QC_STORE.md docs/APP_COMPATIBILITY.md docs/SECURITY.md
  docs/PERMISSIONS.md docs/PERFORMANCE.md docs/TESTING.md
  docs/DEVICE_PORTING.md docs/OTA.md docs/KNOWN_LIMITATIONS.md
)

for path in "${required[@]}"; do
  [[ -s "$path" ]] || { echo "missing or empty: $path" >&2; exit 1; }
done

grep -Fq 'device/google/cuttlefish/vsoc_x86_64/phone/aosp_cf.mk' products/qc_cf_x86_64_phone.mk
grep -Fq 'qc_cf_x86_64_phone-userdebug' products/AndroidProducts.mk
grep -Fq 'ro.qc.version=' config/common.mk

marker_pattern='(^|[^A-Za-z])(TO''DO|FIX''ME)([^A-Za-z]|$)'
if find . -path ./.git -prune -o -type f -print0 | xargs -0 grep -nE "$marker_pattern"; then
  echo "unresolved planning marker found" >&2
  exit 1
fi

echo "QC OS integration-layer validation passed"
