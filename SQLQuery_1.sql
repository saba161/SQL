CREATE DATABASE Persons

CREATE TABLE Student(
    PersonID int,
    FirstName VARCHAR(20)   ,
    LastName VARCHAR(20),
    Country VARCHAR(20),
    City VARCHAR(20)
)

INSERT INTO Student(PersonID, FirstName, LastName, Country, City)
VALUES(3, 'Saba', 'Koghuashvili', 'Georgia', 'Kutaisi'),
(4, 'Saba', 'Koghuashvili', 'Georgia', 'Kutaisi'),
(5, 'lado', 'Kogli', 'Georgia', 'tbilisi'),
(6, 'jano', 'irema', 'Georgia', 'batumi'),
(7, 'nunu', 'loer', 'Georgia', 'xoni')


ALTER TABLE Student
ADD CONSTRAINT UC_Student UNIQUE (PersonID)

SELECT * FROM Student;
DROP TABLE Blog;

ALTER TABLE Student
ADD UserID int IDENTITY(1,1)

ALTER TABLE Student
ADD PRIMARY KEY (UserID);

CREATE TABLE Blog (
    BlogId int IDENTITY(1,1),
    Name NVARCHAR(50) NOT NULL,
    CreateDate DATETIME NOT NULL
)
Go

 

ALTER TABLE Blog
ADD UserId int NOT NULL
GO