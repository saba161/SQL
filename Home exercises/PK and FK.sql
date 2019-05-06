--First Table
CREATE TABLE Customer(
    CustomerID INT IDENTITY (1,1) PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Order_Product INT
)

--Second TABLE
CREATE TABLE Orders(
    OrderID INT IDENTITY (1,1) PRIMARY KEY,
    CustomerID INT,
    Model NVARCHAR(50),
    Cost INT,
    Quantity INT,
    FOREIGN KEY (CustomerId)  REFERENCES Customer (CustomerId)
)

--INSERT VALUES in First Table
INSERT INTO Customer (FirstName, LastName, Order_Product)
    VALUES('Saba', 'Koghuashvili', 2)

INSERT INTO Customer (FirstName, LastName, Order_Product)
    VALUES('Gio', 'Koghuashvili', 4)

--INSERT VALUES in Second Table
INSERT INTO Orders (CustomerID, Cost, Quantity, Model)
    VALUES (2, 500, 9, 'Simens');
INSERT INTO Orders (CustomerID, Cost, Quantity, Model)
    VALUES(1, 3000, 4, 'Panasonic')

--Select 
SELECT * FROM Customer
SELECT * FROM Orders

--Add column in Table
ALTER TABLE Customer ADD Code int;

--Remove column from Table
ALTER TABLE Customer
DROP COLUMN Code;

--JOIN 
SELECT c.FirstName, c.LastName, o.CustomerID, o.Cost, o.Quantity FROM Orders o JOIN Customer c ON o.CustomerID = c.CustomerID
where c.CustomerID = 2

--CREATE UNIQUE INDEX
CREATE UNIQUE INDEX ID ON Orders (CustomerID);

--DROP TABLE
DROP TABLE Orders
DROP TABLE Customer
