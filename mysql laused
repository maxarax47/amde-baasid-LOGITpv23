--komentaar
--Xampp control panel
--Conect TO:
--Server Name: localhost - 1270.0.1
-- Authentification:
-- kasutaja: root
-- parool: ei ole
1. Windows Auth - (localdb) admini õigused

-----------------------------
CREATE DATABASE logunovLogitp23;
USE logunovLogitp23;

--taabeli loomine
--identity(1,1) - ise täidab tabeli 1,2,3...
CREATE TABLE inimene(
inimeneID int Primary Key identity(1,1),
nimi varchar(50) unique, 
sunniaeg date,
telefon char(12),
pikkus decimal(5,2),
opilasekodu bit
);
SELECT * FROM inimenee;
--tabeli kustutamine
DROP table inimenee;
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
