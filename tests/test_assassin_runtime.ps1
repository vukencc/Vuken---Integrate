param(
    [Parameter(Mandatory = $true)][string]$MinecraftRoot,
    [string]$Version = '26.1.2',
    [string]$Java = 'java',
    [string]$Python = 'python'
)

$ErrorActionPreference = 'Stop'
$gameRoot = (Resolve-Path $MinecraftRoot).Path
$versionDir = Join-Path (Join-Path $gameRoot 'versions') $Version
$profile = Get-Content (Join-Path $versionDir "$Version.json") -Raw | ConvertFrom-Json
$gameJar = Join-Path $versionDir "$Version.jar"
if (-not (Test-Path -LiteralPath $gameJar)) { throw "Missing game jar: $gameJar" }
$jars = @($gameJar)
foreach ($library in $profile.libraries) {
    if ($library.downloads.artifact.path) {
        $jar = Join-Path (Join-Path $gameRoot 'libraries') $library.downloads.artifact.path
        if (Test-Path -LiteralPath $jar) { $jars += $jar }
    }
}

$checkDir = Join-Path ([System.IO.Path]::GetTempPath()) ('game-test-' + [guid]::NewGuid())
New-Item -ItemType Directory -Path $checkDir | Out-Null
$fixture = Join-Path $checkDir 'packs/assassin'
& $Python (Join-Path $PSScriptRoot 'prepare_assassin_fixture.py') $fixture
if ($LASTEXITCODE -ne 0) { throw 'Assassin fixture preparation failed' }
New-Item -ItemType Directory -Path (Join-Path $checkDir 'universe') | Out-Null
Push-Location $checkDir
try {
    & $Java -cp ($jars -join [System.IO.Path]::PathSeparator) (Join-Path $PSScriptRoot 'RunAssassinGameTest.java') --universe (Join-Path $checkDir 'universe') --packs (Join-Path $checkDir 'packs') --tests 'test:assassin' --report (Join-Path $checkDir 'report.xml')
    if ($LASTEXITCODE -ne 0) { throw "Minecraft runtime test failed (exit $LASTEXITCODE). Logs: $checkDir" }
    $runtimeLog = Join-Path $checkDir 'logs/latest.log'
    if (Select-String -LiteralPath $runtimeLog -Pattern 'Failed to load function|Serialization errors:' -Quiet) { throw "Fixture function loading failed. Logs: $checkDir" }
    Write-Output "GameTest report: $checkDir/report.xml"
} finally { Pop-Location }
