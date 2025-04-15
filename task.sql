CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE ProductInventory (
    ID INT,
    ProductName VARCHAR(50),
    WarehouseAmount INT,
    CountryID INT,
	  FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);

CREATE TABLE Product(	
	ID INT,
    ProductName VARCHAR (50),
    PRIMARY KEY (ID)
);

CREATE TABLE ProductInfo(
	  ID INT,
    ProductID INT,
    WarehouseAmount INT,
    CountryID INT,
    FOREIGN KEY (ProductID) REFERENCES Product(ID) ON DELETE NO ACTION,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);

CREATE TABLE Warehouse(
		ID INT,
    WarehouseName VARCHAR(50),
    WarehouseAddress VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE WarehouseInfo(
	  ID INT,
    ProductID INT,
    WarehouseAmount INT,
    CountryID INT,
    WarehouseID INT,
    FOREIGN KEY (ProductID) REFERENCES ProductInventory(ID) ON DELETE NO ACTION,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouse(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);
    
INSERT INTO WarehouseInfo(ID,ProductID, WarehouseAmount,CountryID,WarehouseID)
	VALUES(1, 1, 2, 1, 1);
INSERT INTO WarehouseInfo(ID,ProductID, WarehouseAmount,CountryID,WarehouseID)
	VALUES(2, 2, 5, 2, 2);
    
INSERT INTO Warehouse(ID, WarehouseName, WarehouseAddress)
	VALUES(1, 'Warehouse-1', 'City-1, Street-1');
INSERT INTO Warehouse(ID, WarehouseName, WarehouseAddress)
	VALUES(2, 'Warehouse-2', 'City-2, Street-2');

INSERT INTO Product(ID,ProductName)
	VALUES(1, 'AwersomeProduct');

INSERT INTO ProductInfo(ID, ProductID, WarehouseAmount,CountryID)
	VALUES(1, '1', 2, 1);
INSERT INTO ProductInfo(ID, ProductID, WarehouseAmount,CountryID)
	VALUES(2, '2', 5, 2);

-- Populate test data

INSERT INTO Countries (ID,Name)
	VALUES (1, 'Country1');
INSERT INTO Countries (ID,Name)
	VALUES (2, 'Country2');
    
INSERT INTO ProductInventory (ID,ProductName,WarehouseAmount, CountryID)
	VALUES (1, 'AwersomeProduct', 2, 1);
INSERT INTO ProductInventory (ID,ProductName,WarehouseAmount, CountryID)
	VALUES (2, 'AwersomeProduct', 5, 2);
