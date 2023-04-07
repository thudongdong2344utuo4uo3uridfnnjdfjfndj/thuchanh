create table GiaoVien(
	MaGV nvarchar(10) primary key,
	TenGV nvarchar(50),

)
create table Lop(
	MaLop int primary key,
	TenLop nvarchar(50),
	Phong nvarchar(20),
	SiSo int,
	MaGV nvarchar(50)

)
create table SinhVien(
	MaSV nvarchar(10) primary key,
	TenSV nvarchar(100),
	GioiTinh nvarchar(10),
	quequan nvarchar(100),
	malop nvarchar(10)
)
---insert giao vien
insert into GiaoVien(MaGV, TenGV)
values ('GV1','Nguyen thi A')
insert into GiaoVien(MaGV, TenGV)
values ('GV2','Nguyen thi B')
insert into GiaoVien(MaGV, TenGV)
values ('GV3','Nguyen thi C')
---insert lop
insert into Lop(MaLop,TenLop, Phong, SiSo,MaGV )
values ('1','Lop1','Phong1','30','GV1')
insert into Lop(MaLop,TenLop, Phong, SiSo,MaGV )
values ('2','Lop2','Phong2','31','GV2')
insert into Lop(MaLop,TenLop, Phong, SiSo,MaGV )
values ('3','Lop3','Phong3','32','GV3')
---insert sinhvien
insert into SinhVien(MaSV, TenSV, GioiTinh,quequan,malop )
values ('SV1', 'Huynh Van A', 'Nam', 'Long An', '1')
insert into SinhVien(MaSV, TenSV, GioiTinh,quequan,malop )
values ('SV1', 'Huynh Van B', 'Nam', 'Ca Mau', '2')
insert into SinhVien(MaSV, TenSV, GioiTinh,quequan,malop )
values ('SV1', 'Huynh Van C', 'Nam', 'TP HCM', '3')
insert into SinhVien(MaSV, TenSV, GioiTinh,quequan,malop )
values ('SV1', 'Tran Thi A', 'Nu', 'Long An', '1')
insert into SinhVien(MaSV, TenSV, GioiTinh,quequan,malop )
values ('SV1', 'Tran Thi B', 'Nu', 'Long An', '2')
--select
select * from GiaoVien
select * from Lop
select * from SinhVien
---caau 2
CREATE FUNCTION DanhSachSV(@tenLop nvarchar(50), @tenGV nvarchar(50))
RETURNS TABLE
AS
RETURN (
    SELECT sv.MaSV, sv.TenSV, l.TenLop, gv.TenGV
    FROM SinhVien sv
    JOIN Lop l ON sv.malop = l.MaLop
    JOIN GiaoVien gv ON l.MaGV = gv.MaGV
    WHERE l.TenLop = @tenLop AND gv.TenGV = @tenGV
);