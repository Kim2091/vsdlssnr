param([string]$BuildDir = (Join-Path $PSScriptRoot 'build'))
$ErrorActionPreference = 'Stop'
# Explicit inputs keep user-supplied NVIDIA DLLs out of the distribution.
$files = @(
  (Join-Path $BuildDir 'vsdlssnr.dll'),
  (Join-Path $PSScriptRoot 'vapourkit'),
  (Join-Path $PSScriptRoot 'README.md'),
  (Join-Path $PSScriptRoot 'LICENSE.md'),
  (Join-Path $PSScriptRoot 'THIRD-PARTY-NOTICES.md')
)
foreach ($file in $files) {
  if (-not (Test-Path -LiteralPath $file)) { throw "Missing package input: $file. Build first." }
}
if (-not (Test-Path -LiteralPath (Join-Path $PSScriptRoot 'vapourkit/DLSS Neural Uplift.vkfilter'))) {
  throw 'The matching Vapourkit filter is required.'
}
$out = Join-Path $PSScriptRoot 'out'
New-Item -ItemType Directory -Force -Path $out | Out-Null
$archive = Join-Path $out 'vsdlssnr.zip'
Compress-Archive -LiteralPath $files -DestinationPath $archive -Force
Write-Host "Packaged $archive"
