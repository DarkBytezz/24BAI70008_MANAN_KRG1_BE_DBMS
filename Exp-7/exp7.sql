-- Create Tables
CREATE TABLE department (
    dept_id INT,
    dept_name VARCHAR(50)
);

CREATE TABLE employee (
    emp_id INT,
    emp_name VARCHAR(50),
    salary INT,
    dept_id INT
);

-- Insert Data
INSERT INTO department VALUES (1, 'HR'), (2, 'IT');

INSERT INTO employee VALUES 
(1, 'Simon', 30000, 1),
(2, 'Alex', 50000, 2),
(3, 'John', 25000, 1);

-- Simple View
CREATE VIEW simple_view AS
SELECT emp_id, emp_name, salary FROM employee;

-- Complex View (Join + Aggregation)
CREATE VIEW complex_view AS
SELECT d.dept_name, AVG(e.salary) AS avg_salary
FROM employee e
JOIN department d ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

-- Materialized View (PostgreSQL)
CREATE MATERIALIZED VIEW mat_view AS
SELECT d.dept_name, AVG(e.salary) AS avg_salary
FROM employee e
JOIN department d ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

-- Performance Check
EXPLAIN ANALYZE SELECT * FROM simple_view;
EXPLAIN ANALYZE SELECT * FROM complex_view;
EXPLAIN ANALYZE SELECT * FROM mat_view;