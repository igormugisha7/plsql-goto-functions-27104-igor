CREATE OR REPLACE FUNCTION fn_validate_payroll(
    p_emp_id IN employees.employee_id%TYPE
) RETURN VARCHAR2 IS
    v_salary employees.salary%TYPE;
BEGIN
    SELECT salary INTO v_salary
    FROM employees
    WHERE employee_id = p_emp_id;

    IF v_salary IS NULL OR v_salary < 1000 THEN
        RETURN 'INVALID: Salary is below threshold or null';
    ELSE
        RETURN 'VALID: Salary is compliant';
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'INVALID: Employee does not exist';
END;
/