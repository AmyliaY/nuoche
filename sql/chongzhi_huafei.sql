/*
Navicat MySQL Data Transfer

Source Server         : 水菟科技
Source Server Version : 50703
Source Host           : localhost:3306
Source Database       : nuoche

Target Server Type    : MYSQL
Target Server Version : 50703
File Encoding         : 65001

Date: 2018-05-17 21:59:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `chongzhi_huafei`
-- ----------------------------
DROP TABLE IF EXISTS `chongzhi_huafei`;
CREATE TABLE `chongzhi_huafei` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(32) DEFAULT NULL COMMENT '买家微信号',
  `order_id` varchar(32) DEFAULT NULL COMMENT '申请订单号',
  `order_wx` varchar(32) DEFAULT NULL COMMENT '微信订单号',
  `minute_num` int(11) DEFAULT NULL COMMENT '购买分钟数',
  `total_fee` decimal(10,2) DEFAULT NULL COMMENT '总金额',
  `status` tinyint(2) DEFAULT NULL COMMENT '0未付款，1已付款',
  `created` datetime DEFAULT NULL COMMENT '订单创建时间',
  `updated` datetime DEFAULT NULL COMMENT '付款时间',
  `close_time` datetime DEFAULT NULL COMMENT '交易关闭时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
