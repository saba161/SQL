CREATE DATABASE Persons

CREATE TABLE Student(
    PersonID int,
    FirstName VARCHAR(20),
    LastName VARCHAR(20),
    Country VARCHAR(20),
    City VARCHAR(20)
)

INSERT INTO Student(PersonID, FirstName, LastName, Country, City)
VALUES(1, 'Saba', 'Koghuashvili', 'Georgia', 'Kutaisi')

SELECT * FROM Student

UPDATE Student
SET PersonID = 99