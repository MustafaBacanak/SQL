-- 									SUBQUERIES
-- SUBQUERY baska bir SORGU(query)’nun icinde calisan SORGU’dur

CREATE TABLE calisanlar2
(
id int,
isim VARCHAR(50),
sehir VARCHAR(50),
maas int,
isyeri VARCHAR(20)
);
INSERT INTO calisanlar2 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar2 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar2 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar2 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar2 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');

CREATE TABLE markalar
(
marka_id int,
marka_isim VARCHAR(20),
calisan_sayisi int
);
INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);
INSERT INTO markalar VALUES(104, 'Nike', 19000);

SELECT * FROM calisanlar2;
SELECT * FROM markalar;

-- Çalisan sayisi 15.000’den cok olan markalarin isimlerini 
-- ve bu markada calisanlarin isimlerini ve maaşlarini listeleyin.

SELECT isim,maas,isyeri FROM calisanlar2
WHERE isyeri in ( SELECT marka_isim FROM markalar WHERE calisan_sayisi>15000);

/*
	2.Tabloya daha sonradan "Nike - 19000" verisi eklenmesine rağmen 
	1.Tabloda böyle bir veri yer almadığı icin 
	Select koşulunu sağlamadı ve veriyi çekemedik.
*/

-- Marka_id’si 101’den büyük olan marka çalişanlarinin isim, maaş ve şehirlerini listeleyiniz.

Select isim,maas,sehir From calisanlar2
Where isyeri in (Select marka_isim from markalar where marka_id>101 )

-- ÖDEV- Ankara’da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyiniz.

Select marka_id,calisan_sayisi from markalar
Where marka_isim in (Select isyeri from calisanlar2 where sehir='Ankara')




