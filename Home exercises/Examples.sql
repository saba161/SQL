--First Table
CREATE TABLE Customer(
    CustomerID INT IDENTITY (1,1),
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Order_Product INT
)

--Second TABLE
CREATE TABLE Orders(
    OrderID INT IDENTITY (1,1),
    CustomerID INT,
    Model NVARCHAR(50),
    Cost INT,
    Quantity INT,
)
--INSERT VALUES in First Table
INSERT INTO Customer (FirstName, LastName, Order_Product)
    VALUES('Saba', 'Koghuashvili', 2)

INSERT INTO Customer (FirstName, LastName, Order_Product)
    VALUES('Gio', 'Koghuashvili', 4)

--INSERT VALUES in Second Table
INSERT INTO Orders (CustomerID, Cost, Quantity, Model)
    VALUES (2, 200, 10, 'Iphone');
INSERT INTO Orders (CustomerID, Cost, Quantity)
    VALUES(1, 1000, 5)
--**********

SELECT * FROM Customer
SELECT * FROM Orders
 --Add column in Table

ALTER TABLE Orders ADD Model NVARCHAR(50);

--****

SELECT c.FirstName, c.LastName, o.CustomerID, o.Cost, o.Quantity FROM Orders o JOIN Customer c ON o.CustomerID = c.CustomerID
where c.CustomerID = 2

CREATE UNIQUE INDEX ID ON Orders (CustomerID);


DROP TABLE Orders
DROP TABLE Customer
