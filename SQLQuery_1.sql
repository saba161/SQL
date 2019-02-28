Select * from [dbo].[Cars]
Go
SELECT * from [dbo].[Cars] where color = 'Silver' and Transmission = 'Automatic'
Go
Select * from [dbo].[Cars] where Year between 2010 and 2015 and Make in ('acura', 'Mazda',
'Nissan', 'Infiniti', 'Toyota', 'Subaru', 'Lexus', 'Honda') 
Go
Select * from [dbo].[Cars] where Color = 'White' and Transmission = 'Manual' and Milage = 0
Go
Select  c.Make, c.Model, c.Milage from [dbo].[Cars] c where ListedPrice < 15000 and Milage < 100000
Go

