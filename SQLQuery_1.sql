CREATE DATABASE Saba;

CREATE TABLE Cars(
    Name NVARCHAR(50),
    Model INT
)

INSERT INTO Cars(Name, Model)
VALUES ('BMW', 535), ('Merz', 190), ('BMW', 535)

SELECT * FROM Cars
