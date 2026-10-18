# NexTab Engine – Brave-Erweiterung

Dieses Repository ist das offizielle Update-Ziel von NexTab Engine.

## Stand
Aktuelle lokale Version: **v3.1**. Die Brave-Erweiterung wird als **entpackte Erweiterung** geladen. Dafür gibt es kein automatisches Brave-Store-Update.

## GitHub-Update-System
Der Windows-Updater aus dem Paket [NexTab-v3.1-GitHub-Update-Eingerichtet.zip] wird **einmalig auf dem eigenen PC** eingerichtet. Er prüft öffentliche GitHub **Releases** beim Anmelden und täglich um 12 Uhr.

Für spätere Updates:
1. Die Versionsnummer in `manifest.json` auf z. B. `3.2.0` erhöhen.
2. Die Erweiterung mit `manifest.json` **direkt im ZIP-Stamm** als `NexTab-Engine-v3.2.0.zip` paketieren.
3. Auf GitHub unter **Releases → Draft a new release** ein Release mit Tag `v3.2.0` veröffentlichen und die ZIP als **Release-Asset** anhängen.
4. Beim nächsten geplanten Prüfen lädt der Windows-Updater das Release. Danach Brave komplett neu starten.

**Wichtig:** Nur Dateien in `main` hochzuladen löst mit diesem Updater **kein** Update aus; ein GitHub Release ist nötig. Die Windows-Bridge wird nicht automatisch überschrieben, sondern bleibt vorerst separat. Backups der bisherigen Erweiterungsdateien werden lokal angelegt. Verifikation erfolgt vor der Installation über die Versionsangaben und ggf. den von GitHub bereitgestellten SHA-256-Digest. Nur vertrauenswürdige Releases veröffentlichen.

## Einrichtung
Entpacke das konfigurierte NexTab-Paket und starte unter Windows:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "C:\PFAD\ZUM\ENTPACKTEN\AutoUpdate\Install-NexTab-AutoUpdate.ps1" -ExtensionPath "C:\PFAD\ZU\DEINER\AKTIVEN\NexTab-ERWEITERUNG"
```

Der `ExtensionPath` ist **exakt der Ordner**, den Brave unter `brave://extensions` für NexTab geladen hat. Er enthält `manifest.json`. Keine zweite Erweiterung installieren, damit die vorhandene ID und gespeicherten Einstellungen bleiben.

Updates-Log: `%LOCALAPPDATA%\NexTab\AutoUpdate\updater.log`

Hinweis: Die einmalige Installation und ein vollständiger Praxistest auf dem Windows-PC stehen noch aus.
