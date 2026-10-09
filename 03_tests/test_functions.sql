SET SERVEROUTPUT ON;

DECLARE
    v_emp_id NUMBER := 101;
BEGIN
    DBMS_OUTPUT.PUT_LINE('--- TESTING PL/SQL FUNCTIONS ---');
    DBMS_OUTPUT.PUT_LINE('Annual Salary: $' || fn_annual_salary(v_emp_id));
    DBMS_OUTPUT.PUT_LINE('Years of Service: ' || fn_years_of_service(v_emp_id) || ' years');
    DBMS_OUTPUT.PUT_LINE('Department Name: ' || fn_dept_name(v_emp_id));
    DBMS_OUTPUT.PUT_LINE('Tax for $50000: $' || fn_calculate_tax(50000));
END;
/