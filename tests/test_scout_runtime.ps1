param(
    [Parameter(Mandatory = $true)][string]$MinecraftRoot,
    [string]$Version = '26.1.2',
    [string]$Java = 'java',
    [switch]$Skills58,
    [switch]$Fixes,
    [switch]$Skills67,
    [switch]$Particles,
    [switch]$GiftRoute,
    [switch]$BombRoute,
    [switch]$CleanTiming,
    [switch]$NoPassengerCleanup
)

$ErrorActionPreference = 'Stop'
$projectRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$gameRoot = (Resolve-Path $MinecraftRoot).Path
$versionDir = Join-Path (Join-Path $gameRoot 'versions') $Version
$profile = Get-Content (Join-Path $versionDir "$Version.json") -Raw | ConvertFrom-Json
$gameJar = Join-Path $versionDir "$Version.jar"
if (-not (Test-Path -LiteralPath $gameJar)) { throw "Missing game jar: $gameJar" }

$jars = @($gameJar)
foreach ($library in $profile.libraries) {
    $artifactPath = $library.downloads.artifact.path
    if ($artifactPath) {
        $jarPath = Join-Path (Join-Path $gameRoot 'libraries') $artifactPath
        if (Test-Path -LiteralPath $jarPath) { $jars += $jarPath }
    }
}

# Bootstrap logs go into a fresh temporary directory, never into the project/world.
$checkDir = Join-Path ([System.IO.Path]::GetTempPath()) ('alchemist-runtime-' + [guid]::NewGuid())
New-Item -ItemType Directory -Path $checkDir | Out-Null
$checker = Join-Path $PSScriptRoot 'RunScoutGameTest.java'
if ($Skills58) { $checker = Join-Path $PSScriptRoot 'RunScout58GameTest.java' }
if ($Fixes) { $checker = Join-Path $PSScriptRoot 'RunScoutFixesGameTest.java' }
if ($Skills67) { $checker = Join-Path $PSScriptRoot 'RunAlchemist67GameTest.java' }
if ($Particles) { $checker = Join-Path $PSScriptRoot 'RunAlchemistFxGameTest.java' }
if ($GiftRoute) { $checker = Join-Path $PSScriptRoot 'RunGiftRouteGameTest.java' }
if ($BombRoute) { $checker = Join-Path $PSScriptRoot 'RunBombRouteGameTest.java' }
$fixture = Join-Path $checkDir 'packs/alchemist'
& python (Join-Path $PSScriptRoot 'prepare_alchemist_fixture.py') $fixture
if ($LASTEXITCODE -ne 0) { throw 'Fixture preparation failed' }
& python (Join-Path $PSScriptRoot 'prepare_scout_fixture.py') $fixture
if ($LASTEXITCODE -ne 0) { throw 'Scout fixture failed' }
if ($Fixes) {
    & python (Join-Path $PSScriptRoot 'prepare_scout_input_fixture.py') $fixture
    if ($LASTEXITCODE -ne 0) { throw 'Scout input fixture failed' }
}
if ($CleanTiming) {
    & python (Join-Path $PSScriptRoot 'timing_control_fixture.py') $fixture
    if ($LASTEXITCODE -ne 0) { throw 'Control fixture preparation failed' }
}
if ($NoPassengerCleanup) {
    & python (Join-Path $PSScriptRoot 'passenger_control_fixture.py') $fixture
    if ($LASTEXITCODE -ne 0) { throw 'Passenger control fixture preparation failed' }
}
Push-Location $checkDir
try {
    & $Java -cp ($jars -join [System.IO.Path]::PathSeparator) $checker --universe (Join-Path $checkDir 'universe') --packs (Join-Path $checkDir 'packs') --tests 'test:alchemist' --report (Join-Path $checkDir 'report.xml')
    if ($LASTEXITCODE -ne 0) { throw "Minecraft runtime test failed (exit $LASTEXITCODE). Logs: $checkDir" }
    $runtimeLog = Join-Path $checkDir 'logs/latest.log'
    if (Select-String -LiteralPath $runtimeLog -Pattern 'Failed to load function|Serialization errors:' -Quiet) { throw "Fixture function loading failed. Logs: $checkDir" }
    Write-Output "GameTest report: $checkDir/report.xml"
} finally {
    Pop-Location
}
