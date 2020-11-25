---
title: Webteams-Doku
...

# 1. Aufbau der Webanwendung #

## 1.1. Dateistruktur ##

Die Webanwendung besteht aus folgenden Dateien (Ordner werden kursiv dargestellt):

- server.py
- *app*
  - application.py
  - database.py
  - dataid.py
  - view.py
- *content*
  - webteams.js
  - webteams.css
- *data*
  - maxid.json
  - view_file.json
  - webteams.json
- *templates*
  - form.tpl
  - list.tpl
  - list2.tpl

## 1.2. Funktionsweise ##

### 1.2.1. Serverstart ###

Der Einstiegspunkt bei Serverstart befindet sich in der Datei "server.py". Hier werden alle Konfigurationen vorgenommen und der Server wird gestartet.

Konfigurationen, die in der "server.py" erfolgen, sind u.a.:

- welches Directory das Root-Directory für den Server ist
- wie die Ordnerstruktur serverseitig aussieht
- ob und wo Log-Dateien abgespeichert werden

### 1.2.2. Interaktion mit Benutzer ###

Die Benutzerschnittstelle für Aktionen, die der Benutzer auf der Webseite initiiert, ist je nach Aktion entweder die "application.py" oder die "webteams.js".

#### 1.2.2.1. Aktion "erfassen" ####

Da es sich hier um einen Anchor-Tag (\<a>) handelt, wird durch Klick auf "erfassen" ein Link aufgerufen und diese Anfrage wird durch die "application.py" entgegengenommen, die ihrerseits ein leeres Formular erzeugt. Hierzu bedient sich die Klasse "Application" mehreren Hilfsmethoden aus den Klassen "Database" und "DataId" und "View".

#### 1.2.2.2. Aktion "als Aufzählung darstellen" und "als Liste darstellen" ####

Hierbei handelt es sich um einen Button (\<button>), auf dem ein EventListener liegt. Daher ist die Schnittstelle in diesem Fall die "webteams.js", die ihrerseits eine Anfrage an den Webserver schickt, aber dazu später im Kapitel <span style="color:red;">später ergänzen!</span> mehr.

#### 1.2.2.3. Aktion "bearbeiten" ####

Hierbei handelt sich auch um einen Anchor-Tag (\<a>) wie bei der Aktion "erfassen". Es wird ein Link aufgerufen, dem als Parameter die ID des zu bearbeitenden Datensatzes angehangen wird. Diese Information wird von der "application.py" aufgenommen und es wird ein mit den entsprechenden Daten gefülltes Formular erzeugt. Hierzu werden wieder Hilfsmethoden aus den Klassen "Database" und "DataId" und "View" herangezogen.

#### 1.2.2.4. Aktion "löschen" ####

Hierbei handelt es sich wieder um einen Button (\<button>), auf dem ebenfalls ein EventListener liegt. Nach einem Klick auf den "löschen"-Button wird zunächst durch die "webteams.js" ein Dialog erzeugt, der den Benutzer fragt,  ob er den Eintrag wirklichen löschen möchte. Bestätigt er diesen Dialog mit "OK", dann schickt die Methode `confirm_delete()` eine Anfrage an den Webserver.

#### 1.2.2.5. Aktion "abbrechen" ####

Der Anchor-Tag (\<a>) "abbrechen" führt wieder auf die Startseite zurück, ohne das Formular abzuschicken.

### 1.2.3. Interne Funktionsweise ###

#### 1.2.3.1. Programmverhalten ####

##### application.py #####

Die Klasse "Application" steuert die Webanwendung und stellt die Benutzerschnittstelle dar. Sie erstellt das Formular mit der Methode `add()` und nimmt Daten in der Methode `save()` entgegen. Außerdem erstellt sie mit der Methode `create_list()` jeweils die gewünschte Listen- oder Aufzählungsansicht.

##### database.py #####

Die Klasse "Database" ist für die Speicherung der Team-Daten zuständig. Dies tut sie, indem sie die Datei "webteams.json" pflegt.

##### dataid.py #####

Hier wird die jeweils aktuelle ID erzeugt und verwaltet. Zur Speicherung der aktuellen maxID wird die Datei "maxid.json" geschrieben.

##### view.py #####

Diese Klasse kümmert sich um die Darstellungsweise als Liste bzw. Aufzählung. Um die aktuelle Darstellungsweise festzuhalten, wird die Datei "view_file.json" aktualisiert, in der immer nur "list" oder "list2" geschrieben wird. So ist auch nach einem Server-Neustart und nach Cache-Leerung im Browser immer noch die zuletzt gewählte Darstellungsweise gespeichert.

#### 1.2.3.2. Datenverwaltung ####

Zur Datenverwaltung werden 3 JSON-Dokumente benutzt:

##### maxid.json #####

Hier wird die derzeit aktuelle höchste ID in Benutzung abgespeichert. Wird vom Benutzer ein neuer Datensatz erzeugt, wird die ID um eins erhöht. Diese ID dient nur internen Verarbeitungszwecken und wird dem Benutzer nicht angezeigt.

##### view_file.json #####

Hier wird die als letztes vom Benutzer ausgewählte Ansicht abgespeichert. Beim Aufruf der Webseite wird immer zuerst abgefragt, welche der beiden Ansichten ausgegeben werden soll und die entsprechende .tpl-Datei ausgewählt.

##### webteams.json #####

In dieser Datei werden die Teams nach ID's sortiert abgespeichert. Die Sortierung nach ID's ergibt sich lediglich durch den Umstand, dass es nicht möglich ist, zu einem späteren Zeitpunkt ein Team mit einer niedrigeren ID als die derzeit aktuelle abzuspeichern. Gelöschte Teams werden auch aus dieser Datei entfernt, die ID des gelöschten Teams wird jedoch nicht wiederverwendet.

---

# 2. Durchgeführte Ergänzungen #

Das Formular wurde um die zweite Person erweitert und zusätzlich wurde eine Eingabe "Semesteranzahl" ergänzt, sodass das Formular statt der ursprünglichen 3 Eingabefelder nun 8 Eingabefelder hat.

Die Listenansicht wurde um die Darstellung der zweiten Person und das Attribut "Semesteranzahl" ergänzt, sodass ein Team aus jeweils 2 Zeilen und 4 Spalten besteht.

Die Aktion "abbrechen" wurde im Formular ergänzt. Ein Klick auf "abbrechen" bricht die Formular-Bearbeitung ab und führt zurück auf die Startseite.

Das Löschen von Einträgen wurde implementiert. Hierzu wurde ein Button bei jedem Team ergänzt, das beim Klick ein Dialog-Fenster öffnet mit der Nachfrage: "Wollen Sie den Eintrag wirklich löschen?" und den Optionen "OK" und "Cancel". Klickt der Benutzer auf "OK", wird der Datensatz gelöscht und die Webseite neu geladen, sodass die aktalisierte Liste angezeigt wird. Klickt der Benutzer auf "Cancel", schließt sich lediglich das Dialog-Fenster.

Die Möglichkeit zur Umschaltung zwischen einer Listenansicht und einer Aufzählungsansicht wurde geschaffen. Bei Klick auf die Schaltfläche "als Aufzählung/Liste darstellen" aktiviert sich die jeweils andere Ansicht.

Außerdem wurde die Webseite mit CSS gestylt. Unter anderem wurden die Aktionen "erfassen", "bearbeiten", "löschen", "als Aufzählung/Liste darstellen", "abbrechen" und "speichern" allesamt äußerlich einheitlich als Schaltfläche dargestellt, obwohl es sich um 3 unterschiedliche HTML-Elemente handelt (\<a>, \<button>, \<form type="submit">).

Es existiert nun auch die Möglichkeit, den Server per Aufruf der Adresse "http://127.0.0.1:8080/shutdown" herunterzufahren. Diese Option wird dem Benutzer auf der Webseite nicht angezeigt.

---

# 3. Beschreibung des HTTP-Datenverkehrs #

## 3.1. beim Start der Anwendung ##

![Traffic beim Start der Anwendung](Traffic beim Start der Anwendung.jpg "Traffic beim Start")

Wird die Webseite aufgerufen, schickt der Browser eine GET-Request an den Server, in der ein html-Dokument angefordert wird. Dieses wird auch vom Server ausgeliefert, nebst CSS Stylesheet und JavaScript-Datei.

## 3.2. beim Speichern von Formulardaten ##

![Traffic beim Speichern von Formulardaten](Traffic beim Speichern von Formulardaten.jpg "Traffic beim Speichern")

Klickt der Benutzer auf "speichern", sendet der Browser eine POST-Request an den Server mit allen Daten, die der Benutzer eingegeben hat und die vom Server generierte ID.

## 3.3. beim Umschalten zwischen verschiedenen Ansichten ##

![Traffic beim Umschalten von Liste in Aufzählung](Traffic beim Umschalten von Liste in Aufzählung.jpg "Traffic beim Umschalten")

