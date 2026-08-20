# QC Motion

The motion library will provide `QCSpring`, `QCSlide`, `QCScale`, `QCFade`,
`QCReveal`, `QCMorph`, `QCSharedElement` and `QCGestureTransition`. All use a
shared token registry and Android frame clocks; no primitive assumes 60 Hz.

Gesture transitions own normalized progress and instantaneous velocity. New
input retargets the current state instead of queueing another animation. Settle
uses bounded, critically/near-critically damped springs and remains
interruptible. Reduced motion preserves spatial causality with shorter travel
and fades, not an unstable global animation-scale hack.

Tests cover reversal, cancellation, rapid retargeting, rotation/state restore
and concurrent notification arrival. Performance acceptance is based on frame
timelines and jank metrics, not source inspection.
