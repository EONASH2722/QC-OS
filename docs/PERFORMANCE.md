# Performance

Budgets cover boot, SystemUI/Home/MORICE idle memory, launch and Control Center
latency, touch-to-frame latency, jank, GPU glass cost, invocation latency and
battery. Perfetto, FrameTimeline, `dumpsys gfxinfo`, process memory and power
measurements are captured on named builds/targets. Display modes come from
Android and hardware; timings never hardcode or claim 60/90/120 Hz.

Glass degrades through policy before frame pacing collapses. Heavy MORICE
engines load on demand and unload under pressure. Thermal protection is never
disabled by performance profiles.
