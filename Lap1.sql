﻿create table Sanpham(
	masp nchar(10) primary key,
	mahangsx nchar(10),
	tensp nvarchar(20),
	soluong int ,
	mausac nvarchar(20),
	giaban money,
	donvitinh nchar(10),
	mota nvarchar(max)
)
create table Hangsx(
	Mahangsx nchar(10) primary key,
	Tenhang nvarchar(20),
	Diachi nvarchar(30),
	Sodt nvarchar(20),
	email Nvarchar(30),
)
create table Nhanvien(
	Manv nchar(10) primary key,
	Tennv nvarchar(20),
	Giotinh nchar(10),
	Diachi nvarchar(30),
	Sodt nvarchar(20),
	email nvarchar(30),
	Phong nvarchar(30),
)
create table Nhap(
	Sohdn nchar(10) primary key,
	Masp nchar(10),
	Manv nchar(10),
	Ngaynhap date,
	soluongN int,
	dongiaN money

)
create table Xuat(
	Sohdx nchar(10) primary key(sohdx,masp),
	Masp nchar(10),
	Manv nchar(10),
	Ngayxuat date,
	soluongX int,
)

--tap rang buoc khoa ngoai
ALTER TABLE Sanpham
ADD FOREIGN KEY (mahangsx) REFERENCES Hangsx(mahangsx);

ALTER TABLE Nhap
ADD FOREIGN KEY (masp) REFERENCES Sanpham(masp);

ALTER TABLE Nhap
ADD FOREIGN KEY (manv) REFERENCES Nhanvien(manv);

ALTER TABLE xuat
ADD FOREIGN KEY (masp) REFERENCES Sanpham(masp);

ALTER TABLE xuat
ADD FOREIGN KEY (manv) REFERENCES Nhanvien(manv);


-- insert vao hangsx
INSERT INTO Hangsx VALUES
('H01', 'Samsung', 'Korea', '011-08271717', 'ss@gmail.com.kr'),
('H02', 'OPPO', 'China', '081-08626262', 'oppo@gmail.com.cn'),
('H03', 'Vinfone', 'Việt Nam', '084-098262626', 'vf@gmail.com.vn');
-- insert vao nhanvien
INSERT INTO Nhanvien VALUES
('NV01', 'Nguyễn Thị Thu', 'Nữ', 'Hà Nội', '0982626521', 'thu@gmail.com', 'Kế toán'),
('NV02', 'Lê Văn Nam', 'Nam', 'Bắc Ninh', '0972525252', 'nam@gmail.com', 'Vật tư'),
('NV03', 'Trần Hòa Bình', 'Nữ', 'Hà Nội', '0328388388', 'hb@gmail.com', 'Kế toán');
-- insert vao sanpham
INSERT INTO Sanpham VALUES
('SP01', 'H02', 'F1 Plus', 100, 'Xám', 7000000, 'Chiếc', 'Hàng cận cao cấp'),
('SP02', 'H01', 'Galaxy Note11', 50, 'Đỏ', 19000000, 'Chiếc', 'Hàng cao cấp'),
('SP03', 'H02', 'F3 lite', 200, 'Nâu', 3000000, 'Chiếc', 'Hàng phổ thông'),
('SP04', 'H03', 'Vjoy3', 200, 'Xám', 1500000, 'Chiếc', 'Hàng phổ thông'),
('SP05', 'H01', 'Galaxy V21', 500, 'Nâu', 8000000, 'Chiếc', 'Hàng cận cao cấp');
-- insert vao nhap
INSERT INTO Nhap VALUES
('N01', 'SP02', 'NV01', '02-05-2019', 10, 17000000),
('N02', 'SP01','NV02','04-07-2020',30,6000000),
('N03', 'SP04','NV02','05-17-2020',20,1200000),
('N04', 'SP01','NV03','03-22-2020',10,6200000),
('N05', 'SP05','NV01','07-07-2020',20,7000000);
-- insert vao xuat
INSERT INTO Xuat VALUES
('X01', 'SP03', 'NV02', '06-14-2020', 5),
('X02', 'SP01', 'NV03', '03-05-2019', 3),
('X03', 'SP02', 'NV01', '12-12-2020', 1),
('X04', 'SP03', 'NV02', '06-02-2020', 2),
('X05', 'SP05', 'NV01', '05-18-2020', 1);