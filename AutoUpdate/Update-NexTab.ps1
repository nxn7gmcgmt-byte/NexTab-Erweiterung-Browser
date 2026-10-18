param([switch]$Silent)
$ErrorActionPreference = 'Stop'
$root = Join-Path $env:LOCALAPPDATA 'NexTab\AutoUpdate'
$configFile = Join-Path $root 'config.json'
function Log([string]$message) {
  $line = "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') $message"
  Add-Content -LiteralPath (Join-Path $root 'updater.log') -Value $line
  if (-not $Silent) { Write-Host $line }
}
if (-not (Test-Path -LiteralPath $configFile)) { throw "Updater nicht eingerichtet: $configFile" }
$config = Get-Content -LiteralPath $configFile -Raw | ConvertFrom-Json
$target = [IO.Path]::GetFullPath([string]$config.ExtensionPath)
$repo = [string]$config.Repository
if ($repo -notmatch '^[A-Za-z0-9_.-]+/[A-Za-z0-9_.-]+$') { throw 'Ungueltiges Repository' }
$manifest = Join-Path $target 'manifest.json'
if (-not (Test-Path -LiteralPath $manifest)) { throw "manifest.json fehlt: $target" }
$local = Get-Content -LiteralPath $manifest -Raw | ConvertFrom-Json
if ([string]$local.name -notlike 'NexTab Engine*') { throw 'Ziel ist keine NexTab-Erweiterung' }
$headers = @{ 'User-Agent' = 'NexTab-Windows-Updater'; 'Accept' = 'application/vnd.github+json' }
try { $release = Invoke-RestMethod -Uri "https://api.github.com/repos/$repo/releases/latest" -Headers $headers -TimeoutSec 25 }
catch { Log "Noch kein oeffentliches Release oder Netzwerkfehler: $($_.Exception.Message)"; exit 0 }
$asset = @($release.assets) | Where-Object { $_.name -match '^NexTab-Engine-v[0-9].*\.zip$' } | Select-Object -First 1
if (-not $asset) { Log 'Release-Asset NexTab-Engine-v*.zip fehlt'; exit 0 }
$onlineVersion = ([string]$release.tag_name) -replace '^v',''
try {
  if ([version]$onlineVersion -le [version]$local.version) { Log "Aktuell: v$($local.version)"; exit 0 }
} catch { Log "Release-Tag ungueltig: $($release.tag_name)"; exit 0 }
$tmp = Join-Path $env:TEMP ('NexTab-update-'+[guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $tmp -Force | Out-Null
try {
  $zipPath = Join-Path $tmp 'nextab.zip'
  Log "Lade v$onlineVersion von $repo"
  Invoke-WebRequest -Uri $asset.browser_download_url -OutFile $zipPath -TimeoutSec 240 -Headers $headers
  if ($asset.digest -and [string]$asset.digest -match '^sha256:([a-fA-F0-9]{64})$') {
    $expected = $Matches[1]
    $actual = (Get-FileHash -LiteralPath $zipPath -Algorithm SHA256).Hash
    if ($actual -ine $expected) { throw 'SHA256 stimmt nicht mit GitHub ueberein' }
  }
  Add-Type -AssemblyName System.IO.Compression
  $archive = [IO.Compression.ZipFile]::OpenRead($zipPath)
  try {
    foreach ($entry in $archive.Entries) {
      if ($entry.FullName.StartsWith('/') -or $entry.FullName -match '(^|/)\.\.(/|$)|\\|:') { throw 'Unsicherer ZIP-Pfad' }
    }
  } finally { $archive.Dispose() }
  $unpack = Join-Path $tmp 'unpack'
  Expand-Archive -LiteralPath $zipPath -DestinationPath $unpack
  $newManifest = Join-Path $unpack 'manifest.json'
  if (-not (Test-Path -LiteralPath $newManifest)) { throw 'manifest.json muss in ZIP-Wurzel liegen' }
  $new = Get-Content -LiteralPath $newManifest -Raw | ConvertFrom-Json
  if ([string]$new.name -notlike 'NexTab Engine*') { throw 'Ungueltiges Release' }
  if ([version]$new.version -ne [version]$onlineVersion) { throw 'Version und Release-Tag stimmen nicht ueberein' }
  $backup = Join-Path $root ('backup-'+(Get-Date -Format 'yyyyMMdd-HHmmss'))
  New-Item -ItemType Directory -Path $backup -Force | Out-Null
  $names = @('manifest.json','newtab.html','newtab.js','background.js','styles.css','assets')
  foreach ($name in $names) {
    $old = Join-Path $target $name
    if (Test-Path -LiteralPath $old) { Copy-Item -LiteralPath $old -Destination $backup -Recurse -Force }
  }
  try {
    foreach ($name in $names) {
      $source = Join-Path $unpack $name
      if (-not (Test-Path -LiteralPath $source)) { throw "Release-Datei fehlt: $name" }
      $destination = Join-Path $target $name
      if ($name -eq 'assets') {
        if (-not (Test-Path -LiteralPath $destination)) { New-Item -ItemType Directory -Path $destination -Force | Out-Null }
        Copy-Item -Path (Join-Path $source '*') -Destination $destination -Recurse -Force
      } else { Copy-Item -LiteralPath $source -Destination $destination -Force }
    }
  } catch {
    foreach ($name in $names) {
      $from = Join-Path $backup $name
      if (Test-Path -LiteralPath $from) {
        if ($name -eq 'assets') { Copy-Item -Path (Join-Path $from '*') -Destination (Join-Path $target $name) -Recurse -Force }
        else { Copy-Item -LiteralPath $from -Destination (Join-Path $target $name) -Force }
      }
    }
    throw
  }
  Log "NexTab v$onlineVersion installiert. Brave vollstaendig neu starten."
} catch { Log "Update fehlgeschlagen: $($_.Exception.Message)"; exit 1 }
finally { Remove-Item -LiteralPath $tmp -Recurse -Force -ErrorAction SilentlyContinue }
