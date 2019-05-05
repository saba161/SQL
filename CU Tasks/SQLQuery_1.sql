SELECT * FROM cars
Go
SELECT * FROM cars where Color = 'silver' and Transmission = 'automatic'
Go
SELECT * FROM cars WHERE Year BETWEEN 2010 and 2015 and Make in ('Acura', 'Mazda',
'Nissan', 'Infiniti', 'Toyota', 'Subaru', 'Lexus', 'Honda')
GO
SELECT * FROM cars WHERE Milage = 0 and Color = 'white' and Transmission = 'manual'
GO
Select  c.Make, c.Model, c.Milage from [dbo].[Cars] c where ListedPrice < 15000 and Milage < 100000
GO
SELECT a.Make, a.Model, a.Color FROM cars a WHERE a.Make like 'c%' and (a.Model like 'a%' OR a.Make like 'e%')
GO
SELECT a.Make, a.Condition, a.Color FROM cars a WHERE a.Make = 'ford' and a.Condition = 'new' and a.Color in ('black','gray')
GO
SELECT a.Year, a.Transmission, a.BodyStyle FROM cars a WHERE a.BodyStyle like 'coupe' and a.Transmission like 'manual' and a.Year BETWEEN 2016 and 2017
GO
CREATE DATABASE books
CREATE TABLE book()