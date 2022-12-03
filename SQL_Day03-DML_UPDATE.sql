--        DML UPDATE 


CREATE TABLE tedarikciler -- parent
(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);
INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
INSERT INTO tedarikciler VALUES (102, 'Huawei', 'Çin Li');
INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammen');
INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');

CREATE TABLE urunler1 -- child
(
ted_vergino int, 
urun_id int, 
urun_isim VARCHAR(50), 
musteri_isim VARCHAR(50),
CONSTRAINT fk_urunler FOREIGN KEY(ted_vergino) REFERENCES tedarikciler(vergi_no)
on delete cascade
);   

INSERT INTO urunler1 VALUES(101, 1001,'Laptop', 'Ayşe Can');
INSERT INTO urunler1 VALUES(102, 1002,'Phone', 'Fatma Aka');
INSERT INTO urunler1 VALUES(102, 1003,'TV', 'Ramazan Öz');
INSERT INTO urunler1 VALUES(102, 1004,'Laptop', 'Veli Han');
INSERT INTO urunler1 VALUES(103, 1005,'Phone', 'Canan Ak');
INSERT INTO urunler1 VALUES(104, 1006,'TV', 'Ali Bak');
INSERT INTO urunler1 VALUES(104, 1007,'Phone', 'Aslan Yılmaz');

select * from tedarikciler;
select * from urunler1;

-- Vergi_no’su 102 olan tedarikcinin firma ismini 'Vestel' olarak güncelleyeniz.
/*
UPDATE tablo_adi
SET sutun_ismi = 'istenen veri' WHERE sutun_ismi = 'istenen veri'
*/
Update tedarikciler
Set firma_ismi='Vestel' Where vergi_no=102;


-- Vergi_no’su 101 olan tedarikcinin firma ismini 'Casper' 
-- ve irtibat_ismi 'Ali Veli'  olarak güncelleyeniz.
Update tedarikciler
Set firma_ismi='Casper',irtibat_ismi='Ali Veli' Where vergi_no=101


-- Urunler tablosundaki 'Phone' değerlerini 'Telefon' olarak güncelleyiniz.
Update urunler1
Set urun_isim='Telefon' Where urun_isim='Phone'


-- Urunler tablosundaki urun_id değeri 1004'ten büyük olanların urun_id’sini 1 arttırın.
Update urunler1
Set urun_id=urun_id+1 where urun_id>1004


-- Urunler tablosundaki tüm ürünlerin urun_id değerini 
-- ted_vergino sutun değerleri ile toplayarak guncelleyiniz
Update urunler1
Set urun_id=urun_id + ted_vergino

	-- DELETE FROM tedarikciler
	-- DELETE FROM urunler1  
/*
   İki listeyi de komple sildik ki yukarıda yaptığımız degisiklikler gitsin,
   Daha sonra tekrar en tepedeki eklemeleri yaptık. Yeni soruya geçmek için. 
   Yani tabloların ilk haliyle devam ediyoruz buradan itibaren.
*/   

-- Urunler tablosundan Ali Bak’in aldigi urunun ismini, tedarikci tablosunda irtibat_ismi
-- 'Adam Eve' olan firmanın ismi (firma_ismi) ile degistiriniz
Update urunler1
Set urun_isim = (Select firma_ismi from tedarikciler where irtibat_ismi ='Adam Eve')
Where musteri_isim='Ali Bak'


-- Urunler tablosunda laptop satin alan musterilerin ismini, 
-- firma_ismi Apple’in irtibat_isim'i ile degistirin.
Update urunler1
Set musteri_isim= (Select irtibat_ismi from tedarikciler where firma_ismi='Apple'  )
Where urun_isim='Laptop'




