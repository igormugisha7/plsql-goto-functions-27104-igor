SET SERVEROUTPUT ON;

DECLARE
    v_number NUMBER := -15; -- Change this value to test positive, negative, or zero
BEGIN
    IF v_number > 0 THEN
        GOTO positive;
    ELSIF v_number < 0 THEN
        GOTO negative;
    ELSE
        GOTO zero;
    END IF;

    <<positive>>
    DBMS_OUTPUT.PUT_LINE('Number ' || v_number || ' is POSITIVE.');
    GOTO end_label;

    <<negative>>
    DBMS_OUTPUT.PUT_LINE('Number ' || v_number || ' is NEGATIVE.');
    GOTO end_label;

    <<zero>>
    DBMS_OUTPUT.PUT_LINE('Number is ZERO.');
    GOTO end_label;

    <<end_label>>
    DBMS_OUTPUT.PUT_LINE('Classification complete.');
END;
/