SELECT * FROM Category
SELECT * FROM Continent
SELECT * FROM Country
SELECT * FROM Event

SELECT * FROM Manufacturers
SELECT * FROM Products

-- 1. გამოიტანეთ იმ პროდუქტების სახელწოდება და ღირებულება, რომელთა ღირებულება
-- აღემატება Products ცხრილში არსებული ყველა პროდუქტის საშუალო ღირებულებას; 

SELECT pr.Name, pr.Price FROM Products pr WHERE pr.Price > 
(
    select AVG(p.Price) FROM Products p
)

-- 2. გამოიტანეთ იმ მწარმოებელთა რაოდენობა, რომლებიც აწარმოებენ drive -ებს; 
SELECT COUNT(*) FROM Manufacturers m WHERE m.ManufacturerId in 
(
    select p.ManufacturerId FROM Products p
    WHERE p.Name like '%drive%'
)

-- 3. გამოიტანეთ მინიმალური ღირებულების მქონე პროდუქტის მწარმოებელი კომპანიის
-- სახელწოდება; 

SELECT m.Name FROM Manufacturers m
    WHERE m.ManufacturerId in
    (
        select p.ManufacturerId FROM Products p
        WHERE p.Price in 
        (
            select MIN(p.Price) FROM Products p
        )
    )

-- 4. გამოიტანეთ Sony -ის მიერ წარმოებული პროდუქტების ჯამური ღირებულება;
SELECT SUM(p.Price) FROM Products p WHERE p.ManufacturerId in
(
    select m.ManufacturerId FROM Manufacturers m
    WHERE m.Name like 'sony'
)

-- 5. გამოიტანეთ Intel -ის მიერ წარმოებული იმ პროდუქტების რაოდენობა, რომელთა ფასი
-- აღემატება Intel -ის მიერ წარმოებული პროდუქტების საშუალო ფასს.
SELECT COUNT(*) FROM [dbo].[Products] pp WHERE pp.Price >
	(
	SELECT AVG(p.Price) FROM [dbo].[Products] p WHERE p.ManufacturerId =
	(
	SELECT m.ManufacturerId FROM [dbo].[Manufacturers] m WHERE m.Name ='Intel'
	)
)
AND pp.ManufacturerId =
(
	SELECT m.ManufacturerId FROM [dbo].[Manufacturers] m WHERE m.Name ='Intel'
)
