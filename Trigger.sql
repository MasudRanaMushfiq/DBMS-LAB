create database TriggerLab;
use TriggerLab;

create table account(
		id int primary key,
		name VARCHAR(15),
        cgpa int
		);

insert into account values 
		(11, 'Aftab', 3.1),
        (12, 'Mahim', 2.2);

create table student(
		name varchar(15)
        );

DELIMITER //

CREATE TRIGGER insert_trigger
BEFORE INSERT ON account
FOR EACH ROW
BEGIN
    DECLARE vUser VARCHAR(20);

    SELECT USER() INTO vUser;

    INSERT INTO student (name)
    VALUES (vUser);
END;
// 
DELIMITER ;

select * from student;
select * from account;
DROP TRIGGER before_insert;
drop table student;



DELIMITER //

CREATE TRIGGER before_insert
BEFORE INSERT ON account
FOR EACH ROW
BEGIN

    INSERT INTO student (name)
    VALUES (NEW.name);
END;
//

DELIMITER ;








