# Überblick
Diese Dokumentation beschreibt die Klasse `/rbgrp/interval_checker`, die verwendet wird, um zu prüfen, ob ein gegebener Wert innerhalb eines bestimmten Intervalls liegt.

# Klasse Definition
```abap
  PUBLIC SECTION.
    CLASS-METHODS is_in_interval
      IMPORTING
        i_value       TYPE string
        i_interval    TYPE string
      RETURNING
        VALUE(result) TYPE abap_bool
      RAISING
        cx_sy_conversion_no_number.
  PRIVATE SECTION.
    CLASS-METHODS extract_bounds
      IMPORTING
        i_interval    TYPE string
      RETURNING
        VALUE(result) TYPE ts_interval_bounds.
```

# öffentliche Methoden
## is_in_interval
Hier wird überprüft, ob der eingegebene Wert innerhalb des definierten Intervalls liegt. Der Rückgabewert ist vom Typ `abap_bool` und zeigt an, ob der Wert im Intervall liegt oder nicht.

# private Methoden
## extract_bounds
Diese Methode extrahiert die Grenzen des Intervalls und gibt sie als `ts_interval_bounds` zurück.

# Detaillierte Verwendungsbeispiele in ABAP
1. **Beispiel 1**: 
```abap
 DATA(lo_checker) = NEW /rbgrp/interval_checker().
 DATA(lv_result) = lo_checker->is_in_interval( i_value = 50 i_interval = '[20:80]).
* Hier wird geprüft, ob 50 im Intervall liegt.
```

# Unit-Tests Übersicht
Unit-Tests sind entscheidend, um sicherzustellen, dass die Methoden `is_in_interval` und `extract_bounds` wie erwartet funktionieren. Es sollten Tests für Grenzfälle durchgeführt werden.

# Technische Details
Die Klasse `/rbgrp/interval_checker` basiert auf den gängigen ABAP-Standards und verwendet die modernen Syntax-Elemente von ABAP 7.4 und höher.

# Besonderheiten
Besonderheiten der Klasse sind die Möglichkeit, dynamische Intervallgrenzen zu verwenden und die Verwendung von Rückgabewerten zur effektiven Fehlerbehandlung.

# Zusammenfassung
Die Klasse `/rbgrp/interval_checker` ist ein effektives Werkzeug zur Überprüfung von Werten innerhalb festgelegter Intervalle. Durch die öffentlichen und privaten Methoden kann die Klasse flexibel eingesetzt werden.
