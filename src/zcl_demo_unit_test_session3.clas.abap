class ZCL_DEMO_UNIT_TEST_SESSION3 definition
  public
  final
  create public .

public section.

  methods GET_YRS_OF_SRVC
    importing
      !IV_DATEOFHIRE_CUSTOM type D
    exporting
      !EV_YRS_SRVC type DEC10_2
      !EV_MSGTEXT type STRING .
protected section.
private section.
ENDCLASS.



CLASS ZCL_DEMO_UNIT_TEST_SESSION3 IMPLEMENTATION.


  method GET_YRS_OF_SRVC.

    if iv_dateofhire_custom gt sy-datum.
      message e002(zdemo3) into ev_msgtext.
    else.
      ev_yrs_srvc = ( sy-datum - iv_dateofhire_custom ) / 365.
      ev_yrs_srvc = round( val = ev_yrs_srvc dec = 1 ).
    endif.

  endmethod.
ENDCLASS.
