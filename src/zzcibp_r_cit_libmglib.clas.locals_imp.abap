CLASS LHC_ZZCIR_CIT_LIBMGLIB DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS:
      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
          REQUEST requested_authorizations FOR ZCitLibmg
        RESULT result,
      validate_category FOR VALIDATE ON SAVE
            IMPORTING keys FOR ZCitLibmg~validate_category.


ENDCLASS.

CLASS LHC_ZZCIR_CIT_LIBMGLIB IMPLEMENTATION.
  METHOD GET_GLOBAL_AUTHORIZATIONS.
  ENDMETHOD.
  METHOD validate_category.
  READ ENTITIES OF ZZCIR_CIT_LIBMGLIB
    IN LOCAL MODE
    ENTITY ZCitLibmg
    ALL FIELDS
    WITH CORRESPONDING #( keys )
    RESULT DATA(lt_books).

  LOOP AT lt_books INTO DATA(ls_book).

    IF ls_book-Category IS NOT INITIAL AND
   ls_book-Category <> 'F' AND
   ls_book-Category <> 'N' AND
   ls_book-Category <> 'S'.

      APPEND VALUE #(
        %tky = ls_book-%tky
        %msg = new_message_with_text(
                 severity = if_abap_behv_message=>severity-error
                 text     = 'Category must be F, N, or S' ) )
        TO reported-ZCitLibmg.

    ENDIF.

  ENDLOOP.
  ENDMETHOD.

ENDCLASS.
