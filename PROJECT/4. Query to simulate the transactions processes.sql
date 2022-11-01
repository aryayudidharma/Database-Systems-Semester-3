--Simulate transaction process
INSERT INTO SalesTransaction VALUES
('SH016', 'ST010', 'CU005', '2022-01-05');

INSERT INTO SalesTransactionDetail VALUES
('SH016', 'PO001', 1),
('SH016', 'PO002', 2),
('SH016', 'PO003', 3);

--Transaction Detail
SELECT st.SalesID [SalesID], st.StaffID [StaffID], st.CustomerID [CustomerID], mp.PhoneName [Phone Type], 
mpb.PhoneBrandName [Phone Brand], std.SalesQTY [Quantity], mp.PhonePrice [Price], SUM(std.SalesQTY*mp.PhonePrice) [Subtotal]
FROM MsCustomer mc JOIN SalesTransaction st ON mc.CustomerID = st.CustomerID JOIN
SalesTransactionDetail std ON st.SalesID = std.SalesID JOIN 
MsPhone mp ON std.PhoneID = mp.PhoneID JOIN
MsPhoneBrand mpb ON mp.PhoneBrandID = mpb.PhoneBrandID JOIN
MsStaff ms ON ms.StaffID = st.StaffID
WHERE st.SalesID = 'SH016'
GROUP BY st.SalesID, st.StaffID, st.CustomerID, mp.PhoneName, 
mpb.PhoneBrandName, std.SalesQTY, mp.PhonePrice

--Grand Total of Transaction Detail
SELECT SUM(std.SalesQTY*mp.PhonePrice) [Grand Total]
FROM MsCustomer mc JOIN SalesTransaction st ON mc.CustomerID = st.CustomerID JOIN
SalesTransactionDetail std ON st.SalesID = std.SalesID JOIN 
MsPhone mp ON std.PhoneID = mp.PhoneID JOIN
MsPhoneBrand mpb ON mp.PhoneBrandID = mpb.PhoneBrandID JOIN
MsStaff ms ON ms.StaffID = st.StaffID
WHERE st.SalesID = 'SH016'
