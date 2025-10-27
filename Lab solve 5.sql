CREATE DATABASE LIBRARY;
USE LIBRARY;
show databases;

-- Example 05 -- 

CREATE TABLE Publisher (
    Name VARCHAR(100) PRIMARY KEY,
    Address VARCHAR(200),
    Phone VARCHAR(15)
);

CREATE TABLE Book (
    BookId VARCHAR(50) PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    PublisherName VARCHAR(100) NOT NULL,
    FOREIGN KEY (PublisherName) REFERENCES Publisher(Name)
);

CREATE TABLE Book_Author (
    BookId VARCHAR(50),
    AuthorName VARCHAR(100),
    PRIMARY KEY (BookId, AuthorName),
    FOREIGN KEY (BookId) REFERENCES Book(BookId)
);

CREATE TABLE Library_Branch (
    BranchId INT PRIMARY KEY,
    BranchName VARCHAR(100),
    Address VARCHAR(200)
);

CREATE TABLE Borrower (
    CardNo INT PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(200),
    Phone VARCHAR(15)
);

CREATE TABLE Book_Copies (
    BookId VARCHAR(50),
    BranchId INT,
    No_Of_Copies INT,
    PRIMARY KEY (BookId, BranchId),
    FOREIGN KEY (BookId) REFERENCES Book(BookId),
    FOREIGN KEY (BranchId) REFERENCES Library_Branch(BranchId)
);

CREATE TABLE Book_Loan (
    BookId VARCHAR(50),
    BranchId INT,
    CardNo INT,
    DateOut DATE,
    DueDate DATE,
    PRIMARY KEY (BookId, BranchId, CardNo),
    FOREIGN KEY (BookId) REFERENCES Book(BookId),
    FOREIGN KEY (BranchId) REFERENCES Library_Branch(BranchId),
    FOREIGN KEY (CardNo) REFERENCES Borrower(CardNo)
);

INSERT INTO Publisher (Name, Address, Phone)VALUES
    ('PHI', '20 Delhi Super Market', '01715-454678'),
    ('Tata', 'North Kolkata', '0156-2345445'),
    ('Galgotia', 'Mumbai', '0192-203490');

INSERT INTO Book (BookId, Title, PublisherName)VALUES
    ('100.001cn', 'Computer Network', 'PHI'),
    ('100.002dsc', 'Database System', 'Tata'),
    ('100.003ds', 'Digital System', 'PHI'),
    ('100.004db', 'DBMS', 'PHI'),
    ('100.005ora', 'Oracle 2000', 'Galgotia');
    
INSERT INTO Book_Author (BookId, AuthorName)VALUES
    ('100.001cn', 'A S Tanenbaum'),
    ('100.002dsc', 'Silberschatz'),
    ('100.003ds', 'Ronald J Tocci'),
    ('100.004db', 'Ivan Bayross'),
    ('100.005ora', 'Ivan Bayross');

INSERT INTO Library_Branch (BranchId, BranchName, Address)VALUES
    (1001, 'CSE Seminar Library', 'Rajshahi'),
    (1002, 'RU Central Library', 'Rajshahi'),
    (1003, 'DU Central Library', 'Dhaka');

INSERT INTO Book_Copies (BookId, BranchId, No_Of_Copies)VALUES
    ('100.001cn', 1001, 2),
    ('100.001cn', 1002, 5),
    ('100.002dsc', 1001, 3),
    ('100.002dsc', 1002, 4),
    ('100.003ds', 1001, 3),
    ('100.003ds', 1003, 5),
    ('100.004db', 1001, 2),
    ('100.004db', 1002, 5),
    ('100.005ora', 1001, 2),
    ('100.005ora', 1002, 7);


INSERT INTO Borrower (CardNo, Name, Address, Phone)VALUES
    (10001, 'Saidur', 'CSE', '01714-400567'),
    (10002, 'Rafiq', 'PHYSICS', '0194-300456'),
    (10003, 'Masud', 'CSE', '0156-345678'),
    (10004, 'Nobir', 'ICT', '01199-203456');

INSERT INTO Book_Loan (BookId, BranchId, CardNo, DateOut, DueDate)VALUES
    ('100.001cn', 1001, 10001, '2015-01-15', '2015-02-15'),
    ('100.001cn', 1002, 10002, '2015-01-25', '2015-02-25'),
    ('100.002dsc', 1001, 10003, '2015-02-20', '2015-03-20'),
    ('100.002dsc', 1002, 10004, '2015-03-15', '2015-04-15'),
    ('100.003ds', 1001, 10001, '2015-06-07', '2015-07-07'),
    ('100.003ds', 1003, 10002, '2015-10-15', '2015-11-15'),
    ('100.004db', 1001, 10003, '2015-10-25', '2015-11-25'),
    ('100.004db', 1002, 10004, '2015-11-15', '2015-12-15'),
    ('100.005ora', 1001, 10003, '2015-12-22', '2016-01-22'),
    ('100.005ora', 1002, 10001, '2015-12-25', '2016-01-25');

-- Question: 01 --

SELECT SUM(bc.no_of_Copies)
FROM book_copies AS bc
NATURAL JOIN book as b
NATURAL JOIN library_branch as lb
WHERE lb.BranchName='CSE Seminar Library' AND b.Title='DBMS';

SELECT lb.BranchName,b.Title,bc.no_of_Copies
FROM book_copies AS bc
NATURAL JOIN book as b
NATURAL JOIN library_branch as lb
WHERE b.Title='DBMS';

SELECT Name
FROM Borrower
WHERE CardNo NOT IN (SELECT CardNo FROM Book_Loan);	

SELECT b.title, br.Name,br.Address,br.Phone
FROM Borrower as br
JOIN book_loan as bl ON br.CardNo=bl.CardNo
JOIN library_branch as lb ON lb.BranchId=bl.BranchId
JOIN book as b ON b.BookId=bl.BookId
WHERE lb.BranchName='CSE Seminar Library' AND bl.DueDate='2015-02-15';

-- Questions: 05 --

SELECT lb.branchname, sum(bc.no_of_copies)
FROM library_branch as lb
NATURAL JOIN book_copies as bc
GROUP BY lb.branchName;

SELECT br.Name, br.Address, br.Phone
FROM borrower as br
NATURAL JOIN book_loan as bl
GROUP BY bl.CardNo
HAVING COUNT(bl.CardNo)>2;

SELECT b.Title , SUM(bc.no_of_copies)
FROM Book as b
JOIN book_author as ba ON b.BookId = ba.BookId
JOIN book_copies as bc ON bc.BookId = ba.BookId
JOIN library_branch as lb ON bc.BranchId = lb.BranchId
WHERE ba.AuthorName = 'Ivan Bayross' AND lb.BranchName = 'RU Central Library'
GROUP BY bc.BookId;






