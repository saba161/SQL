SELECT * FROM CustomerInquiries
--1
SELECT ve.Make, ve.Model, ve.Price from Vehicles ve
WHERE ve.Price = 
(
    select max(v.Price) FROM Vehicles v
)

--2
select v.make, v.model FROM Vehicles v
WHERE v.BodyStyleId in
(
    select vbs.BodyStyleId from VehicleBodyStyles vbs
    WHERE vbs.Description = 'sedan'
)
--3
SELECT COUNT(*) FROM Sales sa 
WHERE sa.SalesPersonId in
(
    select sp.SalesPersonId from SalesPeople sp
    WHERE sp.FirstName = 'Paul' and sp.LastName = 'Hill'
)
and YEAR(sa.SaleDate) = 2017 and MONTH(sa.SaleDate) BETWEEN 1 and 6
--4
SELECT cu.FirstName, cu.LastName from Customers cu
WHERE cu.CustomerId in
(
    select s.CustomerId from Sales s
    WHERE s.SaleDate in 
    (
        select MIN(sa.saledate) from Sales sa
    )
)
--5
SELECT COUNT(*) , YEAR(s.saledate) FROM Sales s
GROUP BY YEAR(s.SaleDate)
--6
select ve.Model, ve.Year from Vehicles ve
WHERE ve.Price = 
(
    select min(v.Price) from Vehicles v
    WHERE v.Make  = 'BMW'
)
--7
select COUNT(*) FROM Sales sa
WHERE sa.VehicleId in
(
    select v.VehicleId from Vehicles v
    WHERE v.BodyStyleId in
    (
        select vbs.BodyStyleId from VehicleBodyStyles vbs
        WHERE vbs.[Description] = 'hatchback'
    )
)

--8
select COUNT(*) FROM Sales sa 
WHERE sa.SalesPersonId in
(
    select sp.SalesPersonId from SalesPeople sp
    WHERE sp.FirstName = 'Jeff' AND sp.LastName = 'Paulson'
)

and YEAR(sa.SaleDate) = 2016 and MONTH(sa.SaleDate) BETWEEN 6 and 12

--9
SELECT v.Make, v. Model  from vehicles v
WHERE v.Price > 200 
(
    select AVG(Price) from Vehicles 
)