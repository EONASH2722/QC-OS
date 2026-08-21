# QC Glass

`QCGlassSurface` is the single rendering policy boundary. It combines backdrop
capability, tint, border, depth and contrast; opacity alone is not glass.
Callers request a semantic role and receive a resolved recipe.

Quality policy has **high**, **balanced** (default), and **reduced** levels.
Reduced mode removes expensive live blur and increases opaque contrast. The
resolver considers accessibility reduce-transparency, battery saver, thermal
status, renderer support and measured frame pressure. Nested surfaces must
avoid repeated backdrop passes. Unsupported blur always has a readable fallback.

Validation requires screenshot/contrast tests plus FrameTimeline/Perfetto and
GPU profiling on the actual target. No visual quality or frame-rate claim is
made before measurement.
