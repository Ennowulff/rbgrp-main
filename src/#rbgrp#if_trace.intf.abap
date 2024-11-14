INTERFACE /rbgrp/if_trace
  PUBLIC.
  TYPES:
    BEGIN OF _trace,
      name            TYPE string,
      used_rule       TYPE string,
      number_of_rules TYPE string,
      version         TYPE string,
    END OF _trace.

  METHODS inittrace
    IMPORTING
      name            TYPE csequence
      number_of_rules TYPE csequence
      version         TYPE csequence.

  METHODS dotrace
    IMPORTING
      iv_rule TYPE csequence.

  METHODS get_trace
    RETURNING
      VALUE(trace) TYPE _trace.
ENDINTERFACE.
