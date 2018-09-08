# SQL Manager 2007 for MySQL 4.5.0.7
# ---------------------------------------
# Host     : 47.106.64.181
# Port     : 3306
# Database : myshop


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

SET FOREIGN_KEY_CHECKS=0;

USE `nuoche`;

#
# Structure for the `carouselimages` table : 
#

DROP TABLE IF EXISTS `carouselimages`;

CREATE TABLE `carouselimages` (
  `cimgId` INTEGER(11) NOT NULL AUTO_INCREMENT COMMENT '轮播图片ID',
  `cimgTitle` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL COMMENT '标题',
  `cimgDescribe` VARCHAR(500) COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片内容',
  `cimgTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上传时间',
  `cimages` VARCHAR(100) COLLATE utf8_general_ci NOT NULL COMMENT '轮播图片路径',
  `cimgUrl` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL COMMENT 'url链接',
  `cimgStatus` INTEGER(11) NOT NULL COMMENT '图片状态0：禁用1：启用',
  `cimgType` INTEGER(11) NOT NULL COMMENT '图片类型0：内容1：url链接',
  PRIMARY KEY (`cimgId`)

)ENGINE=InnoDB COMMENT='InnoDB free: 9216 kB; InnoDB free: 9216 kB; InnoDB free: 194' CHECKSUM=0 DELAY_KEY_WRITE=0 PACK_KEYS=0 MIN_ROWS=0 MAX_ROWS=0 ROW_FORMAT=COMPACT CHARACTER SET 'utf8' COLLATE 'utf8_general_ci';

#
# Structure for the `goods` table : 
#

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `gId` INTEGER(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `gName` VARCHAR(100) COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `gPrice` DOUBLE(12,2) DEFAULT NULL COMMENT '普通会员价格',
  `gVipprice` DOUBLE(12,2) DEFAULT NULL COMMENT 'vip会员价格',
  `gDetail` TEXT COLLATE utf8_general_ci COMMENT '商品详情',
  `gStatus` INTEGER(11) NOT NULL COMMENT '商品状态0:下架1：上架',
  `gImages` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品图片路径',
  `gDanwei` VARCHAR(20) COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品单位',
  `gSellnum` INTEGER(11) DEFAULT '0' COMMENT '销售数量',
  `gCollectionsnum` INTEGER(11) DEFAULT '0' COMMENT '收藏数量',
  `gTime` VARCHAR(32) COLLATE utf8_general_ci DEFAULT NULL,
  `gchandi` VARCHAR(200) COLLATE utf8_general_ci NOT NULL COMMENT '水果产地',
  `gpinpai` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL COMMENT '水果品牌',
  `gcoder` VARCHAR(100) COLLATE utf8_general_ci NOT NULL COMMENT '二维码',
  `jianjie` VARCHAR(500) COLLATE utf8_general_ci DEFAULT NULL,
  `buyCount` INTEGER(11) DEFAULT '0' COMMENT '购买次数',
  `gshiprice` DOUBLE(12,2) DEFAULT NULL COMMENT '市场价格',
 
 
  PRIMARY KEY (`gId`)
 

)ENGINE=InnoDB COMMENT='InnoDB free: 9216 kB; InnoDB free: 9216 kB; InnoDB free: 194' CHECKSUM=0 DELAY_KEY_WRITE=0 PACK_KEYS=0 MIN_ROWS=0 MAX_ROWS=0 ROW_FORMAT=COMPACT CHARACTER SET 'utf8' COLLATE 'utf8_general_ci';

#
# Structure for the `userinfo` table : 
#

DROP TABLE IF EXISTS `userinfo`;

CREATE TABLE `userinfo` (
  `usersId` INTEGER(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `usersName` VARCHAR(32) COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户名称',
  `usersPhone` VARCHAR(32) COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号(登录账号)',
  `usersArea` VARCHAR(32) COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户所在区/县',
  `usersHeadimg` VARCHAR(200) COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户头像',
  `usersStatus` INTEGER(11) DEFAULT '1' COMMENT '状态0:禁用1:启用',
  `usersGender` INTEGER(11) DEFAULT NULL COMMENT '用户性别0:女1:男',
  `usersRemark` TEXT COLLATE utf8_general_ci COMMENT '备注',
  `usersCreatetime` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `usersIntegral` DOUBLE(12,2) DEFAULT '0.00' COMMENT '积分',
  `usersType` INTEGER(11) DEFAULT '0' COMMENT '用户类型 0：普通会员 1：vip会员',
  `usersPassword` VARCHAR(32) COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户二级密码',
  `usersCode` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL COMMENT '二维码',
 
  
 
  PRIMARY KEY (`usersId`)
 
)ENGINE=InnoDB COMMENT='InnoDB free: 9216 kB; InnoDB free: 9216 kB; InnoDB free: 194' CHECKSUM=0 DELAY_KEY_WRITE=0 PACK_KEYS=0 MIN_ROWS=0 MAX_ROWS=0 ROW_FORMAT=COMPACT CHARACTER SET 'utf8' COLLATE 'utf8_general_ci';

#
# Structure for the `collections` table : 
#

DROP TABLE IF EXISTS `collections`;

CREATE TABLE `collections` (
  `coId` INTEGER(11) NOT NULL AUTO_INCREMENT COMMENT '收藏ID',
  `usersId` INTEGER(11) NOT NULL COMMENT '用户ID',
  `gId` INTEGER(11) NOT NULL COMMENT '商品ID',
  `coTime` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '添加收藏时间',
  PRIMARY KEY (`coId`),
  KEY `usersId` (`usersId`),
  KEY `gId` (`gId`),
  CONSTRAINT `collections_fk` FOREIGN KEY (`usersId`) REFERENCES `userinfo` (`usersId`),
  CONSTRAINT `collections_fk1` FOREIGN KEY (`gId`) REFERENCES `goods` (`gId`)

)ENGINE=InnoDB COMMENT='InnoDB free: 9216 kB; (`usersId`) REFER `nuoche/userinf' CHECKSUM=0 DELAY_KEY_WRITE=0 PACK_KEYS=0 MIN_ROWS=0 MAX_ROWS=0 ROW_FORMAT=COMPACT CHARACTER SET 'utf8' COLLATE 'utf8_general_ci';

#
# Structure for the `goodsimages` table : 
#

DROP TABLE IF EXISTS `goodsimages`;

CREATE TABLE `goodsimages` (
  `gimgId` INTEGER(11) NOT NULL AUTO_INCREMENT COMMENT '商品图片ID',
  `gId` INTEGER(11) NOT NULL COMMENT '商品ID',
  `gimages` VARCHAR(100) COLLATE utf8_general_ci NOT NULL COMMENT '商品图片路径',
  `gimgStatus` INTEGER(11) NOT NULL COMMENT '商品图片状态0：上架1：下架',
  `gimgDetail` TEXT COLLATE utf8_general_ci COMMENT '商品描述',
  `gimgTime` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '商品上传时间',
  `index` INTEGER(11) DEFAULT NULL,
  PRIMARY KEY (`gimgId`),
  KEY `gId` (`gId`),
  CONSTRAINT `goodsimages_fk` FOREIGN KEY (`gId`) REFERENCES `goods` (`gId`)

)ENGINE=InnoDB COMMENT='InnoDB free: 9216 kB; (`gId`) REFER `shuiguoshop/goods`(`gId' CHECKSUM=0 DELAY_KEY_WRITE=0 PACK_KEYS=0 MIN_ROWS=0 MAX_ROWS=0 ROW_FORMAT=COMPACT CHARACTER SET 'utf8' COLLATE 'utf8_general_ci';

#
# Structure for the `zitiaddress` table : 
#

DROP TABLE IF EXISTS `zitiaddress`;

CREATE TABLE `zitiaddress` (
  `zitiId` INTEGER(11) NOT NULL AUTO_INCREMENT COMMENT '自提地址ID',
  `arId` INTEGER(11) NOT NULL COMMENT '区/县ID',
  `zitiText` VARCHAR(20) COLLATE utf8_general_ci NOT NULL COMMENT '详细地址',
  `zitiName` VARCHAR(50) COLLATE utf8_general_ci DEFAULT NULL COMMENT '联系人',
  `zitiPhone` VARCHAR(50) COLLATE utf8_general_ci DEFAULT NULL COMMENT '电话号码',
  `zitiStatus` INTEGER(11) NOT NULL COMMENT '状态0：禁用1：启用',
  PRIMARY KEY (`zitiId`),
  KEY `arId` (`arId`),
  CONSTRAINT `zitiaddress_fk` FOREIGN KEY (`arId`) REFERENCES `area` (`arId`)

)ENGINE=InnoDB COMMENT='InnoDB free: 9216 kB; (`arId`) REFER `nuoche/area`(`arI' CHECKSUM=0 DELAY_KEY_WRITE=0 PACK_KEYS=0 MIN_ROWS=0 MAX_ROWS=0 ROW_FORMAT=COMPACT CHARACTER SET 'utf8' COLLATE 'utf8_general_ci';

#
# Structure for the `goodsorders` table : 
#

DROP TABLE IF EXISTS `goodsorders`;

CREATE TABLE `goodsorders` (
  `orId` INTEGER(11) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `usersId` INTEGER(11) NOT NULL COMMENT '用户ID',
  `orTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '下单时间',
  `orStatus` INTEGER(11) NOT NULL COMMENT '订单状态',
  `orPrice` DOUBLE(12,2) NOT NULL COMMENT '实际总金额',
  `orYunfei` DOUBLE(15,3) NOT NULL COMMENT '运费',
  `orRemark` TEXT COLLATE utf8_general_ci COMMENT '订单备注',
  `orTotalnum` INTEGER(11) NOT NULL COMMENT '订单总数量',
  `orOrdernumber` VARCHAR(32) COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `orPaytype` INTEGER(11) DEFAULT NULL COMMENT '支付方式0：支付宝1：微信',
  `orThreepay` DOUBLE(12,2) DEFAULT NULL COMMENT '第三方支付的金额',
  `orJifen` DOUBLE(15,3) DEFAULT NULL COMMENT '使用了多少积分',
  `adId` INTEGER(11) DEFAULT NULL COMMENT '收货地址ID',
  `orRecipient` VARCHAR(50) COLLATE utf8_general_ci DEFAULT NULL COMMENT '配送单号',
  `pscId` INTEGER(11) DEFAULT NULL COMMENT '配送公司ID',
  `zitiId` INTEGER(11) DEFAULT NULL COMMENT '自提ID',
  `orPeisongtype` INTEGER(11) NOT NULL COMMENT '配送方式 0：自提1：快题2：送货上门',
  `orShoppingzhekou` DOUBLE(12,2) DEFAULT NULL COMMENT '购买时折扣',
  `orExist` INTEGER(11) DEFAULT NULL,
  PRIMARY KEY (`orId`),
  KEY `usersId` (`usersId`),
  KEY `adId` (`adId`),
  KEY `pscId` (`pscId`),
  KEY `zitiId` (`zitiId`),
  CONSTRAINT `goodsorders_fk1` FOREIGN KEY (`adId`) REFERENCES `address` (`adId`),
  CONSTRAINT `goodsorders_fk2` FOREIGN KEY (`pscId`) REFERENCES `peisongcorp` (`pscId`),
  CONSTRAINT `goodsorders_fk3` FOREIGN KEY (`zitiId`) REFERENCES `zitiaddress` (`zitiId`)

)ENGINE=InnoDB COMMENT='InnoDB free: 9216 kB; (`usersId`) REFER `nuoche/userinf' CHECKSUM=0 DELAY_KEY_WRITE=0 PACK_KEYS=0 MIN_ROWS=0 MAX_ROWS=0 ROW_FORMAT=COMPACT CHARACTER SET 'utf8' COLLATE 'utf8_general_ci';

#
# Structure for the `jihuoma` table : 
#

DROP TABLE IF EXISTS `jihuoma`;

CREATE TABLE `jihuoma` (
  `id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Message` VARCHAR(20) COLLATE utf8_general_ci DEFAULT NULL,
  `Phone` VARCHAR(20) COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)

)ENGINE=InnoDB COMMENT='InnoDB free: 9216 kB; InnoDB free: 9216 kB; InnoDB free: 194' CHECKSUM=0 DELAY_KEY_WRITE=0 PACK_KEYS=0 MIN_ROWS=0 MAX_ROWS=0 ROW_FORMAT=COMPACT CHARACTER SET 'utf8' COLLATE 'utf8_general_ci';

#
# Structure for the `paypresent` table : 
#

DROP TABLE IF EXISTS `paypresent`;

CREATE TABLE `paypresent` (
  `ppId` INTEGER(11) NOT NULL AUTO_INCREMENT COMMENT '充值赠送id',
  `ppMin` INTEGER(11) NOT NULL COMMENT '区间-左',
  `ppMax` INTEGER(11) NOT NULL COMMENT '区间-右',
  `ppPresent` INTEGER(11) NOT NULL COMMENT '赠送积分数目',
  `ppStatus` INTEGER(11) NOT NULL COMMENT '赠送状态0：不赠送 1：赠送',
  PRIMARY KEY (`ppId`)

)ENGINE=InnoDB COMMENT='InnoDB free: 9216 kB; InnoDB free: 9216 kB; InnoDB free: 194' CHECKSUM=0 DELAY_KEY_WRITE=0 PACK_KEYS=0 MIN_ROWS=0 MAX_ROWS=0 ROW_FORMAT=COMPACT CHARACTER SET 'utf8' COLLATE 'utf8_general_ci';

#
# Structure for the `payrecords` table : 
#

DROP TABLE IF EXISTS `payrecords`;

CREATE TABLE `payrecords` (
  `prId` INTEGER(11) NOT NULL AUTO_INCREMENT COMMENT '充值记录ID',
  `usersId` INTEGER(11) NOT NULL COMMENT '用户ID',
  `prMoney` DOUBLE(12,2) NOT NULL COMMENT '充值金额',
  `prType` INTEGER(11) NOT NULL COMMENT '充值类型1：支付宝2：微信3:后台充值',
  `prTime` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '充值时间',
  `prDingdanhao` VARCHAR(32) COLLATE utf8_general_ci DEFAULT NULL COMMENT '订单号',
  `prStatus` INTEGER(11) NOT NULL COMMENT '充值状态0：失败1：成功',
  `prPresent` INTEGER(11) DEFAULT NULL COMMENT '赠送积分',
  PRIMARY KEY (`prId`),
  KEY `usersId` (`usersId`),
  CONSTRAINT `payrecords_fk` FOREIGN KEY (`usersId`) REFERENCES `userinfo` (`usersId`)

)ENGINE=InnoDB COMMENT='InnoDB free: 9216 kB; (`usersId`) REFER `nuoche/userinf' CHECKSUM=0 DELAY_KEY_WRITE=0 PACK_KEYS=0 MIN_ROWS=0 MAX_ROWS=0 ROW_FORMAT=COMPACT CHARACTER SET 'utf8' COLLATE 'utf8_general_ci';

#
# Structure for the `shoppingcat` table : 
#

DROP TABLE IF EXISTS `shoppingcat`;

CREATE TABLE `shoppingcat` (
  `scatId` INTEGER(11) NOT NULL AUTO_INCREMENT COMMENT '购物车ID',
  `usersId` INTEGER(11) NOT NULL COMMENT '用户ID',
  `gId` INTEGER(11) NOT NULL COMMENT '商品ID',
  `scatNum` INTEGER(11) NOT NULL COMMENT '商品数量',
  `scatTime` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '添加购物车时间',
  PRIMARY KEY (`scatId`),
  KEY `usersId` (`usersId`),
  KEY `gId` (`gId`),
  CONSTRAINT `shoppingcat_fk` FOREIGN KEY (`usersId`) REFERENCES `userinfo` (`usersId`),
  CONSTRAINT `shoppingcat_fk1` FOREIGN KEY (`gId`) REFERENCES `goods` (`gId`)

)ENGINE=InnoDB COMMENT='InnoDB free: 9216 kB; (`usersId`) REFER `nuoche/userinf' CHECKSUM=0 DELAY_KEY_WRITE=0 PACK_KEYS=0 MIN_ROWS=0 MAX_ROWS=0 ROW_FORMAT=COMPACT CHARACTER SET 'utf8' COLLATE 'utf8_general_ci';

#
# Structure for the `uamessages` table : 
#

DROP TABLE IF EXISTS `uamessages`;

CREATE TABLE `uamessages` (
  `meid` INTEGER(11) NOT NULL AUTO_INCREMENT COMMENT '消息主键',
  `usersId` INTEGER(11) NOT NULL COMMENT '会员外键ID',
  `adminId` INTEGER(11) DEFAULT NULL COMMENT '管理员ID',
  `metime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间',
  `mefangxiang` INTEGER(11) NOT NULL COMMENT '0后台>会员1会员>后台',
  `smdetail` TEXT COLLATE utf8_general_ci COMMENT '内容',
  `mestatus` INTEGER(11) NOT NULL DEFAULT '0' COMMENT '状态0：未读1：已读',
  PRIMARY KEY (`meid`),
  KEY `usersId` (`usersId`),
  KEY `adminId` (`adminId`),
  CONSTRAINT `uamessages_fk` FOREIGN KEY (`usersId`) REFERENCES `userinfo` (`usersId`),
  CONSTRAINT `uamessages_fk1` FOREIGN KEY (`adminId`) REFERENCES `admin` (`id`)

)ENGINE=InnoDB COMMENT='InnoDB free: 9216 kB; (`usersId`) REFER `nuoche/userinf' CHECKSUM=0 DELAY_KEY_WRITE=0 PACK_KEYS=0 MIN_ROWS=0 MAX_ROWS=0 ROW_FORMAT=COMPACT CHARACTER SET 'utf8' COLLATE 'utf8_general_ci';



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;