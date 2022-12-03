-- IN CONDITIONS 

Create TABLE  musteriler5 
(
urun_id int,
musteri_isim varchar(50), urun_isim varchar(50)
);

INSERT INTO musteriler5 VALUES (10, 'Mark', 'Orange');
INSERT INTO musteriler5 VALUES (10, 'Mark', 'Orange');
INSERT INTO musteriler5 VALUES (20, 'John', 'Apple');
INSERT INTO musteriler5 VALUES (30, 'Amy', 'Palm');
INSERT INTO musteriler5 VALUES (20, 'Mark', 'Apple');
INSERT INTO musteriler5 VALUES (10, 'Adem', 'Orange');
INSERT INTO musteriler5 VALUES (40, 'John', 'Apricot');
INSERT INTO musteriler5 VALUES (20, 'Eddie', 'Apple');

Select * From musteriler5

-- Musteriler tablosundan urun ismi orange,apple veya apricot olan tüm verileri listeleyiniz

Select * from musteriler5 where urun_isim='Orange' OR urun_isim='Apple' OR urun_isim='Apricot'

-- IN CONDITION > Yazdıgımız verileri getirir
Select * from musteriler5 where urun_isim IN('Orange','Apple','Apricot')


-- Musteriler tablosundan urun ismi orange,apple veya apricot dısındaki tüm verileri listeleyiniz

-- NOT IN CONDITION > Yazdıgımız veriler dısındakileri getirir
Select * from musteriler5 where urun_isim NOT IN('Orange','Apple','Apricot')


-- Musteriler tablosundan urun_id'si 20 ile 40 arasında olan tüm verileri listeleyiniz

Select * from musteriler5 Where urun_id>=20 and urun_id<=40

-- BETWEEN CONDITION > iki mantiksal ifade ile tanimlayabilecegimiz durumlari tek komutla
--                     yazabilme imkani verir. Yazdigimiz 2 sinirda araliga dahildir 

Select * from musteriler5 Where urun_id Between 20 and 40


-- NOT BETWEEN > Aralık dısındakileri getirir. 

Select * from musteriler5 Where urun_id Not Between 20 and 40




