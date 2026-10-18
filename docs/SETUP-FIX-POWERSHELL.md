# NexTab Setup-Fix: Windows PowerShell ParserError

Wenn `Update-NexTab.ps1` meldet, dass eine Zeichenfolge kein Abschlusszeichen hat oder `try`/`catch`-Bloecke fehlen, kann Windows PowerShell 5.1 die UTF-8-Datei ohne BOM falsch decodiert haben. Insbesondere Umlaute und Sonderzeichen in Logmeldungen verursachen dabei Syntaxfehler.

## Loesung (18.10.2026)

1. Das korrigierte NexTab-Komplettpaket **NexTab-Komplettpaket-FIX-PowerShell.zip** benutzen.
2. ZIP entpacken und `UPDATE-REPARIEREN.cmd` ausfuehren.
3. Bei bestehender Installation denselben Erweiterungsordner aus `brave://extensions` angeben (nicht doppelt installieren).
4. Das Setup kopiert den bereinigten Updater erneut nach `%LOCALAPPDATA%\NexTab\AutoUpdate\Update-NexTab.ps1`.
5. GitHub-Releases werden danach alle 10 Minuten per Windows-Aufgabenplanung abgefragt.

Im korrigierten Paket sind PowerShell-Skripte als **UTF-8 mit BOM** gespeichert; die vom Legacy-Parser gelesenen Setup-/Updater-Skripte benutzen ausserdem ASCII-Text. Das vermeidet den ParserError, ohne Windows-Sicherheitsfunktionen abzuschalten. Das Paket wurde noch nicht auf einem echten Windows-Rechner getestet.

**Wichtig:** Der GitHub-Updater kann erst einen neuen NexTab-Release installieren, wenn dieser als oeffentlicher GitHub-Release mit dem passenden `NexTab-Engine-vX.Y.Z.zip`-Asset existiert.
