--1
SELECT MIN(p.Price) FROM [dbo].[Products] p WHERE p.Name like '%CPU%'
--2
SELECT AVG(p.Price) FROM [dbo].[Products] p WHERE p.Name = 'Monitor'
--3
SELECT COUNT(*) FROM [dbo].[Products] p WHERE p.Name like '%drive%' and p.Price between 30 and 50
--4
SELECT SUM(p.Price) FROM [dbo].[Products] p WHERE p.Name = 'Memory'
--5
SELECT MIN(p.Price) FROM [dbo].[Products] p WHERE p.Name = 'Printer'
--6
SELECT COUNT(*) FROM [dbo].[Products] p WHERE p.Name not like '%s%' and p.Name like '%e'
--7
SELECT MAX(p.Price) FROM [dbo].[Products] p WHERE p.Name != 'SSD Drive' and p.Name like '%drive'
--8
SELECT COUNT(*) FROM [dbo].[Products] p WHERE p.Name != 'Monitor'
--9
SELECT AVG(p.Price) FROM [dbo].[Products] p WHERE p.Price > 100
--10
SELECT COUNT(*) FROM [dbo].[Products] p WHERE p.Name not like '%s%' and p.Name not like '%j%' and p.Name like '% %'
