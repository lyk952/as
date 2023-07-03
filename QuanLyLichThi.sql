use master
go 
drop database QuanLyLichThi
go
create database QuanLyLichThi
go
use QuanLyLichThi
go
create table KhoaThi
(
	MaKhoaThi varchar(20) Not null,
	TenKhoaThi nvarchar(100) unique Not null,
	NgayBD date Not null,
	NgayKT date Not null,
	constraint PK_KT primary key (MaKhoaThi)
)
go
create table ThiSinh
(
	MaTS varchar(20) Not null,
	HoTenTS nvarchar(100) Not null,
	CMND nvarchar(100) unique Not null,
	NgaySinh date Not null,
	GioiTinh nvarchar(5) Not null,
	DiaChi nvarchar(20) Not null,
	LoaiTS nvarchar(50),
	constraint PK_TS primary key (MaTS)
)
go
create table PhongThi
(
	MaPhongThi varchar(20) Not null,
	TenPhongThi nvarchar(100) Not null,
	constraint PK_PT primary key (MaPhongThi)
)
go
create table CanBo
(
	MaCanBo varchar(20) Not null,
	TenCanBo nvarchar(20) Not null,
	NgaySinh date,
	constraint PK_CB primary key (MaCanBo)
)
go
create table LichThi
(
	MaLichThi varchar(20) Not null,
	MaKhoaThi varchar(20) Not null,
	MaPhongThi varchar(20) Not null,
	CanBo1 varchar(20) Not null,
	CanBo2 varchar(20) Not null,
	NgayThi date Not null,
	GioThi time Not null,
	constraint PK_LT primary key (MaLichThi),
	constraint FK_LT_KT foreign key (MaKhoaThi)
		references KhoaThi (MaKhoaThi),
	constraint FK_LT_PT foreign key (MaPhongThi)
		references PhongThi (MaPhongThi),
	constraint FK_LT_CB1 foreign key (CanBo1)
		references CanBo (MaCanBo),
	constraint FK_LT_CB2 foreign key (CanBo2)
		references CanBo (MaCanBo)
)
go
--Cau2
create table LichThiChiTiet
(
	MaLichThi varchar(20) Not null,
	MaTS varchar(20) Not null,
	GhiChu nvarchar(100),
	constraint PK_LTCT primary key (MaLichThi,MaTS),
	constraint FK_LTCT_LT foreign key (MaLichThi)
		references LichThi(MaLichThi),
	constraint FK_LTCT_TS foreign key (MaTS)
		references ThiSinh (MaTS)
)
go
--Cau3
alter table ThiSinh
	add constraint CHK_TS check (LoaiTS=N'HỌC VIÊN' or LoaiTS=N'TỰ DO')
go
--Cau 4
alter table PhongThi
	add ViTri nvarchar(200)
go
--Cau5
select *from KhoaThi
insert KhoaThi
	values  ('001',N'TOÁN CAO CẤP A1','01/02/2023','03/12/2023'),
			('002',N'TOÁN RỜI RẠC','01/05/2023','03/16/2023'),
			('003',N'PHÁP LUẬT ĐẠI CƯƠNG','01/10/2023','03/15/2023'),
			('004',N'CHỦ NGHĨA XÃ HỘI KHOA HỌC','01/14/2023','03/20/2023'),
			('006',N'BIÊN TẬP VÀ SOẠN THẢO VĂN BẢN','01/19/2023','03/27/2023')
select *from ThiSinh
insert ThiSinh
	values  ('TS01',N'NGUYỄN THỊ QUỲNH','390214289','03/24/2000',N'NỮ',N'VĨNH LONG',N'TỰ DO'),
			('TS02',N'TRẦN VĂN TRÍ','342034925','08/28/1998',N'NAM',N'BẾN TRE',N'TỰ DO'),
			('TS03',N'NGÔ VĂN BÌNH','284952394','06/12/1997',N'NAM',N'CẦN THƠ',N'HỌC VIÊN'),
			('TS04',N'LÊ NGỌC KỲ','381194725','05/10/1999',N'NỮ',N'TIỀN GIANG',N'HỌC VIÊN'),
			('TS05',N'LÊ NGỌC KỲ','284925728','04/18/2000',N'NAM',N'TIỀN GIANG',N'TỰ DO'),
			('TS06',N'ĐINH QUỐC VIỆT','332948145','08/23/1999',N'NAM',N'CÀ MAU',N'HỌC VIÊN'),
			('TS07',N'TRẦN NGỌC KIM KHÁNH','294758249','07/05/1996',N'NỮ',N'TIỀN GIANG',N'HỌC VIÊN')
select *from PhongThi
insert PhongThi
	values  ('A201',N'PHÒNG THI LÁI XE',N'KHU A'),
			('A202',N'PHÒNG THI MÁY TÍNH',N'KHU A'),
			('B207',N'PHÒNG THI LÝ THUYẾT',N'KHU B'),
			('C201',N'PHÒNG THI TOÁN',N'KHU C')
select *from CanBo		
insert CanBo
	values	('2143',N'ĐINH VĂN QUÂN','03/12/1991'),
			('2212',N'NGUYỄN TIẾN DŨNG','10/01/1989'),
			('2216',N'LÝ MINH KHOA','05/09/1994'),
			('2234',N'PHẠM ĐÔNG VŨ','03/22/1992'),
			('2245',N'NGUYỄN MINH KHOA','11/20/1990'),
			('2311',N'ĐOÀN NGỌC TIẾN','06/16/1988'),
			('2355',N'TRỊNH TRÍ TÍN','01/25/1993')
select *from LichThi
insert LichThi
	values  ('122','001','A201','2143','2216','05/02/2023','7:30 AM'),
			('123','002','A202','2212','2311','05/06/2023','8:30 AM'),
			('124','003','B207','2355','2234','05/07/2023','7:00 AM'),
			('125','004','A202','2216','2311','05/11/2023','9:30 AM'),
			('126','006','C201','2143','2355','05/15/2023','10:30 AM')
select *from LichThiChiTiet
insert LichThiChiTiet
	values	('122','TS01',N'KHÔNG'),
			('122','TS02',N'KHÔNG'),
			('122','TS03',N'KHÔNG'),
			('124','TS03',N'KHÔNG'),
			('125','TS04',N'KHÔNG'),
			('126','TS05',N'KHÔNG'),
			('126','TS06',N'KHÔNG'),
			('126','TS07',N'KHÔNG')
--Cau 6
update ThiSinh
	set HoTenTS=N'NGUYỄN THỊ QUỲNH NHƯ'
	where CMND='390214289'
--Cau7
select HoTenTS,MaTS,CMND,year(getdate())-year(NgaySinh) as Tuoi,LoaiTS 
	from ThiSinh
	where LoaiTS=N'TỰ DO'
	order by Tuoi desc
--Cau8
select *from PhongThi
	where ViTri=N'KHU A'
--Cau 9
select TS.MaTS,HoTenTS,CMND,NgaySinh,Gioitinh,DiaChi,LoaiTS,N'KHÓA 6' as Khoa from ThiSinh as TS
	inner join  LichThiChiTiet as LT
	on TS.MaTS=LT.MaTS
	where DiaChi=N'TIỀN GIANG' and  MaLichThi='126'
	order by HoTenTS desc , NgaySinh asc
--Cau 10
select max(MaLichThi) as N'Mã lịch thi',count(MaTS) as N'Số thí sinh' from LichThiChiTiet
	group by MaLichThi

