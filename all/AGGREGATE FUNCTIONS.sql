select * from Category
SELECT * FROM Continent
SELECT * FROM Country
SELECT * FROM Event


-- 1. გამოიტანეთ მოვლენების რაოდენობა წლების მიხედვით. მონაცემები დაალაგეთ
-- მოვლენების რაოდენობის კლების მიხედვით.
SELECT YEAR(e.EventDate) as Quantity ,COUNT(*) FROM Event e
GROUP BY YEAR(e.EventDate)
ORDER BY 2 DESC

-- 2. გამოიტანეთ მეოცე საუკუნის მოვლენების რაოდენობა ქვეყნების მიხედვით. მონაცემები
-- დაალაგეთ ქვეყნების მიხედვით ანბანური თანმიმდევრობით.
SELECT Count(*), c.CountryName FROM Event e
JOIN Country c on c.CountryID = e.CountryID
WHERE YEAR(e.EventDate) BETWEEN 1901 and 2000
GROUP BY c.CountryName
ORDER BY c.CountryName

-- 3. გამოიტანეთ ქვეყნების რაოდენობა კონტინენტების მიხედვით.
SELECT Count(*), co.ContinentName FROM Country c
JOIN Continent co on c.ContinentID = co.ContinentID
GROUP BY co.ContinentName

-- 4. გამოიტანეთ გერმანიის, საფრანგეთის და ესპანეთის 21-ე საუკუნის მოვლენების
-- რაოდენობა წლების მიხედვით;
SELECT COUNT(*),YEAR(e.EventDate), c.CountryName FROM Country c
JOIN Event e on e.CountryID = c.CountryID
WHERE c.CountryName in('Germany', 'France', 'Spain')
GROUP BY c.CountryName, YEAR(e.EventDate)
ORDER BY 2
