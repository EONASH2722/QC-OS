# Testing and Status Evidence

Allowed labels are **implemented**, **host tested**, **emulator tested**,
**physical device tested**, **awaiting device**, and **not implemented**. Every
label links to reproducible evidence.

Host gates validate product registration and static policy. Emulator gates
build and boot Cuttlefish, complete setup, launch real apps, exercise
Home/SystemUI/Control Center/notifications/recents/settings/MORICE, rotate and
inject process deaths. Motion stress includes rapid open/close, gesture
reversal, Control Center scrubbing, recents fling and MORICE morph retargeting.
Performance runs record traces. Hardware claims wait for a selected device and
cover every radio, sensor, camera, biometric, audio, USB, charging and suspend
path individually.
