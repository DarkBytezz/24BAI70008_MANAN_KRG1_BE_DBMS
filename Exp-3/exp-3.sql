CREATE TABLE employee (
    emp_id INTEGER PRIMARY KEY,
    emp_name VARCHAR(50),
    emp_salary NUMERIC
);
INSERT INTO employee VALUES (101, 'Manan Verma', 55000);


DO $$
DECLARE
    v_emp_id INTEGER;
    v_emp_name VARCHAR(50);
    v_emp_salary NUMERIC;
BEGIN

    SELECT emp_id, emp_name, emp_salary
    INTO v_emp_id, v_emp_name, v_emp_salary
    FROM employee
    WHERE emp_id = 101;

 
    RAISE NOTICE 'Employee ID     : %', v_emp_id;
    RAISE NOTICE 'Employee Name   : %', v_emp_name;
    RAISE NOTICE 'Employee Salary : %', v_emp_salary;
END $$;

