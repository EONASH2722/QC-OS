# OTA Strategy

OTA work is not implemented. The plan uses AOSP target-files and signed full or
incremental packages, anti-rollback compatible versioning and staged rollout.
Production keys never enter source control or cloud logs. QC system components
ship in system partitions; downloadable MORICE models use a separate signed,
rollback-capable content channel and cannot grant platform privilege.
