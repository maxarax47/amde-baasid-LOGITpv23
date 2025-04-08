--komentaar
--Xampp control panel
--Conect TO:
--Server Name: localhost - 1270.0.1
-- Authentification:
-- kasutaja: root
-- parool: ei ole
1. Windows Auth - (localdb) admini õigused

-----------------------------
CREATE DATABASE plohhotnitsenkoLOGITpv23;
USE plohhotnitsenkoLOGITpv23;

--taabeli loomine
--AUTO_INCREMENT - ise täidab tabeli 1,2,3...
CREATE TABLE inimene(
inimeneID int Primary Key identity(1,1),
nimi varchar(50) unique, 
sunniaeg date,
telefon char(12),
pikkus decimal(5,2),
opilasekodu bit
);
SELECT * FROM inimene;
--tabeli kustutamine
DROP table inimene;
------
INSERT INTO inimene
(nimi, sunniaeg, telefon, pikkus, opilasekodu)
VALUES
('Valeri Smirnov', '2015-11-20', '2532952', 150.5, 0 ),
('Kirill Tamm', '2007-10-02', '7658952',	180.3, 1 ),
('Dmitri Kozlov', '2006-7-03', '2568677', 167.5, 1 ),
('Kasper Leht', '2012-01-10', '2788952', 160.3, 0 );
SELECT * FROM inimene;
--Kustuta id=3
DELETE FROM inimene 
WHERE inimeneID=3;
--tabel elukoht
CREATE TABLE elukoht (
elukohtID int PRIMARY KEY identity (1,1),
elukoht varchar(50) UNIQUE,
maakond varchar(50)
);
SELECT * FROM elukoht;
-- andmete lisamine tabeli elukoht
INSERT INTO elukoht(elukoht, maakond)
VALUES ('Tallinn', 'Harjumaa'),
('Tartu', 'Tartumaa'),
('Pärnu', 'Pärnumaa');

--tabeli muutmine uue veergu lisamine
ALTER TABLE inimene ADD elukohtID int;
SELECT * FROM inimene;
-- foreign key lisamine
ALTER TABLE inimene ADD constraint fk_elukoht
FOREIGN KEY (elukohtID) references elukoht(elukohtID);
select * from inimene;
select * from elukoht;

insert into inimene
(nimi, sunniaeg, telefon, pikkus, opilasekodu, elukohtID)
VALUES
('Peeter Vana', '2021-12-30', '2568952' , 90.5, 0, 1);

select * from inimene join elukoht
on inimene.elukohtID=elukoht.elukohtID;

select inimene.nimi, inimene.sunniaeg, elukoht.elukoht from inimene join elukoht
on inimene.elukohtID=elukoht.elukohtID;

select i.nimi, i.sunniaeg, e.elukoht
from inimene i join elukoht e
on i.elukohtID=e.elukohtID;
-- auto lisamine
CREATE TABLE auto (
autoID int PRIMARY KEY identity (1,1),
autoNr varchar(50) UNIQUE,
mudell varchar(50),
mark varchar(50),
v_aasta date
);

select * from auto;

INSERT INTO auto (autoNr, mudell, mark, v_aasta)
VALUES ('777NAS', 'MW2', 'BMW', '2006');
ALTER TABLE inimene ADD autoID int;

SELECT * FROM inimene;

ALTER TABLE inimene ADD constraint fk_auto
FOREIGN KEY (autoID) references auto(autoID);

select * from inimene join auto
on inimene.autoID=auto.autoID;
