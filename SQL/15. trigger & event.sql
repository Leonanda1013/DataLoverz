-- trigger

SELECT * FROM `employee_salary`;

SELECT * FROM `employee_demographics`;


DELIMITER $$
CREATE TRIGGER employee_insert
	AFTER INSERT employee_salary
    for EACH ROW
BEGIN
	INSERT INTO employee_salary(employee_id, first_name, last_name)
    VALUES(NEW.employee_id, NEW.first_name, NEW.last_name);
END $$
DELIMITER ;

INSERT INTO employee_salary(employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES(13, 'Vincentius', 'Fidelac', 'Married couple', '1000000', null); 


SELECT * FROM `employee_salary`;

SELECT * FROM `employee_demographics`;


-- event
DELIMITER $$
CREATE EVENT delete_retirees
ON SCHEDULE EVERY 30 SECOND
DO
BEGIN
	DELETE FROM `employee_demographics` WHERE age>=60;
END $$
DELIMITER ;


SELECT * FROM `employee_demographics`;