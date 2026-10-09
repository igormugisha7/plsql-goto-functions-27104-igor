SET SERVEROUTPUT ON;

BEGIN
    DBMS_OUTPUT.PUT_LINE('--- TESTING PAYROLL VALIDATION ---');
    DBMS_OUTPUT.PUT_LINE('Emp 101 Status: ' || fn_validate_payroll(101));
    DBMS_OUTPUT.PUT_LINE('Emp 103 Status: ' || fn_validate_payroll(103));
    DBMS_OUTPUT.PUT_LINE('Emp 999 Status: ' || fn_validate_payroll(999));
END;
/