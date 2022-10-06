CREATE DATABASE IF NOT EXISTS Transactions;
USE Transactions;

CREATE TABLE Sales(
OID INTEGER PRIMARY KEY,
Item VARCHAR(20) NOT NULL,
Price FLOAT,
Qty INTEGER,
Date DATETIME,
CustomerName VARCHAR(30) NOT NULL
);

-- part b
SELECT CustomerName FROM Sales as Hammer_Customers where Item = "Hammer" and Qty >= 1;

-- part c

SELECT Item, CustomerName FROM Sales as Items_bought where Date = "2020-02-25" ORDER BY Item ASC;


-- part d
SELECT item FROM Sales as Items_bought_by_omar where CustomerName="Omar Ahmed" and Date="2020-01-21";

-- part e

SELECT SUM(Price * Qty) FROM Sales as Grand_total;

-- part f

SELECT CustomerName, AVG(Qty) FROM Sales as Avg_Quantity where MONTH(Date) = MONTH("2020-03-01") AND YEAR(Date)=YEAR("2020-03-01") GROUP BY CustomerName;

-- part g

SELECT AVG(Qty*Price) FROM Sales as Avg_Sales where MONTH(Date)=MONTH("2020-01-01") AND YEAR(Date)=YEAR("2020-01-01");
