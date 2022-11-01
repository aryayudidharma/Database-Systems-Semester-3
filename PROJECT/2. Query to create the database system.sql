CREATE DATABASE FlexPhone
GO
USE FlexPhone
GO

CREATE TABLE MsStaff(
    StaffID CHAR(5) PRIMARY KEY CHECK (StaffID LIKE 'ST[0-9][0-9][0-9]'),
    StaffName VARCHAR(50) NOT NULL,
    StaffEmail VARCHAR(50) CHECK(StaffEmail LIKE '%@bluejack.com' OR StaffEmail LIKE '%@sunib.edu') NOT NULL,
    StaffDOB DATE CHECK(YEAR(StaffDOB) >= 1960) NOT NULL,
    StaffGender VARCHAR(7) CHECK(StaffGender IN ('Female','Male')) NOT NULL,
    StaffPhoneNumber VARCHAR(20) NOT NULL,
    StaffAddress VARCHAR(100) NOT NULL,
    StaffSalary FLOAT NOT NULL	
)

CREATE TABLE MsCustomer(
    CustomerID CHAR(5) PRIMARY KEY CHECK (CustomerID LIKE 'CU[0-9][0-9][0-9]'),
    CustomerName VARCHAR(50) CHECK(LEN(CustomerName)>=3) NOT NULL,
    CustomerEmail VARCHAR(50) CHECK(CustomerEmail LIKE '%@bluejack.com' OR CustomerEmail LIKE '%@sunib.edu') NOT NULL,
    CustomerDOB DATE NOT NULL,
    CustomerGender VARCHAR(7) CHECK(CustomerGender IN ('Female','Male')) NOT NULL,
    CustomerPhoneNumber VARCHAR(20) NOT NULL,
    CustomerAddress VARCHAR(100) NOT NULL,
)

CREATE TABLE MsVendor(
    VendorID CHAR(5) PRIMARY KEY CHECK (VendorID LIKE 'VE[0-9][0-9][0-9]'),
    VendorName VARCHAR(50) NOT NULL,
    VendorEmail VARCHAR(50) CHECK(VendorEmail LIKE '%@bluejack.com' OR VendorEmail LIKE '%@sunib.edu') NOT NULL,
    VendorPhoneNumber VARCHAR(20) NOT NULL,
    VendorAddress VARCHAR(100) NOT NULL
)

CREATE TABLE MsPhoneBrand(
	PhoneBrandID CHAR(5) PRIMARY KEY CHECK (PhoneBrandID LIKE 'PB[0-9][0-9][0-9]') NOT NULL,
	PhoneBrandName VARCHAR(50) NOT NULL
)

CREATE TABLE MsPhone(
	PhoneID CHAR(5) PRIMARY KEY CHECK (PhoneID LIKE 'PO[0-9][0-9][0-9]'),
	PhoneName VARCHAR(50) NOT NULL,
	PhonePrice FLOAT NOT NULL,
	PhoneBrandID CHAR(5) FOREIGN KEY REFERENCES MsPhoneBrand(PhoneBrandID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL
)

CREATE TABLE PurchaseTransaction(
	PurchaseID CHAR(5) PRIMARY KEY CHECK (PurchaseID LIKE 'PH[0-9][0-9][0-9]'),
	StaffID CHAR(5) FOREIGN KEY REFERENCES MsStaff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	VendorID CHAR(5) FOREIGN KEY REFERENCES MsVendor(VendorID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	PurchaseTransactionDate DATE NOT NULL,
)

CREATE TABLE PurchaseTransactionDetail(
	PurchaseID CHAR(5) FOREIGN KEY REFERENCES PurchaseTransaction(PurchaseID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	PhoneID CHAR(5) FOREIGN KEY REFERENCES MsPhone(PhoneID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	PurchaseQTY INTEGER NOT NULL,
	PRIMARY KEY(PurchaseID, PhoneID)
)

CREATE TABLE SalesTransaction(
	SalesID CHAR(5) PRIMARY KEY CHECK (SalesID LIKE 'SH[0-9][0-9][0-9]'),
	StaffID CHAR(5) FOREIGN KEY REFERENCES MsStaff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	CustomerID CHAR(5) FOREIGN KEY REFERENCES MsCustomer(CustomerID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	SalesTransactionDate DATE NOT NULL
)

CREATE TABLE SalesTransactionDetail(
	SalesID CHAR(5) FOREIGN KEY REFERENCES SalesTransaction(SalesID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	PhoneID CHAR(5) FOREIGN KEY REFERENCES MsPhone(PhoneID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	SalesQTY INTEGER NOT NULL,
	PRIMARY KEY(SalesID, PhoneID)
)
