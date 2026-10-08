-- =====================================================================
-- 00_setup/create_tables.sql
-- Creates and populates the tables used by every other script.
-- Run this FIRST.
-- =====================================================================
SET SERVEROUTPUT ON

-- Clean re-run support: drop old tables if they exist (ignore errors)
BEGIN EXECUTE IMMEDIATE 'DROP TABLE employees CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE departments CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/

CREATE TABLE departments (
    dept_id    NUMBER(4)    PRIMARY KEY,
    dept_name  VARCHAR2(50) NOT NULL
);

CREATE TABLE employees (
    emp_id         NUMBER(6)    PRIMARY KEY,
    first_name     VARCHAR2(30) NOT NULL,
    last_name      VARCHAR2(30) NOT NULL,
    dept_id        NUMBER(4)    REFERENCES departments (dept_id),  -- nullable on purpose (test data)
    hire_date      DATE         NOT NULL,
    monthly_salary NUMBER(12,2) NOT NULL CHECK (monthly_salary >= 0)
);

INSERT INTO departments VALUES (10, 'Sales');
INSERT INTO departments VALUES (20, 'Finance');
INSERT INTO departments VALUES (30, 'IT');
INSERT INTO departments VALUES (40, 'Human Resources');

-- Normal employees
INSERT INTO employees VALUES (1, 'Alice',  'Uwase',       10, DATE '2018-03-01',   450000);
INSERT INTO employees VALUES (2, 'Jean',   'Habimana',    20, DATE '2020-07-15',   850000);
INSERT INTO employees VALUES (3, 'Grace',  'Mukamana',    30, DATE '2015-01-10',  1200000);
INSERT INTO employees VALUES (4, 'Eric',   'Niyonzima',   30, DATE '2025-09-01',   300000);
INSERT INTO employees VALUES (5, 'Claire', 'Ishimwe',     40, DATE '2022-05-20',    55000);
INSERT INTO employees VALUES (6, 'Paul',   'Nsengimana',  10, DATE '2019-11-30',   150000);
-- Edge cases used to test the payroll validator (C1)
INSERT INTO employees VALUES (7, 'David',   'Kamanzi',  NULL, DATE '2021-02-01',   200000); -- no department
INSERT INTO employees VALUES (8, 'Sandrine','Teta',       20, DATE '2021-06-01',        0); -- zero salary
INSERT INTO employees VALUES (9, 'Future',  'Hire',       10, DATE '2027-01-15',   250000); -- hire date in future

COMMIT;

SELECT * FROM departments ORDER BY dept_id;
SELECT * FROM employees   ORDER BY emp_id;
