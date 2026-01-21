CREATE TABLE employee (
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    joining_date DATE
);

INSERT INTO employee VALUES
(1, 'Amit', 'HR', 25000, '2022-01-10'),
(2, 'Neha', 'HR', 32000, '2021-03-15'),
(3, 'Rahul', 'IT', 40000, '2020-06-20'),
(4, 'Sneha', 'IT', 28000, '2022-08-05'),
(5, 'Arjun', 'Finance', 35000, '2019-11-12'),
(6, 'Pooja', 'Finance', 18000, '2023-02-18');


SELECT department, AVG(salary) AS average_salary
FROM employee
WHERE salary > 20000
GROUP BY department
HAVING AVG(salary) > 30000
ORDER BY average_salary DESC;
