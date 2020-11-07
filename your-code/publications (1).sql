-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: relational.fit.cvut.cz    Database: pubs
-- ------------------------------------------------------
-- Server version	5.5.5-10.2.14-MariaDB-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `authors`
--
CREATE DATABASE database_name;

USE database_name;



DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;

CREATE TABLE `authors` (
  `au_id` varchar(11) NOT NULL,
  `au_lname` varchar(40) NOT NULL,
  `au_fname` varchar(20) NOT NULL,
  `phone` char(12) NOT NULL,
  `address` varchar(40) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` char(2) DEFAULT NULL,
  `zip` char(5) DEFAULT NULL,
  `contract` tinyint(4) NOT NULL,
  PRIMARY KEY (`au_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

SELECT * from authors a 

LOCK TABLES `authors` WRITE;
INSERT INTO `authors` VALUES ('172-32-1176','White','Johnson','408 496-7223','10932 Bigge Rd.','Menlo Park','CA','94025',1),('213-46-8915','Green','Marjorie','415 986-7020','309 63rd St. #411','Oakland','CA','94618',1),('238-95-7766','Carson','Cheryl','415 548-7723','589 Darwin Ln.','Berkeley','CA','94705',1),('267-41-2394','O\'Leary','Michael','408 286-2428','22 Cleveland Av. #14','San Jose','CA','95128',1),('274-80-9391','Straight','Dean','415 834-2919','5420 College Av.','Oakland','CA','94609',1),('341-22-1782','Smith','Meander','913 843-0462','10 Mississippi Dr.','Lawrence','KS','66044',0),('409-56-7008','Bennet','Abraham','415 658-9932','6223 Bateman St.','Berkeley','CA','94705',1),('427-17-2319','Dull','Ann','415 836-7128','3410 Blonde St.','Palo Alto','CA','94301',1),('472-27-2349','Gringlesby','Burt','707 938-6445','PO Box 792','Covelo','CA','95428',1),('486-29-1786','Locksley','Charlene','415 585-4620','18 Broadway Av.','San Francisco','CA','94130',1),('527-72-3246','Greene','Morningstar','615 297-2723','22 Graybar House Rd.','Nashville','TN','37215',0),('648-92-1872','Blotchet-Halls','Reginald','503 745-6402','55 Hillsdale Bl.','Corvallis','OR','97330',1),('672-71-3249','Yokomoto','Akiko','415 935-4228','3 Silver Ct.','Walnut Creek','CA','94595',1),('712-45-1867','del Castillo','Innes','615 996-8275','2286 Cram Pl. #86','Ann Arbor','MI','48105',1),('722-51-5454','DeFrance','Michel','219 547-9982','3 Balding Pl.','Gary','IN','46403',1),('724-08-9931','Stringer','Dirk','415 843-2991','5420 Telegraph Av.','Oakland','CA','94609',0),('724-80-9391','MacFeather','Stearns','415 354-7128','44 Upland Hts.','Oakland','CA','94612',1),('756-30-7391','Karsen','Livia','415 534-9219','5720 McAuley St.','Oakland','CA','94609',1),('807-91-6654','Panteley','Sylvia','301 946-8853','1956 Arlington Pl.','Rockville','MD','20853',1),('846-92-7186','Hunter','Sheryl','415 836-7128','3410 Blonde St.','Palo Alto','CA','94301',1),('893-72-1158','McBadden','Heather','707 448-4982','301 Putnam','Vacaville','CA','95688',0),('899-46-2035','Ringer','Anne','801 826-0752','67 Seventh Av.','Salt Lake City','UT','84152',1),('998-72-3567','Ringer','Albert','801 826-0752','67 Seventh Av.','Salt Lake City','UT','84152',1);
UNLOCK TABLES;

SELECT * from authors a 



DROP TABLE IF EXISTS `trialrandom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trialrandom` SELECT * from authors where au_fname in ('Meander')

SELECT * from trialrandom


DROP TABLE IF EXISTS `stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stores` (
  `stor_id` char(4) NOT NULL,
  `stor_name` varchar(40) DEFAULT NULL,
  `stor_address` varchar(40) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` char(2) DEFAULT NULL,
  `zip` char(5) DEFAULT NULL,
  PRIMARY KEY (`stor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stores`
--

LOCK TABLES `stores` WRITE;
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
INSERT INTO `stores` VALUES ('6380','Eric the Read Books','788 Catamaugus Ave.','Seattle','WA','98056'),('7066','Barnum\'s','567 Pasadena Ave.','Tustin','CA','92789'),('7067','News & Brews','577 First St.','Los Gatos','CA','96745'),('7131','Doc-U-Mat: Quality Laundry and Books','24-A Avogadro Way','Remulade','WA','98014'),('7896','Fricative Bookshop','89 Madison St.','Fremont','CA','90019'),('8042','Bookbeat','679 Carson St.','Portland','OR','89076');
/*!40000 ALTER TABLE `stores` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `discounts`
--
SELECT * from stores s 



DROP TABLE IF EXISTS `discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discounts` (
  `discounttype` varchar(40) NOT NULL,
  `stor_id` char(4) DEFAULT NULL,
  `lowqty` smallint(6) DEFAULT NULL,
  `highqty` smallint(6) DEFAULT NULL,
  `discount` decimal(4,2) NOT NULL,
  KEY `discounts_stor_id` (`stor_id`),
  CONSTRAINT `discounts_ibfk_1` FOREIGN KEY (`stor_id`) REFERENCES `stores` (`stor_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts`
--

LOCK TABLES `discounts` WRITE;
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;
INSERT INTO `discounts` VALUES ('Initial Customer',NULL,NULL,NULL,10.50),('Volume Discount',NULL,100,1000,6.70),('Customer Discount','8042',NULL,NULL,5.00);
/*!40000 ALTER TABLE `discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--


DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `job_id` smallint(6) NOT NULL,
  `job_desc` varchar(50) NOT NULL,
  `min_lvl` smallint(6) NOT NULL,
  `max_lvl` smallint(6) NOT NULL,
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (1,'New Hire - Job not specified',10,10),(2,'Chief Executive Officer',200,250),(3,'Business Operations Manager',175,225),(4,'Chief Financial Officier',175,250),(5,'Publisher',150,250),(6,'Managing Editor',140,225),(7,'Marketing Manager',120,200),(8,'Public Relations Manager',100,175),(9,'Acquisitions Manager',75,175),(10,'Productions Manager',75,165),(11,'Operations Manager',75,150),(12,'Editor',25,100),(13,'Sales Representative',25,100),(14,'Designer',25,100);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

SELECT * from jobs



DROP TABLE IF EXISTS `publishers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publishers` (
  `pub_id` char(4) NOT NULL,
  `pub_name` varchar(40) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` char(2) DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`pub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publishers`
--

LOCK TABLES `publishers` WRITE;
/*!40000 ALTER TABLE `publishers` DISABLE KEYS */;
INSERT INTO `publishers` VALUES ('0736','New Moon Books','Boston','MA','USA'),('0877','Binnet & Hardley','Washington','DC','USA'),('1389','Algodata Infosystems','Berkeley','CA','USA'),('1622','Five Lakes Publishing','Chicago','IL','USA'),('1756','Ramona Publishers','Dallas','TX','USA'),('9901','GGG&G','MÂnchen',NULL,'Germany'),('9952','Scootney Books','New York','NY','USA'),('9999','Lucerne Publishing','Paris',NULL,'France');
/*!40000 ALTER TABLE `publishers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roysched`
--
SELECT * from publishers



DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `emp_id` char(9) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `minit` char(1) DEFAULT NULL,
  `lname` varchar(30) NOT NULL,
  `job_id` smallint(6) NOT NULL,
  `job_lvl` smallint(6) DEFAULT NULL,
  `pub_id` char(4) NOT NULL,
  `hire_date` datetime NOT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `employee_job_id` (`job_id`),
  KEY `employee_pub_id` (`pub_id`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`pub_id`) REFERENCES `publishers` (`pub_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('A-C71970F','Aria','','Cruz',10,87,'1389','1991-10-26 00:00:00'),('A-R89858F','Annette','','Roulet',6,152,'9999','1990-02-21 00:00:00'),('AMD15433F','Ann','M','Devon',3,200,'9952','1991-07-16 00:00:00'),('ARD36773F','Anabela','R','Domingues',8,100,'0877','1993-01-27 00:00:00'),('CFH28514M','Carlos','F','Hernadez',5,211,'9999','1989-04-21 00:00:00'),('CGS88322F','Carine','G','Schmitt',13,64,'1389','1992-07-07 00:00:00'),('DBT39435M','Daniel','B','Tonini',11,75,'0877','1990-01-01 00:00:00'),('DWR65030M','Diego','W','Roel',6,192,'1389','1991-12-16 00:00:00'),('ENL44273F','Elizabeth','N','Lincoln',14,35,'0877','1990-07-24 00:00:00'),('F-C16315M','Francisco','','Chang',4,227,'9952','1990-11-03 00:00:00'),('GHT50241M','Gary','H','Thomas',9,170,'0736','1988-08-09 00:00:00'),('H-B39728F','Helen','','Bennett',12,35,'0877','1989-09-21 00:00:00'),('HAN90777M','Helvetius','A','Nagy',7,120,'9999','1993-03-19 00:00:00'),('HAS54740M','Howard','A','Snyder',12,100,'0736','1988-11-19 00:00:00'),('JYL26161F','Janine','Y','Labrune',5,172,'9901','1991-05-26 00:00:00'),('KFJ64308F','Karin','F','Josephs',14,100,'0736','1992-10-17 00:00:00'),('KJJ92907F','Karla','J','Jablonski',9,170,'9999','1994-03-11 00:00:00'),('L-B31947F','Lesley','','Brown',7,120,'0877','1991-02-13 00:00:00'),('LAL21447M','Laurence','A','Lebihan',5,175,'0736','1990-06-03 00:00:00'),('M-L67958F','Maria','','Larsson',7,135,'1389','1992-03-27 00:00:00'),('M-P91209M','Manuel','','Pereira',8,101,'9999','1989-01-09 00:00:00'),('M-R38834F','Martine','','Rance',9,75,'0877','1992-02-05 00:00:00'),('MAP77183M','Miguel','A','Paolino',11,112,'1389','1992-12-07 00:00:00'),('MAS70474F','Margaret','A','Smith',9,78,'1389','1988-09-29 00:00:00'),('MFS52347M','Martin','F','Sommer',10,165,'0736','1990-04-13 00:00:00'),('MGK44605M','Matti','G','Karttunen',6,220,'0736','1994-05-01 00:00:00'),('MJP25939M','Maria','J','Pontes',5,246,'1756','1989-03-01 00:00:00'),('MMS49649F','Mary','M','Saveley',8,175,'0736','1993-06-29 00:00:00'),('PCM98509F','Patricia','C','McKenna',11,150,'9999','1989-08-01 00:00:00'),('PDI47470M','Palle','D','Ibsen',7,195,'0736','1993-05-09 00:00:00'),('PHF38899M','Peter','H','Franken',10,75,'0877','1992-05-17 00:00:00'),('PMA42628M','Paolo','M','Accorti',13,35,'0877','1992-08-27 00:00:00'),('POK93028M','Pirkko','O','Koskitalo',10,80,'9999','1993-11-29 00:00:00'),('PSA89086M','Pedro','S','Afonso',14,89,'1389','1990-12-24 00:00:00'),('PSP68661F','Paula','S','Parente',8,125,'1389','1994-01-19 00:00:00'),('PTC11962M','Philip','T','Cramer',2,215,'9952','1989-11-11 00:00:00'),('PXH22250M','Paul','X','Henriot',5,159,'0877','1993-08-19 00:00:00'),('R-M53550M','Roland','','Mendel',11,150,'0736','1991-09-05 00:00:00'),('RBM23061F','Rita','B','Muller',5,198,'1622','1993-10-09 00:00:00'),('SKO22412M','Sven','K','Ottlieb',5,150,'1389','1991-04-05 00:00:00'),('TPO55093M','Timothy','P','O\'Rourke',13,100,'0736','1988-06-19 00:00:00'),('VPA30890F','Victoria','P','Ashworth',6,140,'0877','1990-09-13 00:00:00'),('Y-L77953M','Yoshi','','Latimer',12,32,'1389','1989-06-11 00:00:00');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--

SELECT * from employee;
--

DROP TABLE IF EXISTS `pub_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pub_info` (
  `pub_id` char(4) NOT NULL,
  `logo` longblob DEFAULT NULL,
  `pr_info` longtext DEFAULT NULL,
  PRIMARY KEY (`pub_id`),
  CONSTRAINT `pub_info_ibfk_1` FOREIGN KEY (`pub_id`) REFERENCES `publishers` (`pub_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pub_info`
--

LOCK TABLES `pub_info` WRITE;
/*!40000 ALTER TABLE `pub_info` DISABLE KEYS */;
INSERT INTO `pub_info` VALUES ('0736','GIF89a\Ó\0\0³\0\0\0\0€\0\0\0€\0€€\0\0\0€€\0€\0€€€€€ÀÀÀÿ\0\0\0ÿ\0ÿÿ\0\0\0ÿÿ\0ÿ\0ÿÿÿÿÿ!ù\0\0\0,\0\0\0\0\Ó\0\0@ÿð\ÉI«½8\ëÍ»ÿ`(Ž$Phg’#jº°;Å°U³øCÓ¹\â«S*6û%;\å¦#\Z“L¡Œ·\\‘Ö›ö*­F\\ð6\Ø$7‘6ŸQj\Þù0Jøó\n5c\×\åLü¿$7{]i~dQ3=ˆ!u‰ŽvexwrYu^T“– yŸŠ„m›J’“…§¥EŒ wsb¬¯X^lj„­B•Uº©¤q¨Ž‹¢\Ã\Ç\È-\ÉÈ®\Ë\Î\Ï\ÂÐ‘C¦n€\ÓÙ¼,A\×jÒ²\ÍPšÚ©ª\Æ%”£ß\Æ_à½µ°\Íô\âv\Þö\Ýx\ïk†úl‚Å¢dŠT«jª\äÁxd\Þ9.:ôX+õ‚\ßÀ}’D­¢H\Ô\Æv{ÿ2®ó\ï`;9I\nD\'\Î!§3\nm„¸fM8?¢Y2H¹m7½ùIHÑ£H“zRÊ´©\ÓxNõ\å‹JUE\ÕK\Åhú¼šh\ÝRnÐ¦¸ª3\ÙZ\Ù\ÑÓ\Î\Ò=ˆõJ:\Ë\n•ZÝ­šPµ\r‡)n>¹\Çj|Ú«\Èk$`\róM9•QZ¹ÿ_\Zú\r«  —#‚Ì¹ùå®¼6‹!\î\Ûf\í¡_G¾-ý\ë´J{|h‰$\r”s\ës2/N»\áM–e¼\årK¹W‰5—\êKóqŒ\Ýdu\Z&‹9\Ö\Ü\Þ<7öŽµŽ]\ÎØ¤DwSpI….ý%<\î8\És·\é\ÙzHŒ)yû“oºÿ,õ\Ëy\ãX0@1†J›\é%\ÔCŸ¶ s¾ñW_Y<¢[&rU\Ô]JE¶[…\Z6\ÅaTg…h¢\0\0;','This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.\r\n\r\nThis is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.'),('0877','GIF89a‹\0/\0³\0\0\0\0€\0\0\0€\0€€\0\0\0€€\0€\0€€€€€ÀÀÀÿ\0\0\0ÿ\0ÿÿ\0\0\0ÿÿ\0ÿ\0ÿÿÿÿÿ!ù\0\0\0,\0\0\0\0‹\0/\0@ÿð\ÉI«½8\ëÍ»ÿ „dœã„¦+Õ–0œ\ÆôõŠ(~ºy\ís³\ÒjH,\ZÈ¤rIü\Ív¼0X\ÙA5Wœ“E=ƒWhVþjU]4:m?\Æ\Ü*7~fÛ¥ø\Û\ëö\î\áÿ*€[F:G‚‚i‡z=||Š>‰“”fjueg™nlQžv’dn}œ˜¤\"•«¬$ ’­6Ls~±^¶Žµ¸°¾Œdp ¾X\Æº\Ãe\Å\È6Î¡¼»\ÄÀÐª\Ö\ÑL…\Í\Øo\Ýß«_C¥€Üµ¢[›®˜›\Ãî©§\ëÙ¿Taš}ø»¨tu\í§p\ÖÅ‹–ŒY¢tû™\â7\Çp\ÕU‰H±\\Å‹N Îšv.bµXÊ¸h9ü$«…Fb¼\Ö\re>ƒ+½y$ô’&F“\'ý\ì‘Æ­%8—.oþ\ä)r\rNcG)%\Z3©Ò´zZs\Zs%\ÕmP³jÝª$cÕ¯®‚õøOª”fVª!¬1\ÐÄ¿…Ë¨y\ÖÑ”Ôµ5\Å\ÝÛ©2!\Ë\"m.”7ØœYCý2·ß¥Å‚#n19¹%c\Ý\æm*Í‹+Ë’ƒ\Î\Þ\ãÆ¥>ã›§WšbÁ)I\ÜG05\à¹\ã?š;¶÷«\Þ`‹ˆ\0\0;','This is sample text data for Binnet & Hardley, publisher 0877 in the pubs database. Binnet & Hardley is located in Washington, D.C.\r\n\r\nThis is sample text data for Binnet & Hardley, publisher 0877 in the pubs database. Binnet & Hardley is located in Washington, D.C.\r\n\r\nThis is sample text data for Binnet & Hardley, publisher 0877 in the pubs database. Binnet & Hardley is located in Washington, D.C.\r\n\r\nThis is sample text data for Binnet & Hardley, publisher 0877 in the pubs database. Binnet & Hardley is located in Washington, D.C.\r\n\r\nThis is sample text data for Binnet & Hardley, publisher 0877 in the pubs database. Binnet & Hardley is located in Washington, D.C.'),('1389','GIF89a\Â\0\0³\0\0\0\0€\0\0\0€\0€€\0\0\0€€\0€\0€€€€€ÀÀÀÿ\0\0\0ÿ\0ÿÿ\0\0\0ÿÿ\0ÿ\0ÿÿÿÿÿ!ù\0\0\0,\0\0\0\0\Â\0\0@ÿð\ÉI«½8\ëÍ»ÿ`(Ž`ž(@®,–žm,Ï³9\Ù,\áø®æ¼Ÿ\ï&\ìA:£ò\×kª–Ç¡T\ê|ÂœDšÇ¨\íz/\Ü/\í%›)\ä\ÔyýU§\Ë\Ù1\Ü5Ï¤‘aq¾ýª¼QTeAhL‚…„qQS‰ŠX‰€`E”t‘u{lš›œžŸ ¡¢£¤¥¦§¨©Zj>d™#°\Zw[uf²]ŒˆŠQP¾{“„}\ÃÀyƒ¾½Á‡‹Ï¯oD»Ð­q\É\Ë\ÖS¿\Õ\Î\Ç\Ñ\Ã\ßÛ—Ø•œ¹ª¸·\ë\î\ïðº’ñ¶µô ö÷v\Óúž¼ýtŒÜ´«]¿|\ÏTaB=I2k¡Ž!%z±(ga˜%ó.\Îh¬$+j\'EV\Ñ!Ò¤l\ç…dÅ²•0!»õ\Ê\Ö\Ì\å,p92\Ä\í\\QsF·Á\Âh3h4I¡9\Ó8¤R©Z¥š«žjƒZ«\Ð\\\ÑGŒYq@SªLIU«K™V‡š´—ö.º#s\Ú%·R#Ÿ‡‡“«X\ÇN\0\0;','This is sample text data for Algodata Infosystems, publisher 1389 in the pubs database. Algodata Infosystems is located in Berkeley, California.\r\n\r\nThis is sample text data for Algodata Infosystems, publisher 1389 in the pubs database. Algodata Infosystems is located in Berkeley, California.\r\n\r\nThis is sample text data for Algodata Infosystems, publisher 1389 in the pubs database. Algodata Infosystems is located in Berkeley, California.\r\n\r\nThis is sample text data for Algodata Infosystems, publisher 1389 in the pubs database. Algodata Infosystems is located in Berkeley, California.\r\n\r\nThis is sample text data for Algodata Infosystems, publisher 1389 in the pubs database. Algodata Infosystems is located in Berkeley, California.\r\n\r\nThis is sample text data for Algodata Infosystems, publisher 1389 in the pubs database. Algodata Infosystems is located in Berkeley, California.\r\n\r\nThis is sample text data for Algodata Infosystems, publisher 1389 in the pubs database. Algodata Infosystems is located in Berkeley, California.\r\n\r\nThis is sample text data for Algodata Infosystems, publisher 1389 in the pubs database. Algodata Infosystems is located in Berkeley, California.\r\n\r\nThis is sample text data for Algodata Infosystems, publisher 1389 in the pubs database. Algodata Infosystems is located in Berkeley, California.\r\n\r\nThis is sample text data for Algodata Infosystems, publisher 1389 in the pubs database. Algodata Infosystems is located in Berkeley, California.'),('1622','GIF89aõ\04\0³\0\0\0\0€\0\0\0€\0€€\0\0\0€€\0€\0€€€€€ÀÀÀÿ\0\0\0ÿ\0ÿÿ\0\0\0ÿÿ\0ÿ\0ÿÿÿÿÿ!ù\0\0\0,\0\0\0\0õ\04\0@ÿð\ÉI«½8\ëÍ»ÿ`(Žd\Ùfªlë¾°*\Ïtmg\è-Â¬\îÿÀ )—³\'\Å!\ï%iŽB#>Š\ØSs…¼Ay\ÛkWL&c{\å‹óŠ³“\ß,\å\\¥\'1÷y¾Ÿ¯\Ía€i_nlzƒmb‡jzy‰Š~1RMpŽr™œ”V’ŸDw|eu¥c¦Ž‚}L3K³°Q¶·¸:„¹´³½Á\ÂQ¡\ÂK\Ã\È\É\È\ÅÄ¿\Ì\Ê\Ð\Ñ5¬\Ãk.;¼¶U­Ûi!Þ¸ÔŠ©­¤`F\×\àÜ‚›˜é˜ˆxÙª\å®øu¼m\ï÷\ç£\\™CñŒ\Ê1uÀ¤)\\Hb_;†#J\ÑYÂ‰•\Ìu1£Ç‰ÿ›YúHcH òJª”ˆ.¥\r‹»>ˆY‹Š=|\roË‡\åºu6\Ù\í<E‹Pœñ|\éL\êe%M”H‰Rƒ\è<$P‰b\ÚO‹\ÖX…šË·­«*Sd¯\ÚóD\'R@š`…ú9^»<-«.Rú†·¬ú	V\ËpYv\Û>tû•lÌ§r»kŒªªÞ£ÿ¾¤Œ\Øq\ÖUi\Ã~%¤X\Å\ÉW.Wª\ÞY÷ô\n˜´V\Ë6Vs	g³s{t­»·\ïÚ¿ƒ\çö\È\á\È/14^3¹ó¥Æ˜û}NwƒÔ³×˜Z»w\àÉ°>úqò\è\íVë˜¾½uY0o\Ç,i•\êt™óµÝ¤ÿSŠ¶ý \Éÿ}F=S—ˆ\àNE|t-X\Û{)´TT8 cQ5µ\Ø8\Ö\ä‡a/‡m˜Ù„·=( ‡}ý‡#õ\áa\Ù}\×ü´\È.1¾\ÈhV\Ù\ØH}•\á\å\×@\Z\âDŽñt\ä~i5“‚è¨‡‘ˆ(\å†69™Pþü¥^1]‚y%\\,j¨˜™¶…ˆ–[‚\Ãfi3YñÊ‰¬¬¹Y—vö\æ`{nAW±©jR½\Õf6\ÌºQœ^Ú‡Ch‰ÚSò\ãg™–V©b’\âx—¦&Nb N%þI¥“TiiX@›õ\'c\ê\ÈNw•U:š¬¨\\h\è—}*y¥§ø3)¤o\ryi‹ö\r˜hŒ\ÌŠl?8\æØœŒö5\ä‘Eö-i\Ü\ÎhG%üFÃ´u×žp¥†z‚tæž‹®¬\îÀ.’\î:§­ 6[ï¾ƒò\ëo5\0\0;','This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.\r\n\r\nThis is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.'),('1756','GIF89a\ã\0%\0³\0\0\0\0€\0\0\0€\0€€\0\0\0€€\0€\0€€€€€ÀÀÀÿ\0\0\0ÿ\0ÿÿ\0\0\0ÿÿ\0ÿ\0ÿÿÿÿÿ!ù\0\0\0,\0\0\0\0\ã\0%\0@ÿð\ÉI«½8\ëÍ»ÿ`(Ž$X\ç¤\Ò\êNn\Ç2M\Ñ\ëœÛºüá¬‡ç«½„GdR\Éc6Ÿ/(Ž“:Y[@M²x4\æz_\ì7¬\ìQ}N²N\\™f6\Z^Ž\Ó\ÃÜ¥ªT¹²®-B0‚„‚†‰ƒ†…‡Tˆ{Š“””~‘‹}‡€•ž|˜o¢¦§Z{\"¥›7Ž¬®±@¶¨¸¨Srzµ½Nvgj7¿¹¯*VMkÀwnc[\Îm\Ï\Ò\Ã\Èsqhy\Ôtl`S\Úv\àÚ³¡3\ÖÕ²’Ÿœ\ê\í\ëo \Ä5ïž—õ˜–\ì(\îúÿi¢´\Ê>cM´+—\Ö@}\Éå’˜°¢Å‹3z è£F\Ãÿ\Ði!‡§˜/_\"q±R-\åG•Î°ð\Úø\ë\Ú*“/ò³ŒHKn\ÐvtJ\Íc–yBKN\Û6\'›M8Rþ•&gC•Q8\Å š\Úm\\²m\ÍüdM\ÓQ\êÏ€K\Í2B\ZV-¶–_%ª\Ý°V½{¤6\É\è*J=Giº\çw°»x‡õ\Z.•‰¼ü\à\Ýe\'Yr#Ä‘u¬¼ø\Õ\æÄŸo¦Q§\ÂtŠ>\ç\ÝkpµbšXs\Æ\ÛY6\å~¸C\Ç&;•\ë\Þ9O5„\ìp–í¦\r†\0¼¹ó\ç/™CŸ}\ìr—º„Ù’Ný±\ZeVkŽûQ|\ÂXÛ·wŸx4©unl—\Ñù^T)ñ<\å÷ùªõ™i(`GÿTJýÇ—Á\ØQW\Æ\í\×_~´œ\Ô\\^©gN[» e”ûEó\Ö-^™\áˆQeh¡]’%_c^€E\àR> yµÅ \îR\ãˆL%Wx\æõÄ¢‡Ì´\ØMA\ÎÍ‘<Ved‚\ê\í\è\ãq¹tU<ž\Ã$W<6i#|XUˆ\å-\Z\ÎŸ…RHe•VÍƒD]\'\ÉôÖ…\ÎX1tŽÔ”Œ>ˆ•›%|‡\ã\nŽ\Å\ØU’4™jž\å¶\èdþ1ºRb—\ä¥·]šHzšy—\\jµ\Ý\êlÊ¹O¦¡VŠØ¤\Ã=ºjY•\îTP¬\n¢Jœmº\éöˆ<´‰vÐ«¨\Ù\n©¨bFÂ«£þŠC\Ê\"›œX¯Á\Z±Ñ¾6mµÉ®…Ü¤…•Fkƒ¬•\Æ¦\rFî³»z\Ú@ ŒûÛ²\ë™r\ën\Ûf\Òmqv[+\ï\Æ[¯¥ú–\É:õ\n¦¯¾þ&<Àü¢«Š\ÂG,1\n\0\0;','This is sample text data for Ramona Publishers, publisher 1756 in the pubs database. Ramona Publishers is located in Dallas, Texas.'),('9901','GIF89a]\0\"\0³\0\0\0\0€\0\0\0€\0€€\0\0\0€€\0€\0€€€€€ÀÀÀÿ\0\0\0ÿ\0ÿÿ\0\0\0ÿÿ\0ÿ\0ÿÿÿÿÿ!ù\0\0\0,\0\0\0\0]\0\"\0@ÿð\ÉI«½8\ë\Íû\ßŒ$˜•£†ªh»žn\n\Îb:½\É\é˜]ÿ¸žŽ6k\íx,S2V:ºBE¦tJ­Z¯M\"v\Ë\í^¡\Ð&\Å(²0\Í8²\É\'!×Œ\Äw%&tŸa²\ç¯\â^‚ƒ`J‡ˆ‰Šs…ƒŽU…ol,†9/k—0plTwg7X£†^’b~”uN6—¦©u€“h”›²®{šheªsO€¢¡}¥vª[¶gÂ\Í\ÎCy\Ï\ÒÎž\ÓÖ§\Ì\×Ú¤\ÙÇ“AÈ¹\ß_ÀR¨Þº›¶–v{œÕ¸»ò>«¹pk\Ê\åðZ·\æ\Ä\ÇH\Ú÷%ÀbSþ“cŒ[5€\ìÔ•\Â\Ä%\ç>‰Ó‡	×\r9;\Ò\nRŒ\àªpJ¢\Ô\Ó.X<‰½,-rS\áÈ’&—\ÔLö®S¿m@AuJ\Ôg\ÅEH“*st©Ó§‰\0D\0\0;','This is sample text data for GGG&G, publisher 9901 in the pubs database. GGG&G is located in MÃ¼nchen, Germany.'),('9952','GIF89a(\0³\0\0\0\0€\0\0\0€\0€€\0\0\0€€\0€\0€€€€€ÀÀÀÿ\0\0\0ÿ\0ÿÿ\0\0\0ÿÿ\0ÿ\0ÿÿÿÿÿ!ù\0\0\0,\0\0\0\0(\0@ÿð\ÉI«½8\ëÍ»ÿ`(Ždif\0¬,{µm§\ÒLO3ž?v_\Ç˜8$ò„\äÑ¥RÚŠÌ¥Qz{Ro\'Yi\r*›\Ñ«‹‚W\ç\éwk\Þ\äR\Â\'œG¥\Ë\í\ï+<?¿Ÿ\ÈY‚}v†…ˆ‡Š‰Œ‹ƒ’Žs8‚“™”›—žŸ t¡£¤¥¦§EX>i€?S¯Lb­^m±;k=®¬nºd³e²k·«¾µÀ´(¼\Ä\ÈÁ\ÌÇ»°ec|z›{¾Œ\Ú\ÛÚ‹|1\Ù\áØŽ/¨žš\é\äš\çí¤¢\îòóôõ—®öùúûü€]lÒŒd\ÆM¾:­ˆ\Øz¥Á\ÛÀÕœ\åB“ð\àˆ*Ãž\Ù\Ê(†\ã0³ÿ&.¼rmY# O.	¤£³,þ¬¼$†Ä\Ó\â\Ô82\ãÀg\Z-‰sqg(\Z£3!šÀH\ÐaIš<ƒ¾\È	\ØNZ™Þ€‹s\r\éQkr|\èZ\çÁ\"¿s\êÒ’U\Ëv­Û¶\ìTœ…÷­]³sC©—WnÝ¿|û\n\î„W\ï]Nƒ+®±¸±\ã\ÇI Kž¬¸0\åË˜M\áó9¤\áÌˆ\É<·Ù‰\×\"4\ÑÓ¦rþøPUÄƒ\È\nt*\ÛfO5cžA}ZRß±Q*\ì]‚\é\Èf*G±šr¶ò\çA?Tªu¨\Ä\ÆHý¼4j\Í\ÍT‡¯\Ä9¾‹\È\èªk\×}+}ô\æÅˆ.Wß½\âõj\îm‡ß¸¿\àk\ç\èñ\Æ\Ë\ÎM-ÁWQ€<YVV~úG A\åñaƒ\ÌW!Â…–V\\õ±\ÕWŠ\Â\à™¡^…&ž‡ {6³o\æ 2NX!õ!Qx\ÈgcQŠh\ß\è\É\Æ }\Í¤{kqsˆú\'#Ž4‚ENC»a\èÓˆ÷ýD\Ý2G>y\Ô:Rv3#%a\æøe6fV‰™\Ñu˜šo\Z\nœu\É\Õ\æ‚t\Æ×‘µ\ÅŸy\Êg)q)Øžˆ\Z:¨>Š¶#\è^‹\Úèœ‰\"é¥„¸¦œ~2i§ Fúi¨¤¶	@\0;','This is sample text data for Scootney Books, publisher 9952 in the pubs database. Scootney Books is located in New York City, New York.'),('9999','GIF89a©\0$\0³\0\0\0\0€\0\0\0€\0€€\0\0\0€€\0€\0€€€€€ÀÀÀÿ\0\0\0ÿ\0ÿÿ\0\0\0ÿÿ\0ÿ\0ÿÿÿÿÿ!ù\0\0\0,\0\0\0\0©\0$\0@ÿð\ÉI«½8\ëÍ»ÿ`ø\Z`žge>¨ÔŠp,\ÏôEfhž\Ö|\ïÿ#ÕŽu¶†DJn¢ko\È\çJ\È$!§«\åôYMa·»ð\Öõbqšh z\Í\Æ8™%tšün\Ûï¼¢M>–\âÿ€=zrF1snIJ‹\\„†3ƒK‘nY‹e~Jƒ_}›{V˜`d ›¢¦c`:.q|”‡²³ œ§­RYGQ´½€¶]u·™¾Å¿¯|\Æ\Ê\Ëf8…*\Ì@Ÿ\Ó>¶¼\ÍÁ\ÑÎ©–{#À‚\Ãp–b¦Ÿ¤¥‘ç®„\Øz_ «P/C¬]t\ë“g°bE“ú\\±\íAs\åô1Z\èH[B‡ü¾9\äF±bAsþ¬Y\Ü(	YF#\Ù\Ã8ŠT\ä¬Õœd#S\âð˜\é1•0\Ýa\Ä\Ç\ËË˜1\Å\å¢,$N˜:?þ\Ú!(,¢H«±Œ%3iR£‰Ö‰ä‰°\ÒDƒ$;fÍ‡u£€\Z¥¦\nk-¬N7AÖ»¨+¦‡\é¦Ñ£¶\Ö\Ñ\\t`\Çz£\ã\åV×žºôªª²\Ï\ÏW†q\ß\Þeu˜0]Q÷¾^Z%6\Ó8Ž\í\n„²·S]`rÁ\Ö-µX‹\åÌ¥±½£w¹ž<¾ž\Ú1”J•\Z\ß}±Rc¡B›7»~BŽ\Ä\×T¸qd+‡ \0;','This is sample text data for Lucerne Publishing, publisher 9999 in the pubs database. Lucerne publishing is located in Paris, France.\r\n\r\nThis is sample text data for Lucerne Publishing, publisher 9999 in the pubs database. Lucerne publishing is located in Paris, France.\r\n\r\nThis is sample text data for Lucerne Publishing, publisher 9999 in the pubs database. Lucerne publishing is located in Paris, France.\r\n\r\nThis is sample text data for Lucerne Publishing, publisher 9999 in the pubs database. Lucerne publishing is located in Paris, France.');
/*!40000 ALTER TABLE `pub_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publishers`




SELECT * from employee;



DROP TABLE IF EXISTS `titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `titles` (
  `title_id` varchar(6) NOT NULL,
  `title` varchar(80) NOT NULL,
  `type` char(12) NOT NULL,
  `pub_id` char(4) DEFAULT NULL,
  `price` decimal(19,4) DEFAULT NULL,
  `advance` decimal(19,4) DEFAULT NULL,
  `royalty` int(11) DEFAULT NULL,
  `ytd_sales` int(11) DEFAULT NULL,
  `notes` varchar(200) DEFAULT NULL,
  `pubdate` datetime NOT NULL,
  PRIMARY KEY (`title_id`),
  KEY `titles_pub_id` (`pub_id`),
  CONSTRAINT `titles_ibfk_1` FOREIGN KEY (`pub_id`) REFERENCES `publishers` (`pub_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titles`
--

LOCK TABLES `titles` WRITE;
/*!40000 ALTER TABLE `titles` DISABLE KEYS */;
INSERT INTO `titles` VALUES ('BU1032','The Busy Executive\'s Database Guide','business','1389',19.9900,5000.0000,10,4095,'An overview of available database systems with emphasis on common business applications. Illustrated.','1991-06-12 00:00:00'),('BU1111','Cooking with Computers: Surreptitious Balance Sheets','business','1389',11.9500,5000.0000,10,3876,'Helpful hints on how to use your electronic resources to the best advantage.','1991-06-09 00:00:00'),('BU2075','You Can Combat Computer Stress!','business','0736',2.9900,10125.0000,24,18722,'The latest medical and psychological techniques for living with the electronic office. Easy-to-understand explanations.','1991-06-30 00:00:00'),('BU7832','Straight Talk About Computers','business','1389',19.9900,5000.0000,10,4095,'Annotated analysis of what computers can do for you: a no-hype guide for the critical user.','1991-06-22 00:00:00'),('MC2222','Silicon Valley Gastronomic Treats','mod_cook','0877',19.9900,0.0000,12,2032,'Favorite recipes for quick, easy, and elegant meals.','1991-06-09 00:00:00'),('MC3021','The Gourmet Microwave','mod_cook','0877',2.9900,15000.0000,24,22246,'Traditional French gourmet recipes adapted for modern microwave cooking.','1991-06-18 00:00:00'),('MC3026','The Psychology of Computer Cooking','UNDECIDED','0877',NULL,NULL,NULL,NULL,NULL,'2014-11-07 10:39:37'),('PC1035','But Is It User Friendly?','popular_comp','1389',22.9500,7000.0000,16,8780,'A survey of software for the naive user, focusing on the \'friendliness\' of each.','1991-06-30 00:00:00'),('PC8888','Secrets of Silicon Valley','popular_comp','1389',20.0000,8000.0000,10,4095,'Muckraking reporting on the world\'s largest computer hardware and software manufacturers.','1994-06-12 00:00:00'),('PC9999','Net Etiquette','popular_comp','1389',NULL,NULL,NULL,NULL,'A must-read for computer conferencing.','2014-11-07 10:39:37'),('PS1372','Computer Phobic AND Non-Phobic Individuals: Behavior Variations','psychology','0877',21.5900,7000.0000,10,375,'A must for the specialist, this book examines the difference between those who hate and fear computers and those who don\'t.','1991-10-21 00:00:00'),('PS2091','Is Anger the Enemy?','psychology','0736',10.9500,2275.0000,12,2045,'Carefully researched study of the effects of strong emotions on the body. Metabolic charts included.','1991-06-15 00:00:00'),('PS2106','Life Without Fear','psychology','0736',7.0000,6000.0000,10,111,'New exercise, meditation, and nutritional techniques that can reduce the shock of daily interactions. Popular audience. Sample menus included, exercise video available separately.','1991-10-05 00:00:00'),('PS3333','Prolonged Data Deprivation: Four Case Studies','psychology','0736',19.9900,2000.0000,10,4072,'What happens when the data runs dry?  Searching evaluations of information-shortage effects.','1991-06-12 00:00:00'),('PS7777','Emotional Security: A New Algorithm','psychology','0736',7.9900,4000.0000,10,3336,'Protecting yourself and your loved ones from undue emotional stress in the modern world. Use of computer and nutritional aids emphasized.','1991-06-12 00:00:00'),('TC3218','Onions, Leeks, and Garlic: Cooking Secrets of the Mediterranean','trad_cook','0877',20.9500,7000.0000,10,375,'Profusely illustrated in color, this makes a wonderful gift book for a cuisine-oriented friend.','1991-10-21 00:00:00'),('TC4203','Fifty Years in Buckingham Palace Kitchens','trad_cook','0877',11.9500,4000.0000,14,15096,'More anecdotes from the Queen\'s favorite cook describing life among English royalty. Recipes, techniques, tender vignettes.','1991-06-12 00:00:00'),('TC7777','Sushi, Anyone?','trad_cook','0877',14.9900,8000.0000,10,4095,'Detailed instructions on how to make authentic Japanese sushi in your spare time.','1991-06-12 00:00:00');
/*!40000 ALTER TABLE `titles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;


DROP TABLE IF EXISTS `roysched`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roysched` (
  `title_id` varchar(6) NOT NULL,
  `lorange` int(11) DEFAULT NULL,
  `hirange` int(11) DEFAULT NULL,
  `royalty` int(11) DEFAULT NULL,
  KEY `roysched_title_id` (`title_id`),
  CONSTRAINT `roysched_ibfk_1` FOREIGN KEY (`title_id`) REFERENCES `titles` (`title_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roysched`
--

LOCK TABLES `roysched` WRITE;
/*!40000 ALTER TABLE `roysched` DISABLE KEYS */;
INSERT INTO `roysched` VALUES ('BU1032',0,5000,10),('BU1032',5001,50000,12),('PC1035',0,2000,10),('PC1035',2001,3000,12),('PC1035',3001,4000,14),('PC1035',4001,10000,16),('PC1035',10001,50000,18),('BU2075',0,1000,10),('BU2075',1001,3000,12),('BU2075',3001,5000,14),('BU2075',5001,7000,16),('BU2075',7001,10000,18),('BU2075',10001,12000,20),('BU2075',12001,14000,22),('BU2075',14001,50000,24),('PS2091',0,1000,10),('PS2091',1001,5000,12),('PS2091',5001,10000,14),('PS2091',10001,50000,16),('PS2106',0,2000,10),('PS2106',2001,5000,12),('PS2106',5001,10000,14),('PS2106',10001,50000,16),('MC3021',0,1000,10),('MC3021',1001,2000,12),('MC3021',2001,4000,14),('MC3021',4001,6000,16),('MC3021',6001,8000,18),('MC3021',8001,10000,20),('MC3021',10001,12000,22),('MC3021',12001,50000,24),('TC3218',0,2000,10),('TC3218',2001,4000,12),('TC3218',4001,6000,14),('TC3218',6001,8000,16),('TC3218',8001,10000,18),('TC3218',10001,12000,20),('TC3218',12001,14000,22),('TC3218',14001,50000,24),('PC8888',0,5000,10),('PC8888',5001,10000,12),('PC8888',10001,15000,14),('PC8888',15001,50000,16),('PS7777',0,5000,10),('PS7777',5001,50000,12),('PS3333',0,5000,10),('PS3333',5001,10000,12),('PS3333',10001,15000,14),('PS3333',15001,50000,16),('BU1111',0,4000,10),('BU1111',4001,8000,12),('BU1111',8001,10000,14),('BU1111',12001,16000,16),('BU1111',16001,20000,18),('BU1111',20001,24000,20),('BU1111',24001,28000,22),('BU1111',28001,50000,24),('MC2222',0,2000,10),('MC2222',2001,4000,12),('MC2222',4001,8000,14),('MC2222',8001,12000,16),('MC2222',12001,20000,18),('MC2222',20001,50000,20),('TC7777',0,5000,10),('TC7777',5001,15000,12),('TC7777',15001,50000,14),('TC4203',0,2000,10),('TC4203',2001,8000,12),('TC4203',8001,16000,14),('TC4203',16001,24000,16),('TC4203',24001,32000,18),('TC4203',32001,40000,20),('TC4203',40001,50000,22),('BU7832',0,5000,10),('BU7832',5001,10000,12),('BU7832',10001,15000,14),('BU7832',15001,20000,16),('BU7832',20001,25000,18),('BU7832',25001,30000,20),('BU7832',30001,35000,22),('BU7832',35001,50000,24),('PS1372',0,10000,10),('PS1372',10001,20000,12),('PS1372',20001,30000,14),('PS1372',30001,40000,16),('PS1372',40001,50000,18);
/*!40000 ALTER TABLE `roysched` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales` (
  `stor_id` char(4) NOT NULL,
  `ord_num` varchar(20) NOT NULL,
  `ord_date` datetime NOT NULL,
  `qty` smallint(6) NOT NULL,
  `payterms` varchar(12) NOT NULL,
  `title_id` varchar(6) NOT NULL,
  PRIMARY KEY (`stor_id`,`ord_num`,`title_id`),
  KEY `sales_title_id` (`title_id`),
  CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`stor_id`) REFERENCES `stores` (`stor_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`title_id`) REFERENCES `titles` (`title_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES ('6380','6871','1994-09-14 00:00:00',5,'Net 60','BU1032'),('6380','722a','1994-09-13 00:00:00',3,'Net 60','PS2091'),('7066','A2976','1993-05-24 00:00:00',50,'Net 30','PC8888'),('7066','QA7442.3','1994-09-13 00:00:00',75,'ON invoice','PS2091'),('7067','D4482','1994-09-14 00:00:00',10,'Net 60','PS2091'),('7067','P2121','1992-06-15 00:00:00',40,'Net 30','TC3218'),('7067','P2121','1992-06-15 00:00:00',20,'Net 30','TC4203'),('7067','P2121','1992-06-15 00:00:00',20,'Net 30','TC7777'),('7131','N914008','1994-09-14 00:00:00',20,'Net 30','PS2091'),('7131','N914014','1994-09-14 00:00:00',25,'Net 30','MC3021'),('7131','P3087a','1993-05-29 00:00:00',20,'Net 60','PS1372'),('7131','P3087a','1993-05-29 00:00:00',25,'Net 60','PS2106'),('7131','P3087a','1993-05-29 00:00:00',15,'Net 60','PS3333'),('7131','P3087a','1993-05-29 00:00:00',25,'Net 60','PS7777'),('7896','QQ2299','1993-10-28 00:00:00',15,'Net 60','BU7832'),('7896','TQ456','1993-12-12 00:00:00',10,'Net 60','MC2222'),('7896','X999','1993-02-21 00:00:00',35,'ON invoice','BU2075'),('8042','423LL922','1994-09-14 00:00:00',15,'ON invoice','MC3021'),('8042','423LL930','1994-09-14 00:00:00',10,'ON invoice','BU1032'),('8042','P723','1993-03-11 00:00:00',25,'Net 30','BU1111'),('8042','QA879.1','1993-05-22 00:00:00',30,'Net 30','PC1035');
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `titleauthor`
--

DROP TABLE IF EXISTS `titleauthor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `titleauthor` (
  `au_id` varchar(11) NOT NULL,
  `title_id` varchar(6) NOT NULL,
  `au_ord` tinyint(4) DEFAULT NULL,
  `royaltyper` int(11) DEFAULT NULL,
  PRIMARY KEY (`au_id`,`title_id`),
  KEY `titleauthor_title_id` (`title_id`),
  CONSTRAINT `titleauthor_ibfk_1` FOREIGN KEY (`title_id`) REFERENCES `titles` (`title_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `titleauthor_ibfk_2` FOREIGN KEY (`au_id`) REFERENCES `authors` (`au_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titleauthor`
--

LOCK TABLES `titleauthor` WRITE;
/*!40000 ALTER TABLE `titleauthor` DISABLE KEYS */;
INSERT INTO `titleauthor` VALUES ('172-32-1176','PS3333',1,100),('213-46-8915','BU1032',2,40),('213-46-8915','BU2075',1,100),('238-95-7766','PC1035',1,100),('267-41-2394','BU1111',2,40),('267-41-2394','TC7777',2,30),('274-80-9391','BU7832',1,100),('409-56-7008','BU1032',1,60),('427-17-2319','PC8888',1,50),('472-27-2349','TC7777',3,30),('486-29-1786','PC9999',1,100),('486-29-1786','PS7777',1,100),('648-92-1872','TC4203',1,100),('672-71-3249','TC7777',1,40),('712-45-1867','MC2222',1,100),('722-51-5454','MC3021',1,75),('724-80-9391','BU1111',1,60),('724-80-9391','PS1372',2,25),('756-30-7391','PS1372',1,75),('807-91-6654','TC3218',1,100),('846-92-7186','PC8888',2,50),('899-46-2035','MC3021',2,25),('899-46-2035','PS2091',2,50),('998-72-3567','PS2091',1,50),('998-72-3567','PS2106',1,100);
/*!40000 ALTER TABLE `titleauthor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titles`
--

DROP TABLE IF EXISTS `titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `titles` (
  `title_id` varchar(6) NOT NULL,
  `title` varchar(80) NOT NULL,
  `type` char(12) NOT NULL,
  `pub_id` char(4) DEFAULT NULL,
  `price` decimal(19,4) DEFAULT NULL,
  `advance` decimal(19,4) DEFAULT NULL,
  `royalty` int(11) DEFAULT NULL,
  `ytd_sales` int(11) DEFAULT NULL,
  `notes` varchar(200) DEFAULT NULL,
  `pubdate` datetime NOT NULL,
  PRIMARY KEY (`title_id`),
  KEY `titles_pub_id` (`pub_id`),
  CONSTRAINT `titles_ibfk_1` FOREIGN KEY (`pub_id`) REFERENCES `publishers` (`pub_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titles`
--

LOCK TABLES `titles` WRITE;
/*!40000 ALTER TABLE `titles` DISABLE KEYS */;
INSERT INTO `titles` VALUES ('BU1032','The Busy Executive\'s Database Guide','business','1389',19.9900,5000.0000,10,4095,'An overview of available database systems with emphasis on common business applications. Illustrated.','1991-06-12 00:00:00'),('BU1111','Cooking with Computers: Surreptitious Balance Sheets','business','1389',11.9500,5000.0000,10,3876,'Helpful hints on how to use your electronic resources to the best advantage.','1991-06-09 00:00:00'),('BU2075','You Can Combat Computer Stress!','business','0736',2.9900,10125.0000,24,18722,'The latest medical and psychological techniques for living with the electronic office. Easy-to-understand explanations.','1991-06-30 00:00:00'),('BU7832','Straight Talk About Computers','business','1389',19.9900,5000.0000,10,4095,'Annotated analysis of what computers can do for you: a no-hype guide for the critical user.','1991-06-22 00:00:00'),('MC2222','Silicon Valley Gastronomic Treats','mod_cook','0877',19.9900,0.0000,12,2032,'Favorite recipes for quick, easy, and elegant meals.','1991-06-09 00:00:00'),('MC3021','The Gourmet Microwave','mod_cook','0877',2.9900,15000.0000,24,22246,'Traditional French gourmet recipes adapted for modern microwave cooking.','1991-06-18 00:00:00'),('MC3026','The Psychology of Computer Cooking','UNDECIDED','0877',NULL,NULL,NULL,NULL,NULL,'2014-11-07 10:39:37'),('PC1035','But Is It User Friendly?','popular_comp','1389',22.9500,7000.0000,16,8780,'A survey of software for the naive user, focusing on the \'friendliness\' of each.','1991-06-30 00:00:00'),('PC8888','Secrets of Silicon Valley','popular_comp','1389',20.0000,8000.0000,10,4095,'Muckraking reporting on the world\'s largest computer hardware and software manufacturers.','1994-06-12 00:00:00'),('PC9999','Net Etiquette','popular_comp','1389',NULL,NULL,NULL,NULL,'A must-read for computer conferencing.','2014-11-07 10:39:37'),('PS1372','Computer Phobic AND Non-Phobic Individuals: Behavior Variations','psychology','0877',21.5900,7000.0000,10,375,'A must for the specialist, this book examines the difference between those who hate and fear computers and those who don\'t.','1991-10-21 00:00:00'),('PS2091','Is Anger the Enemy?','psychology','0736',10.9500,2275.0000,12,2045,'Carefully researched study of the effects of strong emotions on the body. Metabolic charts included.','1991-06-15 00:00:00'),('PS2106','Life Without Fear','psychology','0736',7.0000,6000.0000,10,111,'New exercise, meditation, and nutritional techniques that can reduce the shock of daily interactions. Popular audience. Sample menus included, exercise video available separately.','1991-10-05 00:00:00'),('PS3333','Prolonged Data Deprivation: Four Case Studies','psychology','0736',19.9900,2000.0000,10,4072,'What happens when the data runs dry?  Searching evaluations of information-shortage effects.','1991-06-12 00:00:00'),('PS7777','Emotional Security: A New Algorithm','psychology','0736',7.9900,4000.0000,10,3336,'Protecting yourself and your loved ones from undue emotional stress in the modern world. Use of computer and nutritional aids emphasized.','1991-06-12 00:00:00'),('TC3218','Onions, Leeks, and Garlic: Cooking Secrets of the Mediterranean','trad_cook','0877',20.9500,7000.0000,10,375,'Profusely illustrated in color, this makes a wonderful gift book for a cuisine-oriented friend.','1991-10-21 00:00:00'),('TC4203','Fifty Years in Buckingham Palace Kitchens','trad_cook','0877',11.9500,4000.0000,14,15096,'More anecdotes from the Queen\'s favorite cook describing life among English royalty. Recipes, techniques, tender vignettes.','1991-06-12 00:00:00'),('TC7777','Sushi, Anyone?','trad_cook','0877',14.9900,8000.0000,10,4095,'Detailed instructions on how to make authentic Japanese sushi in your spare time.','1991-06-12 00:00:00');
/*!40000 ALTER TABLE `titles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

SELECT * from titles



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-01 16:44:55


LOCK TABLES `store_sales_summary` WRITE;
DROP TABLE IF EXISTS `store_sales_summary`;
UNLOCK TABLES;



CREATE TABLE store_sales_summary
SELECT stores.stor_id AS StoreID, stores.stor_name AS Store, COUNT(DISTINCT(ord_num)) AS Orders, COUNT(title_id) AS Items, SUM(qty) AS Qty
FROM sales sales
INNER JOIN stores stores ON stores.stor_id = sales.stor_id
GROUP BY StoreID, Store;



SELECT *
FROM store_sales_summary;


DELETE FROM store_sales_summary
WHERE Qty < 80;



DELETE FROM store_sales_summary;


SELECT *
FROM store_sales_summary;





INSERT INTO store_sales_summary
SELECT stores.stor_id AS StoreID, stores.stor_name AS Store, COUNT(DISTINCT(ord_num)) AS Orders, COUNT(title_id) AS Items, SUM(qty) AS Qty
FROM sales sales
INNER JOIN stores stores ON stores.stor_id = sales.stor_id
GROUP BY StoreID, Store;


SELECT * from store_sales_summary


UPDATE store_sales_summary
SET Qty = Qty + 5


SELECT *
FROM store_sales_summary;

UPDATE store_sales_summary
SET Qty = Qty + 10
WHERE Qty < 100




-- This is for next session :)


SELECT * from sales ;
SELECT * from stores;
SELECT * from titles;

-- orders, items and total quantity per store

SELECT stores.stor_name AS Store, title_id, count(ord_num), COUNT(DISTINCT(ord_num)) AS Orders, 
    COUNT(title_id) AS Items, SUM(qty) AS Qty
FROM database_name.sales sales
INNER JOIN database_name.stores stores ON stores.stor_id = sales.stor_id
GROUP BY 1,2 ;

-- What if I want average items per order and average quantity?
-- Can we perform that without a subquery? YES

SELECT stores.stor_name AS Store, COUNT(title_id)/COUNT(DISTINCT(ord_num)) AS AvgItems, SUM(qty)/COUNT(title_id) AS AvgQty
FROM database_name.sales sales
INNER JOIN database_name.stores stores ON stores.stor_id = sales.stor_id
GROUP BY 1;

-- Can we perform this with a subquery? YES

SELECT Store, Items/Orders AS AvgItems, Qty/Items AS AvgQty
FROM (
    SELECT stores.stor_name AS Store, COUNT(DISTINCT(ord_num)) AS Orders, COUNT(title_id) AS Items, SUM(qty) AS Qty
    FROM sales JOHAN
    INNER JOIN stores stores ON stores.stor_id = JOHAN.stor_id
    GROUP BY Store
) summary;

-- sales by TITLE for the two stores that averaged more than one item per order. We can obtain these results by 
-- adding the stor_id field to our subquery, joining the subquery results to the sales table, creating another join
--  between the sales table and the title table, and then adding a WHERE clause to the main query so that it returns only results
-- where the average items per order were greater than 1.

SELECT Store, ord_num AS OrderNumber, ord_date AS OrderDate, title AS Title, sales.qty AS Qty, summary.Qty as sumqty, price AS Price, type as Type
FROM (
	SELECT stores.stor_id AS StoreID, stores.stor_name AS Store, COUNT(DISTINCT(ord_num)) AS Orders, COUNT(title_id) AS Items, SUM(qty) AS Qty
	FROM sales sales
	INNER JOIN stores stores ON stores.stor_id = sales.stor_id
	GROUP BY StoreID, Store
) summary
INNER JOIN sales sales ON summary.StoreID = sales.stor_id
INNER JOIN titles ON sales.title_id = titles.title_id
WHERE Items / Orders > 1;


-- temporary derived table

CREATE TEMPORARY TABLE store_sales_summary
SELECT stores.stor_id AS StoreID, stores.stor_name AS Store, COUNT(DISTINCT(ord_num)) AS Orders, COUNT(title_id) AS Items, SUM(qty) AS Qty
FROM sales sales
INNER JOIN stores stores ON stores.stor_id = sales.stor_id
GROUP BY StoreID, Store;

-- This created a new temp table in the publications database that has the results of our query stored in it. Now that our temp table has been created, we can query it just like any other table.

SELECT * FROM store_sales_summary;

SELECT Store, ord_num AS OrderNumber, ord_date AS OrderDate, title AS Title, sales.qty AS Qty, price AS Price, type as Type
FROM store_sales_summary summary
INNER JOIN sales sales ON summary.StoreID = sales.stor_id
INNER JOIN titles ON sales.title_id = titles.title_id
WHERE Items / Orders > 1;



-- ephemeral derived table

with ironhackers as (
SELECT stores.stor_id AS StoreID, stores.stor_name AS Store, COUNT(DISTINCT(ord_num)) AS Orders, COUNT(title_id) AS Items, SUM(qty) AS Qty
FROM sales sales
INNER JOIN stores stores ON stores.stor_id = sales.stor_id
GROUP BY StoreID, Store),

SQLROCKS as (
SELECT stores.stor_id AS StoreID, stores.stor_name AS Store, COUNT(DISTINCT(ord_num)) AS Orders, COUNT(title_id) AS Items, SUM(qty) AS Qty
FROM sales sales
INNER JOIN stores stores ON stores.stor_id = sales.stor_id
GROUP BY StoreID, Store)

SELECT * FROM SQLROCKS;

SELECT * FROM ironhackers;



-- More about joins;



SELECT * FROM publishers;

SELECT * FROM titles;


SELECT  pub_id, count(pub_id) FROM publishers group by 1 order by 1 desc;

SELECT  pub_id, count(pub_id) FROM titles group by 1 order by 1 desc;

-- Inner and leftjoin

SELECT pubs.pub_name, COUNT(titles.title_id) AS Titles
FROM publishers pubs
LEFT JOIN titles titles
ON pubs.pub_id = titles.pub_id
GROUP BY pubs.pub_name;

-- What is the relationship of both tables?

SELECT *
FROM publishers pubs
LEFT JOIN titles titles ON pubs.pub_id = titles.pub_id

-- counting publishers without join

SELECT  count(pub_id) FROM publishers  order by 1 desc;

-- counting publishers with join; beware with the fanout

SELECT  count(distinct titles.pub_id) 
FROM publishers pubs
LEFT JOIN titles titles ON pubs.pub_id = titles.pub_id


-- bonustrack; right join. Here I want the full titles list


SELECT titles.title, titles.type, titles.price, SUM(s.qty) AS units_sold
FROM sales s 
RIGHT JOIN titles titles ON s.title_id = titles.title_id
GROUP BY titles.title, titles.type, titles.price;

-- note that the case seen before equals the one following;

SELECT titles.title, titles.type, titles.price, SUM(sales.qty) AS units_sold
			FROM titles 
			left JOIN sales ON sales.title_id = titles.title_id
GROUP BY titles.title, titles.type, titles.price;


-- FULL OUTER joins are not supported in MySQL.

SELECT *
FROM employee emp
RIGHT JOIN jobs job
ON emp.job_id = job.job_id
UNION
SELECT *
FROM employee emp
LEFT JOIN jobs job
ON emp.job_id = job.job_id;

-- doing appends;

SELECT *
FROM employee emp
RIGHT JOIN jobs job
ON emp.job_id = job.job_id
UNION ALL
SELECT *
FROM employee emp
LEFT JOIN jobs job
ON emp.job_id = job.job_id;



/* Challenge 1 - Who Have Published What At Where?
 */

SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, t.title AS TITLE, p.pub_name AS PUBLISHER
FROM authors a
JOIN titleauthor ta ON a.au_id = ta.au_id 
JOIN titles t ON ta.title_id = t.title_id 
JOIN publishers p ON p.pub_id = t.pub_id 


/* Challenge 2 - Who Have Published How Many At Where?
 */

SELECT a.au_id AS AUTHOR_ID,
a.au_lname AS LAST_NAME,
a.au_fname AS FIRST_NAME,
p.pub_name ,
COUNT(ta.title_id) AS TITLE_COUNT
FROM authors a
JOIN titleauthor ta ON a.au_id = ta.au_id 
JOIN titles t ON ta.title_id = t.title_id 
JOIN publishers p ON p.pub_id = t.pub_id
GROUP by 1,2,3,4
order by 5 desc


/*
Challenge 3 - Best Selling Authors
 */

SELECT 
a.au_id AS AUTHOR_ID,
a.au_lname AS LAST_NAME,
a.au_fname AS FIRST_NAME,
SUM(s.qty) AS TOTAL
FROM authors a
JOIN titleauthor ta ON a.au_id = ta.au_id 
JOIN titles t ON ta.title_id = t.title_id 
JOIN publishers p ON p.pub_id = t.pub_id
JOIN sales s ON s.title_id = t.title_id 
GROUP BY 1,2,3
ORDER BY 4 DESC 
/* LIMIT 3


/*
Challenge 4 - Best Selling Authors Ranking
 */

SELECT 
a.au_id AS AUTHOR_ID,
a.au_lname AS LAST_NAME,
a.au_fname AS FIRST_NAME,
SUM(s.qty) AS TOTAL
FROM authors a
JOIN titleauthor ta ON a.au_id = ta.au_id 
JOIN titles t ON ta.title_id = t.title_id 
JOIN publishers p ON p.pub_id = t.pub_id
JOIN sales s ON s.title_id = t.title_id 
GROUP BY 1,2,3
ORDER BY 4 DESC

SELECT * FROM authors a ;

