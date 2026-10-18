# NexTab Windows-Bridge: feste Erweiterungs-ID

Die aktuelle NexTab-Erweiterungs-ID des Nutzers ist **`mmekhafoddolhfmghgolkebcjcgpgmh`** (32 gueltige Buchstaben `a` bis `p`).

Der alte Setup-Dialog fragte die ID erneut ab. Im aktualisierten Komplettpaket `NexTab-Komplettpaket-v3.2-Bridge-ID-FIX.zip` verwendet `NexTab-EINRICHTEN.ps1` diese ID jetzt automatisch, prueft das Format und registriert die Wallpaper-Engine-Bridge im Benutzerprofil. Das bestehende Browserprofil und die Erweiterung werden dabei nicht geloescht.

## Auf dem Windows-PC

1. Das korrigierte ZIP vollstaendig entpacken.
2. `UPDATE-REPARIEREN.cmd` ausfuehren.
3. Falls Brave NexTab bereits verwendet, den bisherigen Erweiterungsordner waehlen.
4. Die Bridge registriert automatisch `mmekhafoddolhfmghgolkebcjcgpgmh`.
5. Brave vollstaendig schliessen und neu starten.

**Hinweis:** Das Paket muss lokal auf Windows ausgefuehrt werden. Das GitHub-Release-404 ist davon getrennt und bleibt, bis ein oeffentliches GitHub Release erstellt wird. Auf fremden Computern mit anderen IDs muss der Parameter `-ExtensionId` entsprechend angepasst werden. Ein Windows-Livetest des Fixes steht noch aus.
