# SQL Manager 2007 for MySQL 4.5.0.7
# ---------------------------------------
# Host     : localhost
# Port     : 3306
# Database : nuoche


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

SET FOREIGN_KEY_CHECKS=0;

USE `nuoche`;

#
# Structure for the `jiayou_station` table : 
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
  `uid` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL COMMENT '第三方支付用户ID',
  `token` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL COMMENT '第三方支付密码',
  PRIMARY KEY (`gid`)

)ENGINE=InnoDB COMMENT='InnoDB free: 6144 kB' CHECKSUM=0 DELAY_KEY_WRITE=0 PACK_KEYS=0 MIN_ROWS=0 MAX_ROWS=0 ROW_FORMAT=COMPACT CHARACTER SET 'utf8' COLLATE 'utf8_general_ci';

#
# Structure for the `jiayou_emp` table : 
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
  `getime` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `geover` TIMESTAMP DEFAULT '0000-00-00 00:00:00',
  `gecode` VARCHAR(40) COLLATE utf8_general_ci DEFAULT NULL,
  `gecode2` VARCHAR(40) COLLATE utf8_general_ci DEFAULT NULL,
  `gerating` FLOAT(9,3) DEFAULT '0.000',
  `gepeople` INTEGER(11) DEFAULT '0',
  PRIMARY KEY (`geid`),
  KEY `gid` (`gid`),
  CONSTRAINT `gas_emp_fk2` FOREIGN KEY (`gid`) REFERENCES `jiayou_station` (`gid`)

)ENGINE=InnoDB COMMENT='InnoDB free: 6144 kB; (`gid`) REFER `nuoche/jiayou_station`(' CHECKSUM=0 DELAY_KEY_WRITE=0 PACK_KEYS=0 MIN_ROWS=0 MAX_ROWS=0 ROW_FORMAT=COMPACT CHARACTER SET 'utf8' COLLATE 'utf8_general_ci';

#
# Structure for the `jiayou_zhekou` table : 
#

DROP TABLE IF EXISTS `jiayou_zhekou`;

CREATE TABLE `jiayou_zhekou` (
  `oid` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `oname` VARCHAR(32) COLLATE utf8_general_ci DEFAULT NULL,
  `ostyle` INTEGER(11) DEFAULT NULL,
  `oprice` FLOAT(9,3) DEFAULT NULL,
  `odetail` TEXT COLLATE utf8_general_ci,
  `ostatus` INTEGER(2) NOT NULL DEFAULT '1',
  `ostation` INTEGER(11) DEFAULT NULL,
  `zhekou` FLOAT(9,3) DEFAULT '1.000' COMMENT '折扣',
  PRIMARY KEY (`oid`),
  KEY `ostation` (`ostation`),
  CONSTRAINT `jiayou_zhekou_fk` FOREIGN KEY (`ostation`) REFERENCES `jiayou_station` (`gid`)

)ENGINE=InnoDB COMMENT='InnoDB free: 6144 kB; (`ostation`) REFER `nuoche/jiayou_stat' CHECKSUM=0 DELAY_KEY_WRITE=0 PACK_KEYS=0 MIN_ROWS=0 MAX_ROWS=0 ROW_FORMAT=COMPACT CHARACTER SET 'utf8' COLLATE 'utf8_general_ci';

#
# Structure for the `jiayou_jilu` table : 
#

DROP TABLE IF EXISTS `jiayou_jilu`;

CREATE TABLE `jiayou_jilu` (
  `id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `youType` INTEGER(11) DEFAULT NULL COMMENT '油',
  `price` FLOAT(9,3) DEFAULT '0.000' COMMENT '原价',
  `zhekou` FLOAT(9,3) DEFAULT '1.000' COMMENT '折扣',
  `yinfu` FLOAT(9,3) DEFAULT '0.000' COMMENT '应付',
  `shifu` FLOAT(9,3) DEFAULT '0.000' COMMENT '实付',
  `time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '加油时间',
  `openid` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL COMMENT '微信用户',
  PRIMARY KEY (`id`),
  KEY `jiayou_jilu_fk` (`youType`),
  KEY `jiayou_jilu_fk1` (`openid`),
  CONSTRAINT `jiayou_jilu_fk` FOREIGN KEY (`youType`) REFERENCES `jiayou_zhekou` (`oid`),
  CONSTRAINT `jiayou_jilu_fk1` FOREIGN KEY (`openid`) REFERENCES `weixin_user` (`openid`)

)ENGINE=InnoDB COMMENT='InnoDB free: 6144 kB; (`youType`) REFER `nuoche/jiayou_zheko' CHECKSUM=0 DELAY_KEY_WRITE=0 PACK_KEYS=0 MIN_ROWS=0 MAX_ROWS=0 ROW_FORMAT=COMPACT CHARACTER SET 'utf8' COLLATE 'utf8_general_ci';

#
# Structure for the `jiayou_printer` table : 
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

)ENGINE=InnoDB COMMENT='InnoDB free: 6144 kB' CHECKSUM=0 DELAY_KEY_WRITE=0 PACK_KEYS=0 MIN_ROWS=0 MAX_ROWS=0 ROW_FORMAT=COMPACT CHARACTER SET 'utf8' COLLATE 'utf8_general_ci';

#
# Structure for the `jiayou_station_yuer` table : 
#

DROP TABLE IF EXISTS `jiayou_station_yuer`;

CREATE TABLE `jiayou_station_yuer` (
  `id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `station` INTEGER(11) DEFAULT NULL COMMENT '加油站',
  `openid` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL COMMENT '微信用户openid',
  `money` FLOAT(9,3) DEFAULT '0.000' COMMENT '余额',
  PRIMARY KEY (`id`),
  KEY `jiayou_station_yuer_fk` (`station`),
  KEY `jiayou_station_yuer_fk1` (`openid`),
  CONSTRAINT `jiayou_station_yuer_fk1` FOREIGN KEY (`openid`) REFERENCES `weixin_user` (`openid`),
  CONSTRAINT `jiayou_station_yuer_fk` FOREIGN KEY (`station`) REFERENCES `jiayou_station` (`gid`)

)ENGINE=InnoDB COMMENT='InnoDB free: 6144 kB; (`openid`) REFER `nuoche/weixin_user`(' CHECKSUM=0 DELAY_KEY_WRITE=0 PACK_KEYS=0 MIN_ROWS=0 MAX_ROWS=0 ROW_FORMAT=COMPACT CHARACTER SET 'utf8' COLLATE 'utf8_general_ci';



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;