-- String Function

SELECT * FROM `parks_departments`;

SELECT department_name , LENGTH(department_name)
FROM `parks_departments`
ORDER BY 2;

-- Upper Case

SELECT UPPER(department_name) , LENGTH(department_name)
FROM `parks_departments`
ORDER BY 2;

-- Replace
SELECT department_name,REPLACE(department_name, 'a','z') FROM `parks_departments`;

-- concat

SELECT first_name, last_name, CONCAT(first_name,' ',last_name) FROM `employee_demographics`;