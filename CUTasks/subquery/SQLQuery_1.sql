SELECT * FROM Manufacturers
SELECT * FROM Products

-- 1) გამოიტანეთ იმ პროდუქტების სახელწოდება და ღირებულება, რომელთა მწარმოებელი არის Hewlett-Packard;
select * from Products p
where p.ManufacturerId in
      (
          select m.ManufacturerId
          from Manufacturers m
          where m.Name = 'Hewlett-Packard'
      )
-- 2) გამოიტანეთ იმ პროდუქტების სახელწოდება და ღირებულება, რომლებიც არ უწარმოებია Fujitsu -ს;
SELECT * FROM Products p
WHERE p.ManufacturerId in
    (
    select m.ManufacturerId from Manufacturers m
    where m.Name != 'Fujitsu'
    )
-- 3) გამოიტანეთ იმ პროდუქტების სახელწოდება და ღირებულება, რომელთა მწარმოებელი არის Sony, Fujitsu, IBM ან Intel;
SELECT * FROM Products p
WHERE p.ManufacturerId in
    (
        select m.ManufacturerId FROM Manufacturers m
        where m.Name in ('Fujitsu', 'Sony', 'IBM', 'Intel')
    )
-- 4) გამოიტანეთ იმ კომპანიების სახელწოდებები, რომლებმაც აწარმოეს 200 -ზე უფრო მაღალი ღირებულების მქონე პროდუქტები;
select m.Name from Manufacturers m
where m.ManufacturerId in
      (
          select p2.ManufacturerId from Products p2
          where p2.Price > 200
      )

-- 5) გამოიტანეთ იმ პროდუქტების სახელწოდება და ღირებულება, რომლებსაც არ აწარმოებს Genius და Dell.
SELECT p.Name, p.Price FROM Products p
WHERE p.ManufacturerId in
    (
        select m.ManufacturerId from Manufacturers m
        where m.Name not in ('Genius', 'Dell')
    )

-- WorldEvents

SELECT * FROM Category
SELECT * FROM Continent
SELECT * FROM Country
SELECT * FROM Event

-- 6)გამოიტანეთ ევროპის კონტინენტის ქვეყნები;
SELECT * FROM Country c
WHERE c.ContinentID =
    (
        select co.ContinentID from Continent co
        WHERE co.ContinentName = 'Europe'
    )
-- 7) გამოიტანეთ იმ მოვლენის სახელწოდება და თარიღი, რომლებიც მოხდა გერმანიაში ან ავსტრიაში;

