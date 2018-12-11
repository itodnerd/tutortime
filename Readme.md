TutorTime by dev

[[toc]]

# Was ist das?
Bei TutorTime handelt es sich um eine kleine Sammlung von Skripten, um die Dokumentation der täglichen Arbeitszeit für Tutoren möglichst einfach zu gestalten.
Sie wurde speziell für die Zusammenarbeit mit [Eternity](http://www.komorian.com/eternity.html) für iOS entwickelt, sie kann aber auch auf Ausgabeformate für andere Zeitnehmer angepasst werden.



# Wie funktioniert das?
## Bedingungen
* [ ] Ein Handy mit iOS.
* [ ] Ein Pc mit Linux, auf welchem LaTeX und Python3 installiert ist.
## Zeit loggen
Um die Zeit mit Eternity zu loggen, muss man sich erstmal die App auf dem Handy instalieren.
Die Eternity App kann nun ganz nach Wunsch konfiguriert und verwendet werden, wichtig ist nur, dass zu Beginn jeden Zeitintervalls auf Start und zum Ende Auf Stopp gedrückt wird.
Ich habe mehrere Aktivitäten namens Tafelübung, Korrektur, Vorbereitung ... erstellt und auf diesen dann die Zeiten geloggt.
## Zeiten aus der App exportieren
- Um auf die Zeiten zuzugreifen müssen diese im CSV-Format passend exportiert werden.
- Dazu wechseln wir in der App auf den Reports Bereich und wählen oben den gewünschten Monat aus.
- Neben der Auswahl des Monats findet sich das Export Menü, über welches der jeweilige Monat exportiert werden kann.
- In den Export Einstellungen muss nun das mitführen des Datums in jeder Zeile aktiviert werden.
- Nun kann das Log exportiert werden.

## Umwandeln des Logs in eine PDF
- Die exportieren Dateien müssen nun am Computer in einem Ordner gespeichert werden und dieser Ordner in /scripts/config.sh eingetragen werden (log_src_dir)
- Nun muss in der Datei Ausgabe.tex das Feld "NAME" und "BIRTHDAY" angepasst werden
- mithilfe des run.sh Skripts werden nun alle Logdateien in einen lokalen Ordner kopiert und jeweils in eine PDF umgewandelt.

## Was tut das Skript
Aktuell erwartet das Skript eine Datei im CSV Format, in welchem jede Zeile folgendermaßen aufgebaut ist:

0Day, 1Start, 2End, 3Duration, 4notImportant, 5ActivityName, 6Notes, 7notImportant

- 0Day: dd.mm.yy
- 1Start: hh:mm:ss
- 2End: hh:mm:ss
- 3Duration: hh:mm:ss
- 4: egal
- 5ActivityName: "String"
- 6Nots: "String"
- 7: egal

Bis auf die Einträge 4 und 7 tauchen später alle in der PDF auf und sind daher notwendig.

Diese Einträge werden nun in der Datei /scripts/TeXextractor.sh eingelesen und verarbeitet.
Dabei werden die Dateien tmp/Work.txt, tmp/Time.txt und tmp/Month.txt erzeugt, mithilfe derer dann das TeX file kompiliert wird.

## Anpassungsmöglichkeiten:
Für eine Anpassung an eine andere App ist es nur notwendig, die Datei /scripts/TeXextractor.sh anzupassen, sodass die benötigten Einträge gefunden werden können.
