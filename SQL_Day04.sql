--ALIASES

CREATE TABLE calisan1 (
calisan_id char(9),
calisan_isim varchar(50),
calisan_dogdugu_sehir varchar(50)
);

INSERT INTO calisan1 VALUES(123456789,'Ali Can', 'Istanbul');
INSERT INTO calisan1 VALUES(234567890, 'Veli Cem', 'Ankara');
INSERT INTO calisan1 VALUES(345678901, 'Mine Bulut', 'Izmir');

select * from calisan1;

-- Eğer iki sutunun verilerini birleştirmek istersek concat sembolu || kullanırız
SELECT calisan_id AS id, calisan_isim||' '||calisan_dogdugu_sehir AS calisan_bilgisi FROM calisan1

--2. YOl
SELECT calisan_id AS id, concat (calisan_isim,calisan_dogdugu_sehir) AS calisan_bilgisi FROM calisan1

-- IS NULL CONDITION

CREATE TABLE insanlar1
(
ssn char(9),
name varchar(50),  
adres varchar(50)
);

INSERT INTO insanlar1 VALUES(123456789, 'Ali Can', 'Istanbul');  
INSERT INTO insanlar1 VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO insanlar1 VALUES(345678901, 'Mine Bulut', 'Izmir');  
INSERT INTO insanlar1 (ssn, adres) VALUES(456789012, 'Bursa'); 
INSERT INTO insanlar1 (ssn, adres) VALUES(567890123, 'Denizli');
select * from insanlar1

-- Name sutununda null olan değerleri listeleyelim
SELECT name FROM insanlar1 WHERE name IS NULL

-- Insanlar taplosunda sadece null olmayan değerleri listeleyiniz
SELECT name FROM insanlar1 WHERE name IS NOT NULL

-- Insanlar toplasunda null değer almış verileri no name olarak değiştiriniz
UPDATE insanlar1
SET name='No Name'
WHERE name is null;
drop table if exists insanlar1

-- ORDER BY KOMUTU

/*
Tablolardaki verileri sıralamak için ORDER BY komutu kullanırız
Büyükten küçüğe yada küçükten büyüğe sıralama yapabiliriz
Default olarak küçükten büyüğe sıralama yapar
Eğer BÜYÜKTEN KÜÇÜĞE sıralmak istersek ORDER BY komutundan sonra DESC komutunu kullanırız
*/

CREATE TABLE insanlar1
(
ssn char(9),
isim varchar(50),
soyisim varchar(50),  
adres varchar(50)
);

INSERT INTO insanlar1 VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO insanlar1 VALUES(234567890, 'Veli','Cem', 'Ankara');  
INSERT INTO insanlar1 VALUES(345678901, 'Mine','Bulut', 'Ankara');  
INSERT INTO insanlar1 VALUES(256789012, 'Mahmut','Bulut', 'Istanbul'); 
INSERT INTO insanlar1 VALUES (344678901, 'Mine','Yasa', 'Ankara');  
INSERT INTO insanlar1 VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');
select * from insanlar1


--Insanlar1 tablosundaki datalari adres’e gore siralayin  
SELECT * FROM insanlar1 ORDER BY adres;
SELECT * FROM insanlar1 ORDER BY soyisim;

--Insanlar1 tablosundaki ismi Mine olanlari SSN sirali olarak listeleyin
SELECT * FROM insanlar1 WHERE isim='Mine' ORDER BY ssn

--Not : Order by komutndan sonra field(stun) ismi yerine field (stun) numarasi da kullanilir.

--Insanlar1 tablosundaki soyismi Bulut olanlari isim sirali olarak listeleyin
SELECT * FROM insanlar1 WHERE soyisim='Bulut' ORDER BY 2

--Insanlar1 tablosundaki tum kayitlari SSN numarasini buyukten kucuge siralayin
SELECT * FROM insanlar1 ORDER BY ssn DESC;

--Insanlar1 tablosundaki tum kayitlari isimler Naturel sirali, Soyisimler ters sirali listeleyin
SELECT * FROM insanlar1 ORDER BY isim ASC, soyisim DESC;

-- İsim ve soyisim değerlerini soyisim kelime uzunluklarına göre sıralayınız
/*
Eger stun uzunluguna gore siralamak istersek LENGTH komutu kullaniriz
ve yine uzunlugu buyukten kucuge siralamak istersek sonuna DESC ekleriz
*/
SELECT isim,soyisim FROM insanlar1 ORDER BY LENGTH (soyisim);
SELECT isim,soyisim FROM insanlar1 ORDER BY LENGTH (soyisim) DESC;

-- Tüm isim ve soyisim değerlerini aynı sutunda çağırarak her bir sütun değerini uzunluğuna göre sıralayınız
select isim || ' ' || soyisim  from insanlar1 order by length (isim || soyisim);

select concat(isim,' ',soyisim) as isim_soyisim from insanlar1 order by length (isim)+length (soyisim)

--GROUP BY CLAUSE

/*
Group By komutu sonuçları bir veya daha fazla sütuna göre gruplamak için SELECT
komutuyla birlikte kullanılır.
*/

CREATE TABLE manav
(
isim varchar(50),
Urun_adi varchar(50),
Urun_miktar int
);
INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);

-- Isme gore alinan toplam urunleri bulun
select isim, sum(urun_miktar) AS aldığı_toplam_urun from manav group by isim
order by isim -- isme gore sıralama yaptı

-- Isme gore alinan toplam urunleri bulun ve urunleri büyükten küçüğe listeleyiniz
SELECT isim,sum(urun_miktar) AS aldığı_toplam_urun FROM manav
GROUP BY isim -- isme gore siralama yapti
ORDER BY aldığı_toplam_urun DESC; -- aldigi toplam urune gore ters siralama yapti 

-- Urun adina gore urunu alan toplam kisi sayisi
select urun_adi,count(isim) from manav
group by urun_adi;

select isim,count(urun_adi) from manav
group by isim





