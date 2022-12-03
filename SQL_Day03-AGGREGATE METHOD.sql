	-- 							AGGREGATE METOT KULLANIMI

	/*
	Aggregate Metotlari (SUM,COUNT, MIN, MAX, AVG) Subquery içinde
	kullanilabilir.
	Ancak, Sorgu tek bir değer döndürüyor olmalidir.
	SYNTAX: sum() şeklinde olmalı sum ile () arasında boşluk olmamalı
	*/

	CREATE TABLE calisanlar3
	(
	id int,
	isim VARCHAR(50),
	sehir VARCHAR(50),
	maas int,
	isyeri VARCHAR(20)
	);
	INSERT INTO calisanlar3 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
	INSERT INTO calisanlar3 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
	INSERT INTO calisanlar3 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
	INSERT INTO calisanlar3 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
	INSERT INTO calisanlar3 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
	INSERT INTO calisanlar3 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
	INSERT INTO calisanlar3 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');
	INSERT INTO calisanlar3 VALUES(123456710, 'Fatma Yasa', 'Bursa', null, 'Vakko');
	
	CREATE TABLE markalar1
	(
	marka_id int,
	marka_isim VARCHAR(20),
	calisan_sayisi int
	);
	INSERT INTO markalar1 VALUES(100, 'Vakko', 12000);
	INSERT INTO markalar1 VALUES(101, 'Pierre Cardin', 18000);
	INSERT INTO markalar1 VALUES(102, 'Adidas', 10000);
	INSERT INTO markalar1 VALUES(103, 'LCWaikiki', 21000);
	INSERT INTO markalar1 VALUES(104, 'Nike', 19000);


	-- Calisanlar toplasundan maksimum maası listeleyelim
	SELECT max(maas) AS maksimum_maas FROM calisanlar3;
	/*
		Eğer bir sutuna geçici olarak bir isim vermek istersek AS komutunu yazdıktan sonra
	vermek istediğimiz ismi yazarız
	*/

	-- Calisanlar toplasundan en dusuk maası listeleyelim
	Select min (maas) as en_dusuk_maas from calisanlar3;

	-- Calisanlar toplasundan maaslarin toplamini listeleyelim
	select sum(maas) from calisanlar3

	-- Calisanlar tablosundaki maas'larin ortalamasini listeleyiniz.
	select avg(maas) from calisanlar3
	select round(avg(maas),2) from calisanlar3 -- yüzdelik kısmı atar ( decimal format gibi)

	-- Calisanlar tablosundaki maas'larin sayisini listeleyiniz 
	Select count(maas) as maas_sayisi from calisanlar3
	Select count(*) as maas_sayisi from calisanlar3
	
	/*
	Eğer count(*) kullanırsak tablodaki tüm satırların sayısını verir
	Sutun adı kullanırsak o sutundaki sayıları verir
	*/
	
	-- 				AGGRATE METHODLARDA SUBQUERY
	
	-- Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu listeleyen bir SORGU yaziniz
	
	SELECT marka_id,marka_isim,
    (SELECT count(sehir) as sehir_sayisi FROM calisanlar3 WHERE marka_isim=isyeri)
    FROM markalar1;
	
	
	-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin toplam maaşini listeleyiniz
	
	Select marka_isim,calisan_sayisi,
	(Select sum (maas) from calisanlar3 where isyeri=marka_isim) as toplam_maas
	From markalar1;
	
	
	-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin 
	-- maksimum ve minumum maaşini listeleyen bir Sorgu yaziniz.
	
	Select marka_isim,calisan_sayisi, 
	(Select max(maas) from calisanlar3 where isyeri=marka_isim) as max_maas,
	(Select min(maas) from calisanlar3 where isyeri=marka_isim) as min_maas
	from markalar1;
	
	-- VIEW KULLANIMI > Metod Olusturma gibi birsey 
	
	/*
	Yaptigimiz sorgulari hafizaya alir ve tekrar bizden istenen sorgulama yerine
	view'e atadigimiz ismi SELECT komutuyla cagiririz
	*/
	
	CREATE View maxminmaas
	as
	Select marka_isim,calisan_sayisi, 
	(Select max(maas) from calisanlar3 where isyeri=marka_isim) as max_maas,
	(Select min(maas) from calisanlar3 where isyeri=marka_isim) as min_maas
	from markalar1;
	
	SELECT * FROM maxminmaas;	
	
	




