# NexTab v3.6.0 – Live-Monitor-Beta

Build: `NexTab-Engine-v3.6.0-Live-Monitor-Beta.zip` (ZIP-Integritaet und JavaScript-Syntax lokal geprueft).

**Neu:** Unter Einstellungen → LIVE-ANSICHT kann der Benutzer nach expliziter Browser-Freigabe einen Monitor live in NexTab anzeigen. So sind Bewegungen einer dort laufenden Wallpaper-Engine-.pkg-Szene sichtbar. `getDisplayMedia()` liefert jedoch den **gesamten freigegebenen Monitor**, auch geoeffnete Fenster, und ist **kein direkter .pkg-Renderer**. Keine Aufnahme, keine Cloud-Uebertragung; der Stream wird bei Freigabeende gestoppt. Die Freigabe muss fuer jede neue Tab-Sitzung erneut bestaetigt werden. Fuer sinnvoll nutzbare Ansicht Wallpaper Engine am besten auf einem ansonsten freien zweiten Monitor anzeigen.

**Nicht implementiert:** automatisches universelles `.pkg`-Rendering, isolierte Hintergrundfenster-Erfassung, pixelgenaue 1:1-Garantie, automatischer Start ohne ausdrueckliche Nutzerfreigabe. Deshalb weiterhin nicht alle Punkte uneingeschraenkt mit ✅ markieren.

**Aktualisieren:** Oeffentliches Release `v3.6.0` mit der ZIP als Asset (umbenennen in `NexTab-Engine-v3.6.0.zip`, wenn die derzeitige Updater-Version verwendet wird) veroeffentlichen. Ein Push nach main allein startet keinen Update-Vorgang. Der optionale Windows-Bridge-Stand aus v3.5 ist unveraendert.

**Tests:** JavaScript `node --check` bestanden, ZIP-Integritaet bestanden. Kein Live-Test in Brave/Windows.
