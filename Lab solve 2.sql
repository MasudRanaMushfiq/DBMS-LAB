
-- Example 02 --- 

use dbmslab;

CREATE TABLE employee (
    employee_name VARCHAR(15) primary key,
    street VARCHAR(15),
    city VARCHAR(15)
);

describe employee;

INSERT INTO employee VALUES 
('Arif', '51 upashahar', 'Rajshahi'),
('Sumon', '52 east', 'Moynamati'),
('Sagor', 'Neemgachhi', 'Sirajgong'),
('Abdul', 'Binodpur', 'Rajshahi'),
('Himesh', 'Nazrul avenue', 'Dhaka'),
('Amirul', 'Chawk bazar', 'Sylhet'),
('Sajib', '99 north', 'Chittagong');

select * from employee;

CREATE TABLE works (
    employee_name VARCHAR(50) PRIMARY KEY,
    company_name VARCHAR(100),
    salary INT
);

DESCRIBE works;

INSERT INTO works VALUES 
('Sumon', 'Agrani', 12000),
('Abdul', 'Sonali', 13000),
('Himesh', 'Agrani', 6000),
('Amirul', 'Sonali', 20000),
('Sagor', 'Sonali', 8000),
('Arif', 'Janata', 13000),
('Sajib', 'Janata', 9000);

select * from works;

SELECT employee_name FROM employee WHERE city = 'Rajshahi';
SELECT employee_name, street FROM employee WHERE city = 'Rajshahi';

SELECT employee_name FROM works WHERE company_name = 'Sonali';
SELECT employee_name FROM works WHERE company_name = 'Agrani';
SELECT employee_name FROM works WHERE company_name = 'Janata';

SELECT employee_name, salary FROM works WHERE company_name = 'Sonali';
SELECT employee_name, salary FROM works WHERE company_name = 'Agrani';
SELECT employee_name, salary FROM works WHERE company_name = 'Janata';

SELECT employee_name FROM works WHERE salary = 12000;
SELECT employee_name FROM works WHERE salary >= 12000;
SELECT employee_name FROM works WHERE salary < 12000;

SELECT employee_name, company_name FROM works WHERE salary = 12000;
SELECT employee_name, company_name FROM works WHERE salary >= 12000;
SELECT employee_name, company_name FROM works WHERE salary < 12000;

SELECT e.employee_name, e.street, e.city FROM employee e
JOIN works w ON e.employee_name = w.employee_name
WHERE w.company_name = 'Agrani';

SELECT e.employee_name, e.street, e.city FROM employee e
JOIN works w ON e.employee_name = w.employee_name
WHERE w.salary >= 10000;

SELECT e.employee_name, w.company_name, w.salary FROM employee e
JOIN works w ON e.employee_name = w.employee_name
WHERE e.city = 'Rajshahi';

SELECT e.employee_name, e.street, e.city, w.company_name FROM employee e
JOIN works w ON e.employee_name = w.employee_name
WHERE w.salary >= 10000;

SELECT e.employee_name, e.street, e.city FROM employee e
JOIN works w ON e.employee_name = w.employee_name
WHERE w.company_name = 'Sonali' AND w.salary > 12000;

SELECT e.employee_name FROM employee e
JOIN works w ON e.employee_name = w.employee_name
WHERE w.company_name != 'Sonali';

UPDATE employee SET city = 'Natore' WHERE employee_name = 'Arif';

select * from employee;
SELECT * FROM WORKS;
SET SQL_SAFE_UPDATES = 0;

UPDATE works SET salary = salary * 1.10 WHERE company_name = 'Agrani';

DELETE FROM employee WHERE employee_name = 'Sagor';

 describe address;
 select * from address;
 
 