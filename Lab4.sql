----------------2---------------
create view lab2cau2 as 
SELECT masp, tensp, tenhang, soluong, mausac, giaban, donvitinh, mota
FROM Sanpham sp
inner join Hangsx hsx
on sp.mahangsx = hsx.mahangsx
--------------3--------------------------
create view lab2cau3 as 
SELECT sp.*, hsx.tenhang, hsx.sodt, hsx.email, hsx.diachi
FROM sanpham sp
inner join Hangsx hsx
on sp.mahangsx = hsx.mahangsx
WHERE hsx.tenhang = 'Samsung'
---------------4------------------------------------
create view lab2cau4 as 
SELECT *
FROM nhanvien
WHERE gioitinh = 'Nữ' AND phong = 'Kế toán'
-------------------------------------5-----------------------------------
create view lab2cau5 as 
SELECT sohdn, nh.masp, tensp, tenhang, soluongN, dongiaN, tiennhap=soluongN*dongiaN, mausac, donvitinh, ngaynhap, tennv, phong
from Nhap nh
inner join Sanpham sp on nh.masp = sp.masp
inner join Hangsx hsx on sp.mahangsx = hsx.mahangsx
inner join Nhanvien nv on nh.manv = nv.manv

---------------6------------------------------------------
create view lab2cau6 as 
SELECT Xuat.sohdx, Sanpham.masp, Sanpham.tensp, Hangsx.tenhang, Xuat.soluongX, Sanpham.giaban, 
       Xuat.soluongX*Sanpham.giaban AS tienxuat, Sanpham.mausac, Sanpham.donvitinh, Xuat.ngayxuat, 
       Nhanvien.tennv, Nhanvien.phong
FROM Xuat
INNER JOIN Sanpham ON Xuat.masp = Sanpham.masp
INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
INNER JOIN Nhanvien ON Xuat.manv = Nhanvien.manv
WHERE MONTH(Xuat.ngayxuat) = 10 AND YEAR(Xuat.ngayxuat) = 2018
-------------------7-----------------------------------
create view lab2cau7 as 
SELECT sohdn, Sanpham.masp, tensp, soluongN, dongiaN, ngaynhap, tennv, phong
FROM Nhap 
JOIN Sanpham ON Nhap.masp = Sanpham.masp 
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
JOIN Nhanvien ON Nhap.manv = Nhanvien.manv
WHERE Hangsx.tenhang = 'Samsung' AND YEAR(ngaynhap) = 2017;
---------------------------8-----------------------------
create view lab2cau8 as 
SELECT TOP 10 Xuat.sohdx, Sanpham.tensp, Xuat.soluongX
FROM Xuat 
INNER JOIN Sanpham ON Xuat.masp = Sanpham.masp
WHERE YEAR(Xuat.ngayxuat) = '2023' 
-------------------------9-----------------------------
create view lab2cau9 as 
SELECT TOP 10 tenSP, giaBan
FROM SanPham
---------------------10-----------------------------------
create view lab2cau10 as 
SELECT Sanpham.*, Hangsx.sodt, Hangsx.tenhang, Hangsx.email, Hangsx.diachi
FROM Sanpham
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
WHERE Hangsx.tenhang = 'Samsung' AND Sanpham.giaban >= 100000 AND Sanpham.giaban <= 500000
--------------------11---------------------------------------
create view lab2cau11 as 
SELECT SUM(soluongN * dongiaN) AS tongtien
FROM Nhap
JOIN Sanpham ON Nhap.masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
WHERE Hangsx.tenhang = 'Samsung' AND YEAR(ngaynhap) = 2018
----------------------12---------------------------------------
create view lab2cau12 as 
SELECT SUM(Xuat.soluongX * Sanpham.giaban) AS Tongtien
FROM Xuat
INNER JOIN Sanpham ON Xuat.masp = Sanpham.masp
WHERE Xuat.ngayxuat = '2018-09-02'
-----------------13------------------------
create view lab2cau13 as 
SELECT TOP 1 sohdn, ngaynhap, dongiaN
FROM Nhap
-----------------------14------------------------------------
create view lab2cau14 as 
SELECT TOP 10 Sanpham.tensp, SUM(Nhap.soluongN) AS TongSoLuongN 
FROM Sanpham 
INNER JOIN Nhap ON Sanpham.masp = Nhap.masp 
WHERE YEAR(Nhap.ngaynhap) = 2019 
GROUP BY Sanpham.tensp 
ORDER BY TongSoLuongN DESC
-----------------------15---------------------------------
create view lab2cau15 as 
SELECT Sanpham.masp, Sanpham.tensp
FROM Sanpham
INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
INNER JOIN Nhap ON Sanpham.masp = Nhap.masp
INNER JOIN Nhanvien ON Nhap.manv = Nhanvien.manv
WHERE Hangsx.tenhang = 'Samsung' AND Nhanvien.manv = 'NV01';
-------------------16-----------------------------
create view lab2cau16 as 
SELECT sohdn, masp, soluongN, ngaynhap
FROM Nhap
WHERE masp = 'SP02'------------------------
create view lab2cau17 as 
SELECT Nhanvien.manv, Nhanvien.tennv
FROM Nhanvien
JOIN Xuat ON Nhanvien.manv = Xuat.manv
WHERE Xuat.masp = 'SP02' AND Xuat.ngayxuat = '2020-03-02'