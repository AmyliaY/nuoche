# SQL Manager 2007 for MySQL 4.5.0.7
# ---------------------------------------
# Host     : 42.51.23.42
# Port     : 3306
# Database : jiayouzhan


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;



USE `nuoche`;

#
# Structure for the `gas_station` table : 
#

DROP TABLE IF EXISTS `jiayou_station`;

CREATE TABLE `jiayou_station` (
  `gid` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `aid` INTEGER(11) DEFAULT NULL,
  `gname` VARCHAR(32) COLLATE utf8_general_ci DEFAULT NULL,
  `gaddress` VARCHAR(32) COLLATE utf8_general_ci DEFAULT NULL,
  `gcode` VARCHAR(32) COLLATE utf8_general_ci DEFAULT NULL,
  `gpicture` VARCHAR(32) COLLATE utf8_general_ci DEFAULT NULL,
  `gdescribe` VARCHAR(32) COLLATE utf8_general_ci DEFAULT NULL,
  `gstatus` INTEGER(11) DEFAULT NULL,
  `gzuobiaox` VARCHAR(20) COLLATE utf8_general_ci DEFAULT NULL,
  `gzuobiaoy` VARCHAR(20) COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`gid`)
  

)ENGINE=InnoDB COMMENT='' CHECKSUM=0 DELAY_KEY_WRITE=0 PACK_KEYS=0 MIN_ROWS=0 MAX_ROWS=0 ROW_FORMAT=COMPACT CHARACTER SET 'utf8' COLLATE 'utf8_general_ci';

#
# Structure for the `gas_emp` table : 
#

DROP TABLE IF EXISTS `jiayou_emp`;

CREATE TABLE `jiayou_emp` (
  `geid` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `gename` VARCHAR(20) COLLATE utf8_general_ci NOT NULL,
  `gid` INTEGER(11) NOT NULL,
  `gecard` VARCHAR(20) COLLATE utf8_general_ci NOT NULL,
  `genumber` VARCHAR(25) COLLATE utf8_general_ci DEFAULT NULL,
  `geadress` VARCHAR(32) COLLATE utf8_general_ci DEFAULT NULL,
  `gestatus` INTEGER(2) NOT NULL DEFAULT '1',
  `getime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `geover` TIMESTAMP NOT NULL ,
  `gecode` VARCHAR(40) COLLATE utf8_general_ci DEFAULT NULL,
  `gecode2` VARCHAR(40) COLLATE utf8_general_ci DEFAULT NULL,
  `gerating` FLOAT(9,3) DEFAULT '0.000',
  `gepeople` INTEGER(11) DEFAULT '0',
  PRIMARY KEY (`geid`),
  KEY `gid` (`gid`),
  CONSTRAINT `gas_emp_fk2` FOREIGN KEY (`gid`) REFERENCES `jiayou_station`(`gid`)

)ENGINE=InnoDB COMMENT='' CHECKSUM=0 DELAY_KEY_WRITE=0 PACK_KEYS=0 MIN_ROWS=0 MAX_ROWS=0 ROW_FORMAT=COMPACT CHARACTER SET 'utf8' COLLATE 'utf8_general_ci';

#
# Structure for the `oil` table : 
#

DROP TABLE IF EXISTS `jiayou_zhekou`;

CREATE TABLE `jiayou_zhekou` (
  `oid` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `oname` VARCHAR(32) COLLATE utf8_general_ci DEFAULT NULL,
  `ostyle` INTEGER(11) DEFAULT NULL,
  `oprice` FLOAT(9,3) DEFAULT NULL,
  `odetail` TEXT COLLATE utf8_general_ci,
  `ostatus` INTEGER(2) NOT NULL DEFAULT '1',
  `ostation` INTEGER(11) ,
  `zhekou`  FLOAT(9,3) DEFAULT 1,
  PRIMARY KEY (`oid`),
  KEY `ostation`(`ostation`),
  CONSTRAINT `jiayou_zhekou_fk` FOREIGN KEY (`ostation`) REFERENCES `jiayou_station`(`gid`)
)ENGINE=InnoDB COMMENT='' CHECKSUM=0 DELAY_KEY_WRITE=0 PACK_KEYS=0 MIN_ROWS=0 MAX_ROWS=0 ROW_FORMAT=COMPACT CHARACTER SET 'utf8' COLLATE 'utf8_general_ci';

#
# Structure for the `printer` table : 
#

DROP TABLE IF EXISTS `jiayou_printer`;

CREATE TABLE `jiayou_printer` (
  `pid` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `gsid` INTEGER(11) DEFAULT NULL,
  `pstatus` TINYINT(1) DEFAULT '0' COMMENT '?????????0???????',
  `mcode` CHAR(10) COLLATE utf8_general_ci DEFAULT NULL COMMENT '??????',
  `msign` CHAR(12) COLLATE utf8_general_ci DEFAULT NULL COMMENT '???????',
  `pname` CHAR(20) COLLATE utf8_general_ci DEFAULT NULL COMMENT '???????',
  `psign` CHAR(32) COLLATE utf8_general_ci DEFAULT NULL COMMENT '????????',
  PRIMARY KEY (`pid`)

)ENGINE=InnoDB COMMENT='' CHECKSUM=0 DELAY_KEY_WRITE=0 PACK_KEYS=0 MIN_ROWS=0 MAX_ROWS=0 ROW_FORMAT=COMPACT CHARACTER SET 'utf8' COLLATE 'utf8_general_ci';

#
# Data for the `gas_station` table  (LIMIT 0,500)
#

INSERT INTO `jiayou_station` (`gid`, `gname`, `gaddress`, `gcode`, `gpicture`, `gdescribe`, `gstatus`, `gzuobiaox`, `gzuobiaoy`) VALUES 
  (5,'益阳市大利加油站','益阳市赫山区龙光桥镇欧阳塘村',NULL,'1476613655429.jpg','快乐加油，优惠到家',1,'112.420805','28.570217'),
  (6,'汉寿大利加油站','汉寿县毓德铺镇',NULL,'1476613409217.jpg','快乐加油，优惠到家',1,'112.04552','28.751509'),
  (7,'测试加油站','测试地址',NULL,'1495606785372.png','测试用',0,'111','111');
COMMIT;

#
# Data for the `oil` table  (LIMIT 0,500)
#

INSERT INTO `jiayou_zhekou` (`oid`, `oname`, `ostyle`, `oprice`, `odetail`, `ostatus`, `ostation`,`zhekou`) VALUES 
  (1,'92#汽油',2,7.440,'93#汽油',1,5,0.9),
  (2,'95#汽油',2,7.900,'97#汽油',1,5,0.88),
  (3,'车用柴油',1,6.390,'车用柴油',1,5,0.88),
  (4,'92#汽油',2,7.340,'93#汽油',1,6,0.88),
  (5,'98#汽油',2,10.000,'测试用',1,7,0.88),
  (6,'车用柴油',1,6.780,'车用柴油',1,7,0.88);
COMMIT;

#
# Data for the `gas_emp` table  (LIMIT 0,500)
#

INSERT INTO `jiayou_emp` (`geid`, `gename`, `gid`, `gecard`, `genumber`, `geadress`, `gestatus`, `getime`, `geover`, `gecode`, `gecode2`, `gerating`, `gepeople`) VALUES 
  (23,'熊建坤',5,'432321196410066836','15080700448','益阳市赫山区大利加油站\t\t\t\t\t',1,'2016-10-16 04:52:00','2016-10-16 04:52:00','23.png','232.png',4.740,681),
  (24,'曹智梅',5,'430903197711174606','07372660666','益阳市赫山区大利加油站\t\t\t\t',1,'2016-10-17 19:22:13','2016-10-17 19:22:13','24.png','242.png',4.791,1941),
  (25,'龙玲',5,'432321197102027127','07372660666','益阳市赫山区大利加油站\t\t\t\t\t',1,'2016-10-17 19:23:33','2016-10-17 19:23:33','25.png','252.png',4.627,1529),
  (26,'刘佳',6,'111111111111111111','15116783860','\t\t\t',0,'2018-06-20 09:00:57','2018-06-20 09:02:29','26.png','262.png',0.000,0),
  (27,'杨远达',6,'111111111111111111','13548678611','\t\t\t\t',1,'2016-11-13 19:39:54','2016-11-13 19:35:15','27.png','272.png',5.046,622),
  (28,'蔡世红',5,'430903199109214512','13786799811','益阳大利加油站\t\t\t',1,'2016-11-13 19:38:39','2016-11-13 19:38:04','28.png','282.png',4.774,1264),
  (29,'蔡娟',5,'612425199603178226','18230506136','益阳市大利加油站\t\t\t\t\t',1,'2016-10-23 19:31:47','2016-10-23 19:31:47','29.png','292.png',4.745,745),
  (30,'吴世芬',5,'432325197911266123','13786789550','益阳市大利加油站\t\t\t\t\t',1,'2016-10-23 19:33:31','2016-10-23 19:33:31','30.png','302.png',4.703,1523),
  (31,'何芬',5,'430903199004064220','18673718036','益阳大利加油站\t\t\t\t\t',1,'2016-11-13 19:18:22','2016-11-13 19:18:22','31.png','312.png',4.853,375),
  (32,'吴志群',5,'111111111111111111','11111111111','益阳大利加油站\t\t\t\t\t',1,'2016-11-13 19:23:14','2016-11-13 19:23:14','32.png','322.png',4.585,1755),
  (33,'测试人员',7,'333333333333333333','11111111111','测试地址\t\t\t\t\t',1,'2018-01-17 21:59:55','2017-09-19 01:07:40','33.png','332.png',5.000,14),
  (34,'测试',5,'111111111111111111','11111111111','111\t\t\t\t\t',1,'2018-06-21 01:34:59','2018-06-21 01:34:59',NULL,NULL,0.000,0),
  (35,'刘佳',5,'111111111111111111','15116783860','\t益阳赫山\t\t\t\t\t',1,'2018-06-21 20:54:01','2018-06-21 20:54:01','35.png','352.png',4.781,92);
COMMIT;

#
# Data for the `printer` table  (LIMIT 0,500)
#

INSERT INTO `jiayou_printer` (`pid`, `gsid`, `pstatus`, `mcode`, `msign`, `pname`, `psign`) VALUES 
  (6,6,1,'4004513922','cbfc6zuebbvd','益阳打印机','8B835F0CE50C44861C3F134A6030E762'),
  (7,5,1,'4004515723','di3uvv42nchf','益阳打印机','218BEF94DB3DB4CF28EECD8E08C36DA0');
COMMIT;



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;