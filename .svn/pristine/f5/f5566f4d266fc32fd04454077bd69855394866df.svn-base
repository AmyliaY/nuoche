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

CREATE DATABASE `nuoche`
    CHARACTER SET 'utf8'
    COLLATE 'utf8_general_ci';

USE `nuoche`;

#
# Structure for the `jiayou_youhuijuan` table : 
#

DROP TABLE IF EXISTS `jiayou_youhuijuan`;

CREATE TABLE `jiayou_youhuijuan` (
  `id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `money` FLOAT(9,2) DEFAULT '0.00' COMMENT '优惠卷金额',
  `youmoney` FLOAT(9,2) DEFAULT '0.00' COMMENT '油金额',
  `time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '失效时间',
  `openid` VARCHAR(40) COLLATE utf8_general_ci DEFAULT NULL COMMENT '微信openid',
  PRIMARY KEY (`id`),
  KEY `jiayou_youhuijuan_fk` (`openid`),
  CONSTRAINT `jiayou_youhuijuan_fk` FOREIGN KEY (`openid`) REFERENCES `weixin_user` (`openid`)

)ENGINE=InnoDB COMMENT='InnoDB free: 6144 kB; (`openid`) REFER `nuoche/weixin_user`(' CHECKSUM=0 DELAY_KEY_WRITE=0 PACK_KEYS=0 MIN_ROWS=0 MAX_ROWS=0 ROW_FORMAT=COMPACT CHARACTER SET 'utf8' COLLATE 'utf8_general_ci';



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;