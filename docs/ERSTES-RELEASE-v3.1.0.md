# Erstes NexTab Release vorbereiten – v3.1.0

Das erste auslieferbare Paket ist **NexTab-Engine-v3.1.0.zip** (Version `3.1.0` in der Datei `manifest.json`, direkt in der ZIP-Wurzel).

## Release einmalig veröffentlichen

1. Auf GitHub dieses Repository öffnen: https://github.com/nxn7gmcgmt-byte/NexTab-Erweiterung-Browser/releases/new
2. **Choose a tag** -> `v3.1.0` -> **Create new tag**.
3. Release title: `NexTab Engine v3.1.0`.
4. **Attach binaries** -> die vorbereitete ZIP-Datei mit EXAKT diesem Namen `NexTab-Engine-v3.1.0.zip` anhängen.
5. **Publish release** anklicken. Das Release muss öffentlich und nicht als Draft angelegt werden.

Wichtig: Der Windows-Updater prüft `https://api.github.com/repos/nxn7gmcgmt-byte/NexTab-Erweiterung-Browser/releases/latest` und erwartet eine ZIP im Format `NexTab-Engine-vX.Y.Z.zip`. Die `manifest.json` muss direkt im ZIP-Stamm liegen und dieselbe Version nennen. Die ZIP muss die vollständigen Erweiterungsdateien enthalten. Ein bloßer GitHub-Commit behebt den 404-Fehler nicht.

Nach dem ersten Release wird der bisherige 404-Hinweis beim nächsten Prüfen verschwinden, sofern GitHub erreichbar ist. Installierte Version 3.1.0 wird dann als aktuell erkannt und nicht erneut heruntergeladen. **Die Windows-Bridge und der Updater bleiben separat**; ZIP wird nur für die Erweiterungsdateien verwendet.

## Sicherheit
Veröffentliche nur selbst geprüfte Releases. Das installierte PowerShell-Skript führt Downloads aus diesem Repository aus. Andere Personen können das heruntergeladene ZIP anhand der SHA-256-Prüfsumme prüfen.
