# TODO

## Desktop Ordner
Für MS Office, im speziellen Visio.
* Desktop Ordner "upload"
  * wird mit der Applikation erstellt
  * alles was da rein kommt wird hochgeladen
    * daisy->uploadFile(appname,url,gruppen_id=null)
      * appname wird an endung erkannt
  * und mit schließen von Electron gelöscht

## Menu ein/ausblenden

### Was soll es können?
Wenn eine Andere Applikation geöffnet ist:
  * Wird mit einem "swypw" von ganz links nach rechts das Menu von Daisy eingeblendet
    * Beim Tippen auf das Menu:
      * verschwindet die aktuelle app im Hintergrund
        * Menu punkt wird erweitert mit "zurück zu xxx App"
          * Daraufhin soll die app wieder in den vordergrund
      * Der entsprechende Menu Punkt wird aufgerufen

### Umsetzung

#### Idee 1
Beim einsteigen in eine App:
  * wird eine Kopie des Menu's auf root ebene gepackt und manipuliert:
    * Die a tags verweisen auf die a-tags des Originals
    * mit klick auf einen a tag wird das Dashboard (Daisy) gezeigt.
    * es wird ausserdem beim Original Menu, ein Item erstellt mit "zurück zu xx App"
      * durch klick kommt man wieder zur App
Das Swypen habe ich ja praktisch schon. Sollte nur verbessert werden