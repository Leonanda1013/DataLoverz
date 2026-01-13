-- Stored Procedures

SELECT * FROM employee_salary WHERE salary >= 50000;


-- DELIMITER $$

-- CREATE PROCEDURE large_salaries()
-- BEGIN
   -- SELECT * 
    -- FROM employee_salary 
   -- WHERE salary >= 50000;
-- END $$

-- DELIMITER ;


CALL large_salaries();