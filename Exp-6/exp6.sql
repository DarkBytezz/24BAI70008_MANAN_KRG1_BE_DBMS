CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name TEXT,
    salary NUMERIC
);

INSERT INTO employee VALUES
(1, 'simran', 25000),
(2, 'Rahul', 35000),
(3, 'Amit', 20000);


DO $$
DECLARE
    v_id INT;
    v_name TEXT;
    v_salary NUMERIC;

    emp_cursor CURSOR FOR
        SELECT emp_id, emp_name, salary FROM employee;

BEGIN
    -- Implicit-like update
    UPDATE employee
    SET salary = salary + 1000
    WHERE emp_id = 1;

    IF FOUND THEN
        RAISE NOTICE 'Row Updated';
        RAISE NOTICE 'Rows Affected: %', FOUND;
    END IF;

    OPEN emp_cursor;

    LOOP
        FETCH emp_cursor INTO v_id, v_name, v_salary;
        EXIT WHEN NOT FOUND;

        IF v_salary < 30000 THEN
            UPDATE employee
            SET salary = salary + 5000
            WHERE emp_id = v_id;
        END IF;

        RAISE NOTICE 'ID: %, Name: %, Salary: %',
                     v_id, v_name, v_salary;

    END LOOP;

    CLOSE emp_cursor;

    RAISE NOTICE 'Processing Completed';

END $$;