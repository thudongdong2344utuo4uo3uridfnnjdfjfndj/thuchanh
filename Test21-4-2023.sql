----------------Cau 1----------------------------
Create database QLKHO;

Create table Ton(
	MaVT nvarchar(10) primary key,
	TenVT nvarchar(50),
	SoLuongT int
);

Create table Nhap(
	SoHDN int primary key,
	MaVT nvarchar(10) foreign key references Ton(MaVT),
	SoLuongN int,
	DonGiaN int,
	NgayN date
);

Create table Xuat(
	SoHDX int primary key,
	MaVT nvarchar(10) foreign key references Ton(MaVT),
	SoLuongX int,
	DonGiaX int,
	NgayX date
);
-------------thêm 3 mặt hàng vào bảng ton---------------------
INSERT INTO Ton(MaVT, TenVT, SoLuongT) VALUES ('VT01', 'Vật tư 1', 200);
INSERT INTO Ton(MaVT, TenVT, SoLuongT) VALUES ('VT02', 'Vật tư 2', 300);
INSERT INTO Ton(MaVT, TenVT, SoLuongT) VALUES ('VT03', 'Vật tư 3', 400);

----------------thêm 3 phiếu nhập vào bảng nhập--------------------------
INSERT INTO Nhap(SoHDN, MaVT, SoLuongN, DonGiaN, NgayN) 
VALUES (1, 'VT01', 70, 90000, '2022-01-17');
INSERT INTO Nhap(SoHDN, MaVT, SoLuongN, DonGiaN, NgayN) 
VALUES (2, 'VT02', 90, 89000, '2022-01-17');
INSERT INTO Nhap(SoHDN, MaVT, SoLuongN, DonGiaN, NgayN) 
VALUES (3, 'VT03', 100, 87000, '2022-01-17');

----------------thêm 4 phiếu xuất vào bảng xuất-------------------------
INSERT INTO Xuat(SoHDX, MaVT, SoLuongX, DonGiaX, NgayX) 
VALUES (1, 'VT02', 10, 90000, '2022-01-17');
INSERT INTO Xuat(SoHDX, MaVT, SoLuongX, DonGiaX, NgayX) 
VALUES (2, 'VT02', 20, 89000, '2022-01-17');
INSERT INTO Xuat(SoHDX, MaVT, SoLuongX, DonGiaX, NgayX) 
VALUES (3, 'VT03', 30, 87000, '2022-01-17');
INSERT INTO Xuat(SoHDX, MaVT, SoLuongX, DonGiaX, NgayX) 
VALUES (4, 'VT01', 40, 90000, '2022-01-18');

select * from Ton
select * from Nhap
select * from Xuat


---------------------Cau 2------------------------------

CREATE FUNCTION ThongKeTienBan(@MaVT nvarchar(10), @NgayX date)
RETURNS TABLE
AS
RETURN
SELECT Ton.MaVT, Ton.TenVT, SUM(Xuat.SoLuongX * Xuat.DonGiaX) AS Tienban
FROM Xuat
INNER JOIN Ton ON Xuat.MaVT = Ton.MaVT
WHERE Ton.MaVT = @MaVT AND Xuat.NgayX = @NgayX
GROUP BY Ton.MaVT, Ton.TenVT

SELECT * FROM ThongKeTienBan('VT02', '2022-01-17')

------------------Cau 3-------------------------
CREATE FUNCTION ThongKeTongTienNhap(@MaVT nvarchar(10), @NgayN date)
RETURNS TABLE
AS
RETURN
SELECT Ton.MaVT, Ton.TenVT, SUM(Nhap.SoLuongN * Nhap.DonGiaN) AS Tiennhap
FROM Nhap
INNER JOIN Ton ON Nhap.MaVT = Ton.MaVT
WHERE Ton.MaVT = @MaVT AND Nhap.NgayN = @NgayN
GROUP BY Ton.MaVT, Ton.TenVT

SELECT * FROM ThongKeTongTienNhap('VT01', '2022-01-17')

-------------------Câu 4-----------------------------
CREATE TRIGGER tr_Nhap_Insert
ON Nhap
FOR INSERT
AS
BEGIN
    DECLARE @MaVT nvarchar(10)
    DECLARE @SoLuongN int

    SELECT @MaVT = MaVT, @SoLuongN = SoLuongN
    FROM inserted

    IF EXISTS(SELECT 1 FROM Ton WHERE MaVT = @MaVT)
    BEGIN
        UPDATE Ton SET SoLuongT = SoLuongT + @SoLuongN WHERE MaVT = @MaVT
    END
    ELSE
    BEGIN
        ROLLBACK TRAN
        RAISERROR ('Mã VT chưa có mặt trong bảng Ton', 16, 1)
    END
END
INSERT INTO Nhap (SoHDN, MaVT, SoLuongN, DonGiaN, NgayN) VALUES (1, 'VT04', 60, 100000, '2022-01-17');

