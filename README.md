# Dashy-Browser
Dies ist ein Projekt für die TU-Braunschweig.
Es wurde entwickelt um die Funktionen Web-App [daisy](https://github.com/ratze90/daisy) zu erweitern.

## Installation
* Electron herunterladen

Dieses Projekt baut auf [Electron](http://electron.atom.io) auf.
Die neueste Electron Version kann von [Electron Release](https://github.com/atom/electron/releases) herunter geladen werden.
Erfolgreich getestet wurde dieses Projekt mit `electron v0.34.0 win32 ia32`.

* Projekt hinzufügen

Nachdem Electron heruntergeladen und entpackt wurde. Wird dieses Projekt direkt zu dem Unterordner `electron/resources/app` eingefügt.

* Einstellungen

Vor Ausführeung müssen noch die Einstellungen (siehe `Informationen zu den Einstellungen`) angepasst werden.

* Ausführen

Nun wird die ´electron.exe´ vom Electron-Root Ordner ausgeführt. - Zack Fertig


## Informationen zu den Einstellungen
Die Einstellungen werden in der `package.json` vorgenommen.

### Flash
Es wird Chrome's build in Flash benutzt. Dafür rufen Sie in Chrome ´chrome://plugins´ auf und lesen den Flash Pfad und die Flash Version aus.
Diese Informationen werden entsprechend zu ´package.json´ -> ´flash.path´ und ´flash.version´ hinzugefügt.
**Wichtig:** Aktuell wird Flash nur von Electron's ia32 Build's unterstützt. Nicht von x64.

### Settings
Im folgenden werden die Einstellungen von `package.json > Settings` erklärt.
#### Debug
Wenn `Settings.debug` auf true gesetzt ist, wird die Console geöffnet und CoffeScript sowie Less kompiliert.
**Wichtig:** Muss beim ersten Start (nach checkout) aktiviert sein. Damit die CoffeeScript Sourcen zu Javascript kompiliert werden.
#### Url
Gibt die Url der Applikation [daisy](https://github.com/ratze90/daisy) an.
#### Zeige Demo
Wenn `settings.showIntroduction` auf true steht, wird die Finger-Demo und eine Nachricht zum Dateiupload für Sumo Paint angezeigt.
#### Dir Upload
Deaktiviert den Upload wenn `settings.dirUpload.enable` auf false steht.
Mit `settings.dirUpload.dir` wird der Überordner des up-/download Ordners angegeben. Normalerweiße sollte ´dir´ auf den Desktop zeigen.
#### Nativ Apps
Hier wird für jede Nativen-Applikations ein entsprechender Pfad hinterlegt. Die Haupt App wird (über a.href) `<call_name>:` ausführen.
Dies wird vom daisy-browser abgefangen, nach einem entsprechenden Pfad in ´settings.nativApps´ gesucht und danach ausgeführt.
Jeder eintrag sieht folgendermaßen aus: 'call_name' : 'run_file_path'

## [Documentation](http://rawgit.com/mulian/daisy-browser/master/docs/main.html)
