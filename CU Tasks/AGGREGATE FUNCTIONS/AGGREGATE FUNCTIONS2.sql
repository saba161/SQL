SELECT * FROM Event 
SELECT * FROM Continent
SELECT * FROM Country

--1
SELECT YEAR(e.EventDate) ,COUNT(*) FROM Event e
GROUP BY YEAR(e.EventDate)
ORDER BY 2 DESC
--2
SELECT c.CountryName,COUNT(*) FROM Event e
JOIN Country c on e.CountryID = c.CountryID
WHERE YEAR(e.EventDate) BETWEEN 1901 and 2000 
GROUP BY c.CountryName
ORDER BY c.CountryName
--3
SELECT co.ContinentName,COUNT(*) FROM Country c
JOIN Continent co on co.ContinentID = c.ContinentID
GROUP BY co.ContinentName
--4
SELECT c.CountryName,YEAR(e.EventDate),COUNT(*) FROM Event e
JOIN Country c on e.CountryID = c.CountryID
WHERE c.CountryName in ('Germany', 'France', 'Spain')
GROUP BY c.CountryName, YEAR(e.EventDate)
ORDER BY 2
--5
