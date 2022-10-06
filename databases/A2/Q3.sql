CREATE DATABASE IF NOT EXISTS MANUFACTURING_PLANT;
USE MANUFACTURING_PLANT;

CREATE TABLE IF NOT EXISTS ManufacturingUnit(
CountryName VARCHAR(50) NOT NULL,
CityName VARCHAR(50) NOT NULL,
Area VARCHAR(50) NOT NULL,
PRIMARY KEY(CountryName, CityName)
);

CREATE TABLE IF NOT EXISTS Supplier(
SNO INTEGER NOT NULL,
SName VARCHAR(50) NOT NULL,
CountryName VARCHAR(50) NOT NULL,
CityName VARCHAR(50) NOT NULL,
Email VARCHAR(50) NOT NULL,
PRIMARY KEY(SNO)
);
CREATE TABLE IF NOT EXISTS ItemType(
ItemType VARCHAR(50) NOT NULL,
BasePrice INTEGER NOT NULL,
PRIMARY KEY(ItemType)
);
CREATE TABLE IF NOT EXISTS Item(
PartNumber INTEGER NOT NULL,
ItemType VARCHAR(50) NOT NULL,
PRIMARY KEY(PartNumber),
FOREIGN KEY(ItemType) REFERENCES ItemType(ItemType)
);


CREATE TABLE IF NOT EXISTS Supply(
SNO INTEGER NOT NULL,
PartNumber INTEGER NOT NULL,
CountryName VARCHAR(50) NOT NULL,
CityName VARCHAR(50) NOT NULL,
Quantity INTEGER NOT NULL,
PRIMARY KEY(SNO, PartNumber, CountryName, CityName), 
FOREIGN KEY(CountryName, CityName) REFERENCES ManufacturingUnit(CountryName, CityName),
FOREIGN KEY(PartNumber) REFERENCES Item(PartNumber),
FOREIGN KEY(SNO) REFERENCES Supplier(SNO)
);

CREATE TABLE IF NOT EXISTS Product(
ProductCode INTEGER NOT NULL,
ProductType VARCHAR(50) NOT NULL,
ProductBasePrice INTEGER NOT NULL,
PRIMARY KEY(ProductCode)
);

CREATE TABLE IF NOT EXISTS ManufacturingLine(
CountryName VARCHAR(50) NOT NULL,
CityName VARCHAR(50) NOT NULL,
LineNumber INTEGER NOT NULL,
ProductCode INTEGER NOT NULL,
PRIMARY KEY(CountryName, CityName,LineNumber),
FOREIGN KEY(ProductCode) REFERENCES Product(ProductCode),
FOREIGN KEY(CountryName, CityName) REFERENCES ManufacturingUnit(CountryName, CityName)
);
CREATE TABLE IF NOT EXISTS ManufacturingJob(
CountryName VARCHAR(50) NOT NULL,
CityName VARCHAR(50) NOT NULL,
LineNumber INTEGER NOT NULL,
MMonth INTEGER NOT NULL,
MYear INTEGER NOT NULL,
Quantity INTEGER NOT NULL,
PRIMARY KEY(CountryName, CityName,LineNumber, MMonth, MYear),
FOREIGN KEY(CountryName, CityName,LineNumber) REFERENCES ManufacturingLine(CountryName, CityName,LineNumber)
);



-- part a: total production of "Cosmetics" in 2019 and 2020
SELECT SUM(Quantity) FROM Product AS TotalProducedQuantity JOIN ManufacturingLine USING (ProductCode) JOIN ManufacturingJob USING (LineNumber) WHERE ProductType='Cosmetics' AND MYear IN (2019,2020);

-- part b: retrieve product code and type of all products not manufactured by any manufacturing line
SELECT ProductCode, ProductType FROM Product WHERE ProductCode NOT IN (SELECT ProductCode From ManufacturingLine);
-- part c:  For each manufacturing line in Cairo, Egypt and for each year, display manufacturing line number and total production for lines with more than 20000 units in total
SELECT LineNumber, SUM(Quantity) AS TotalProduction FROM ManufacturingLine AS ML JOIN ManufacturingJob AS MJ USING(CountryName, CityName, LineNumber) WHERE CountryName = 'Egypt' AND CityName = 'Cairo' GROUP BY MJ.MYear HAVING SUM(Quantity) > 20000;

-- part d: Total number of products manufactured by more than three manufacturing lines
SELECT Count(SQ.ProductCode) AS TP3L FROM (SELECT ProductCode FROM ManufacturingLine GROUP BY ProductCode HAVING Count(LineNumber) >3) AS SQ;
-- part e: Get supplier info (name, city, country, email) and total cost of items they supplied of type "SquareParts", must have supplied more than 10
SELECT SR.SName, SR.CountryName AS SCountry, SR.CityName AS SCity, SR.Email AS SEmail, SUM(S.Quantity * IT.BasePrice) AS TotalCost FROM Supply AS S JOIN Supplier AS SR USING(SNO) JOIN Item AS I USING (PartNumber) JOIN ItemType AS IT USING (ItemType) WHERE I.ItemType = 'SpareParts' GROUP BY 1, 2, 3, 4 HAVING SUM(S.Quantity) > 10;
