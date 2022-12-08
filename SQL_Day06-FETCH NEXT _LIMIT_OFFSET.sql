-- 		DISTINCT
-- DISTINCT clause, çağrılan terimlerden tekrarlı olanların sadece birincisini alır.

CREATE TABLE musteri_urun 
(
urun_id int, 
musteri_isim varchar(50),
urun_isim varchar(50) 
);
INSERT INTO musteri_urun VALUES (10, 'Ali', 'Portakal'); 
INSERT INTO musteri_urun VALUES (10, 'Ali', 'Portakal'); 
INSERT INTO musteri_urun VALUES (20, 'Veli', 'Elma'); 
INSERT INTO musteri_urun VALUES (30, 'Ayse', 'Armut'); 
INSERT INTO musteri_urun VALUES (20, 'Ali', 'Elma'); 
INSERT INTO musteri_urun VALUES (10, 'Adem', 'Portakal'); 
INSERT INTO musteri_urun VALUES (40, 'Veli', 'Kaysi'); 
INSERT INTO musteri_urun VALUES (20, 'Elif', 'Elma');


-- Musteri urun tablosundan urun isimlerini tekrarsız(grup) listeleyiniz

--Group By Cozumu 
select urun_isim from musteri_urun
group by urun_isim

--Distinct Cozumu 
select distinct (urun_isim) from musteri_urun

-- Tabloda kac farkli meyve vardir ?
select distinct (urun_isim) from musteri_urun

-- FETCH NEXT (SAYI) ROW ONLY- OFFSET

-- Musteri urun tablosundan ilk 3 kaydi listeleyiniz.

-- Fetch Next & Row Only Cozumu
SELECT * FROM musteri_urun
ORDER BY urun_id
FETCH NEXT 3 ROW ONLY

-- Limit Cozumu 
SELECT * FROM musteri_urun
ORDER BY urun_id
LIMIT 3

-- 1) Tabloyu urun_id ye gore siralayiniz
-- 2) Sirali tablodan ilk 3 kaydi listeleyin
-- 3) Sirali tablodan 4. kayittan 7.kayida kadar olan kayitlari listeleyin


CREATE TABLE maas
(
id int,
musteri_isim varchar(50),
maas int
);
INSERT INTO musteri_urun VALUES (10, 'Ali', 5000);
INSERT INTO musteri_urun VALUES (10, 'Ali', 7500);
INSERT INTO musteri_urun VALUES (20, 'Veli', 10000);
INSERT INTO musteri_urun VALUES (30, 'Ayse', 9000);
INSERT INTO musteri_urun VALUES (20, 'Ali', 6500);
INSERT INTO musteri_urun VALUES (10, 'Adem', 8000);
INSERT INTO musteri_urun VALUES (40, 'Veli', 8500);
INSERT INTO musteri_urun VALUES (20, 'Elif', 5500);

--En yüksek maası alan müsteriyi listeleyiniz 
select * from maas 
order by maas desc 

--En yüksek maası alan 2. müsteriyi listeleyiniz 
select * from mmaas 
order by maas desc 
offset 1 limit 1 

--En düşük maası alan 4. müsteriyi listeleyiniz 

select * from mmaas 
order by maas  
offset 3 limit 1 
