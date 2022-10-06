-- Question 2
-- part a
CREATE DATABASE IF NOT EXISTS hotel;
use hotel;

CREATE TABLE IF NOT EXISTS Room_Type(
RoomTypeCode INTEGER NOT NULL,
RoomTypeName VARCHAR(50) NOT NULL,
PRIMARY KEY(RoomTypeCode)
);
CREATE TABLE IF NOT EXISTS  Season(
SeasonCode INTEGER NOT NULL,
SeasonName VARCHAR(50) NOT NULL,
PRIMARY KEY(SeasonCode)
);
CREATE TABLE IF NOT EXISTS Customer_Type(
CustomerTypeCode INTEGER NOT NULL,
CustomerTypeName VARCHAR(50) NOT NULL,
PRIMARY KEY(CustomerTypeCode)
);
CREATE TABLE IF NOT EXISTS Job(
JobCode INTEGER NOT NULL,
JobDescription VARCHAR(255) NOT NULL,
BasicSalary INTEGER NOT NULL,
PRIMARY KEY(JobCode)
);
CREATE TABLE IF NOT EXISTS PRICE (
RoomTypeCode INTEGER NOT NULL,
SeasonCode INTEGER NOT NULL,
CustomerTypeCode INTEGER NOT NULL,
PriceValue INTEGER NOT NULL,
PRIMARY KEY(RoomTypeCode, SeasonCode, CustomerTypeCode),
FOREIGN KEY(RoomTypeCode) REFERENCES Room_Type(RoomTypeCode),
FOREIGN KEY(SeasonCode) REFERENCES Season(SeasonCode),
FOREIGN KEY(CustomerTypeCode) REFERENCES Customer_Type(CustomerTypeCode)
);
CREATE TABLE IF NOT EXISTS Shift(

ShiftCode INTEGER NOT NULL,
StartTime TIME NOT NULL,
EndTime TIME NOT NULL,
BonusValue INTEGER NOT NULL,
SuperStaffNumber INTEGER NOT NULL,
PRIMARY KEY(ShiftCode)
);
CREATE TABLE IF NOT EXISTS Member_Staff(
StaffNumber INTEGER NOT NULL,
StaffName VARCHAR(50) NOT NULL,
GENDER CHAR NOT NULL,
JobCode INTEGER NOT NULL,
ShiftCode INTEGER NOT NULL,
PRIMARY KEY(StaffNumber),
FOREIGN KEY(JobCode) REFERENCES Job(JobCode),
FOREIGN KEY(ShiftCode) REFERENCES Shift(ShiftCode)
);
ALTER TABLE Shift ADD FOREIGN KEY(SuperStaffNumber) REFERENCES Member_Staff(StaffNumber);
CREATE TABLE IF NOT EXISTS Section(
SectCode VARCHAR(10) NOT NULL,
SectName VARCHAR(50) NOT NULL,
ViewDescription VARCHAR(255) NOT NULL,
ManagerStaffNumber INTEGER NOT NULL,
PRIMARY KEY(SectCode),
FOREIGN KEY(ManagerStaffNumber) REFERENCES Member_Staff(StaffNumber)
);
CREATE TABLE IF NOT EXISTS Room(
SectCode VARCHAR(10) NOT NULL,
RoomNo INTEGER NOT NULL,
RoomTypeCode INTEGER NOT NULL,
Status VARCHAR(25) NOT NULL,
PRIMARY KEY(SectCode, RoomNo),
FOREIGN KEY(SectCode) REFERENCES Section(SectCode),
FOREIGN KEY(RoomTypeCode) REFERENCES Room_Type(RoomTypeCode)
);


CREATE TABLE IF NOT EXISTS Customer(
CustFirstName VARCHAR(25) NOT NULL,

CustLastName VARCHAR(25) NOT NULL,
CustomerTypeCode INTEGER NOT NULL,
Nationality VARCHAR(25) NOT NULL,
CreditCardNo INTEGER NOT NULL,
PRIMARY KEY(CustFirstName, CustLastName),
FOREIGN KEY(CustomerTypeCode) REFERENCES Customer_Type(CustomerTypeCode)
);
CREATE TABLE IF NOT EXISTS Reservation(
ReferenceNo INTEGER NOT NULL,
SectCode VARCHAR(10) NOT NULL,
RoomNo INTEGER NOT NULL,
CheckInDD INTEGER(2) NOT NULL,
CheckInMM INTEGER(2) NOT NULL,
CheckInYYYY INTEGER(4) NOT NULL,
NumberOfNights INTEGER NOT NULL,
ActualPrice INTEGER NOT NULL,
PRIMARY KEY(ReferenceNo),
FOREIGN KEY(SectCode, RoomNo) REFERENCES Room(SectCode, RoomNo)
);
CREATE TABLE IF NOT EXISTS Reservation_Customer(
ReferenceNo INTEGER NOT NULL,
CustFirstName VARCHAR(25) NOT NULL,
CustLastName VARCHAR(25) NOT NULL,
status VARCHAR(25) NOT NULL,
PRIMARY KEY(ReferenceNo, CustFirstName, CustLastName),
FOREIGN KEY(ReferenceNo) REFERENCES Reservation(ReferenceNo),
FOREIGN KEY(CustFirstName, CustLastName) REFERENCES Customer(CustFirstName, CustLastName)
);

-- part b
SELECT StaffNumber, StaffName, JobCode, JobDescription FROM Member_Staff AS M JOIN Job AS J USING (JobCode) WHERE M.ShiftCode IS NULL;

-- part c
SELECT C.CustFirstName, C.CustLastName, Nationality FROM Customer C JOIN
Reservation_Customer RC ON RC.CustFirstName = C.CustFirstName AND
RC.CustLastName=C.CustLastName JOIN Reservation R on
RC.ReferenceNo=R.ReferenceNo and R.CheckInYYYY IN (2019, 2020) GROUP BY
CustFirstName, CustLastName HAVING COUNT(*) >5;

-- part d
SELECT ShiftCode, StaffName AS SupervisorName, COUNT(StaffNumber) AS TotalStaffCount FROM Shift AS S JOIN Member_Staff AS M
USING (ShiftCode) WHERE M.StaffNumber = S.SuperStaffNumber GROUP BY
S.ShiftCode HAVING COUNT(*) <10;
-- part e
CREATE VIEW  Statistics AS SELECT R.SectCode, RT.RoomTypeName, RT.RoomTypeCode,  SUM(DISTINCT R.RoomNo) AS SoldUnits, SUM(ActualPrice) AS Total, CheckInMM, CheckInYYYY FROM Reservation AS R JOIN Room AS Rom USING (RoomNo) JOIN Room_Type AS RT USING (RoomTypeCode) GROUP BY SectCode, RoomTypeName, CheckInMM, CheckInYYYY;
SELECT * FROM Statistics;

-- part f
SELECT SoldUnits, RoomTypeName, RoomTypeCode, Total, SectCode, CheckInMM, CheckInYYYY FROM Statistics WHERE SectCode = 'S01' AND RoomTypeCode = 'D' AND CheckInMM = '07' AND CheckInYYYY='2020';