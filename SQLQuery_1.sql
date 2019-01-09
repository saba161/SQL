CREATE DATABASE Saba;

CREATE TABLE Cars(
    Name NVARCHAR(50),
    Model INT
)

CREATE TABLE Bus(
    Name NVARCHAR(50),
    Model INT
)
INSERT INTO Bus(Name, Model)
VALUES ('MAN', 599)

INSERT INTO Cars(Name, Model)
VALUES ('BMW', 535), ('Merz', 190), ('BMW', 535)

SELECT * FROM Cars
SELECT * FROM Bus
