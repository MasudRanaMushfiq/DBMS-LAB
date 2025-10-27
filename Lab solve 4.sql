
-- Example 04 -- 

CREATE DATABASE company;

USE company;

CREATE TABLE employee(
		employee_name VARCHAR(50) PRIMARY KEY, 
		street VARCHAR(50),
		city VARCHAR(50)
		);

CREATE TABLE company(
company_name VARCHAR(50) PRIMARY KEY, 
city VARCHAR(50)
);

CREATE TABLE works(
employee_name VARCHAR(50), 
company_name VARCHAR(50),
salary INT,
PRIMARY KEY (employee_name, company_name),
FOREIGN KEY (employee_name) REFERENCES employee(employee_name),
FOREIGN KEY (company_name) REFERENCES company(company_name)
);

CREATE TABLE manages(
employee_name VARCHAR(50) PRIMARY KEY, 
manager_name VARCHAR(50),
FOREIGN KEY (employee_name) REFERENCES employee(employee_name)
);

show tables;

INSERT INTO employee (employee_name, street, city) VALUES
('Arif', '51 Upashahar', 'Rajshahi'),
('Sumon', '52 East', 'Moynamati'),
('Sagor', 'Neemgachhi', 'Sirajgong'),
('Abdul', 'Binodpur', 'Rajshahi'),
('Himesh', 'Nazrul avenue', 'Dhaka'),
('Amirul', 'Chawk bazar', 'Sylhet'),
('Sajib', '99 North', 'Chittagong');

INSERT INTO company (company_name, city) VALUES
('Agrani', 'Rajshahi'),
('Sonali', 'Sylhet'),
('Janata', 'Dhaka');

INSERT INTO works (employee_name, company_name, salary) VALUES
('Sumon', 'Agrani', 12000),
('Abdul', 'Sonali', 13000),
('Himesh', 'Agrani', 6000),
('Amirul', 'Sonali', 20000),
('Sagor', 'Sonali', 8000),
('Arif', 'Janata', 13000),
('Sajib', 'Janata', 9000); 

INSERT INTO manages (employee_name, manager_name) VALUES
('Amirul', 'Amirul'),
('Abdul', 'Amirul'),
('Sagor', 'Amirul'),
('Sumon', 'Sumon'),
('Himesh', 'Sumon'),
('Arif', 'Arif'),
('Sajib', 'Arif');  

select * from employee;

SELECT employee_name  
FROM works  
WHERE company_name = 'Sonali';

SELECT e.employee_name, e.street, e.city
FROM employee e JOIN works w ON e.employee_name = w.employee_name
WHERE w.company_name = 'Agrani';

SELECT e.employee_name, e.street, e.city
FROM employee e
JOIN works w  
ON w.employee_name = e.employee_name
WHERE company_name = 'Sonali' and salary >= 10000;

SELECT e.employee_name  
FROM employee e
JOIN works w ON e.employee_name = w.employee_name  
JOIN company c ON w.company_name = c.company_name  
WHERE e.city = c.city;


SELECT e.employee_name
FROM employee e
JOIN manages m ON e.employee_name = m.employee_name
JOIN employee e2 ON e2.employee_name = m.manager_name
WHERE e.street = e2.street AND e.city = e2.city;

SELECT employee_name
FROM works
WHERE company_name !='Sonali';

SELECT w.employee_name
FROM works w
WHERE w.salary>
	(SELECT MAX(w.salary)
	FROM works w
	WHERE w.company_name='Janata');


SELECT employee_name
FROM works w
WHERE w.salary >(SELECT AVG(w2.salary)FROM works w2
	 WHERE w2.company_name = w.company_name
	);


SELECT company_name
FROM works
GROUP BY company_name
ORDER BY COUNT(employee_name) DESC
LIMIT 1;

SELECT company_name
FROM works
GROUP BY company_name
ORDER BY SUM(salary) ASC
LIMIT  1;


SELECT company_name
FROM works
GROUP BY company_name
HAVING AVG(salary) > (
	SELECT AVG(salary) 
    FROM works 
    WHERE company_name = 'Agrani');


UPDATE employee SET city = 'Natore'
	WHERE employee_name = 'Arif';

UPDATE works
SET salary = salary * 1.10
WHERE company_name = 'Agrani';


UPDATE works
SET salary = salary*1.1
WHERE employee_name IN(
 SELECT manager_name
 FROM (
    SELECT DISTINCT manager_name
    FROM manages
    NATURAL JOIN works
    WHERE company_name = 'Agrani')
    	AS temp_table
 );



UPDATE works  
SET salary = CASE  
        WHEN salary * 1.10 > 19000 THEN salary * 1.03  
        ELSE salary * 1.10  
END
WHERE employee_name IN 
(SELECT manager_name FROM manages);


DELETE  
FROM works  
WHERE company_name = 'Janata';

CREATE VIEW manager_avg_salary AS 
SELECT manages.manager_name, AVG(works.salary) AS avg_salary 
FROM manages 
JOIN works ON manages.employee_name = works.employee_name 
GROUP BY manages.manager_name;

UPDATE  manager_avg_salary  SET  avg_salary  =  15000  WHERE  manager_name  =  'Sumon';




