# NexTab Engine v3.3.0 – Wallpaper Engine scene mapping fix

Die Version `NexTab-Engine-v3.3.0.zip` wurde lokal erstellt (ca. 90 MB); `manifest.json` enthaelt `3.3.0` direkt in der ZIP-Wurzel.

## Verbessert
- Die Windows-Bridge liest bei `scene.pkg` den echten Wallpaper-Titel aus `project.json` statt nur `scene` anzuzeigen.
- NexTab versucht bei der automatischen Monitor-Synchronisierung die Wallpaper-Engine-Bibliothek zu laden und die zugeordnete Videoaufnahme ueber den Titel wiederzufinden.
- Nicht renderbare `.pkg`-Szenen bleiben **ehrlich als statische Vorschau** sichtbar, keine kuenstliche Pan-Animation. Eine echte Live-3D-Uebertragung ist in dieser Version **nicht implementiert**.
- Bei zugeordneten Szenen erscheint der Hinweis `VIDEO ZUGEORDNET`.

Die bestehenden sieben Live-Wallpaper, Suchleiste, Einstellungen, der Updater und die Bridge bleiben enthalten. Die aktualisierte Bridge muss auf Windows noch eingerichtet bzw. ersetzt werden, damit die neuen `scene.pkg`-Titel im Auto-Sync erscheinen.

Pruefung: `node --check newtab.js`, `go test ./...` bestanden, Windows-Binary `nextab-bridge.exe` fuer amd64 neu kompiliert. Kein Brave-/Windows-Livetest durchgefuehrt.

## GitHub-Release
Erst nach Veroeffentlichung als oeffentliches Release mit Tag `v3.3.0` und der ZIP-Datei als Asset `NexTab-Engine-v3.3.0.zip` kann der 10-Minuten-Windows-Updater diese Version automatisch finden. Ein Dateiupload nach `main` allein genuegt nicht.
