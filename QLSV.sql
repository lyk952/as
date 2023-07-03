﻿USE MASTER
GO
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'QLSV')
BEGIN
    DROP DATABASE QLSV;
END
CREATE DATABASE QLSV
GO
USE QLSV
GO
--Cau 1
CREATE TABLE PHONGBAN
(
	MAPB VARCHAR(6),
	TENPB NVARCHAR(50) NOT NULL,
	VITRI NVARCHAR(50),
	CONSTRAINT PK_PB PRIMARY KEY(MAPB) 
)
GO
CREATE TABLE CHUCVU
(
	MACV VARCHAR(7),
	TENCV NVARCHAR(30) NOT NULL,
	PHUCAPCV FLOAT NOT NULL,
	CONSTRAINT PK_CV PRIMARY KEY(MACV) 
)
GO
CREATE TABLE NHANVIEN
(
	MANV NVARCHAR(8),
	TENLOP NVARCHAR(30) NOT NULL,
	NGAYSINH DATE NOT NULL,
	NGAYVAOLAMVIEC DATE,
	MAPB VARCHAR(6),
	MACV VARCHAR(7),
	CONSTRAINT PK_NV PRIMARY KEY (MANV),
	CONSTRAINT FK_NV_PB FOREIGN KEY (MAPB)
		REFERENCES PHONGBAN (MAPB) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT FK_NV_CV FOREIGN KEY (MACV)
		REFERENCES CHUCVU(MACV) ON DELETE CASCADE ON UPDATE CASCADE
)
GO
--SELECT *FROM PHONGBAN
INSERT PHONGBAN	
	VALUES	('PB01',N'Tổ chức hành chính',N'Tầng 3 -Khu A'),
			('PB02',N'Kế hoạch tài chính',N'Tầng 2 -Khu B'),
			('PB03',N'Quản trị thiết bị',N'Tầng 2 -Khu A'),
			('PB04',N'Nghiên cứu khoa học',N'Tầng 2 -Khu A'),
			('PB05',N'Khảo thí đảm bảo chất lượng',N'Tầng 3 -Khu A')
GO
--SELECT *FROM CHUCVU
INSERT CHUCVU
	VALUES  ('CV01',N'Trưởng phòng',5.12),
			('CV02',N'Phó phòng',4.03),
			('CV03',N'Nhân viên',3.00),
			('CV04',N'Tạp vụ',1.23)
GO
--SELECT *FROM NHANVIEN
INSERT NHANVIEN
	VALUES	('NV01',N'Bùi Lan Trinh','10/16/1980','02/14/2000','PB01','CV01'),
			('NV02',N'Bùi Anh Tuấn','05/02/2009','03/15/2023','PB01','CV03'),
			('NV03',N'La Hoàng Tuân','05/15/1987','12/24/2021','PB03','CV03'),
			('NV04',N'Nguyễn Thanh An','10/26/2000','03/26/2019','PB01','CV04'),
			('NV05',N'Trần Bùi Lê','03/14/2001','10/20/2022','PB04','CV02'),
			('NV06',N'Trần Minh Thư','12/26/1992','12/22/2022','PB04','CV03')
GO	
--Cau 3
UPDATE NHANVIEN
	SET TENLOP=N'Miko LanTrinh'
	WHERE TENLOP=N'Bùi Lan Trinh'
--Cau 4
UPDATE CHUCVU
	SET PHUCAPCV=3.14
	WHERE TENCV=N'Nhân viên'
--Cau 5
DELETE CHUCVU 
	WHERE TENCV=N'Tạp vụ'
--Cau 6
DELETE NHANVIEN
	WHERE YEAR(GETDATE())-YEAR(NGAYSINH) <18
--Cau 7