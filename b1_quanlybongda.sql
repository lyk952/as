﻿CREATE DATABASE QLBongDa
USE QLBongDa
CREATE TABLE CAUTHU
(
	MACT numeric IDENTITY(1,1) PRIMARY KEY,
	HOTEN nvarchar(100) NOT NULL,
	VITRI nvarchar(20) NOT NULL,
	NGAYSINH datetime ,
	DIACHI nvarchar(200) ,
	MACLB varchar(5) NOT NULL,
	MAQG varchar(5) NOT NULL,
	SO int NOT NULL
)
GO

CREATE TABLE QUOCGIA
(
	MAQG varchar(5) PRIMARY KEY,
	TENQG nvarchar(60) NOT NULL
)
GO
		

CREATE TABLE CAULACBO
(
	MACLB varchar(5) PRIMARY KEY,
	TENCLB nvarchar(100) NOT NULL,
	MASAN nvarchar(5) NOT NULL,
	MATINH varchar(5) NOT NULL
)
GO

CREATE TABLE TENTINH
(
	MATINH varchar(5) PRIMARY KEY,
	TENTINH nvarchar(100) NOT NULL
)

GO
CREATE TABLE SANVD
(
	MASAN varchar(5) PRIMARY KEY,
	TENSAN nvarchar(100) NOT NULL,
	DIACHI nvarchar(200) 
)
GO

CREATE TABLE HUANLV
(
	MAHLV varchar(5) PRIMARY KEY,
	TENHLV nvarchar(100) NOT NULL,
	NGAYSINH datetime ,
	DIACHI nvarchar(200) ,
	DIENTHOAI nvarchar(20) ,
	MAQG varchar(5) NOT NULL
)
GO
CREATE TABLE HLV_CLB
(
	MAHLV varchar(5),
	MACLB varchar(5),
	VAITRO nvarchar(100) NOT NULL,
	constraint PIMARY_KEY_MAHLV_MACLB PRIMARY KEY(MAHLV, MACLB)
)
GO
CREATE TABLE TRANDAU
(
	MATRAN numeric IDENTITY(1,1) PRIMARY KEY,
	NAM int NOT NULL,
	VONG int NOT NULL,
	NGAYTD datetime NOT NULL,
	MACLB1 varchar(5) NOT NULL,
	MACLB2 varchar(5) NOT NULL,
	MASAN varchar(5) NOT NULL,
	KETQUA varchar(5) NOT NULL
)
GO
CREATE TABLE BANGXH
(
	MACLB varchar(5),
	NAM int,
	VONG int,
	SOTRAN int NOT NULL,
	THANG int NOT NULL,
	HOA int NOT NULL,
	THUA int NOT NULL, 
	HIEUSO varchar(5) NOT NULL,
	DIEM int NOT NULL,
	HANG int NOT NULL,
	constraint PRIMARY_KEY_MACLB_NAM_VONG PRIMARY KEY(MACLB, NAM, VONG)
)
GO
ALTER TABLE HUANLV ADD CONSTRAINT FK_QUOCGIA_HUANLV FOREIGN KEY (MAQG) REFERENCES QUOCGIA (MAQG)
GO
ALTER TABLE HLV_CLB ADD CONSTRAINT FK_HUANLV_HLV_CLB FOREIGN KEY (MAHLV) REFERENCES HUANLV (MAHLV)
GO
ALTER TABLE HLV_CLB ADD CONSTRAINT FK_CAULACBO_HLV_CLB FOREIGN KEY (MACLB) REFERENCES CAULACBO (MACLB)
GO
ALTER TABLE TRANDAU ADD CONSTRAINT FK_SANVD_TRANDAU FOREIGN KEY (MASAN) REFERENCES SANVD (MASAN)
GO
ALTER TABLE BANGXH ADD CONSTRAINT FK_CAULACBO_BANGXH FOREIGN KEY (MACLB) REFERENCES CAULACBO (MACLB)
GO
ALTER TABLE CAUTHU ADD CONSTRAINT FK_CAUTHU_QUOCGIA FOREIGN KEY (MAQG) REFERENCES QUOCGIA (MAQG)
GO
ALTER TABLE CAUTHU ADD CONSTRAINT FK_CAUTHU_CAULACBO FOREIGN KEY (MACLB) REFERENCES CAULACBO (MACLB)
--NHAP DU LIEU cauthu
SET DATEFORMAT DMY

INSERT INTO CAUTHU(HOTEN, VITRI, NGAYSINH,MACLB,MAQG,SO)
VALUES(N'Nguyễn Vũ Phong', N'Tiền vệ', '20/02/1990', 'BBD', 'VN', '17')
GO

--NHAP DU LIEU QUOCGIA
INSERT INTO QUOCGIA VALUES('VN' ,N'Việt Nam')
GO

INSERT INTO QUOCGIA VALUES('BDN' ,N'Bồ Đào Nha')
GO

--NHAP DU LIEU CAULACBO
INSERT INTO CAULACBO VALUES('BBD', N'BECAMEX BÌNH DƯƠNG', N'GD','BD')
GO

--NHAP DU LIEU TINH 
INSERT INTO TENTINH VALUES('BD', N'Bình Dương')
go

--NHAP DU LIEU SANVD
INSERT INTO SANVD VALUES( 'GD', N'Gò Dậu', N'123 QL1, TX Thue Dầu Một, Bình Dương')
go

--NHAP DU LIEU HUANLV
INSERT INTO HUANLV(MAHLV,TENHLV,NGAYSINH,DIENTHOAI,MAQG) VALUES ('HLV01', N'Vital', '15/10/1955',N'0918011075', 'BDN')
GO

--NHAP DU LIEU HLV_CLB
INSERT INTO HLV_CLB VALUES ('HLV01', 'BBD', N'HLV Chính')
go

--NHAP DU LIEU TRANDAU
INSERT INTO TRANDAU(NAM,VONG,NGAYTD,MACLB1,MACLB2,MASAN,KETQUA) VALUES('2009','1', '7/2/2009', 'BBD', 'SDN', 'GD', '3-0')
GO

--NHAP DU LIEU BANGXH
INSERT INTO BANGXH VALUES( 'BBD', '2009','1','1','1','0','0','3-0','3','1')
GO

--cau2
DELETE  FROM CAUTHU
WHERE HOTEN = N'Nguyễn Vũ Phong'
--cau 3
DELETE FROM CAUTHU
WHERE YEAR(GETDATE()) -YEAR(NGAYSINH) > 40
--CAU 4
DELETE FROM CAUTHU 
WHERE YEAR(GETDATE()) -YEAR(NGAYSINH) > 35 AND MACLB = 'BBD'
--CAU 5
DELETE FROM CAUTHU
WHERE YEAR(GETDATE()) - YEAR(NGAYSINH) > 35 
AND MACLB IN (SELECT MACLB FROM CAULACBO WHERE TENCLB = N'BECAMEX BÌNH DƯƠNG')
--CAU 6
UPDATE CAUTHU
SET VITRI = N'Tiền  đạo'
WHERE HOTEN = N'Nguyễn Trường Sơn'
--CAU 7
UPDATE HUANLV
SET DIACHI = N'TP.HCM'
WHERE TENHLV = N'Nguyễn Công Thành'
--CAU 8

--CAU 9


--CAU 10
UPDATE CAULACBO
SET TENCLB = N'BÌNH DƯƠNG'
WHERE TENCLB = N'BECAMEX BÌNH DƯƠNG'

