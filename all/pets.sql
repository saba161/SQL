select * from Owners
select * from Pets
select * from ProceduresHistory
select * from Procedures
select * from ProcedureTypes

--1
-- ამობეჭდეთ შინაური ცხოველების მფლობელების სახელი,გვარი და მათი შინაური ცხოველების რაოდენობა.
-- მონაცემები ამობეჭდეთ კლებით, შინაური ცხოველების რაოდენობის მიხედვით.

Select O.Name,O.Surname,T.PetCount From 
(
	select P.OwnerID,count(P.Name) as PetCount from Pets as P
	group by P.OwnerID
) as T
join Owners as O on O.OwnerID = T.OwnerID
order by 3 desc

--2
-- ჯამში რა თანხა დაუჯდა Daniel Nielson -ს თავისი შინაური ცხოველის მკურნალობა 2016 წლის მეორე ნახევარში. (subQuery)

select sum(Price) from Procedures where ProcedureId in (
	select ProcedureId from ProceduresHistory where PetID= (
		select PetId from Pets where OwnerID = (
			select OwnerID from Owners where Name='Daniel' and Surname='Nielson'
		)
	) and YEAR(ProcedureDate)=2016 and MONTH(ProcedureDate)>6
)

--3
-- ამობეჭდეთ იმ დედალ (female) თუთიყუშთა (Parrot) პატრონების სახელები,გვარები,ქალაქები და მისამართები ,რომლეთა თუთიყუშებს
-- დასჭირდათ ჰოსპიტალიზაცია (HOSPITALIZATION). (subQuery)

select Name,Surname,City,StreetAddress from Owners where OwnerID in (
	select OwnerID from Pets where PetId in (
		select PetID from ProceduresHistory where ProcedureId = (
			select ProcedureId from Procedures where ProcedureTypeId = (
				select ProcedureTypeId from ProcedureTypes where Name = 'HOSPITALIZATION'
			)
		)
	) and Gender='Female' and PetTypeId = (
		select PetTypeId from PetTypes where Name = 'Parrot'
	)
)

--4
-- გამოიტანეთ ცხოველების ტიპების მიხედვით რამდენი პროცედურა ჩატარდა იანვარში, მაისში და ივლისში ერთად. (group by)

select PT.Name,count(PH.ProceduresHistoryId) as [Number of Procedures] from ProceduresHistory as PH
join Pets as P on P.PetId=PH.PetID
join PetTypes as PT on PT.PetTypeId=P.PetTypeId
where MONTH(PH.ProcedureDate) in (1,5,7)
group by PT.Name

--5
-- ამობეჭდეთ ჩატარებული პროცედურების რაოდენობა ცხოველების სახელების მიხედით, სადაც ჩატარებული პროცედურების რიცხვი მეტია 2-ზე.
-- პროცედურა ჩატარებული უნდა იყოს ოთხშაბათს (Wednesday) და ცხოველის მფლობელის ქალაქი უნდა შედეგებოდეს 2 სიტყვისგან.

select P.Name,count(*) as [Number of Procedures] from ProceduresHistory as PH 
join Pets as P on P.PetID = PH.PetID
join Owners as O on O.OwnerID=P.OwnerID
where DATENAME(dw,PH.ProcedureDate)='Wednesday' and O.City like '% %'
group by P.Name
having count(PH.ProceduresHistoryId)>2

--6
-- დააჯგუფეთ ჩატარებული პროცედურების რაოდენობა ცხოველის ტიპისა და პროცედურის ტიპის მიხედვით.

select PT.Name,PrT.Name,count(*) from ProcedureTypes as PrT
join Procedures as Pr on Pr.ProcedureTypeId=PrT.ProcedureTypeId
join ProceduresHistory as PrH on PrH.ProcedureId=Pr.ProcedureId
join Pets as P on P.PetId=PrH.PetID
join PetTypes as PT on PT.PetTypeId=P.PetTypeId
group by PT.Name,PrT.Name

--7
-- გამოიტანეთ თითოეულმა შინაურმა ცოხველმა რამდენი ტიპის პროცედურა ჩაიტარა.

select T.PetName,count(*) as [Number of Procedure Type] from 
(
	select Distinct P.Name as [PetName],PrT.Name as [ProcedureType] from Pets as P
	join ProceduresHistory as PrH on PrH.PetID=P.PetId
	join Procedures as Pr on Pr.ProcedureId=PrH.ProcedureId
	join ProcedureTypes as PrT on PrT.ProcedureTypeId=Pr.ProcedureTypeId
) as T
group by T.PetName

--8 
--ამობეჭდეთ თითოეული მფლობელის სახელი,გვარი და მისი ყველაზე მოხუცი ცხოველის ტიპი და ასაკი

select DISTINCT Ow.Name,Ow.Surname,PTy.Name as [Type],YEAR(GETDATE())-Pet.BirthYear as OldestPetAge from Owners as Ow
join Pets as Pet on Ow.OwnerID=Pet.OwnerID
join PetTypes as PTy on PTy.PetTypeId=Pet.PetTypeId
where YEAR(GETDATE())-Pet.BirthYear = (
	Select max(YEAR(GETDATE())-P.BirthYear) from Owners as O
	join Pets as P on O.OwnerID=P.OwnerID
	where O.Name=Ow.Name and O.Surname=Ow.Surname
)

--9
-- გამოთვალეთ რა დაჯდა 2007 დან 2011 წლამდე დაბადებული მამრი (Male) ძალღლების (Dog) მკურნალობა

select sum(PR.Price) from Pets as P
join PetTypes as PT on PT.PetTypeId=P.PetTypeId
join ProceduresHistory as PH on PH.PetID=P.PetId
join Procedures as PR on Pr.ProcedureId = PH.ProcedureId
where PT.Name='Dog' and P.BirthYear between 2007 and 2010 and P.Gender='Male'