# QC Design System

QC-owned surfaces use semantic tokens for color, contrast, spacing, shape,
elevation, typography, motion, haptics and glass quality. Components consume a
runtime `QCVisualContext`; they must not sample wallpaper or hardcode blur
independently. This keeps the abstraction usable for a future non-wallpaper/AR
background provider.

The component library will expose surfaces, cards, panels, dialogs, buttons,
sliders, toggles, menus, notifications, search, overlays and Control Center
containers. Accessibility semantics, focus, large text, RTL, dark/light mode,
minimum touch targets, and contrast are part of each primitive's contract.
