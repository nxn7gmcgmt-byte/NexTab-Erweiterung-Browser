# NexTab Komplettpaket – Einmalige Einrichtung

Das aktuelle Weitergabe-Paket beinhaltet die Brave-Erweiterung (v3.1), Wallpaper-Engine-Windows-Bridge sowie den 10-Minuten-GitHub-Updater.

**Einrichten:** ZIP vollständig entpacken, `STARTEN.cmd` auf Windows doppelklicken und den angezeigten Schritten folgen. Für neue Installationen in Brave unter `brave://extensions` den Entwicklermodus einschalten und den Ordner `%LOCALAPPDATA%\NexTab\Extension` über „Entpackte Erweiterung laden“ auswählen. Die Erweiterungs-ID kann danach optional zur Einrichtung der Wallpaper-Engine-Bridge angegeben werden. Bereits bestehende Erweiterungsordner können im Setup direkt angegeben werden, ohne Browserdaten/ID zurückzusetzen.

**Sicherheitsgrenze:** Eine Brave-Erweiterung kann den Windows-Updater nicht eigenmächtig installieren. Die Ausführung des Setups muss der Benutzer einmalig selbst bestätigen. Der Updater prüft anschließend alle 10 Minuten bei laufendem Windows auf neue **öffentliche GitHub Releases**, nicht auf einzelne Commits.

**Veröffentlichung:** Ein GitHub-Release muss als Asset `NexTab-Engine-vX.Y.Z.zip` mit `manifest.json` direkt in der ZIP-Wurzel enthalten. Nach einem Update Brave neu starten. Die Windows-Bridge wird in dieser Version getrennt von den Browserdateien verwaltet.
