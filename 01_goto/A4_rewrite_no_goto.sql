SET SERVEROUTPUT ON;

DECLARE
    v_emp_id   employees.employee_id%TYPE := 101;
    v_salary   employees.salary%TYPE;
    v_name     employees.first_name%TYPE;
BEGIN
    SELECT first_name, salary 
    INTO v_name, v_salary 
    FROM employees 
    WHERE employee_id = v_emp_id;

    -- Clean structured logic without GOTO
    IF v_salary < 2000 THEN
        DBMS_OUTPUT.PUT_LINE(v_name || ' earns ' || v_salary || ': Eligible for a 15% salary increase.');
    ELSIF v_salary BETWEEN 2000 AND 5000 THEN
        DBMS_OUTPUT.PUT_LINE(v_name || ' earns ' || v_salary || ': Eligible for a 10% performance bonus.');
    ELSE
        DBMS_OUTPUT.PUT_LINE(v_name || ' earns ' || v_salary || ': Salary meets or exceeds high tier standards.');
    END IF;

    DBMS_OUTPUT.PUT_LINE('Salary review process completed cleanly without GOTO.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: Employee ID ' || v_emp_id || ' not found.');
END;
/