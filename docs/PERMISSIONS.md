# Permissions

Privileged permissions are introduced only with a documented platform need and
matching SELinux/caller checks. User-facing access to microphone, camera,
location, notifications, contacts, files and remote processing is granular and
revocable. System actions report policy/admin restrictions rather than
simulating success. Audit records minimize and redact personal content.
