SET SERVEROUTPUT ON;

-- Test B1, B2, B3, and B4 inside SQL SELECT queries
SELECT 
    employee_id,
    first_name || ' ' || last_name AS full_name,
    salary AS monthly_salary,
    fn_annual_salary(employee_id) AS annual_salary,
    fn_years_of_service(employee_id) AS years_of_service,
    fn_calculate_tax(fn_annual_salary(employee_id)) AS tax_amount,
    fn_dept_name(employee_id) AS department_name
FROM employees;