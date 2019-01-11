CREATE DATABASE Saba;

CREATE TABLE Persons(
PersonID int,
FirstName varchar(255),
LastName varchar(255),
Address varchar(255),
City varchar(255)
)

INSERT INTO Persons(PersonID, FirstName, LastName, Address, City)
VALUES (1, 'saba', 'koghuashvili', 'banoja', 'Kutaisi')
SELECT * FROM Persons
