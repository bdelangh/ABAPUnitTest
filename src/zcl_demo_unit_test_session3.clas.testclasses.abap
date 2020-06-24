*"* use this source file for your ABAP unit test classes
class ltc_demo_unit_test_session3 DEFINITION for TESTING risk level harmless duration short.

  PUBLIC SECTION.
    methods _01_get_yrs_of_srvc_success FOR TESTING.
    METHODS _02_get_yrs_of_srvc_fail    for TESTING.

  PRIVATE SECTION.

    class-methods: class_setup.
    class-methods: class_teardown.

    methods setup.
    METHODS teardown.

    data: mo_cut type REF TO zcl_demo_unit_test_session3.
  endclass.

* Implementation
class ltc_demo_unit_test_session3 IMPLEMENTATION.
  method class_setup.
  ENDMETHOD.

  method setup.
    mo_cut = new #( ).
  endmethod.

  method teardown.
    clear mo_cut.
  endmethod.

  method class_teardown.
  endmethod.

  method _01_get_yrs_of_srvc_success.
    "Given
    data: lv_dateofhire type D value '20000101',
          lv_yrs_srvc   type dec10_2,
          lv_msgtext    type string.

    "When
    mo_cut->get_yrs_of_srvc(
      exporting
        iv_dateofhire_custom = lv_dateofhire
      importing
        ev_yrs_srvc          = lv_yrs_srvc
        ev_msgtext           = lv_msgtext
    ).

    "Then
    cl_abap_unit_assert=>assert_equals(
      exporting
        act                  = lv_yrs_srvc
        exp                  = round( val = ( sy-datum - lv_dateofhire + 1000000 ) / 365 dec = 1 )
    ).
  endmethod.

  method _02_get_yrs_of_srvc_fail.
    "Given
    data: lv_dateofhire type D value '20500101',
          lv_yrs_srvc   type dec10_2,
          lv_msgtext    type string.

    "When
    mo_cut->get_yrs_of_srvc(
      exporting
        iv_dateofhire_custom = lv_dateofhire
      importing
        ev_yrs_srvc          = lv_yrs_srvc
        ev_msgtext           = lv_msgtext
    ).

    "Then
    cl_abap_unit_assert=>assert_equals(
      exporting
        act                  = lv_msgtext
        exp                  = 'Hiring date is in the future'
    ).
  endmethod.

endclass.
