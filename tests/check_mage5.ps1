param(
    [Parameter(Mandatory = $true)][string]$MinecraftRoot,
    [string]$Version = '26.1.2',
    [string]$Java = 'java'
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
$checkDir = Join-Path ([System.IO.Path]::GetTempPath()) ('mage5-check-' + [guid]::NewGuid())
New-Item -ItemType Directory -Path $checkDir | Out-Null
$checker = Join-Path $PSScriptRoot 'CheckMage5.java'
Push-Location $checkDir
try {
    & $Java -cp ($jars -join [System.IO.Path]::PathSeparator) $checker $projectRoot
    if ($LASTEXITCODE -ne 0) { throw "Minecraft command compilation failed (exit $LASTEXITCODE). Logs: $checkDir" }
} finally {
    Pop-Location
}
