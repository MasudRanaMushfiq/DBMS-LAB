create database dbmslab;
use dbmslab;

-- Example 01 --

CREATE TABLE student (
    roll VARCHAR(10) PRIMARY KEY,
    name VARCHAR(10),
    dept VARCHAR(5),
    year VARCHAR(5),
    semester VARCHAR(10)
);

INSERT INTO student VALUES 
('06543201', 'Rahim', 'BBA', '2nd', '1st'),
('06543202', 'Karim', 'ICE', '2nd', '1st'),
('06543203', 'Motin', 'CSE', '1st', '2nd'),
('05654456', 'Swadhin', 'CSE', '1st', '2nd'),
('05654457', 'Hena', 'BBA', '4th', '2nd'),
('05654458', 'Sohag', 'CSE', '3rd', '1st');

use dbmslab;
select * from accident;

CREATE TABLE studentInfo (
    roll VARCHAR(10) PRIMARY KEY,
    name VARCHAR(10),
    fatherName VARCHAR(10),
    address VARCHAR(10),
    mobile VARCHAR(11)
);

INSERT INTO studentInfo VALUES 
('06543201', 'Rahim', 'Ataur', 'Rajshahi', '01719201233'),
('06543202', 'Karim', 'Tareq', 'Dhaka', '01719202020'),
('06543203', 'Motin', 'Rahman', 'Khulna', '01719202678'),
('05654456', 'Swadhin', 'Fazlu', 'Rajshahi', '01719204564'),
('05654457', 'Hena', 'Rahman', 'Rajshahi', '01119212020'),
('05654458', 'Sohag', 'Fazlul', 'Natore', '01719202222');

select * from studentinfo;

SELECT name FROM student WHERE semester = '1st';
SELECT name FROM student WHERE year = '2nd';
SELECT name FROM student WHERE dept = 'CSE';
SELECT name FROM student WHERE roll = '06543201';


SELECT name, address, mobile FROM studentInfo WHERE fatherName = 'Rahman';
SELECT name, address, mobile FROM studentInfo WHERE mobile = '01719202020';
SELECT name, address, mobile FROM studentInfo WHERE address = 'Rajshahi';
SELECT name, address, mobile FROM studentInfo WHERE address = 'Rajshahi' AND fatherName = 'Rahman';
SELECT name, address, mobile FROM studentInfo WHERE roll = '05654456';


