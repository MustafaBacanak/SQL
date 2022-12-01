-- DDL - DATA DEFINATION LANG.
-- CREATE - TABLO OLUSTURMA

Create Table ogrenciler 
(
ogrenci_no char(7),
isim varchar(20),
soyisim varchar(25),
not_ort real,
kayit_tarih date	
)

Create Table ogrenci_ortalamaar 
AS 
--Benzer tablodaki başlıklarla ve data tipleriyle yeni bir tablo oluşturmak 
--için normal tablo oluştururkenki parantezler yerine AS kullanıp SELECT 
--komutuyla almak istediğimiz verileri alırız

SELECT isim,soyisim,not_ort FROM ogrenciler;

-- DML - DATAMANUPILATION LANG.
-- INSERT (Database'e veri ekleme)

INSERT INTO ogrenciler VALUES ('1234567','Mustafa','Bacanak',98.6,now());
INSERT INTO ogrenciler VALUES ('1234567','Mustafa','Bacanak',98.6,'2022-12-2');

-- Tabloya parcalı veri ekleme 

INSERT INTO ogrenciler (ogrenci_no,isim,soyisim) VALUES (7654321,'Mustafa','Bugra');

-- DQL - DATA QUERY LANG.
-- SELECT

-- * Herşeyi seçer

SELECT * FROM ogrenciler;

-- Son version
