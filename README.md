
#### MySQL Commands with Descriptions


#### 1. Database Commands

```sql
CREATE DATABASE dbname;    -- Creates a new database named 'dbname'.

SHOW DATABASES;    -- Show lists of all available databases here.

USE dbname;    -- Selects 'dbname' as the current working database.

DROP DATABASE dbname;    -- Deletes the database named 'dbname'.
```


#### 2. Table Commands

```sql
CREATE TABLE tablename (col1 datatype, col2 datatype, ...);    
-- Creates a new table named tablename with specified columns with their datatype.

SHOW TABLES;    -- Displays all tables in the current database.

DESCRIBE tablename;    -- Shows structure or schema of the table tablename.

DROP TABLE tablename;    -- Deletes the tablename table permanently.

RENAME TABLE oldname TO newname;    -- Renames  oldtable name to newtable name.
```


#### 3. Alter Table(Alternate or Change)

```sql
ALTER TABLE tablename ADD COLUMN column_name datatype;    -- Adds the new column to the table.

ALTER TABLE tablename DROP COLUMN column_name;    -- Removes the existing column from the table.

ALTER TABLE tablename MODIFY COLUMN column_name new_datatype;    -- Changes the datatype of a existing column.

ALTER TABLE tablename CHANGE COLUMN old_name new_name datatype;    -- Renames the column name and changes datatype of the column.
```


#### 4. Insert, Update, Delete

```sql
INSERT INTO tablename (col1, col2) VALUES ('val1', 'val2'), ('VAL3', 'VAL4');    
-- Inserts a new row into the table. You can add multiple values at a time separating them using comma.

UPDATE tablename SET col1 = val1 WHERE condition;    -- Updates existing data in the table. 

DELETE FROM tablename WHERE condition;    -- Deletes data from the table
```


#### 5. Select Queries

```sql
SELECT * FROM tablename;    -- Selects all columns from the table

SELECT col1, col2 FROM tablename;    -- Selects specific columns from the table

SELECT * FROM tablename WHERE condition;    -- Selects rows matching a condition

SELECT * FROM tablename ORDER BY col1 ASC;    -- Sorts result by a column ascending order.

SELECT * FROM tablename ORDER BY col1 DESC;    -- Sorts result by a column in descending order.

SELECT * FROM tablename LIMIT n;    -- Show first n number of rows.
```


#### 6. Constraints

```sql
PRIMARY KEY    -- Defines a column as the primary key.

UNIQUE    -- Ensures all values in the column are unique.

FOREIGN KEY (column) REFERENCES othertable(column);    -- Sets a foreign key reference from column of current table with column of other table.

NOT NULL    -- Prevents NULL values in a column.

DEFAULT default_value;    -- Sets a default value for a column if NULL.
```


#### 7. Indexes

```sql
CREATE INDEX index_name ON tablename (column);    -- Creates an index on a column

DROP INDEX index_name ON tablename;    -- Deletes an index from a column
```


#### 8. Safe Mode and Settings

```sql
SET SQL_SAFE_UPDATES = 0;    -- Disables safe update mode

SET SQL_SAFE_UPDATES = 1;    -- Enables safe update mode
```


#### 9. Miscellaneous

```sql
SHOW COLUMNS FROM tablename;    -- Displays column details of a table

SHOW INDEX FROM tablename;    -- Shows indexes of a table

SHOW CREATE TABLE tablename;    -- Displays the TABLE creation SQL command

EXPLAIN SELECT * FROM tablename;    -- Shows how MySQL executes a SELECT query
```



#### Aggregate Function: 
That take multiple row of data and return a single summarized value.


**Count Function:**
```sql
SELECT COUNT(*) AS X From table1 WHERE name  = "Nazim";
SELECT COUNT(First_Name) AS X From table1 Where name  = "Nazim";

SELECT COUNT(*) FROM students;    -- It is also allowed
```

- If we use * the it will count NULL value also.
- If we give value to count function it will return the count of the not NULL values. 


**Sum and Average:**
```sql
SELECT SUM(Salary) AS Y FROM table1;   -- Return totall value
SELECT AVG(Salary) AS Z FROM table1;   -- Return avarage value
```

- In this way we can get MIN() or MAX().


**GROUP BY**: Make group on the property are given and supply each group to the above function . Make group of same value for given column, here column is "Status".

```sql
SELECT Name, AVG(Salary) AS Z     -- Show name and avarage Salary from Table1.
	FROM Table1                   -- Make as much group is possible by "Status".
	GROUP BY(Status);             
```



**Having**: **WHERE** filter row before grouping and **HAVING** filter groups after grouping.

```sql
SELECT Name, AVG(Salary)          -- Those groups avarage salary is more than 60000
	FROM Table1                   -- show their name and avarage Salary from
	GROUP BY(Status)              -- Table1 by make as much group is possible by 
	HAVING AVG(Salary) > 60000;   -- "Status"
```


Another Example 01:
```sql
SELECT Name, COUNT(*)             -- Those groups member is more than 3 show their
	FROM Table1                   -- name and count from Table1 by make as much
	GROUP BY(Status)              -- group is possible by "Status"
	HAVING COUNT(Salary) > 3;
```


Another Example 02:
```sql
SELECT Department           -- Show the departments whose average salary is 
FROM Employees              -- higher than the average salary of the whole
GROUP BY Department         -- company
HAVING AVG(Salary) >=
    (SELECT AVG(Salary)
     FROM Employees);
```
- Subquery → GROUP BY → HAVING (Compare with Subquery)



#### Trigger:
Trigger to insert user information into student table  before a record is inserted into account table:

```sql
Delimiter //              -- Change MySQL end statement "//" rather than ";"
create trigger account_before_insert
            before insert
            on account for each row
	begin
                 DECLARE vUser varchar(50);
                SELECT USER() into vUser;   -- Find username of person performing                                              -- the Insert into table
                INSERT into students(name)  -- Insert record into audit table
                VALUES (vUser);
    end //
Delimiter;
```

- Whenever someone inserts a row into `account`, the trigger automatically **adds a new row to `students`**, storing the **current username** in the `name` column.



#### Extra: 
- `NOT IN` = “exclude these values from the result.”

