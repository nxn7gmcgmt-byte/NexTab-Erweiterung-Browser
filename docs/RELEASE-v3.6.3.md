# NexTab 3.6.3 Stability

Lokales Build: `NexTab-Engine-v3.6.3-Stability.zip`, Manifestversion 3.6.3.

Fixes: zugeordnete Videos zu `.pkg`-Szenen werden jetzt ueber die stabile Wallpaper-ID verwendet, selbst wenn der Bibliotheksabruf noch nicht abgeschlossen ist. Ein fehlender Medienlink gilt nicht mehr als erfolgreich synchronisiert. Videofehler werden als solche angezeigt.

Pruefungen: Node-JavaScript-Syntax, Referenzen von JavaScript auf vorhandene HTML-IDs, Go-Tests und ZIP-Integritaet bestanden. Sieben mitgelieferte MP4-Dateien vorhanden. Kein Windows-/Brave-Livetest.

Grenze: Vollautomatisches, hintergrund-isoliertes `.pkg`-Live-Rendering ist weiterhin nicht implementiert. Die bestehende Monitorfreigabe benoetigt ausdrueckliche Zustimmung und zeigt den ganzen Bildschirm. Den Test mit konkreten Wallpaper-Engine-Szenen kann nur ein Windows-Praxistest bestaetigen. **Kein universelles Funktionieren behaupten.**

Veroeffentlichung: Es muss ein oeffentliches GitHub-Release Tag `v3.6.3` mit ZIP-Asset `NexTab-Engine-v3.6.3-Stability.zip` erstellt werden. Der existierende Auto-Updater sucht nach Dateien `NexTab-Engine-v*.zip`; dieses Format passt. Danach Brave neu starten.