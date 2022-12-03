CREATE TABLE ogrenciler10
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

iNSERT INTO ogrenciler10 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler10 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler10 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler10 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler10 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler10 VALUES(127, 'Mustafa Bak', 'Ali', 99);

select * from ogrenciler10;

-- ismi Nesibe Yilmaz veya Mustafa Bak olan kayıtları silelim.

delete from ogrenciler10 where isim= 'Nesibe Yilmaz' or isim ='Mustafa Bak';

-- Veli'sinin ismi Hasan olan datayi siliniz.

delete from ogrenciler10 where veli_isim='Hasan';

-- Yukarıdaki insert into komutlarını çalıştırarak tabloya tekrar isimler eklendi. 

-- TRUNCATE --
--Bir tablodaki tüm verileri geri alamayacagımız sekilde siler, Şartlı silme yapmaz . 

Truncate table ogrenciler10

select * from ogrenciler10;

-- ON DELETE CASCADE --

/* 
Normalde data silmek için önce "Child Table" dan datayi siler daha sonra parent'dan sileriz ama 
"ON DELETE CASCADE" iliskisi kurulduğunda direk "Parent Table"  dan datayi silebiliriz. Data "Parent"dan 
silindiğinde "Chield" dan da silinir.  
*/

-- Drop Table -- eğer aynı isimde tablo varsa eski tabloyu siler yenisini ekler. ** DROP TABLE if exist talebeler

CREATE TABLE talebeler
(
id CHAR(3) primary key,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

CREATE table notlar1
(
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebeler(id)
	
on delete cascade
);

INSERT INTO talebeler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebeler VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebeler VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebeler VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebeler VALUES(127, 'Mustafa Bak', 'Can',99);

INSERT INTO notlar1 VALUES ('123','kimya',75);
INSERT INTO notlar1 VALUES ('124', 'fizik',65);
INSERT INTO notlar1 VALUES ('125', 'tarih',90);
INSERT INTO notlar1 VALUES ('126', 'Matematik',90);

select * from talebeler;
select * from notlar1;

-- Notlar1 tablosundan talebe_id'si 123 olan datayi silin.(Chield Table-Foreign Key var )

delete from notlar1 where talebe_id='123';

-- Talebeler tablosundan id'si 126 olan datayi siliniz (Parent Table- Primary Key var )

delete from talebeler where id='126'




