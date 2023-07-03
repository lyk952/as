﻿CREATE DATABASE QUANLYLICHTHI
GO
USE QUANLYLICHTHI
GO
CREATE TABLE THISINH
(
	MATS VARCHAR(20) PRIMARY KEY,
	HOTENTS NVARCHAR(100) NOT NULL,
	CMND NVARCHAR(15) NOT NULL UNIQUE,
	NGAYSINH DATE  NOT NULL,
	GIOITINH NVARCHAR(5)  NOT NULL,
	DIACHI NVARCHAR(200)  NOT NULL,
	LOAITS NVARCHAR(50)
)
GO
CREATE TABLE PHONGTHI
(
	MAPHONGTHI VARCHAR(20) PRIMARY KEY,
	TENPHONGTHI VARCHAR(10) NOT NULL,
	VITRI NVARCHAR(200)
)
GO
CREATE TABLE CANBO
(
	MACANBO VARCHAR(20) PRIMARY KEY,
	TENCANBO NVARCHAR(100) NOT NULL,
	NGAYSINH DATE
)
GO
CREATE TABLE LICHTHI
(
	MALICHTHI VARCHAR(20) PRIMARY KEY,
	MAKHOATHI VARCHAR(20) NOT NULL,
	MAPHONGTHI VARCHAR(20),
	CANBO1 VARCHAR(20),
	CANBO2 VARCHAR(20),
	NGAYTHI DATE,
	GIOTHI TIME,
	CONSTRAINT FK_LICH_PHONG FOREIGN KEY (MAPHONGTHI) REFERENCES PHONGTHI(MAPHONGTHI) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT FK_LICH_CB1 FOREIGN KEY (CANBO1) REFERENCES CANBO(MACANBO) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT FK_LICH_CB2 FOREIGN KEY (CANBO2) REFERENCES CANBO(MACANBO)
)
GO
CREATE TABLE LICHTHICHITIET
(
	MALICHTHI VARCHAR(20),
	MATS VARCHAR(20),
	GHICHU NVARCHAR(100),
	PRIMARY KEY(MALICHTHI, MATS),
	CONSTRAINT FK_LTCT_LICH FOREIGN KEY (MALICHTHI) REFERENCES LICHTHI(MALICHTHI) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT FK_LTCT_THISINH FOREIGN KEY (MATS) REFERENCES THISINH(MATS) ON DELETE CASCADE ON UPDATE CASCADE
)
GO

----Dữ liệu bảng THISINH
INSERT [dbo].[THISINH] ([MATS], [HOTENTS], [CMND], [NGAYSINH], [GIOITINH], [DIACHI], [LOAITS]) VALUES (N'TS01', N'NGUYỄN THỊ QUỲNH', N'390214829', '2000-03-24', N'NỮ', N'VĨNH LONG', NULL)
INSERT [dbo].[THISINH] ([MATS], [HOTENTS], [CMND], [NGAYSINH], [GIOITINH], [DIACHI], [LOAITS]) VALUES (N'TS02', N'TRẦN VĂN TRÍ', N'342034925', '1998-08-28', N'NAM', N'VĨNH LONG', NULL)
INSERT [dbo].[THISINH] ([MATS], [HOTENTS], [CMND], [NGAYSINH], [GIOITINH], [DIACHI], [LOAITS]) VALUES (N'TS03', N'NGÔ VĂN BÌNH', N'284952394', '1997-06-12', N'NAM', N'CẦN THƠ', N'HỌC VIÊN')
INSERT [dbo].[THISINH] ([MATS], [HOTENTS], [CMND], [NGAYSINH], [GIOITINH], [DIACHI], [LOAITS]) VALUES (N'TS04', N'LÊ NGỌC KỲ', N'381194725', '1999-05-10', N'NỮ', N'VĨNH LONG', N'HỌC VIÊN')
INSERT [dbo].[THISINH] ([MATS], [HOTENTS], [CMND], [NGAYSINH], [GIOITINH], [DIACHI], [LOAITS]) VALUES (N'TS05', N'LÊ NGỌC KÝ', N'284925728', '2000-04-18', N'NAM', N'BẾN TRE', NULL)
INSERT [dbo].[THISINH] ([MATS], [HOTENTS], [CMND], [NGAYSINH], [GIOITINH], [DIACHI], [LOAITS]) VALUES (N'TS06', N'ĐINH QUỐC VIỆT', N'332948145', '1999-08-23', N'NAM', N'CÀ MAU', N'HỌC VIÊN')
INSERT [dbo].[THISINH] ([MATS], [HOTENTS], [CMND], [NGAYSINH], [GIOITINH], [DIACHI], [LOAITS]) VALUES (N'TS07', N'TRẦN NGỌC KIM KHÁNH', N'294758249', '1996-07-05', N'NỮ', N'TIỀN GIANG', N'HỌC VIÊN')
INSERT [dbo].[THISINH] ([MATS], [HOTENTS], [CMND], [NGAYSINH], [GIOITINH], [DIACHI], [LOAITS]) VALUES (N'TS08', N'NGUYỄN THỊ ANH', N'391214829', '2004-01-22', N'NỮ', N'VĨNH LONG',N'TỰ DO')
INSERT [dbo].[THISINH] ([MATS], [HOTENTS], [CMND], [NGAYSINH], [GIOITINH], [DIACHI], [LOAITS]) VALUES (N'TS09', N'NGUYỄN AN MINH', N'393334829', '2003-03-25', N'NAM', N'VĨNH LONG',N'HỌC VIÊN')
INSERT [dbo].[THISINH] ([MATS], [HOTENTS], [CMND], [NGAYSINH], [GIOITINH], [DIACHI], [LOAITS]) VALUES (N'TS10', N'NGUYỄN AN NINH', N'322214829', '2003-04-21', N'NAM', N'VĨNH LONG',N'HỌC VIÊN')
----Dữ liệu bảng PHONGTHI
INSERT [dbo].[PHONGTHI] ([MAPHONGTHI], [TENPHONGTHI], [VITRI]) VALUES (N'A201', N'PHÒNG A201', N'KHU A')
INSERT [dbo].[PHONGTHI] ([MAPHONGTHI], [TENPHONGTHI], [VITRI]) VALUES (N'A202', N'PHÒNG A202', N'KHU A')
INSERT [dbo].[PHONGTHI] ([MAPHONGTHI], [TENPHONGTHI], [VITRI]) VALUES (N'A203', N'PHÒNG A203', N'KHU A')
INSERT [dbo].[PHONGTHI] ([MAPHONGTHI], [TENPHONGTHI], [VITRI]) VALUES (N'A205', N'PHÒNG A205', N'KHU A')
INSERT [dbo].[PHONGTHI] ([MAPHONGTHI], [TENPHONGTHI], [VITRI]) VALUES (N'A206', N'PHÒNG A206', N'KHU A')
INSERT [dbo].[PHONGTHI] ([MAPHONGTHI], [TENPHONGTHI], [VITRI]) VALUES (N'A207', N'PHÒNG A207', N'KHU A')
INSERT [dbo].[PHONGTHI] ([MAPHONGTHI], [TENPHONGTHI], [VITRI]) VALUES (N'C604', N'PHÒNG C604', N'KHU C')
INSERT [dbo].[PHONGTHI] ([MAPHONGTHI], [TENPHONGTHI], [VITRI]) VALUES (N'C605', N'PHÒNG C605', N'KHU C')
----Dữ liệu bảng CANBO
INSERT [dbo].[CANBO] ([MACANBO], [TENCANBO], [NGAYSINH]) VALUES (N'CB1', N'NGUYỄN TUẤN ANH','1982-10-23')
INSERT [dbo].[CANBO] ([MACANBO], [TENCANBO], [NGAYSINH]) VALUES (N'CB2', N'LÊ THỊ HỒNG HẠNH','1985-02-03')
INSERT [dbo].[CANBO] ([MACANBO], [TENCANBO], [NGAYSINH]) VALUES (N'CB3', N'TRẦN VĂN TOÀN', '1990-05-14')
INSERT [dbo].[CANBO] ([MACANBO], [TENCANBO], [NGAYSINH]) VALUES (N'CB4', N'PHAN VĂN SƠN', '1989-03-28')
INSERT [dbo].[CANBO] ([MACANBO], [TENCANBO], [NGAYSINH]) VALUES (N'CB5', N'TRẦN NGỌC TUYẾT', '1987-09-05')
INSERT [dbo].[CANBO] ([MACANBO], [TENCANBO], [NGAYSINH]) VALUES (N'CB6', N'LÊ VĂN NAM', '1988-08-18')
----Dữ liệu bảng LICHTHI
INSERT [dbo].[LICHTHI] ([MALICHTHI], [MAKHOATHI], [MAPHONGTHI], [CANBO1], [CANBO2], [NGAYTHI], [GIOTHI]) VALUES (N'LT1', N'K05', N'A202', N'CB1', N'CB3', '2020-03-18', '16:30:00')
INSERT [dbo].[LICHTHI] ([MALICHTHI], [MAKHOATHI], [MAPHONGTHI], [CANBO1], [CANBO2], [NGAYTHI], [GIOTHI]) VALUES (N'LT2', N'K05', N'A205', N'CB2', N'CB4', '2020-03-30', '18:15:00')
INSERT [dbo].[LICHTHI] ([MALICHTHI], [MAKHOATHI], [MAPHONGTHI], [CANBO1], [CANBO2], [NGAYTHI], [GIOTHI]) VALUES (N'LT3', N'K06', N'A202', N'CB1', N'CB2', '2020-06-03', '19:00:00')
INSERT [dbo].[LICHTHI] ([MALICHTHI], [MAKHOATHI], [MAPHONGTHI], [CANBO1], [CANBO2], [NGAYTHI], [GIOTHI]) VALUES (N'LT4', N'K06', N'A207', N'CB5', N'CB1', '2020-06-04', '17:00:00')
INSERT [dbo].[LICHTHI] ([MALICHTHI], [MAKHOATHI], [MAPHONGTHI], [CANBO1], [CANBO2], [NGAYTHI], [GIOTHI]) VALUES (N'LT5', N'K06', N'C604', N'CB3', N'CB5', '2020-06-05', '14:20:00')
----Dữ liệu bảng CHITIETLICHTHI
INSERT [dbo].[LICHTHICHITIET] ([MALICHTHI], [MATS], [GHICHU]) VALUES (N'LT1', N'TS01', NULL)
INSERT [dbo].[LICHTHICHITIET] ([MALICHTHI], [MATS], [GHICHU]) VALUES (N'LT1', N'TS02', NULL)
INSERT [dbo].[LICHTHICHITIET] ([MALICHTHI], [MATS], [GHICHU]) VALUES (N'LT1', N'TS08', NULL)
INSERT [dbo].[LICHTHICHITIET] ([MALICHTHI], [MATS], [GHICHU]) VALUES (N'LT1', N'TS09', NULL)
INSERT [dbo].[LICHTHICHITIET] ([MALICHTHI], [MATS], [GHICHU]) VALUES (N'LT1', N'TS10', NULL)
INSERT [dbo].[LICHTHICHITIET] ([MALICHTHI], [MATS], [GHICHU]) VALUES (N'LT1', N'TS03', NULL)
INSERT [dbo].[LICHTHICHITIET] ([MALICHTHI], [MATS], [GHICHU]) VALUES (N'LT3', N'TS04', NULL)
INSERT [dbo].[LICHTHICHITIET] ([MALICHTHI], [MATS], [GHICHU]) VALUES (N'LT4', N'TS05', NULL)
INSERT [dbo].[LICHTHICHITIET] ([MALICHTHI], [MATS], [GHICHU]) VALUES (N'LT5', N'TS06', NULL)
INSERT [dbo].[LICHTHICHITIET] ([MALICHTHI], [MATS], [GHICHU]) VALUES (N'LT5', N'TS07', NULL)


----PHẦN TRÌNH BÀY BÀI LÀM
--Cau 2
CREATE TABLE KHOATHI
(
	MAKHOATHI VARCHAR(20),
	TENKHOATHI NVARCHAR(100) NOT NULL,
	NGAYBD DATE,
	NGAYKT DATE,
	CONSTRAINT PK_KT PRIMARY KEY (MAKHOATHI),
	CONSTRAINT UN_KT UNIQUE (TENKHOATHI),
	CONSTRAINT CK_KT CHECK (NGAYKT>NGAYBD)
)
GO
--CAU 3
ALTER TABLE LICHTHI
	ADD CONSTRAINT FK_LT_KT FOREIGN KEY (MAKHOATHI)
		REFERENCES KHOATHI (MAKHOATHI)
--CAU 4
ALTER TABLE PHONGTHI
	ALTER COLUMN TENPHONGTHI NVARCHAR(100)
--CAU 5
INSERT KHOATHI
	VALUES  ('K01',N'KHÓA 1','02/14/2018','02/17/2018'),
			('K02',N'KHÓA 2','06/10/2018','06/15/2018'),
			('K03',N'KHÓA 3','01/17/2019','01/21/2019'),
			('K04',N'KHÓA 4','07/23/2019','07/27/2019'),
			('K05',N'KHÓA 5','03/28/2020','04/02/2020'),
			('K06',N'KHÓA 6','06/02/2020','06/05/2020')
--CAU 6	
UPDATE THISINH
	SET	LOAITS=N'TỰ DO'
	WHERE LOAITS is NULL
--CAU 7
SELECT MATS, HOTENTS, CMND, LOAITS AS N'LOẠI THÍ SINH'
	FROM THISINH
--CAU 8
SELECT *
	FROM LICHTHI
	WHERE CANBO1  IN (SELECT MACANBO
						FROM CANBO
						WHERE TENCANBO=N'NGUYỄN TUẤN ANH')
UNION
	SELECT *
	FROM LICHTHI
	WHERE CANBO2  IN (SELECT MACANBO
						FROM CANBO
						WHERE TENCANBO=N'NGUYỄN TUẤN ANH')
--CAU 9
SELECT *FROM THISINH	
SELECT *FROM KHOATHI	
SELECT *FROM LICHTHI
SELECT *FROM CANBO
SELECT *FROM LICHTHICHITIET	

SELECT *
	FROM THISINH 
	WHERE	DIACHI=N'VĨNH LONG'
			AND YEAR(GETDATE()) - YEAR(NGAYSINH) BETWEEN  18 AND 20
			AND MATS IN (SELECT MATS
						FROM LICHTHICHITIET
						WHERE MALICHTHI IN	(SELECT MALICHTHI
											FROM LICHTHI
											WHERE MAKHOATHI='K05'))
	ORDER BY HOTENTS ASC
--CAU 10
SELECT CANBO1,count(*) AS SL
	FROM LICHTHI
	GROUP BY CANBO1
		
SELECT CANBO2,count(*) AS SL
	FROM LICHTHI
	GROUP BY CANBO2

					