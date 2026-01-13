-- window function
SELECT * FROM employee_salary;
SELECT * FROM employee_demographics;

SELECT dem.first_name, dem.gender, AVG(sal.salary) OVER(PARTITION BY gender) FROM employee_salary as sal JOIN employee_demographics as dem ON dem.employee_id = sal.employee_id;

-- SELECT dem.gender, dem.first_name,  AVG(sal.salary) FROM employee_salary as sal JOIN employee_demographics as dem ON dem.employee_id = sal.employee_id
-- GROUP BY dem.gender;
