CLASS ltcl_interval_test DEFINITION FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      closed_incl FOR TESTING,
      open_left FOR TESTING,
      open_right FOR TESTING,
      both_open FOR TESTING,
      boundary_low FOR TESTING,
      boundary_high FOR TESTING,
      numeric_vs_string FOR TESTING.
*      invalid_format FOR TESTING.

ENDCLASS.

CLASS ltcl_interval_test IMPLEMENTATION.

  METHOD closed_incl.
    cl_abap_unit_assert=>assert_equals( act = /rbgrp/interval_checker=>is_in_interval( i_value = '150' i_interval = '[100:200]' ) exp = abap_true ).
    cl_abap_unit_assert=>assert_equals( act = /rbgrp/interval_checker=>is_in_interval( i_value = '100' i_interval = '[100:200]' ) exp = abap_true ).
    cl_abap_unit_assert=>assert_equals( act = /rbgrp/interval_checker=>is_in_interval( i_value = '99'  i_interval = '[100:200]' ) exp = abap_false ).
  ENDMETHOD.

  METHOD open_left.
    cl_abap_unit_assert=>assert_equals( act = /rbgrp/interval_checker=>is_in_interval( i_value = '222' i_interval = ']100:250]' ) exp = abap_true ).
    cl_abap_unit_assert=>assert_equals( act = /rbgrp/interval_checker=>is_in_interval( i_value = '100' i_interval = ']100:250]' ) exp = abap_false ).
  ENDMETHOD.

  METHOD open_right.
    cl_abap_unit_assert=>assert_equals( act = /rbgrp/interval_checker=>is_in_interval( i_value = '150' i_interval = '[100:200[' ) exp = abap_true ).
    cl_abap_unit_assert=>assert_equals( act = /rbgrp/interval_checker=>is_in_interval( i_value = '200' i_interval = '[100:200[' ) exp = abap_false ).
  ENDMETHOD.

  METHOD both_open.
    cl_abap_unit_assert=>assert_equals( act = /rbgrp/interval_checker=>is_in_interval( i_value = '150' i_interval = ']100:200[' ) exp = abap_true ).
    cl_abap_unit_assert=>assert_equals( act = /rbgrp/interval_checker=>is_in_interval( i_value = '100' i_interval = ']100:200[' ) exp = abap_false ).
    cl_abap_unit_assert=>assert_equals( act = /rbgrp/interval_checker=>is_in_interval( i_value = '200' i_interval = ']100:200[' ) exp = abap_false ).
  ENDMETHOD.

  METHOD boundary_low.
    cl_abap_unit_assert=>assert_equals( act = /rbgrp/interval_checker=>is_in_interval( i_value = '1.5' i_interval = '[1.0:2.0]' ) exp = abap_true ).
  ENDMETHOD.

  METHOD boundary_high.
*    cl_abap_unit_assert=>assert_equals( act = /rbgrp/interval_checker=>is_in_interval( iv_Value = 'abc' iv_interval = '[aaa-bzz]' ) exp = abap_true ). " lexikalisch
  ENDMETHOD.

  METHOD numeric_vs_string.
    cl_abap_unit_assert=>assert_equals( act = /rbgrp/interval_checker=>is_in_interval( i_value = '10' i_interval = '[5:15]' ) exp = abap_true ).
  ENDMETHOD.

ENDCLASS.
