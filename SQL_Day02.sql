Create Table ogrenciler 
(
ogrenci_no char(7),
isim varchar(20),
soyisim varchar(25),
not_ort real,
kayit_tarih date	
)

--Varolan bir tablodan yeni bir tablo olusturma

Create table notlar
as
select isim,not_ort from ogrenciler;

select * from notlar;

-- INSERT TABLO ICINE VERI EKLEME

INSERT INTO notlar VALUES ('Osman',95.5);
INSERT INTO notlar VALUES ('Sumeyye',95.5);
INSERT INTO notlar VALUES ('Salih',95.5);
INSERT INTO notlar VALUES ('Hakan',95.5);
INSERT INTO notlar VALUES ('Adem',95.5);
select * from notlar;
	
-- CONSTRAINT
-- UNIQUE
-- NOT NULL

CREATE TABLE ogrenciler2
(
ogrenci_no char(7) unique,
isim varchar(20) not null,
soyisim varchar(25),
not_ort real,
kayit_tarih date
);
select * from ogrenciler2;

INSERT INTO ogrenciler2 VALUES ('1234567','Mustafa','Bacanak',98.5,now());
INSERT INTO ogrenciler2 VALUES ('1234568','Mustafa','Bugra',98.5,now());
Insert into ogrenciler2 (ogrenci_no,soyisim,not_ort) values ('1234569','Mustafa',85.9);--Hata
--Cunku not Null veriyi kullanmadan olusturamadık.

-- PRIMARY KEY ataması

CREATE TABLE ogrenciler3
(
ogrenci_no char(7) primary key,
isim varchar(20),
soyisim varchar(25),
not_ort real,
kayit_tarih date
);

-- Primary Key ataması 2.Yol 

CREATE TABLE ogrenciler4
(
ogrenci_no char(7),
isim varchar(20),
soyisim varchar(25),
not_ort real,
kayit_tarih date,
Constraint ogr Primary key(ogrenci_no)	
);

-- Practice 4:
/* “tedarikciler3” isimli bir tablo olusturun. Tabloda “tedarikci_id”, “tedarikci_ismi”, “iletisim_isim” field’lari olsun ve “tedarikci_id” yi Primary Key yapin.
“urunler” isminde baska bir tablo olusturun “tedarikci_id” ve “urun_id” field’lari olsun ve
“tedarikci_id” yi Foreign Key yapin.
*/

Create table tedarikciler3
(
	tedarikci_id char(12) primary key,
	tedarikci_ismi varchar(18),
	iletisim_isim varchar(22)
)

Create table urunler
(
tedarikci_id varchar(25),
urun_id varchar(28), 
foreign key (tedarikci_id) references tedarikciler3(tedarikci_id)
);

select * from tedarikciler3;
select * from  urunler;

-- Practice
/*
“calisanlar” isimli bir Tablo olusturun. Icinde “id”, “isim”, “maas”, “ise_baslama” field’lari olsun. 
“id” yi Primary Key yapin, “isim” i Unique, “maas” i Not Null yapın.
“adresler” isminde baska bir tablo olusturun.Icinde “adres_id”, “sokak”, 
“cadde” ve “sehir” fieldlari olsun. “adres_id” field‘i ile Foreign Key oluşturun.
*/

create table calisanlar
(
id varchar(15) primary key,
isim varchar(30) unique,
maas int not null,
ise_baslama date
)

CREATE TABLE adresler
(
adres_id varchar(30),
sokak varchar(30),
cadde varchar(30),
sehir varchar(30),
FOREIGN KEY (adres_id) REFERENCES calisanlar(id)
);

INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', Mehmet Yılmaz, 5000, '2018-04-14');--Unique cons. Kabul etmez
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12');--not null cons. kabul etmez
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14');--Unique cons. Kabul etmez
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14');-- int old icin string girilmez 
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14');--primary
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14');--primary
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14');--Primary key null
INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');
-- Parent tabloda olmayan id ile child a ekleme yapamayiz
INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep');
-- FK'ye null değeri atanabilir.
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Maraş');

select * from calisanlar;
select * from adresler;


-- Check Cons.

create table calisanlar1
(
id varchar(15) primary key,
isim varchar(30) unique,
maas int check (maas>10000),
ise_baslama date
);

INSERT INTO calisanlar1 VALUES('10002', 'Mehmet Yılmaz' ,9000, '2018-04-14'); -- Check hatası (maas<10000)
INSERT INTO calisanlar1 VALUES('10002', 'Mehmet Yılmaz' ,19000, '2018-04-14');

-- DQL -- Where kullanimi 

select * from calisanlar;
select isim  from calisanlar;

-- Calisanlar tablosundan maasi 5000 den buyuk olan isimleri listeleyiniz

select isim,maas from calisanlar where maas>5000;

-- Calisanlar tablosundan ismi veli Han olan tum verileri listeleyiniz 

Select * from calisanlar where isim='Veli Han';

-- Calisanlar tablosundan maası 5000 olan tum verileri listeleyiniz 

Select * from calisanlar where maas =5000;

-- Dml --  Delete komutu 

Delete from calisanlar; -- Eger parent table baska bir child table'a baglıysa önce child table silinmelidir.

--delete from adresler; -- Once Cocuk sonra parent silinebilir. 

--Adresler tablosundan sehri Antep olan verileri sil.

Delete from adresler where sehir='Antep';


-- ismi Nesibe Yilmaz veya Mustafa Bak olan kayıtları silelim.

CREATE TABLE ogrenciler5
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

INSERT INTO ogrenciler5 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler5 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler5 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler5 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler5 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler5 VALUES(127, 'Mustafa Bak', 'Ali', 99);

select * from ogrenciler5;

Delete from ogrenciler5 where isim ='Nesibe Yilmaz' or isim='Mustafa Bak';

select * from ogrenciler5;


	




	
