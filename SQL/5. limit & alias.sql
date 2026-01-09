SHOW TABLES;

-- SELECT * FROM `employee_demographics`;
-- SELECT gender FROM `employee_demographics` GROUP BY gender;
-- SELECT gender, AVG(age), COUNT(age) FROM `employee_demographics` GROUP BY gender;

-- SELECT gender, AVG(age), COUNT(age) FROM `employee_demographics` GROUP BY gender HAVING AVG(age)>40;

SELECT occupation, AVG(salary) AS avg_salary FROM `employee_salary`GROUP BY occupation HAVING avg_salary>50000 && occupation LIKE 'D%';

SELECT occupation, AVG(salary) AS avg_salary FROM `employee_salary`GROUP BY occupation limit 4;
