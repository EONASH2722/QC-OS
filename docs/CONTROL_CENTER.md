# QC Control Center

Control Center is a QC SystemUI surface backed by Android controllers, not a
reskin of Quick Settings and not a collection of fake toggles. Presentation,
layout editing, gesture routing and system operations are separate modules.

A persisted setting chooses top-left or top-right (default) activation. The
opposite top region routes to notifications. Gesture arbitration checks region,
direction, touch slop, falsing and accessibility; reveal progress and blur are
scrubbed directly from drag progress, then settled using release velocity.

Modules declare stable IDs, supported sizes, detail-provider capability and
whether they are required. A versioned layout store supports reorder/resize and
atomic reset. Drag layout changes animate surrounding bounds. Connectivity and
other privileged controls call typed SystemUI/platform controllers and expose
real state, failure and policy restrictions.
