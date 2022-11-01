--MsStaff
INSERT INTO MsStaff VALUES
('ST001', 'Arya Yudidharma', 'aryayudidharma@bluejack.com', '2002-01-11', 'Male', '+621398228807', 'Green Lake City', 500000),
('ST002', 'Karmel', 'karmelelelele@sunib.edu', '2002-12-2', 'Male', '+625156596230', 'Bohemia', 700000),
('ST003', 'Nixon Leonard', 'nixonleonard@bluejack.com', '2002-09-16', 'Male', '+62594533989', 'Gading Serpong', 650000),
('ST004', 'Reyner Adrian', 'reyneradrian@sunib.edu', '2002-03-13', 'Male', '+621929233232', 'Pantai Indah Kapuk', 1000000),
('ST005', 'Aliong', 'aliongteng@bluejack.com', '1970-08-17', 'Male', '+621888999', 'Green Garden City', 1000000),
('ST006', 'Steven Liaw', 'stevenkeren123@sunib.edu', '1975-09-09', 'Male', '+627842951283', 'Taman Indah Kapuk', 2500000),
('ST007', 'Jesslyn May', 'mayjesslyn@bluejack.com', '1969-07-29', 'Female', '+621118382911', 'Blue Lake City', 2500000),
('ST008', 'Jingjongfan', 'namakuaneh@sunib.edu', '2002-12-11', 'Female', '+6212333343', 'Yellow Lake City', 760000),
('ST009', 'Windah Basudara', 'utuberkaya@bluejack.com', '1960-1-11', 'Male', '+6256666666', 'Gapunya Rumah', 100000),
('ST010', 'Mary Jane', 'maryjane@sunib.edu', '1995-02-19', 'Female', '+621394348242', 'Palem Asri', 750000);

--MsCustomer
INSERT INTO MsCustomer VALUES
('CU001', 'Ahay Mang', 'ahay@sunib.edu', '2000-01-22', 'Male', '+6216273483', 'Jalan Pepaya'),
('CU002', 'Hijaunamaku Yaga', 'green@bluejack.com', '2001-01-19', 'Female', '+6216274483', 'Jalan Hijau'),
('CU003', 'Hiuuu Siuuu', 'ikanhiu@sunib.edu', '1992-01-17', 'Male', '+621223453', 'Aquarium'),
('CU004', 'Andrew Garfield', 'unknown@bluejack.com', '1992-12-19', 'Male', '+62218765', 'Rahasia'),
('CU005', 'Hiyaaa', 'iihayy@sunib.edu', '1972-10-17', 'Female', '+621223453', 'Aquarium'),
('CU006', 'Abcdefgh', 'unknown@bluejack.com', '1999-12-25', 'Female', '+62218765456', 'Green Apple'),
('CU007', 'Maxim', 'maxxx@sunib.edu', '1987-10-17', 'Male', '+62122345399', 'Aquamarine'),
('CU008', 'Zilong Boy', 'knonwn@bluejack.com', '1982-12-31', 'Female', '+628844256', 'Green Peer'),
('CU009', 'Alan Runner', 'alannnrrr@sunib.edu', '1987-12-17', 'Male', '+6212334556', 'Aquamarine'),
('CU010', 'Ashley Jane', 'zzhfjff@bluejack.com', '1970-12-2', 'Female', '+6288442566', 'Green Orange');

--MsVendor
INSERT INTO MsVendor VALUES
('VE001', 'Tokoku', 'tokoku@bluejack.com', '+621398227113', 'Orange Mountain City'),
('VE002', 'Lazuda', 'lazudatoko@sunib.edu', '+627485947361', 'Brown Lake City'),
('VE003', 'PediaShop', 'pediashop@bluejack.com', '+629465788787', 'Di Mana Hayo'),
('VE004', 'TokoKilatSiap', 'tokokilatsiap@sunib.edu', '+623284812321', 'Siap Kilat City'),
('VE005', 'BeliSkuy', 'beliskuy@bluejack.com', '+628475564732', 'Beli Skuy City'),
('VE006', 'TokoOrang', 'tanyayangpunyaaja@bluejack.com', '+620000055514', 'Bukan Toko Saya'),
('VE007', 'Sepi tolong', 'banturamein@sunib.edu', '+6213657349583', 'Kota Gunung Hijau'),
('VE008', 'Cek Toko Sebelah', 'cektokosebelah@bluejack.com', '+621999993212', 'Cek Toko Sebelah Aja'),
('VE009', 'Rame Terus', 'sombongdikit@sunib.edu', '+621365748693', 'Gamau kasi tau biar sepi'),
('VE010', 'Sopee', 'sopi@bluejack.com', '+620002232134', 'Pademangan City');


--MsPhoneBrand
INSERT INTO MsPhoneBrand VALUES
('PB001', 'Apelkemakan'),
('PB002', 'Sumsang'),
('PB003', 'Vito'),
('PB004', 'Xiomay'),
('PB005', 'Appa'),
('PB006', 'fakemi'),
('PB007', 'GOR'),
('PB008', 'Whiteshark'),
('PB009', 'Kiano'),
('PB010', 'Blueberry');

--MsPhone
INSERT INTO MsPhone VALUES
('PO001', 'Aipon 1', '2000000', 'PB001'),
('PO002', 'fakemi pro 20', '3000000', 'PB006'),
('PO003', 'Appa oren 3', '900000', 'PB005'),
('PO004', 'GOR Phone 6', '660000', 'PB007'),
('PO005', 'Hp termahal di dunia', '40000000', 'PB008'),
('PO006', 'bisa wa dan chatting', '6000000', 'PB005'),
('PO007', 'hp butut', '11000000', 'PB006'),
('PO008', 'Samsul yes  10', '13000000', 'PB002'),
('PO009', 'kiasong', '16000000', 'PB009'),
('PO010', 'Onix 3', '1000000', 'PB010');

--PurchaseTransaction
INSERT INTO PurchaseTransaction VALUES
('PH001', 'ST001', 'VE003', '2020-01-03'),
('PH002', 'ST002', 'VE006', '2020-01-09'),
('PH003', 'ST003', 'VE001', '2020-02-17'),
('PH004', 'ST004', 'VE009', '2020-03-01'),
('PH005', 'ST005', 'VE004', '2020-04-13'),
('PH006', 'ST006', 'VE007', '2020-05-22'),
('PH007', 'ST007', 'VE008', '2020-06-15'),
('PH008', 'ST008', 'VE002', '2020-07-28'),
('PH009', 'ST009', 'VE005', '2020-08-13'),
('PH010', 'ST010', 'VE010', '2020-09-02'),
('PH011', 'ST001', 'VE008', '2020-10-08'),
('PH012', 'ST002', 'VE007', '2020-11-03'),
('PH013', 'ST003', 'VE004', '2020-11-07'),
('PH014', 'ST004', 'VE001', '2020-12-10'),
('PH015', 'ST009', 'VE003', '2020-12-23');

--PurchaseTransactionDetail
INSERT INTO PurchaseTransactionDetail VALUES
('PH001', 'PO001', 30),
('PH001', 'PO002', 40),
('PH002', 'PO003', 55),
('PH002', 'PO004', 25),
('PH003', 'PO005', 50),
('PH003', 'PO006', 50),
('PH004', 'PO007', 60),
('PH004', 'PO008', 40),
('PH005', 'PO009', 30),
('PH005', 'PO010', 60),
('PH006', 'PO001', 20),
('PH006', 'PO002', 15),
('PH007', 'PO003', 65),
('PH007', 'PO004', 85),
('PH008', 'PO005', 55),
('PH008', 'PO006', 100),
('PH009', 'PO007', 100),
('PH009', 'PO008', 100),
('PH010', 'PO009', 100),
('PH010', 'PO010', 100),
('PH011', 'PO001', 50),
('PH012', 'PO002', 50),
('PH013', 'PO003', 50),
('PH014', 'PO004', 50),
('PH015', 'PO005', 50);

--SalesTransaction
INSERT INTO SalesTransaction VALUES
('SH001', 'ST001', 'CU003', '2021-01-1'),
('SH002', 'ST002', 'CU004', '2021-02-16'),
('SH003', 'ST003', 'CU007', '2021-02-12'),
('SH004', 'ST004', 'CU010', '2021-03-12'),
('SH005', 'ST005', 'CU004', '2021-04-04'),
('SH006', 'ST006', 'CU008', '2021-05-05'),
('SH007', 'ST007', 'CU002', '2021-05-15'),
('SH008', 'ST008', 'CU004', '2021-06-06'),
('SH009', 'ST009', 'CU005', '2021-07-14'),
('SH010', 'ST010', 'CU002', '2021-08-17'),
('SH011', 'ST001', 'CU001', '2021-09-09'),
('SH012', 'ST002', 'CU009', '2021-10-10'),
('SH013', 'ST003', 'CU005', '2021-11-11'),
('SH014', 'ST004', 'CU006', '2021-12-12'),
('SH015', 'ST005', 'CU007', '2021-12-12');

--SalesTransactionDetail
INSERT INTO SalesTransactionDetail VALUES
('SH001', 'PO001', 2),
('SH001', 'PO002', 1),
('SH001', 'PO003', 1),
('SH002', 'PO003', 7),
('SH002', 'PO004', 3),
('SH003', 'PO003', 2),
('SH003', 'PO005', 3),
('SH003', 'PO006', 1),
('SH004', 'PO007', 2),
('SH004', 'PO008', 2),
('SH005', 'PO001', 3),
('SH005', 'PO002', 25),
('SH005', 'PO009', 6),
('SH005', 'PO010', 3),
('SH006', 'PO001', 11),
('SH006', 'PO002', 9),
('SH007', 'PO003', 1),	
('SH007', 'PO004', 1),
('SH008', 'PO005', 18),
('SH008', 'PO006', 1),
('SH009', 'PO001', 5),
('SH009', 'PO002', 2),
('SH009', 'PO003', 1),
('SH009', 'PO004', 2),
('SH009', 'PO007', 3),
('SH009', 'PO008', 2),
('SH010', 'PO009', 21),
('SH010', 'PO010', 3),
('SH011', 'PO001', 9),
('SH012', 'PO003', 15),
('SH013', 'PO006', 2),
('SH014', 'PO008', 9),
('SH015', 'PO010', 35);


SELECT * FROM MsStaff
SELECT * FROM MsCustomer
SELECT * FROM MsVendor
SELECT * FROM MsPhoneBrand
SELECT * FROM MsPhone
SELECT * FROM PurchaseTransaction
SELECT * FROM PurchaseTransactionDetail
SELECT * FROM SalesTransaction
SELECT * FROM SalesTransactionDetail