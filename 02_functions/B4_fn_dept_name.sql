CREATE OR REPLACE FUNCTION fn_dept_name(
    p_emp_id IN employees.employee_id%TYPE
) RETURN VARCHAR2 IS
    v_dept_name departments.department_name%TYPE;
BEGIN
    SELECT d.department_name
    INTO v_dept_name
    FROM employees e
    JOIN departments d ON e.department_id = d.department_id
    WHERE e.employee_id = p_emp_id;

    RETURN v_dept_name;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'Unknown Department';
END;
/