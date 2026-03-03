# Dokumentation der Klasse /rbgrp/interval_checker

## Übersicht
Die Klasse `interval_checker` ermöglicht die Überprüfung, ob ein gegebener Wert innerhalb eines definierten Intervalls liegt. Diese Klasse ist besonders nützlich in Situationen, in denen Genauigkeit und Fehlertoleranz bei Dezimalzahlen erforderlich sind.

## Klassendefinition
Die `interval_checker`-Klasse ist mit den folgenden Datenstrukturen und Typen vordefiniert:

### Daten Typen
**ts_interval_bounds**: Ein Typ, der die Grenzen eines Intervalls definiert:
- `lower`: Die untere Grenze des Intervalls.
- `upper`: Die obere Grenze des Intervalls.

## Öffentliche und private Methoden
### Öffentliche Methoden
- **is_in_interval(value: DECIMAL)**: Überprüft, ob der gegebene Wert `value` im Intervall enthalten ist.
- **extract_bounds(interval: ts_interval_bounds)**: Gibt die Grenzen des Intervalls als ein Array zurück.

### Private Methoden
Diese Methoden sind intern und nicht für den direkten Zugriff von außen vorgesehen.

## Nutzung Beispiele
### Beispiel 1: Verwendung mit Dezimalzahlen 
```plaintext
let checker = new interval_checker();
let bounds = { lower: 5.5, upper: 10.4 };
let result = checker.is_in_interval(7.2, bounds);
console.log(result); // Gibt true zurück
```

### Beispiel 2: Verwendung mit Intervallnotation
```plaintext
let bounds1 = { lower: 3.0, upper: 7.0 };
let bounds2 = { lower: 1.0, upper: 4.0 };
let result1 = checker.is_in_interval(3.0, bounds1); // [3:7]
let result2 = checker.is_in_interval(4.5, bounds2); // ]1:4]
```

## Unit Tests Übersicht
Die Klasse wird durch verschiedene Tests gedeckt, um sicherzustellen, dass die Methoden wie erwartet funktionieren. Prüfen Sie die Testabdeckung.

## Technische Details
### DECFLOAT34 Konvertierung
Die Klasse ermöglicht eine präzise Handhabung von DECFLOAT34-Zahlen, um Genauigkeitsverluste zu minimieren.
### Fehlerbehandlung
Robuste Mechanismen zur Fehlerbehandlung sind implementiert, um ungültige Eingaben zu verwalten und sicherzustellen, dass die Funktionalität erhalten bleibt.

## Fazit
Diese Dokumentation ist gültig ab Version 1.0, erstellt am 2026-03-03. Die `interval_checker`-Klasse bietet eine effiziente und effektive Lösung zur Überprüfung von Intervallen in Ihrer Anwendung.