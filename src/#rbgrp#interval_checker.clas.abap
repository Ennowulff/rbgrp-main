CLASS /rbgrp/interval_checker DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    "! Prüft, ob Wert im Intervall liegt (Format: [ ] ( ) z.B. ]100-250])
    "!
    "! @parameter i_value |
    "! @parameter i_interval |
    "! @parameter result |
    "! @raising cx_sy_conversion_no_number |
    CLASS-METHODS is_in_interval
      IMPORTING
        i_value       TYPE string
        i_interval    TYPE string
      RETURNING
        VALUE(result) TYPE abap_bool
      RAISING
        cx_sy_conversion_no_number.

    TYPES: BEGIN OF ts_interval_bounds,
             low       TYPE string,
             high      TYPE string,
             low_incl  TYPE abap_bool,
             high_incl TYPE abap_bool,
           END OF ts_interval_bounds.

  PRIVATE SECTION.
    CONSTANTS begin_of_bracket TYPE c LENGTH 1 VALUE '['.
    CONSTANTS end_of_bracket   TYPE c LENGTH 1 VALUE ']'.
    CONSTANTS separator        TYPE c LENGTH 1 VALUE ':'.

    CLASS-METHODS extract_bounds
      IMPORTING
        i_interval    TYPE string
      RETURNING
        VALUE(result) TYPE ts_interval_bounds.

ENDCLASS.


CLASS /rbgrp/interval_checker IMPLEMENTATION.
  METHOD is_in_interval.
    TRY.
        DATA(value_num) = CONV decfloat34( i_value ).
        DATA(interval_bounds) = extract_bounds( i_interval ).

        result = xsdbool(     (    interval_bounds-low_incl  = abap_true  AND value_num >= interval_bounds-low
                                OR interval_bounds-low_incl  = abap_false AND value_num >  interval_bounds-low )
                          AND
                              (    interval_bounds-high_incl = abap_true  AND value_num <= interval_bounds-high
                                OR interval_bounds-high_incl = abap_false AND value_num <  interval_bounds-high ) ).
      CATCH cx_sy_conversion_no_number.
        " Fallback: String-Vergleich für nicht-numerisch
*        interval_bounds = extract_bounds( iv_interval ).
*        result = xsdbool( COND #( WHEN lv_low_incl THEN iv_value >= lv_low_str ELSE iv_value > lv_low_str )
*                          AND COND #( WHEN lv_high_incl THEN iv_value <= lv_high_str ELSE iv_value < lv_high_str ) ).
    ENDTRY.
  ENDMETHOD.

  METHOD extract_bounds.
    DATA(lv_clean) = i_interval.
    SHIFT lv_clean RIGHT DELETING TRAILING space.
    SHIFT lv_clean LEFT DELETING LEADING space.

    result-low_incl = xsdbool( lv_clean(1) = begin_of_bracket ).
    lv_clean = shift_left( val = lv_clean places = 1 ).
    DATA(offset) = strlen( lv_clean ) - 1.
    result-high_incl = xsdbool( lv_clean+offset(1) = end_of_bracket ).
    lv_clean = shift_right( val = lv_clean places = 1 ).

    SPLIT lv_clean AT separator INTO result-low result-high.
    result-low  = condense( result-low ).
    result-high = condense( result-high ).
  ENDMETHOD.
ENDCLASS.
