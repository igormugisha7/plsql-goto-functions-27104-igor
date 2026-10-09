SET SERVEROUTPUT ON;

DECLARE
    v_emp_id   employees.employee_id%TYPE := 101;
    v_salary   employees.salary%TYPE;
    v_name     employees.first_name%TYPE;
BEGIN
    -- Fetch employee salary
    SELECT first_name, salary 
    INTO v_name, v_salary 
    FROM employees 
    WHERE employee_id = v_emp_id;

    IF v_salary < 2000 THEN
        GOTO low_salary;
    ELSIF v_salary BETWEEN 2000 AND 5000 THEN
        GOTO medium_salary;
    ELSE
        GOTO high_salary;
    END IF;

    <<low_salary>>
    DBMS_OUTPUT.PUT_LINE(v_name || ' earns ' || v_salary || ': Eligible for a 15% salary increase.');
    GOTO finish;

    <<medium_salary>>
    DBMS_OUTPUT.PUT_LINE(v_name || ' earns ' || v_salary || ': Eligible for a 10% performance bonus.');
    GOTO finish;

    <<high_salary>>
    DBMS_OUTPUT.PUT_LINE(v_name || ' earns ' || v_salary || ': Salary meets or exceeds high tier standards.');
    GOTO finish;

    <<finish>>
    DBMS_OUTPUT.PUT_LINE('Salary review process completed.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: Employee ID ' || v_emp_id || ' not found.');
END;
/