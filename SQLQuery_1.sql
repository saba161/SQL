CREATE DATABASE Persons

CREATE TABLE Student(
    PersonID int,
    FirstName VARCHAR(20)   ,
    LastName VARCHAR(20),
    Country VARCHAR(20),
    City VARCHAR(20)
)

INSERT INTO Student(PersonID, FirstName, LastName, Country, City)
VALUES(3, 'Saba', 'Koghuashvili', 'Georgia', 'Kutaisi')

ALTER TABLE Student
ADD CONSTRAINT UC_Student UNIQUE (PersonID)

SELECT * FROM Student;
DROP TABLE Student;

ALTER TABLE Student
ADD UserID int IDENTITY(1,1)

ALTER TABLE Student
ADD PRIMARY KEY (UserID);