-- UNION

SELECT first_name, last_name, 'Rich' as label FROM employee_salary WHERE salary > 50000
UNION
SELECT first_name, last_name, 'Old Man' as label FROM employee_demographics WHERE age > 40 AND gender = 'Male'
UNION
SELECT first_name, last_name, 'Old Lady' as label FROM employee_demographics WHERE age > 40 AND gender = 'Female';
