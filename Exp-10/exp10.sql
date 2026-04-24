CREATE SEQUENCE emp_seq
START 1;

CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    salary NUMERIC(10,2)
);

CREATE OR REPLACE FUNCTION assign_emp_id()
RETURNS TRIGGER AS $$
BEGIN
    
    IF NEW.emp_id IS NULL THEN
        NEW.emp_id := nextval('emp_seq');
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER before_insert_emp
BEFORE INSERT ON employee
FOR EACH ROW
EXECUTE FUNCTION assign_emp_id();

INSERT INTO employee (emp_name, dept_id, salary) VALUES
('A', 101, 1000),
('B', 102, 2000),
('C', 101, 2000),
('D', 102, 3000);

SELECT * FROM employee;