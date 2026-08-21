# QC OS Architecture

## Decision record

QC OS is an AOSP product, not an application layered over a vendor ROM. The QC
repository mounts at `vendor/qc`; product definitions inherit an upstream
Cuttlefish device while QC framework, SystemUI, applications, resources, and
SELinux policy are introduced as separately reviewable modules.

The initial audit found only a README and ignore file: no AOSP checkout, Android
modules, MORICE source, voice pipeline, binary artifacts, or device trees. The
baseline therefore preserves upstream behavior and introduces identity only.

## Layer boundaries

1. **AOSP/device layer:** kernel, ART, Binder, package manager, framework,
   security model, HAL contracts, Cuttlefish device and vendor implementation.
2. **QC platform layer:** future framework APIs and trusted services. Binder
   contracts are narrow, typed, permission checked, and audited.
3. **QC experience layer:** QC SystemUI, Home, Settings and Setup; all share
   design and motion libraries rather than copying implementations.
4. **MORICE layer:** an isolated core coordinates conversation and planning;
   only a trusted action broker can request allow-listed platform operations.
5. **Downloadable engines/models:** versioned data outside system partitions,
   loaded on demand and removable without an OTA.

SystemUI never hosts model inference, graphs, maps, simulations, or Python.
Crashes in those processes must not destabilize the system experience. Android
remains usable if every MORICE component is stopped.

## Delivery sequence

The gate order is product build, Cuttlefish boot evidence, QC boot identity,
shared design primitives, shared motion primitives, Home/SystemUI, Control
Center, Settings, then MORICE services. A subsystem cannot graduate beyond its
measured test classification.
