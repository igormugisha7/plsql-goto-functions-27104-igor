SET SERVEROUTPUT ON;

/* 
--------------------------------------------------------------------------------
ILLEGAL GOTO DEMONSTRATION (COMMENTED OUT TO ALLOW COMPILATION):
--------------------------------------------------------------------------------
DECLARE
    v_flag BOOLEAN := TRUE;
BEGIN
    GOTO inside_if; -- ILLEGAL: Cannot jump into an IF statement block from outside!

    IF v_flag THEN
        <<inside_if>>
        DBMS_OUTPUT.PUT_LINE('Inside IF block');
    END IF;
END;
/
Error: PLS-00375: illegal GOTO statement; this GOTO statement branches into an IF statement
--------------------------------------------------------------------------------
*/

-- VALID FIX: Branch to a label outside or structure logic properly without illegal jumps
DECLARE
    v_flag BOOLEAN := TRUE;
BEGIN
    IF v_flag THEN
        GOTO valid_target;
    END IF;

    DBMS_OUTPUT.PUT_LINE('This line is skipped if v_flag is TRUE.');

    <<valid_target>>
    DBMS_OUTPUT.PUT_LINE('Successfully jumped to a valid label in the same or enclosing scope.');
END;
/