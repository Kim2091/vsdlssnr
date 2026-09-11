# VapourSynth packaging

Ship each plugin/script with its matching `vapourkit/*.vkfilter` in source and
release packages. Keep filter parameters and docs aligned with the plugin API.
Use `package.ps1` after building. NVIDIA runtime DLLs and SDKs remain external.
