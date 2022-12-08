/*
					DDL - ALTER TABLE STATEMENT
					
	ALTER TABLE statement tabloda add, Type(modify)/Set, Rename veya drop columns
	islemleri icin kullanilir.
	ALTER TABLE statement tablolari yeniden isimlendirmek icin de kullanilir.
 */
 
CREATE TABLE personel
(
id int,
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20),
CONSTRAINT personel_pk PRIMARY KEY (id)
);
INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
INSERT INTO personel VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');
select * from personel

/*
	Default yazmadan ekleme yaparsak fieldlere "null"  degerler ekler
	Default yazarsak fieldlere belirttigimiz degerleri ekler 
*/

--	 1) ADD default deger ile tabloya bir field ekleme

alter table personel
add ulke varchar (30) 

alter table personel 
add adres varchar(50) default 'Turkiye'


--	 2) DROP tablodan sutun silme

alter table personel
drop column ulke

alter table personel
drop ulke,drop adres


-- 	4) RENAME COLUMN sutun adi degistirme

alter table personel
rename column sehir to il

alter table personel
rename il to sehir


-- 	5) RENAME COLUMN tablonun ismini degistirme

ALTER TABLE personel
RENAME TO isci

ALTER TABLE isci
RENAME TO personel


-- 6) TYPE/SET (modify) sutunlarin ozelliklerini degistirme

alter table personel 
alter column sehir type varchar(30),
alter column maas set not null;

/*
	Eğer numeric data türüne sahip bir sütunun data türüne String bir data 
	türü atamak istersek
	TYPE varchar(30) USING (maas::varchar(30)) bu formati kullaniriz.
*/

alter table personel
alter column maas
type varchar(30) using (maas::varchar(30))