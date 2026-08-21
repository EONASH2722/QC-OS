# Security

AOSP verified boot, sandboxing, SELinux, permissions, package signatures and
platform update mechanisms remain authoritative. QC services follow least
privilege, stable typed Binder APIs, caller UID validation and deny-by-default
SELinux policy. MORICE plans are never trusted authorization decisions.

Threat reviews cover confused deputies, malicious prompt/action payloads,
overlays, exported components, model/provider supply chain, logs, user data and
downgrade paths. Custom cryptography or authentication is prohibited.
