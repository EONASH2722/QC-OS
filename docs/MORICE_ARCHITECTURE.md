# MORICE Architecture

No MORICE or custom TTS source exists in the repository at this audit. Future
imports must retain full functionality and provenance; a desktop Python runtime
will not be blindly embedded in the system image.

`MoriceCore` runs outside SystemUI and visible overlays. A deterministic local
parser handles safe fast-path intents. Complex requests use a planner, but its
output is untrusted data passed to the action registry. Models and heavy engines
are downloadable, lazy loaded and isolated. Closing UI does not stop core, and
core failure does not impair normal Android use.

Conversation, context, voice, files, maps, coding, projects, graphs,
visualization and simulation expose bounded interfaces. Remote processing is
explicit, consented and visibly indicated; notification/device content remains
local unless the applicable user decision allows transfer.
