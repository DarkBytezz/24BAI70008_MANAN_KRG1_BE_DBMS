-- Create Table
CREATE TABLE Employee (
    emp_id INT,
    emp_name VARCHAR(50),
    salary INT
);

INSERT INTO Employee VALUES (1, 'Manan', 25000);
INSERT INTO Employee VALUES (2, 'Rohan', 30001);
INSERT INTO Employee VALUES (3, 'Prakhar', 40000);
INSERT INTO Employee VALUES (4, 'Shanaya', 35005);

SELECT *
FROM Employee
WHERE MOD(salary,2) = 0;

SELECT *
FROM Employee
WHERE MOD(salary,2) = 1;