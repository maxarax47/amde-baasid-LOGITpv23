-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 15, 2025 at 01:49 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `plohhotnitsenko`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ALTER_table_ADD_COLUMN(int))` (IN `table1` VARCHAR(50), IN `clmnName` VARCHAR(50))   BEGIN
	set @ddldd=CONCAT ('ALTER TABLE ' , table1 , ' ADD COLUMN ' , clmnName , ' int' );
	prepare STMT from @ddldd;
	execute STMT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ALTER_table_DROP_COLUMN` (IN `table1` VARCHAR(50), IN `clmnName` VARCHAR(50))   BEGIN
	set @ddldd=CONCAT (' ALTER TABLE ' , table1 , ' DROP COLUMN ' , clmnName);
	prepare STMT from @ddldd;
	execute STMT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_filmid` (IN `pikkus_val` INT)   begin
declare today timestamp default current_date;
	select today, filmnimetus, pikkus
	from film
	where pikkus < pikkus_val;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_film_by_type` (IN `type` VARCHAR(3))  DETERMINISTIC BEGIN
SELECT f.filmNimetus, t.filmtype
FROM film f
INNER JOIN filmtype t on f.filmtypeID=t.filmTypeID
AND t.filmType= type;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tervist` ()  DETERMINISTIC COMMENT 'A procedure' BEGIN
	SELECT 'Hello World !';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UPDATE_rezisoor` (IN `condition1` INT(1), IN `value1` VARCHAR(50))   BEGIN
	set @ddld=CONCAT (' UPDATE rezisoor', ' SET perenimi = ', value1 , ' WHERE rezisoorID = ', condition1 );
	prepare STMT from @ddld;
	execute STMT;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `film`
--

CREATE TABLE `film` (
  `filmID` int(11) NOT NULL,
  `filmNimetus` varchar(25) NOT NULL,
  `zanrID` int(11) NOT NULL,
  `keelID` int(11) NOT NULL,
  `pikkus` int(11) NOT NULL,
  `rezisorID` int(11) NOT NULL,
  `filmtypeID` int(11) NOT NULL,
  `reklaam` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `film`
--

INSERT INTO `film` (`filmID`, `filmNimetus`, `zanrID`, `keelID`, `pikkus`, `rezisorID`, `filmtypeID`, `reklaam`) VALUES
(1, 'Pulp Fiction', 8, 1, 154, 1, 1, ''),
(2, 'Vabastatud Django', 1, 1, 165, 1, 2, ''),
(3, 'Ongi Karloson!', 4, 2, 80, 2, 2, ''),
(4, 'Roheline elevant', 7, 2, 86, 3, 1, ''),
(5, 'Kaardid, rahad, kaks püst', 4, 3, 107, 5, 2, '');

-- --------------------------------------------------------

--
-- Table structure for table `filmtype`
--

CREATE TABLE `filmtype` (
  `filmTypeID` int(11) NOT NULL,
  `filmType` varchar(25) NOT NULL,
  `kirjeldus` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `filmtype`
--

INSERT INTO `filmtype` (`filmTypeID`, `filmType`, `kirjeldus`) VALUES
(1, '2D', '2D-arvutigraafika on pildi esitamine digitaalsete kahemõõtmeliste mudelitena, näiteks tasandilise geomeetria ja teksti abil.'),
(2, '3D', '3D-arvutigraafika on pildi esitamine digitaalsete kolmemõõtmeliste mudelitena, näiteks ruumilise geomeetria abil.\r\n\r\n3D-mudel on kolmemõõtmelise objekti matemaatiline esitus. Mudelit saab kuvada kahemõõtmelisena 3D-renderdamise kaudu või kasutada mittevisuaalse arvutisimulatsiooni või arvutuste jaoks. On olemas ka 3D-arvutigraafika tarkvara.'),
(3, '4D', '3D-arvutigraafika lisaeffektidega.');

-- --------------------------------------------------------

--
-- Table structure for table `keel`
--

CREATE TABLE `keel` (
  `keelID` int(11) NOT NULL,
  `keelNimi` varchar(25) NOT NULL,
  `keelNimiVene` varchar(25) NOT NULL,
  `keelNimiInglise` varchar(25) NOT NULL,
  `test2` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `keel`
--

INSERT INTO `keel` (`keelID`, `keelNimi`, `keelNimiVene`, `keelNimiInglise`, `test2`) VALUES
(1, 'Eesti', 'Эстонский', 'Estonian', NULL),
(2, 'Vene', 'Русский', 'Russian', NULL),
(3, 'Inglise', 'Английский', 'English', NULL),
(4, 'Saksa', 'Немецкий', 'German', NULL),
(5, 'Prantsuse', 'Французский', 'French', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kinokava`
--

CREATE TABLE `kinokava` (
  `kinokavaID` int(11) NOT NULL,
  `kuupaev` datetime DEFAULT NULL,
  `filmNimetus` int(11) DEFAULT NULL,
  `pilethind` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kinokava`
--

INSERT INTO `kinokava` (`kinokavaID`, `kuupaev`, `filmNimetus`, `pilethind`) VALUES
(1, '2020-03-20 16:20:00', 5, 5),
(2, '2020-03-17 20:00:00', 1, 8),
(3, '2020-03-18 13:00:00', 4, 2),
(4, '2020-03-19 20:00:00', 2, 7),
(5, '2020-03-21 21:00:00', 3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `piletimyyk`
--

CREATE TABLE `piletimyyk` (
  `piletimyykID` int(11) NOT NULL,
  `kogus` int(11) NOT NULL,
  `kinokavaID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `piletimyyk`
--

INSERT INTO `piletimyyk` (`piletimyykID`, `kogus`, `kinokavaID`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `rezisoor`
--

CREATE TABLE `rezisoor` (
  `rezisoorID` int(11) NOT NULL,
  `eesnimi` varchar(25) DEFAULT NULL,
  `perenimi` varchar(25) DEFAULT NULL,
  `test` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rezisoor`
--

INSERT INTO `rezisoor` (`rezisoorID`, `eesnimi`, `perenimi`, `test`) VALUES
(1, 'Quentin', 'test', NULL),
(2, 'Sarik', 'Andreasjan', NULL),
(3, 'Svetlana', 'Baskova', NULL),
(4, 'Michael', 'Bay', NULL),
(5, 'Guy', 'Richi', NULL),
(6, 'Woody', 'Allen', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `zanr`
--

CREATE TABLE `zanr` (
  `zanrID` int(11) NOT NULL,
  `zanrNimi` varchar(25) NOT NULL,
  `zanrKirjeldus` text NOT NULL,
  `etst` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `zanr`
--

INSERT INTO `zanr` (`zanrID`, `zanrNimi`, `zanrKirjeldus`, `etst`) VALUES
(1, 'Draama', 'Tõsise teema, sisu, ainestiku ja süžeega, realistlikus elu- ja tegevuskeskkonnas ning usutavates elusituatsioonides tegutsevate realistlike tegelastega lavastatud filmiteos, mis on rajatud filmikangelaste (aktiivsele) suhtlemisele, tegevusele, karakterite muutumisele ja arengule. Tavaliselt ei kasutata filmiefekte, komöödia- või märulielemente. Väga levinud filmižanr, mille peamised alaliigid on melodraama, ajalooline (eepiline) draama, romantiline draama ja elulooline film, mida on käesolevas loendis käsitletud eraldiseisvate kategooriatena.', NULL),
(2, 'Fantaasia', 'Žanr, milles toimub või kujundatud midagi ebareaalne elus.', NULL),
(3, 'Animatsioon', 'Teemad on enamasti mõeldud lastele ja käsitlus on lastepärane ja lastele lihtsalt arusaadav ja mõistetav. Filmi kangelased on tavaliselt lapsed, nende vanemad (kes vahel asuvad kaugel või on tegu), loomad, ka kurjad tegelased, kellest tuleneb oht.', NULL),
(4, 'Komöödia', 'Komöödiafilm on enamasti kergema sisu ja tahtlikult meelelahutusliku, publikut lõbustava, lõõgastava ja naerma ajava eesmärgiga tehtud filmiteos rõhutatult, liialdatult ja ülemäärase situatsioonilahenduse, keelekasutuse, tegevuse, suhete ja karakteritega.', NULL),
(5, 'Krimi', 'Krimi- ja gangsterfilmide tegevus hargneb kriminaalkurjategijate, kuritegelike jõukude ja sündikaatide, enamasti pangaröövlite, allmaailma tegelaste ja pättide ümber, kes tegutsevad väljaspool seadust, tegelevad narkootikumidega, võitlevad omavahel, varastavad ja tapavad. Film keskendub enamasti kurjategijate mõttemaailmale, ambitsioonidele, suurusehullustusele ja kompleksidele, mis lõpuks viivad nende hukkumiseni. Sageli liigitatakse need krimifilme sarnasuse tõttu ka film noir või detektiiv/uurijafilmideks. Sellesse kategooriasse peaks paigutama ka filmid sarimõrvaritest. Sageli soovitatakse kasutada (kui võimalik) spetsiifilisemad žanrimääratlusi: röövlifilm, film noir, gangsterifilm, uurijafilm, politseifilm või põnevusfilm ', NULL),
(6, 'Müsteerium', 'Detektiiv/uurijafilmi peetakse tavaliselt kriminaalfilmi (krimifilmi), film noir või põnevusfilmi (põneviku) alaliigiks. Film põhineb enamasti lahendamata mõrva või kadumise loo uurimisele, filmi peategelaseks on tugeva ja omapärase karakteri ja tegutsemisviisiga detektiiv-uurija, kes tegutseb metoodiliselt ja sihikindlalt kurjategija või mõrvari tabamiseks.', NULL),
(7, 'Õudus', 'Filmilavastused, mis tegelevad elu varjatud, tundmatu, keelatud, üleloomuliku või seletamatu poolega, kutsuvad esile varjatud alateadvuslikku pinget, kartust, hirmutunnet või õudust, millel on reeglina hirmus või šokeeriv lõpplahendus, kuid mis samal ajal köidavad vaatajat ja lahutavad meelt siduva vaatamispinge tekitamise, kaasaelamise ja tugeva läbielamise (katarsise) kaudu. Filmide stilistika on mitmekesine, ulatudes õudusfilmide klassikast (Nosferatu) kuni arvutites loodud üleloomulike lugudeni. Õudusfilmides tegutsevad kummitused, vaimud, libahundid, zombid, vampiirid, saatanad, monstrumid.   Nüüdisajal on õudusfilmi žanr sageli kombineeritud ulmefilmiga, kus monstrumeid sünnitab tehnoloogiline viga, väärkäsitlus, võimu-, raha- või kättemaksiha, korruptsioon või Maad ohustavad tulnukad. Õudusfilmides võib leida sarnaseid elemente muinasjuttfilmide ja üleloomulikele nähtustele rajatud filmidega. Õudusfilmidel on mitmeid alaliike: filmid lõikujatest, sarimõrvaritest, noorteõudukad, satanismifilmid, Dracula, Frankenstein jm. Vajadusel tuleks kasutada lisamääranguid (sagedasemad Ulmefilm, Üleloomulik film).         ', NULL),
(8, 'Thriller', 'Põnevusfilmid on enamasti žanrihübriidid – esineb märulipõnevik (Action-Thriller), krimipõnevik (Crime-Caper-Thriller), vesternipõnevik (Western-Thriller), film noir põnevik, isegi romantilise komöödia põnevik (Romantic comedy-Thriller). Põnevikud on lähedalt seotud õudusfilmižanriga. Põnevikud haaravad sellega, et kutsuvad esile intensiivse erutuse, pakuvad põnevust ja kaasaelamisvõimalust, tekitavad rahutut ootust ja närvesöövat pinget. Põnevikud on sageli seotud krimiteemaga, ent põhirõhk ei ole detektiividel, gangsteritel, röövlitel, isegi krimiaktil mitte. Selle asemel fokuseerub narratiiv põnevusel, mis tuleneb sellest, et indiviid või grupp tegelasi on ohtlikkus olukorras, millest pääsemine sõltub juhuslikust saatuse pöördest. Sageli on filmiteemaks poliitiline vandenõu, terrorism, süütu süüdistatava põgenemine, mõrvani viiv armukolmnurk, psüühikahäiretega tegelased.', NULL),
(9, 'Seiklus', 'Enamasti köitvad filmilavastused eksootilistes paikades, seotud uue kogemuse ja tundmatu avastamisega, sageli sarnane märuližanriga. Tegutsevad uljad ja julged inimesed, tegemist võib olla eepilistele ja ajaloolistele filmidele omaste lahendustega (kus kangelased on sageli julged, altruistlikud, patriootilised inimesed, kes tegutsevad oma ideaalide nimel), kadunud kontinentide otsimise, džungli- ja kõrbefilmidega, aaretejahiga, katastroofide, otsingute ja avastamisega, võitlusega vabaduse eest ja vallutajate vastu, püüdega aidata taastada õiglust ja mõistlikku ühiskonnakorraldust jms.   LOC žanrinimistu: seotud sisu- ja žanrikategooriad: seiklusfilm, antiikmaailma film, loomafilm, lennundusaineline film, röövlifilm, krimifilm, katastrooffilm, spioonifilm, muinasjuttfilm, gangsterifilm, džunglifilm, võitluskunstide film, uurijafilm, politseifilm, eelajalooline film, vanglafilm, ulmefilm, laulev kauboi, spordifilm, ellujäämise film, õudusfilm, sõjafilm, vestern. ', NULL),
(10, 'Action', 'Aktiivse, enamasti katkematu tegevusega, paljude kaskadöörinippidega filmid, tagaajamise ja jälitamisega, võitluse, päästeaktsioonide, lahingute, põgenemiste, kriiside ja katastroofidega (üleujutused, plahvatused, loodusõnnetused), võitluskunste kasutavad, seikluslikud, köitva rütmi ja tempoga ning vastuoluliste positiivsete kangelastega, kes võitlevad halbade vastu. Loodud ennekõike vaataja köitmise ja meelelahutuse eesmärgil. ', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`filmID`),
  ADD KEY `zanr_fk` (`zanrID`),
  ADD KEY `rezisor_fk` (`rezisorID`),
  ADD KEY `filmtype_fk` (`filmtypeID`),
  ADD KEY `keel_fk` (`keelID`);

--
-- Indexes for table `filmtype`
--
ALTER TABLE `filmtype`
  ADD PRIMARY KEY (`filmTypeID`);

--
-- Indexes for table `keel`
--
ALTER TABLE `keel`
  ADD PRIMARY KEY (`keelID`);

--
-- Indexes for table `kinokava`
--
ALTER TABLE `kinokava`
  ADD PRIMARY KEY (`kinokavaID`),
  ADD KEY `film_fk` (`filmNimetus`);

--
-- Indexes for table `piletimyyk`
--
ALTER TABLE `piletimyyk`
  ADD PRIMARY KEY (`piletimyykID`),
  ADD KEY `kinokava_fk` (`kinokavaID`);

--
-- Indexes for table `rezisoor`
--
ALTER TABLE `rezisoor`
  ADD PRIMARY KEY (`rezisoorID`);

--
-- Indexes for table `zanr`
--
ALTER TABLE `zanr`
  ADD PRIMARY KEY (`zanrID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `film`
--
ALTER TABLE `film`
  MODIFY `filmID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `filmtype`
--
ALTER TABLE `filmtype`
  MODIFY `filmTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `keel`
--
ALTER TABLE `keel`
  MODIFY `keelID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `kinokava`
--
ALTER TABLE `kinokava`
  MODIFY `kinokavaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `piletimyyk`
--
ALTER TABLE `piletimyyk`
  MODIFY `piletimyykID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `rezisoor`
--
ALTER TABLE `rezisoor`
  MODIFY `rezisoorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `zanr`
--
ALTER TABLE `zanr`
  MODIFY `zanrID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `film`
--
ALTER TABLE `film`
  ADD CONSTRAINT `filmtype_fk` FOREIGN KEY (`filmtypeID`) REFERENCES `filmtype` (`filmTypeID`),
  ADD CONSTRAINT `keel_fk` FOREIGN KEY (`keelID`) REFERENCES `keel` (`keelID`),
  ADD CONSTRAINT `rezisor_fk` FOREIGN KEY (`rezisorID`) REFERENCES `rezisoor` (`rezisoorID`),
  ADD CONSTRAINT `zanr_fk` FOREIGN KEY (`zanrID`) REFERENCES `zanr` (`zanrID`);

--
-- Constraints for table `kinokava`
--
ALTER TABLE `kinokava`
  ADD CONSTRAINT `film_fk` FOREIGN KEY (`filmNimetus`) REFERENCES `film` (`filmID`);

--
-- Constraints for table `piletimyyk`
--
ALTER TABLE `piletimyyk`
  ADD CONSTRAINT `kinokava_fk` FOREIGN KEY (`kinokavaID`) REFERENCES `kinokava` (`kinokavaID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
