create database QuanlySinhVien;
create table SV(
	MaSV int primary key,
	TenSV nvarchar(50),
	Que nvarchar(50)
);
create table mon(
	MaMH nvarchar(50) primary key,
	TenMH nvarchar(50),
	Sotc int
);
CREATE TABLE KQ (
    MaSV INT,                  
    MaMH nvarchar(50),         
    Diem DECIMAL(4, 2),        
    PRIMARY KEY (MaSV, MaMH),  
    FOREIGN KEY (MaSV) REFERENCES SV(MaSV),  
    FOREIGN KEY (MaMH) REFERENCES mon(MaMH)  
);

SELECT *from KQ