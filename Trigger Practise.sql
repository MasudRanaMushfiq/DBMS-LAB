-- Drop tables if they already exist (for testing)
DROP TABLE IF EXISTS Apply;
DROP TABLE IF EXISTS Student;

-- Create Student table
CREATE TABLE Student (
    studentId INT PRIMARY KEY,
    studentName VARCHAR(50),
    GPA DECIMAL(3,2)
);

-- Create Apply table
CREATE TABLE Apply (
    applyId INT AUTO_INCREMENT PRIMARY KEY,
    studentId INT,
    hallId VARCHAR(2),
    hallName VARCHAR(50),
    applyDate DATETIME,
    FOREIGN KEY (studentId) REFERENCES Student(studentId)
);


INSERT INTO Student(studentId, studentName, GPA) VALUES
(101, 'Rahim', 3.95),
(102, 'Karim', 3.82),
(103, 'Mina', 3.65),
(104, 'Rafi', 3.45),
(105, 'Saba', 3.25),
(106, 'Nabila', 3.15),
(107, 'Tariq', 3.05); -- This one should not trigger


DELIMITER $$

CREATE TRIGGER trg_after_student_insert
AFTER INSERT ON Student
FOR EACH ROW
BEGIN
    IF NEW.GPA > 3.9 THEN
        INSERT INTO Apply(studentId, hallId, hallName, applyDate)
        VALUES (NEW.studentId, '01', 'BB', NOW());
    ELSEIF NEW.GPA > 3.7 THEN
        INSERT INTO Apply(studentId, hallId, hallName, applyDate)
        VALUES (NEW.studentId, '02', 'ZR', NOW());
    ELSEIF NEW.GPA > 3.5 THEN
        INSERT INTO Apply(studentId, hallId, hallName, applyDate)
        VALUES (NEW.studentId, '03', 'MB', NOW());
    ELSEIF NEW.GPA > 3.3 THEN
        INSERT INTO Apply(studentId, hallId, hallName, applyDate)
        VALUES (NEW.studentId, '04', 'SJ', NOW());
    ELSEIF NEW.GPA > 3.1 THEN
        INSERT INTO Apply(studentId, hallId, hallName, applyDate)
        VALUES (NEW.studentId, '05', 'FH', NOW());
    END IF;
END$$

DELIMITER ;

-- Insert a new student
INSERT INTO Student(studentId, studentName, GPA) VALUES (108, 'Ayesha', 3.88);

-- Check Apply table
SELECT * FROM Apply;
SELECT * FROM Student;



