# Third-party components

This repository contains **only** first-party source. Nothing below is vendored,
redistributed, or checked in here; each is resolved from a path you supply at build time
or loaded from your own machine at runtime.

## NVIDIA NGX SDK — proprietary, not redistributed

`nvsdk_ngx.h`, `nvsdk_ngx_vk.h` and `nvsdk_ngx_d.lib` are
`LicenseRef-NvidiaProprietary`, Copyright (c) NVIDIA CORPORATION & AFFILIATES.

They are consumed through the `NGX_SDK_DIR` CMake cache variable and are not present in
this tree. You must obtain the NGX SDK from NVIDIA under NVIDIA's own terms. The SDK is
used only for the driver-core parameter block (`Init_Ext`, `GetCapabilityParameters`);
every DLSS-NR symbol is resolved out of the snippet at runtime.

**Note that linking `nvsdk_ngx_d.lib` into a binary you then distribute is redistribution
of NVIDIA proprietary code, and is governed by your agreement with NVIDIA — not by this
project's licence.**

## nvngx_dlssnr.dll — the DLSS-NR snippet, not redistributed

The snippet ships without a licence file and is not included here, in any release, or in
any package built from this source. Supply your own copy. See the README for where it is
looked up.

`bypass_caller_check` defeats a caller-origin check NVIDIA implemented deliberately. That
is a matter between you and your NVIDIA licence agreements; this project's licence grants
you nothing with respect to NVIDIA's software and makes no representation that such use is
permitted.

## VapourSynth — LGPL-2.1

`VapourSynth4.h` and `VSHelper4.h` are used as a plugin API only, resolved through
`VAPOURSYNTH_INCLUDE_DIR`. VapourSynth's plugin interface is explicitly intended to support
plugins under their own terms.

## Vulkan-Headers — Apache-2.0

`vulkan/vulkan.h` is used headers-only, resolved through `VULKAN_INCLUDE_DIR`.
`vulkan-1.dll` is loaded with `LoadLibraryW` at runtime and never linked.
