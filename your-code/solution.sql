-- AUTHOR ID - the ID of the author
-- LAST NAME - author last name
-- FIRST NAME - author first name
-- TITLE - name of the published title
-- PUBLISHER - name of the publisher where the title was published

DROP TABLE IF EXISTS stor_id;
DROP TABLE IF EXISTS discounts_ibfk_1;
DROP TABLE IF EXISTS titleauthor;
DROP TABLE IF EXISTS authors;
DROP TABLE IF EXISTS jobs;

-- SELECT AUTHOR ID ,LAST NAME ,FIRST NAME, TITLE, PUBLISHER 
CREATE TABLE authors (
  au_id varchar(11) NOT NULL,
  au_lname varchar(40) NOT NULL,
  au_fname varchar(20) NOT NULL,
  phone char(12) NOT NULL,
  address varchar(40) DEFAULT NULL,
  city varchar(20) DEFAULT NULL,
  state char(2) DEFAULT NULL,
  zip char(5) DEFAULT NULL,
  contract tinyint(4) NOT NULL,
  PRIMARY KEY (`au_id`)
);

LOCK TABLES authors WRITE;

INSERT INTO authors VALUES ('172-32-1176','White','Johnson','408 496-7223','10932 Bigge Rd.','Menlo Park','CA','94025',1),('213-46-8915','Green','Marjorie','415 986-7020','309 63rd St. #411','Oakland','CA','94618',1),('238-95-7766','Carson','Cheryl','415 548-7723','589 Darwin Ln.','Berkeley','CA','94705',1),('267-41-2394','O\'Leary','Michael','408 286-2428','22 Cleveland Av. #14','San Jose','CA','95128',1),('274-80-9391','Straight','Dean','415 834-2919','5420 College Av.','Oakland','CA','94609',1),('341-22-1782','Smith','Meander','913 843-0462','10 Mississippi Dr.','Lawrence','KS','66044',0),('409-56-7008','Bennet','Abraham','415 658-9932','6223 Bateman St.','Berkeley','CA','94705',1),('427-17-2319','Dull','Ann','415 836-7128','3410 Blonde St.','Palo Alto','CA','94301',1),('472-27-2349','Gringlesby','Burt','707 938-6445','PO Box 792','Covelo','CA','95428',1),('486-29-1786','Locksley','Charlene','415 585-4620','18 Broadway Av.','San Francisco','CA','94130',1),('527-72-3246','Greene','Morningstar','615 297-2723','22 Graybar House Rd.','Nashville','TN','37215',0),('648-92-1872','Blotchet-Halls','Reginald','503 745-6402','55 Hillsdale Bl.','Corvallis','OR','97330',1),('672-71-3249','Yokomoto','Akiko','415 935-4228','3 Silver Ct.','Walnut Creek','CA','94595',1),('712-45-1867','del Castillo','Innes','615 996-8275','2286 Cram Pl. #86','Ann Arbor','MI','48105',1),('722-51-5454','DeFrance','Michel','219 547-9982','3 Balding Pl.','Gary','IN','46403',1),('724-08-9931','Stringer','Dirk','415 843-2991','5420 Telegraph Av.','Oakland','CA','94609',0),('724-80-9391','MacFeather','Stearns','415 354-7128','44 Upland Hts.','Oakland','CA','94612',1),('756-30-7391','Karsen','Livia','415 534-9219','5720 McAuley St.','Oakland','CA','94609',1),('807-91-6654','Panteley','Sylvia','301 946-8853','1956 Arlington Pl.','Rockville','MD','20853',1),('846-92-7186','Hunter','Sheryl','415 836-7128','3410 Blonde St.','Palo Alto','CA','94301',1),('893-72-1158','McBadden','Heather','707 448-4982','301 Putnam','Vacaville','CA','95688',0),('899-46-2035','Ringer','Anne','801 826-0752','67 Seventh Av.','Salt Lake City','UT','84152',1),('998-72-3567','Ringer','Albert','801 826-0752','67 Seventh Av.','Salt Lake City','UT','84152',1);

UNLOCK TABLES;
DROP TABLE IF EXISTS discounts;

CREATE TABLE discounts (
  discounttype varchar(40) NOT NULL,
  stor_id char(4) DEFAULT NULL,
  lowqty smallint(6) DEFAULT NULL,
  highqty smallint(6) DEFAULT NULL,
  discount decimal(4,2) NOT NULL,
  KEY discounts_stor_id (stor_id),
  CONSTRAINT discounts_ibfk_1 FOREIGN KEY (stor_id) REFERENCES stores (stor_id)
)  DEFAULT CHARACTER SET=utf8;

LOCK TABLES discounts WRITE;

SHOW ENGINE INNODB STATUS;
INSERT INTO `discounts` VALUES ('Initial Customer',NULL,NULL,NULL,10.50),('Volume Discount',NULL,100,1000,6.70),('Customer Discount','8042',NULL,NULL,5.00);
UNLOCK TABLES;
DROP TABLE IF EXISTS `employee`;
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

LOCK TABLES `employee` WRITE;
INSERT INTO `employee` VALUES ('A-C71970F','Aria','','Cruz',10,87,'1389','1991-10-26 00:00:00'),('A-R89858F','Annette','','Roulet',6,152,'9999','1990-02-21 00:00:00'),('AMD15433F','Ann','M','Devon',3,200,'9952','1991-07-16 00:00:00'),('ARD36773F','Anabela','R','Domingues',8,100,'0877','1993-01-27 00:00:00'),('CFH28514M','Carlos','F','Hernadez',5,211,'9999','1989-04-21 00:00:00'),('CGS88322F','Carine','G','Schmitt',13,64,'1389','1992-07-07 00:00:00'),('DBT39435M','Daniel','B','Tonini',11,75,'0877','1990-01-01 00:00:00'),('DWR65030M','Diego','W','Roel',6,192,'1389','1991-12-16 00:00:00'),('ENL44273F','Elizabeth','N','Lincoln',14,35,'0877','1990-07-24 00:00:00'),('F-C16315M','Francisco','','Chang',4,227,'9952','1990-11-03 00:00:00'),('GHT50241M','Gary','H','Thomas',9,170,'0736','1988-08-09 00:00:00'),('H-B39728F','Helen','','Bennett',12,35,'0877','1989-09-21 00:00:00'),('HAN90777M','Helvetius','A','Nagy',7,120,'9999','1993-03-19 00:00:00'),('HAS54740M','Howard','A','Snyder',12,100,'0736','1988-11-19 00:00:00'),('JYL26161F','Janine','Y','Labrune',5,172,'9901','1991-05-26 00:00:00'),('KFJ64308F','Karin','F','Josephs',14,100,'0736','1992-10-17 00:00:00'),('KJJ92907F','Karla','J','Jablonski',9,170,'9999','1994-03-11 00:00:00'),('L-B31947F','Lesley','','Brown',7,120,'0877','1991-02-13 00:00:00'),('LAL21447M','Laurence','A','Lebihan',5,175,'0736','1990-06-03 00:00:00'),('M-L67958F','Maria','','Larsson',7,135,'1389','1992-03-27 00:00:00'),('M-P91209M','Manuel','','Pereira',8,101,'9999','1989-01-09 00:00:00'),('M-R38834F','Martine','','Rance',9,75,'0877','1992-02-05 00:00:00'),('MAP77183M','Miguel','A','Paolino',11,112,'1389','1992-12-07 00:00:00'),('MAS70474F','Margaret','A','Smith',9,78,'1389','1988-09-29 00:00:00'),('MFS52347M','Martin','F','Sommer',10,165,'0736','1990-04-13 00:00:00'),('MGK44605M','Matti','G','Karttunen',6,220,'0736','1994-05-01 00:00:00'),('MJP25939M','Maria','J','Pontes',5,246,'1756','1989-03-01 00:00:00'),('MMS49649F','Mary','M','Saveley',8,175,'0736','1993-06-29 00:00:00'),('PCM98509F','Patricia','C','McKenna',11,150,'9999','1989-08-01 00:00:00'),('PDI47470M','Palle','D','Ibsen',7,195,'0736','1993-05-09 00:00:00'),('PHF38899M','Peter','H','Franken',10,75,'0877','1992-05-17 00:00:00'),('PMA42628M','Paolo','M','Accorti',13,35,'0877','1992-08-27 00:00:00'),('POK93028M','Pirkko','O','Koskitalo',10,80,'9999','1993-11-29 00:00:00'),('PSA89086M','Pedro','S','Afonso',14,89,'1389','1990-12-24 00:00:00'),('PSP68661F','Paula','S','Parente',8,125,'1389','1994-01-19 00:00:00'),('PTC11962M','Philip','T','Cramer',2,215,'9952','1989-11-11 00:00:00'),('PXH22250M','Paul','X','Henriot',5,159,'0877','1993-08-19 00:00:00'),('R-M53550M','Roland','','Mendel',11,150,'0736','1991-09-05 00:00:00'),('RBM23061F','Rita','B','Muller',5,198,'1622','1993-10-09 00:00:00'),('SKO22412M','Sven','K','Ottlieb',5,150,'1389','1991-04-05 00:00:00'),('TPO55093M','Timothy','P','O\'Rourke',13,100,'0736','1988-06-19 00:00:00'),('VPA30890F','Victoria','P','Ashworth',6,140,'0877','1990-09-13 00:00:00'),('Y-L77953M','Yoshi','','Latimer',12,32,'1389','1989-06-11 00:00:00');
UNLOCK TABLES;
DROP TABLE IF EXISTS jobs;
CREATE TABLE `jobs` (
  `job_id` smallint(6) NOT NULL,
  `job_desc` varchar(50) NOT NULL,
  `min_lvl` smallint(6) NOT NULL,
  `max_lvl` smallint(6) NOT NULL,
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
