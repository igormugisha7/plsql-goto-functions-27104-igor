CREATE OR REPLACE FUNCTION fn_calculate_tax(
    p_annual_salary IN Number
)RETURN NUMBER IS
BEGIN
   IF p_annual_salary < 30000 THEN
      RETURN p_annual_salary * 0.05;
   ELSIF p_annual_salary BETWEEN 30000 AND 60000 THEN
      RETURN p_annual_salary * 0.10;
   ELSE
      RETURN p_annual_salary * 0.15;
    END IF;
   END;
   /        