SELECT * FROM `employee_demographics`;

SELECT first_name,
CASE
	WHEN age >= 40 THEN 'Old' 
    ELSE 'young'
    END
FROM `employee_demographics`;