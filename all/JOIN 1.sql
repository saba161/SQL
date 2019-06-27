SELECT * FROM Continent
SELECT * FROM Country
SELECT * FROM Category
SELECT * FROM Event

-- 1. გამოიტანეთ ევროპის (Europe) და ჩრდილოეთ ამერიკის (North America) კონტინენტებზე
-- მდებარე ქვეყნები. პირველ სვეტში გამოიტანეთ კონტინენტის სახელწოდება, მეორე სვეტში -
-- ქვეყნის. 
SELECT co.ContinentName, c.CountryName FROM Country c
JOIN Continent co on co.ContinentID = c.ContinentID
WHERE co.ContinentName like 'Europe' or co.ContinentName like 'North America'

-- 2. გამოიტანეთ 1980-1990 წლების მოვლენები, რომლებიც ხვდება ტრანსპორტის (Transport) ან 
-- ეკონომიკის (Economy) კატეგორიაში. პირველ სვეტში გამოიტანეთ კატეგორია, მეორე სვეტში
-- მოვლენა. დაალაგეთ მოვლენის თარიღის ზრდადობის მიხედვით.
SELECT c.CategoryName, e.EventDate FROM Event e 
JOIN Category c on c.CategoryID = e.CategoryID
WHERE c.CategoryName in ('transport' , 'economy') and 
YEAR(e.EventDate) BETWEEN 1980 and 1990

-- 3. გამოიტანეთ სრული მონაცემები მეცხრამეტე საუკუნეში (1801-1900) გამართული მოვლენების
-- შესახებ. ბოლო სვეტში გამოიტანეთ იმ ქვეყნის სახელწოდება, სადაც გაიმართა მოვლენა. 
SELECT * FROM Event e
JOIN Country c on e.CountryID = c.CountryID
WHERE year(e.EventDate) BETWEEN 1801 and 1900

-- 4. გამოიტანეთ ქვეყნების სია, სადაც გაიმართა ომის კატეგორიასთან დაკავშირებული მოვლენები. --
-- თითოეული ქვეყანა გამოიტანეთ მხოლოდ ერთხელ.
SELECT distinct c.CountryName FROM Country c
JOIN Event e on c.CountryID = e.CountryID
JOIN Category ca on ca.CategoryID = e.CategoryID
where  ca.CategoryName like '%war%'

-- 5. გამოიტანეთ მოვლენების სახელწოდებები, რომლებიც იწყება 1 ან 9 -ზე, ასევე გამოიტანეთ ქვეყნის
-- და კონტინენტის სახელწოდებები, სადაც გაიმართა ეს მოვლენები
select e.EventName, c.CountryName,ct.ContinentName from Event  e
join Country c on e.CountryID=c.CountryID
join Continent ct on c.ContinentID=ct.ContinentID
where LEFT(EventName,1) like 9  or LEFT(EventName,1) like 1 

-- 6. გამოიტანეთ კონტინენტების სახელწოდებები, სადაც გაიმართა მეცნიერებებთან და
-- ტექნოლოგიებთან (Science and technology) დაკავშირებული მოვლენები. მეორე სვეტში
-- გამოიტანეთ ქვეყნის სახელწოდება. კონტინენტი-ქვეყნის წყვილი არ გაიმეოროთ. 
select distinct c.CountryName,ct.ContinentName  from Continent ct 
join Country c  on  ct.ContinentID = c.ContinentID
join Event e on e.CountryID = c.CountryID
join Category cat  on cat.CategoryID = e.CategoryID
where  CategoryName like '%Science%' or CategoryName like  '%technology%'



