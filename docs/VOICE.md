# MORICE Voice

Voice is provider based: `MoriceVoiceProvider` adapts the existing custom
pipeline when it becomes available; `AndroidTtsProvider` is the fallback.
Providers support streaming chunks, cancellation, audio focus, locale and
lifecycle callbacks. Conversation/core code never depends on a concrete voice.

Wake and capture design must avoid a permanent heavy workload, respect Android
power behavior, show microphone/processing privacy state and provide a complete
off switch. Voice assets and models remain managed downloads where practical.
