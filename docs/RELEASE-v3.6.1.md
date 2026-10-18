# NexTab v3.6.1 – Stabilisierung der Live-Monitor-Beta

Gepruefter Build: `NexTab-Engine-v3.6.1.zip` (Manifest-Version 3.6.1, JavaScript-Syntax und ZIP-Integritaet geprueft).

Behoben bzw. verbessert: parallele Bildschirmfreigabe-Starts verhindert; Browser bittet explizit um einen ganzen Monitor statt Tab/Fenster; wenn die Schnittstelle den Quellentyp meldet, werden andere Quellen abgelehnt; beendet den Stream beim Verlassen des Tabs, behandelt Abbruch und Fehler; pausiert Wiedergabe bei ausgeblendetem Tab. Nutzerfreigabe bleibt erforderlich.

Einschraenkung: Die Browser-API kann den Quellentyp nicht auf allen Plattformen erzwingen und verhindert auch nicht, dass andere Fenster auf dem freigegebenen Monitor sichtbar sind. Das funktioniert nicht als echter isolierter Wallpaper-Engine-.pkg-Renderer. Keine universelle .pkg-Unterstuetzung und keine getestete 1:1-Qualitaetsgarantie. Windows- und Brave-Livetests stehen aus.

Um ueber den bestehenden 10-Minuten-Updater aktualisiert zu werden, muss v3.6.1 zusaetzlich als oeffentliches GitHub Release mit Tag `v3.6.1` und Asset **`NexTab-Engine-v3.6.1.zip`** veroeffentlicht werden. Nur ein Commit auf main genuegt nicht.
