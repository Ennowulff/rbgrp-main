CLASS /rbgrp/cl_trace DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES /rbgrp/if_trace.

  PRIVATE SECTION.
    DATA trace TYPE /rbgrp/if_trace=>_trace.
ENDCLASS.


CLASS /rbgrp/cl_trace IMPLEMENTATION.
  METHOD /rbgrp/if_trace~dotrace.
    trace-used_rule = iv_rule.
  ENDMETHOD.

  METHOD /rbgrp/if_trace~get_trace.
    trace = me->trace.
  ENDMETHOD.

  METHOD /rbgrp/if_trace~inittrace.
    trace-name            = name.
    trace-number_of_rules = number_of_rules.
    trace-version         = version.
  ENDMETHOD.
ENDCLASS.
