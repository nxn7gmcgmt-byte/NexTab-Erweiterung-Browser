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
$triggers = @((New-ScheduledTaskTrigger -AtLogOn -User $env:USERNAME), (New-ScheduledTaskTrigger -Daily -At '12:00'))
Register-ScheduledTask -TaskName 'NexTab GitHub Updates' -Action $action -Trigger $triggers -Description 'Automatische NexTab GitHub Release Updates' -Force | Out-Null
Write-Host "Updater fuer $Repository eingerichtet; NexTab: $ExtensionPath"
& $script
