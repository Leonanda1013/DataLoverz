-- CTEs

WITH CTE_example AS
(
SELECT gender, AVG(salary), MAX(salary), MIN(salary)
    FROM `employee_salary` AS sal JOIN `employee_demographics` as dem
    ON sal.employee_id = dem.employee_id
GROUP BY gender
)

SELECT * FROM CTE_example;

SELECT * FROM(
SELECT gender, AVG(salary), MAX(salary), MIN(salary)
    FROM `employee_salary` AS sal JOIN `employee_demographics` as dem
    ON sal.employee_id = dem.employee_id
GROUP BY gender
)example_subq;

-- cant call
SELECT * FROM example_subq;