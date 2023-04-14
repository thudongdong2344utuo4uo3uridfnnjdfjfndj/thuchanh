----------a.Thêm dữ liệu cho bảng Nhanvien:

INSERT INTO dbo.Nhanvien (manv, tennv, giotinh, diachi, sodt, email, phong)
VALUES ('NV11', N'Tran Van A', N'Nam', N'Long An', '0922655842', 'tva@gmail.com', N'Kế toán')

--------Thực hiện full backup:

BACKUP DATABASE quanlibanhang TO DISK = 'C:\bk\quanlibanhang.bak' WITH INIT


 ---------b. Thêm dữ liệu cho bảng NhanVien:

INSERT INTO dbo.Nhanvien (manv, tennv, giotinh, diachi, sodt, email, phong)
VALUES ('NV12', N'Nguyen Thi C', N'Nu', N'Ho Chi Minh', '0956239855', 'ndv@gmail.com', N'Thủ kho')


---------------Thực hiện different backup:

BACKUP DATABASE quanlibanhang TO DISK = 'C:\bk\quanlibanhang.bak' WITH DIFFERENTIAL


---------------------------c. Thêm dữ liệu cho bảng Nhanvien:

INSERT INTO dbo.Nhanvien (manv, tennv, giotinh, diachi, sodt, email, phong)
VALUES ('NV23', N'Nguyen Tran Q', N'Nam', N'Vĩnh Long', '0956659241', 'ntddd@gmail.com', N'Thủ kho')

-----------------------Thực hiện log backup lần 1:

BACKUP LOG quanlibanhang TO DISK = 'C:\bk\quanlibanhang.bak' WITH INIT

------------------------d. Thêm dữ liệu cho bảng Nhanvien:

INSERT INTO dbo.Nhanvien (manv, tennv, giotinh, diachi, sodt, email, phong)
VALUES ('NV41', N'Ho Thi C', N'Nu', N'Nam Dinh', '0945951171', 'htc@gmal.com', N'Kế Toán')


--------------------------Thực hiện log backup lần 2:

BACKUP LOG quanlibanhang TO DISK = 'C:\bk\quanlibanhang.bak' WITH INIT

---------------------câu 2a----------------------
DROP DATABASE quanlibanhang

---------------------Câu 2b----------------------------------------------
RESTORE DATABASE quanlibanhang FROM DISK = 'C:\bk\quanlibanhangbak' WITH STANDBY = 'C:\bk\quanlibanhang.bak'