param(
  [string]$Repository = 'nxn7gmcgmt-byte/NexTab-Erweiterung-Browser',
  [Parameter(Mandatory=$true)][string]$ExtensionPath
)
$ErrorActionPreference = 'Stop'
if ($Repository -notmatch '^[A-Za-z0-9_.-]+/[A-Za-z0-9_.-]+$') { throw 'Ungueltiges Repository' }
$ExtensionPath = [IO.Path]::GetFullPath($ExtensionPath)
$manifest = Join-Path $ExtensionPath 'manifest.json'
if (-not (Test-Path -LiteralPath $manifest)) { throw "manifest.json fehlt: $ExtensionPath" }
$existing = Get-Content -LiteralPath $manifest -Raw | ConvertFrom-Json
if ([string]$existing.name -notlike 'NexTab Engine*') { throw 'Kein NexTab-Erweiterungsordner' }
$destination = Join-Path $env:LOCALAPPDATA 'NexTab\AutoUpdate'
New-Item -ItemType Directory -Path $destination -Force | Out-Null
Copy-Item -LiteralPath (Join-Path $PSScriptRoot 'Update-NexTab.ps1') -Destination $destination -Force
@{ Repository=$Repository; ExtensionPath=$ExtensionPath } | ConvertTo-Json | Set-Content -LiteralPath (Join-Path $destination 'config.json') -Encoding UTF8
$script = Join-Path $destination 'Update-NexTab.ps1'
$action = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument ('-NoProfile -NonInteractive -WindowStyle Hidden -ExecutionPolicy Bypass -File "'+$script+'" -Silent')
# Wiederkehrende Prüfung alle 10 Minuten, auch nach dem Neustart.
# schtasks /SC MINUTE /MO 10 hat keine 1-Tages-Endzeit des Repeat-Triggers.
$taskName = 'NexTab GitHub Updates'
$taskCommand = 'powershell.exe -NoProfile -NonInteractive -WindowStyle Hidden -ExecutionPolicy Bypass -File "' + $script + '" -Silent'
& schtasks.exe /Create /F /SC MINUTE /MO 10 /TN $taskName /TR $taskCommand | Out-Null
if ($LASTEXITCODE -ne 0) { throw 'Aufgabe konnte nicht erstellt werden (Windows Aufgabenplanung).' }
Write-Host "Updater fuer $Repository eingerichtet; NexTab: $ExtensionPath"
& $script
