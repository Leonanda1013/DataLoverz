-- Temporary table

CREATE TEMPORARY TABLE temp_table(
first_name Varchar(50), last_name Varchar(50), favorit_movie Varchar(50)
);

SELECT * FROM temp_table;

INSERT INTO temp_table VALUES('vincentius','leonanda','LALALAND'),
                              ('fidel','aminnnnn','Harry Potter');
                              
SELECT * FROM temp_table;


CREATE TEMPORARY TABLE salary
SELECT * FROM `employee_salary`;

SELECT * FROM salary;