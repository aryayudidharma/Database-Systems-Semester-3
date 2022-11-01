--1
SELECT 'Customer' + RIGHT(mc.CustomerID, 1) [CustomerID], mc.CustomerName, mc.CustomerGender, SUM(std.SalesQTY*mp.PhonePrice) [Total amount of spending]
FROM MsCustomer mc JOIN SalesTransaction st ON mc.CustomerID = st.CustomerID JOIN
SalesTransactionDetail std ON st.SalesID = std.SalesID JOIN 
MsPhone mp ON std.PhoneID = mp.PhoneID
GROUP BY mc.CustomerID, mc.CustomerName, mc.CustomerGender

--2
SELECT ms.StaffID, SUBSTRING(ms.StaffName, 0, CHARINDEX(' ', ms.StaffName)) [Name], COUNT(*) [Customer Count]
FROM MsStaff ms JOIN SalesTransaction st ON ms.StaffID = st.StaffID
WHERE ms.StaffName LIKE '% %'
GROUP BY ms.StaffID, ms.StaffName

--3
SELECT 'Customer' + RIGHT(mc.CustomerID, 1) [CustomerID], mc.CustomerName, mpb.PhoneBrandName, SUM(std.SalesQTY*mp.PhonePrice) [Total Spending] 
FROM MsCustomer mc JOIN SalesTransaction st ON mc.CustomerID = st.CustomerID JOIN
SalesTransactionDetail std ON st.SalesID = std.SalesID JOIN 
MsPhone mp ON std.PhoneID = mp.PhoneID JOIN
MsPhoneBrand mpb ON mp.PhoneBrandID = mpb.PhoneBrandID,(
    SELECT mc.CustomerID, mc.CustomerName, COUNT(mc.CustomerID) [Test]
    FROM MsCustomer mc JOIN SalesTransaction st ON mc.CustomerID = st.CustomerID JOIN
    SalesTransactionDetail std ON st.SalesID = std.SalesID JOIN 
    MsPhone mp ON std.PhoneID = mp.PhoneID JOIN
    MsPhoneBrand mpb ON mp.PhoneBrandID = mpb.PhoneBrandID
    WHERE mc.CustomerName LIKE '% %' 
    GROUP BY  mc.CustomerID, mc.CustomerName
) x
WHERE mc.CustomerID IN(x.CustomerID) AND mc.CustomerName LIKE '% %' AND x.Test > 3
GROUP BY mpb.PhoneBrandName, mc.CustomerID, mc.CustomerName

--4
SELECT ms.StaffID, SUBSTRING(ms.StaffEmail, 0, CHARINDEX('@', ms.StaffEmail)+1) + 'Ymail.com' [Email], mpb.PhoneBrandName, SUM(std.SalesQTY*mp.PhonePrice) [Total Selling]
FROM MsStaff ms JOIN SalesTransaction st ON mS.StaffID = st.StaffID JOIN
SalesTransactionDetail std ON st.SalesID = std.SalesID JOIN 
MsPhone mp ON std.PhoneID = mp.PhoneID JOIN
MsPhoneBrand mpb ON mp.PhoneBrandID = mpb.PhoneBrandID, (
	SELECT st.StaffID, COUNT(DISTINCT(std.PhoneID)) [phoneCT]
	FROM SalesTransaction st JOIN SalesTransactionDetail std ON st.SalesID = std.SalesID
	GROUP BY st.StaffID ) x
WHERE x.phoneCT > 2 AND x.StaffID = st.StaffID
GROUP BY ms.StaffID, ms.StaffEmail, mpb.PhoneBrandName
ORDER BY ms.StaffID ASC 

--5
SELECT ms.StaffEmail, ms.StaffGender, CONVERT(VARCHAR(100), ms.StaffDOB, 106) [StaffDOB], ms.StaffSalary
FROM MsStaff ms, (
	SELECT AVG(StaffSalary) [AverageStaffSalary]
	FROM MsStaff) x
WHERE ms.StaffSalary > x.AverageStaffSalary AND 2021 - YEAR(ms.StaffDOB) >= 30

--6
SELECT ms.StaffID, ms.StaffName, '08' + SUBSTRING(ms.StaffPhoneNumber, 4, LEN(ms.StaffPhoneNumber)) [StaffPhone], 'Rp. ' + CONVERT(NVARCHAR(100), CONVERT(BIGINT, SUM(std.SalesQTY*mp.PhonePrice))) + ',00' [Total Selling]
FROM MsStaff ms JOIN SalesTransaction st ON ms.StaffID = st.StaffID 
JOIN SalesTransactionDetail std ON st.SalesID = std.SalesID 
JOIN MsPhone mp ON std.PhoneID = mp.PhoneID, (
    SELECT StaffID [staffs]
    FROM MsStaff
    WHERE StaffGender = 'Male'
) x
WHERE ms.StaffID IN (x.staffs)
GROUP BY ms.StaffID, ms.StaffName, ms.StaffPhoneNumber
HAVING SUM(std.SalesQTY*mp.PhonePrice) BETWEEN 10000000 AND 100000000

--7
SELECT 'Staff No ' + RIGHT(ms.StaffID, 1) [Staff No], ms.StaffName, SUBSTRING(ms.StaffEmail, 0, CHARINDEX('@', ms.StaffEmail)+1) + 'gmail.com' [StaffEmail], CONVERT(VARCHAR(100), ms.StaffDOB, 103) [StaffDOB], [Customer Count]
FROM MsStaff ms, (
	SELECT st.StaffID, 'Customer Count' = COUNT(DISTINCT(CustomerID))
	FROM SalesTransaction st
	GROUP BY st.StaffID
) a, (
	SELECT 'maxcc' = MAX(a.[Customer Count])
	FROM (
		SELECT st.StaffID, 'Customer Count' = COUNT(DISTINCT(CustomerID))
		FROM SalesTransaction st
		GROUP BY st.StaffID
		) a
	) b
WHERE a.[Customer Count] = b.maxcc AND ms.StaffID = a.StaffID

--8
SELECT mpb.PhoneBrandID, mpb.PhoneBrandName, st.CustomerID, mc.CustomerName, SUBSTRING(mc.CustomerEmail, 0, CHARINDEX('@', mc.CustomerEmail)+1) + 'Gmail.com' [CustomerEmail], std.SalesQTY [Qty]
FROM MsCustomer mc JOIN SalesTransaction st ON mc.CustomerID = st.CustomerID
JOIN SalesTransactionDetail std ON st.SalesID = std.SalesID
JOIN MsPhone mp ON std.PhoneID = mp.PhoneID
JOIN MsPhoneBrand mpb ON mp.PhoneBrandID = mpb.PhoneBrandID,(
    SELECT mpb.PhoneBrandID, mpb.PhoneBrandName, MAX(std.SalesQTY)[maxima]
    FROM MsCustomer mc JOIN SalesTransaction st ON mc.CustomerID = st.CustomerID
    JOIN SalesTransactionDetail std ON st.SalesID = std.SalesID
    JOIN MsPhone mp ON std.PhoneID = mp.PhoneID
    JOIN MsPhoneBrand mpb ON mp.PhoneBrandID = mpb.PhoneBrandID
    GROUP BY mpb.PhoneBrandID, mpb.PhoneBrandName
)x
WHERE mpb.PhoneBrandName = x.PhoneBrandName AND std.SalesQTY = x.maxima AND mc.CustomerEmail LIKE '%@bluejack.com' AND RIGHT(mc.CustomerID, 3)%2 = 0
ORDER BY mpb.PhoneBrandID, mpb.PhoneBrandName, st.CustomerID, mc.CustomerName

--9
CREATE VIEW Vendor_Brand_Transaction_View
AS
SELECT 'Vendor' + RIGHT(mv.VendorID, 1) [VendorID], mv.VendorName, '08' + SUBSTRING(mv.VendorPhoneNumber, 4, LEN(mv.VendorPhoneNumber)) [PhoneNumber], mpb.PhoneBrandName, COUNT(*) [Transaction Count], SUM(ptd.PurchaseQTY*mp.PhonePrice) [Total Transaction]
FROM MsVendor mv JOIN PurchaseTransaction pt ON mv.VendorID = pt.VendorID
JOIN PurchaseTransactionDetail ptd ON pt.PurchaseID = ptd.PurchaseID
JOIN MsPhone mp ON ptd.PhoneID = mp.PhoneID
JOIN MsPhoneBrand mpb ON mp.PhoneBrandID = mpb.PhoneBrandID
GROUP BY mv.VendorID, mv.VendorName, mv.VendorPhoneNumber, mpb.PhoneBrandName

SELECT * FROM Vendor_Brand_Transaction_View
DROP VIEW Vendor_Brand_Transaction_View
--10
CREATE VIEW Staff_Selling_View
AS
SELECT ms.StaffID, ms.StaffName, CONVERT(VARCHAR(100), SUM(std.SalesQTY)) + ' pc(s)' [Sold Phone Count],  'Rp. ' + CONVERT(NVARCHAR(100), CONVERT(BIGINT,SUM(std.SalesQTY*mp.PhonePrice))) + ',00' [Total Transaction], COUNT(DISTINCT(mpb.PhoneBrandID)) [Count Brand]
FROM MsStaff ms JOIN SalesTransaction st ON mS.StaffID = st.StaffID JOIN
SalesTransactionDetail std ON st.SalesID = std.SalesID JOIN 
MsPhone mp ON std.PhoneID = mp.PhoneID JOIN
MsPhoneBrand mpb ON mp.PhoneBrandID = mpb.PhoneBrandID
WHERE ms.StaffEmail LIKE '%@bluejack.com'
GROUP BY ms.StaffID, ms.StaffName

SELECT * FROM Staff_Selling_View
DROP VIEW Staff_Selling_View


