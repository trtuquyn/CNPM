use master
if exists (select * from sysdatabases where name = 'cnpm')
	drop database cnpm
go
create database cnpm
go
use cnpm
go
create table TaiKhoan(
    ID	    INT	identity (1,1)  NOT NULL primary key, 
    TenTK   NVARCHAR (50) not null,
    VaiTro  nvarchar (50) not null,
    MK      varCHAR (50) not null,
);

create table KhachHang (
    MaKH    int identity (1,1) not null primary key, 
    TenKH   nvarchar(50) not null,
    SDT     varchar(10) not null,
    Email   nvarchar(30),
    DiaChi  nvarchar (50) not null, 
);

create table LoaiSP(
    MaLoai  varchar(10) not null primary key,
    TenLoai nvarchar(50) not null,
);

create table SanPham(
    maloai  varchar(10) foreign key references LoaiSP not null,
    MaSP    varchar(50) not null primary key,
    TenSP   nvarchar(1000) not null,
    MoTa    nvarchar(4000),
    GiaBan  float default 0 not null,
    Hinh    nvarchar(50),
);

create table HoaDon(
    MaHD        int identity (1,1) not null primary key,
    makh        int foreign key references KhachHang not null,
    NgayDat     date not null,
    NgayGiao    date not null,
    DiaChiGiao  nvarchar(50) not null,  
    TongTien    float default 0 not null,
    TinhTrang   nvarchar(50),
);

create table CTHD (
    mahd      int references HoaDon not null,
    masp      varchar (50) references SanPham not null,
    SoLuong   int not null,
    DonGia    float default 0 not null,
    ThanhTien float default 0 not null,
    primary key (mahd, masp)
);
use cnpm
ALTER TABLE KhachHang
		ADD tentk varchar(50), mk nvarchar(50)

use cnpm
--Tài khoản
insert into TaiKhoan(TenTK, VaiTro, MK) values ('quyen', N'Quản lý', 'quin887')
Insert into TaiKhoan values ('tuong', N'Nhân viên', '12345678')

--Khách hàng
Insert into KhachHang(tentk,TenKH, SDT, Email, DiaChi, mk)	
values ('tu' ,N'Nguyễn Minh Tú', '0908070605', 'minhtunguyen@gmail.com', N'TP HCM', '123456789')

--Loại SP
insert into LoaiSP (MaLoai, TenLoai) values ('at', N'Ẩm thực')
insert into LoaiSP values ('dl', N'Du lịch')
insert into LoaiSP values ('hs', N'Hotel & Resort')
insert into LoaiSP values ('spa', N'Spa & Làm đẹp')
insert into LoaiSP values ('gt', N'Giải trí & Thể thao')
insert into LoaiSP values ('nk', N'Nha khoa')

--Sản Phẩm
insert into SanPham (maloai, MaSP, TenSP, MoTa, GiaBan, Hinh)
values ('dl','DL02', N'Tour Trekking Tà Đùng 2N2Đ - Thực Đơn Hấp Dẫn', N'Tour Trekking Tà Đùng 2N2Đ - Du Sơn Ngoạn Thủy - Thực Đơn Hấp Dẫn. Voucher 5,900,000 VNĐ, Còn 2,690,000 VNĐ, Giảm 54%.', 2690000, 'tadung.jpg')
