CREATE OR REPLACE FUNCTION fn_annual_salary(
    p_emp_id IN employee.employee_id%TYPE
)RETURN NUMBER IS
   v_salary employee.salary%TYPE;
BEGIN
     SELECT salary INTO v_salary
     FROM Employee
     WHERE employee_id=p_emp_id;

     RETURN v_salary * 12;
     EXCEPTION
      WHEN NO_DATA_FOUND THEN
      RETURN 0;

 END;
 /     
