# DOKUMENTATION für die Klasse /rbgrp/interval_checker

## Einführung
Die Klasse `interval_checker` ist ein wichtiges Werkzeug zur Überprüfung von Zeitintervallen und zur Durchführung von Zeitberechnungen.

## Funktionsweise
Die Klasse nutzt verschiedene Methoden, um Start- und Endzeiten zu überprüfen, sicherzustellen, dass sie gültig sind, und Rückgaben basierend auf den Berechnungen zu liefern.

## Eigenschaften
- **Startzeit**: Zeitpunkt, ab dem die Überprüfung beginnen soll.
- **Endzeit**: Zeitpunkt, bis wann die Überprüfung gültig ist.

## Methoden
### 1. `setStartTime($time)`
Setzt die Startzeit des Intervalls.

#### Beispiel:
```php
$checker = new interval_checker();
$checker->setStartTime('2026-03-01 12:00:00');
```

### 2. `setEndTime($time)`
Setzt die Endzeit des Intervalls.

#### Beispiel:
```php
$checker->setEndTime('2026-03-02 12:00:00');
```

### 3. `isWithinInterval($time)`
Überprüft, ob die gegebene Zeit innerhalb des definierten Intervalls liegt.

#### Beispiel:
```php
if ($checker->isWithinInterval('2026-03-01 15:00:00')) {
    echo 'Die Zeit liegt im Intervall.';
} else {
    echo 'Die Zeit liegt außerhalb des Intervalls.';
}
```

## Anwendungsbeispiele
- Überprüfung von Reservierungen:
  - Verwendung der `interval_checker`, um sicherzustellen, dass Zeiträume für Buchungen nicht überschneiden.

- Validierung von Zeitstempeln in Datenbanken:
  - Gewährleistung, dass gespeicherte Zeitstempel immer in gültigen Intervallen liegen.

## Technische Details
Die Klasse implementiert fortgeschrittene Zeitberechnungen und nutzt die native PHP DateTime-Klasse für maximale Flexibilität und Genauigkeit. Alle Zeiten sollten im UTC-Format angegeben werden, um Verzerrungen aufgrund von Zeitzonen zu vermeiden.

## Fazit
Die `interval_checker` Klasse ist eine leistungsstarke Lösung zur Verwaltung von Zeitintervallen in modernen PHP-Anwendungen und bietet Entwicklern die nötigen Werkzeuge zur Durchführung präziser Zeitüberprüfungen.