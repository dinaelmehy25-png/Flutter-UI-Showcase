# Applies the Android settings this app needs. Safe to run more than once.
$ErrorActionPreference = 'Stop'
$root = Split-Path $PSScriptRoot -Parent

# 1. minSdk 23 (required by Firebase Authentication)
$gradle = Join-Path $root 'android\app\build.gradle.kts'
if (-not (Test-Path $gradle)) { $gradle = Join-Path $root 'android\app\build.gradle' }
$text = Get-Content $gradle -Raw
$text = $text -replace 'minSdk\s*=\s*flutter\.minSdkVersion', 'minSdk = 23'
$text = $text -replace 'minSdkVersion\s+flutter\.minSdkVersion', 'minSdkVersion 23'
[IO.File]::WriteAllText($gradle, $text)
Write-Host "  minSdk set to 23 in $gradle"

# 2. Disable Kotlin incremental compilation (fixes 'Could not close incremental caches'
#    when the project and the pub cache are on different drives)
$props = Join-Path $root 'android\gradle.properties'
if (-not (Select-String -Path $props -Pattern 'kotlin.incremental' -Quiet)) {
    Add-Content $props "`r`nkotlin.incremental=false"
}
Write-Host "  kotlin.incremental=false added to $props"
