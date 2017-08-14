/*
Navicat MySQL Data Transfer

Source Server         : CentOS7
Source Server Version : 50505
Source Host           : 172.16.77.1:3306
Source Database       : fdss

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-03-06 12:01:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for fds_admin
-- ----------------------------
DROP TABLE IF EXISTS `fds_admin`;
CREATE TABLE `fds_admin` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `account` varchar(64) NOT NULL,
  `nickname` varchar(64) NOT NULL,
  `password` char(100) NOT NULL,
  `bind_account` varchar(64) NOT NULL,
  `last_login_time` int(11) unsigned DEFAULT '0',
  `last_login_ip` varchar(45) DEFAULT NULL,
  `login_count` mediumint(8) unsigned DEFAULT '0',
  `verify` varchar(32) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `type_id` tinyint(2) unsigned DEFAULT '0',
  `info` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fds_admin
-- ----------------------------
INSERT INTO `fds_admin` VALUES ('1', 'admin', '超级管理员', '21232f297a57a5a743894a0e4a801fc3', '', '1488766496', '192.168.1.4', '983', '8888', 'liu21st@gmail.com', '备注信息', '1222907803', '1239977420', '1', '1', '');
INSERT INTO `fds_admin` VALUES ('38', 'food_admin', '食品股管理员', '21232f297a57a5a743894a0e4a801fc3', '', '1488161707', '192.168.1.4', '10', null, '', '', '1222907803', '1239977420', '1', '0', '');
INSERT INTO `fds_admin` VALUES ('39', 'drug_admin', '医药股管理员', '21232f297a57a5a743894a0e4a801fc3', '', '1484729783', '192.168.1.4', '1', null, '', '', '0', '0', '1', '0', '');
INSERT INTO `fds_admin` VALUES ('40', 'health_admin', '保健股管理员', '21232f297a57a5a743894a0e4a801fc3', '', '0', null, '0', null, '', '', '0', '0', '0', '0', '');

-- ----------------------------
-- Table structure for fds_admin_department
-- ----------------------------
DROP TABLE IF EXISTS `fds_admin_department`;
CREATE TABLE `fds_admin_department` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `admin_id` smallint(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fds_admin_department
-- ----------------------------
INSERT INTO `fds_admin_department` VALUES ('1', '食品生产股', '38');
INSERT INTO `fds_admin_department` VALUES ('2', '食品流通股', '38');
INSERT INTO `fds_admin_department` VALUES ('4', '食品餐饮股', '38');
INSERT INTO `fds_admin_department` VALUES ('5', '药械安全股', '39');
INSERT INTO `fds_admin_department` VALUES ('6', '药品流通股', '39');
INSERT INTO `fds_admin_department` VALUES ('7', '保健食品化妆品股', '40');

-- ----------------------------
-- Table structure for fds_app_user
-- ----------------------------
DROP TABLE IF EXISTS `fds_app_user`;
CREATE TABLE `fds_app_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `account` varchar(64) NOT NULL,
  `nickname` varchar(64) NOT NULL,
  `password` char(100) NOT NULL,
  `bind_account` varchar(64) NOT NULL,
  `last_login_time` int(11) unsigned DEFAULT '0',
  `last_login_ip` varchar(45) DEFAULT NULL,
  `login_count` mediumint(8) unsigned DEFAULT '0',
  `verify` varchar(32) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `department_id` smallint(5) unsigned DEFAULT '0',
  `info` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`)
) ENGINE=MyISAM AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fds_app_user
-- ----------------------------
INSERT INTO `fds_app_user` VALUES ('1', 'test', '测试', '21232f297a57a5a743894a0e4a801fc3', '', '1479461448', '172.16.77.1', '942', '8888', 'liu21st@gmail.com', '备注信息', '1222907803', '1239977420', '1', '0', '');
INSERT INTO `fds_app_user` VALUES ('2', 'aaa', '问问', '21232f297a57a5a743894a0e4a801fc3', '', '1479461448', '172.16.77.1', '942', '8888', 'liu21st@gmail.com', '备注信息', '1222907803', '1239977420', '1', '0', '');
INSERT INTO `fds_app_user` VALUES ('3', 'bbb', '信息', '21232f297a57a5a743894a0e4a801fc3', '', '1479461448', '172.16.77.1', '942', '8888', 'liu21st@gmail.com', '备注信息', '1222907803', '1239977420', '1', '0', '');
INSERT INTO `fds_app_user` VALUES ('4', 'ccc', '辉煌', '21232f297a57a5a743894a0e4a801fc3', '', '1479461448', '172.16.77.1', '942', '8888', 'liu21st@gmail.com', '备注信息', '1222907803', '1239977420', '1', '0', '');
INSERT INTO `fds_app_user` VALUES ('53', 'cc213412', '问2131', 'f29b38f160f87ae86df31cee1982066f', '', '0', null, '0', null, 'dskfj', '', '1480562797', '0', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('54', 'abc', '问大的非', '202cb962ac59075b964b07152d234b70', '', '0', null, '0', null, '2314214', '', '1480563963', '1480563970', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('55', '122', '检查员1', '202cb962ac59075b964b07152d234b70', '', '0', null, '0', null, '123@aa.com', '', '1480734385', '0', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('56', '123', '检查员2', 'c8ffe9a587b126f152ed3d89a146b445', '', '0', null, '0', null, '124@aa.com', '', '1480734385', '0', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('57', '124', '检查员3', '3def184ad8f4755ff269862ea77393dd', '', '0', null, '0', null, '125@aa.com', '', '1480734385', '0', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('58', '125', '检查员4', '069059b7ef840f0c74a814ec9237b6ec', '', '0', null, '0', null, '126@aa.com', '', '1480734385', '0', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('59', '126', '检查员5', 'ec5decca5ed3d6b8079e2e7e7bacc9f2', '', '0', null, '0', null, '127@aa.com', '', '1480734385', '0', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('60', '127', '检查员6', '76dc611d6ebaafc66cc0879c71b5db5c', '', '0', null, '0', null, '128@aa.com', '', '1480734385', '0', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('61', '128', '检查员7', 'd1f491a404d6854880943e5c3cd9ca25', '', '0', null, '0', null, '129@aa.com', '', '1480734385', '0', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('62', '129', '检查员8', '9b8619251a19057cff70779273e95aa6', '', '0', null, '0', null, '130@aa.com', '', '1480734385', '0', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('63', '130', '检查员9', '1afa34a7f984eeabdbb0a7d494132ee5', '', '0', null, '0', null, '131@aa.com', '', '1480734385', '0', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('64', '131', '检查员10', '65ded5353c5ee48d0b7d48c591b8f430', '', '0', null, '0', null, '132@aa.com', '', '1480734385', '0', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('65', '132', '检查员11', '9fc3d7152ba9336a670e36d0ed79bc43', '', '0', null, '0', null, '133@aa.com', '', '1480734385', '0', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('66', '133', '检查员12', '02522a2b2726fb0a03bb19f2d8d9524d', '', '0', null, '0', null, '134@aa.com', '', '1480734385', '0', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('67', '134', '检查员13', '7f1de29e6da19d22b51c68001e7e0e54', '', '0', null, '0', null, '135@aa.com', '', '1480734385', '0', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('68', '135', '检查员14', '42a0e188f5033bc65bf8d78622277c4e', '', '0', null, '0', null, '136@aa.com', '', '1480734385', '0', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('69', '136', '检查员15', '3988c7f88ebcb58c6ce932b957b6f332', '', '0', null, '0', null, '137@aa.com', '', '1480734385', '0', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('70', '137', '检查员16', '013d407166ec4fa56eb1e1f8cbe183b9', '', '0', null, '0', null, '138@aa.com', '', '1480734385', '0', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('71', '138', '检查员17', 'e00da03b685a0dd18fb6a08af0923de0', '', '0', null, '0', null, '139@aa.com', '', '1480734385', '0', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('72', '139', '检查员18', '1385974ed5904a438616ff7bdb3f7439', '', '0', null, '0', null, '140@aa.com', '', '1480734385', '0', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('73', '140', '检查员19', '0f28b5d49b3020afeecd95b4009adf4c', '', '0', null, '0', null, '141@aa.com', '', '1480734385', '0', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('74', '141', '检查员20', 'a8baa56554f96369ab93e4f3bb068c22', '', '0', null, '0', null, '142@aa.com', '', '1480734385', '0', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('75', '142', '检查员21', '903ce9225fca3e988c2af215d4e544d3', '', '0', null, '0', null, '143@aa.com', '', '1480734385', '0', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('76', '143', '检查员22', '0a09c8844ba8f0936c20bd791130d6b6', '', '0', null, '0', null, '144@aa.com', '', '1480734385', '0', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('77', '144', '检查员23', '2b24d495052a8ce66358eb576b8912c8', '', '0', null, '0', null, '145@aa.com', '', '1480734385', '0', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('78', '145', '检查员24', 'a5e00132373a7031000fd987a3c9f87b', '', '0', null, '0', null, '146@aa.com', '', '1480734385', '0', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('79', '146', '检查员25', '8d5e957f297893487bd98fa830fa6413', '', '0', null, '0', null, '147@aa.com', '', '1480734385', '0', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('80', '餐饮1', '中华路102', '83d7a2e752c6ccf23240d6831eb4b252', '', '0', null, '0', null, '4234134', '', '1480734571', '0', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('81', '餐饮2', '中华路103', '83d7a2e752c6ccf23240d6831eb4b252', '', '0', null, '0', null, '4234135', '', '1480734571', '0', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('82', '餐饮3', '中华路104', '83d7a2e752c6ccf23240d6831eb4b252', '', '0', null, '0', null, '4234136', '', '1480734571', '0', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('83', '餐饮4', '中华路105', '83d7a2e752c6ccf23240d6831eb4b252', '', '0', null, '0', null, '4234137', '', '1480734571', '0', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('84', '餐饮5', '中华路106', '83d7a2e752c6ccf23240d6831eb4b252', '', '0', null, '0', null, '4234138', '', '1480734571', '0', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('85', '餐饮6', '中华路107', '83d7a2e752c6ccf23240d6831eb4b252', '', '0', null, '0', null, '4234139', '', '1480734571', '0', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('86', '餐饮7', '中华路108', '83d7a2e752c6ccf23240d6831eb4b252', '', '0', null, '0', null, '4234140', '', '1480734571', '0', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('87', '餐饮8', '中华路109', '83d7a2e752c6ccf23240d6831eb4b252', '', '0', null, '0', null, '4234141', '', '1480734571', '0', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('88', '餐饮9', '中华路110', '83d7a2e752c6ccf23240d6831eb4b252', '', '0', null, '0', null, '4234142', '', '1480734571', '0', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('89', '餐饮10', '中华路111', '83d7a2e752c6ccf23240d6831eb4b252', '', '0', null, '0', null, '4234143', '', '1480734571', '0', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('90', '餐饮11', '中华路112', '83d7a2e752c6ccf23240d6831eb4b252', '', '0', null, '0', null, '4234144', '', '1480734571', '0', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('91', '餐饮12', '中华路113', '83d7a2e752c6ccf23240d6831eb4b252', '', '0', null, '0', null, '4234145', '', '1480734571', '0', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('92', '餐饮13', '中华路114', '83d7a2e752c6ccf23240d6831eb4b252', '', '0', null, '0', null, '4234146', '', '1480734571', '0', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('93', '餐饮14', '中华路115', '83d7a2e752c6ccf23240d6831eb4b252', '', '0', null, '0', null, '4234147', '', '1480734571', '0', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('94', '餐饮15', '中华路116', '83d7a2e752c6ccf23240d6831eb4b252', '', '0', null, '0', null, '4234148', '', '1480734571', '0', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('95', '餐饮16', '中华路117', '83d7a2e752c6ccf23240d6831eb4b252', '', '0', null, '0', null, '4234149', '', '1480734571', '0', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('96', '餐饮17', '中华路118', '83d7a2e752c6ccf23240d6831eb4b252', '', '0', null, '0', null, '4234150', '', '1480734571', '0', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('97', '餐饮18', '中华路119', '83d7a2e752c6ccf23240d6831eb4b252', '', '0', null, '0', null, '4234151', '', '1480734571', '0', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('98', '餐饮19', '中华路120', '83d7a2e752c6ccf23240d6831eb4b252', '', '0', null, '0', null, '4234152', '', '1480734571', '0', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('99', '餐饮20', '中华路121', '83d7a2e752c6ccf23240d6831eb4b252', '', '0', null, '0', null, '4234153', '', '1480734571', '0', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('100', 'c007', '巴尔扎克', '83d7a2e752c6ccf23240d6831eb4b252', '', '0', null, '0', null, 'baerzk@123.com', '', '1480734571', '1487663607', '0', '4', '');
INSERT INTO `fds_app_user` VALUES ('109', 'c008', '韩寒', '202cb962ac59075b964b07152d234b70', '', '0', null, '0', null, 'hanhan@123.com', '', '1481357788', '1487837029', '0', '2', '');
INSERT INTO `fds_app_user` VALUES ('102', 'c006', '李清照', '83d7a2e752c6ccf23240d6831eb4b252', '', '0', null, '0', null, 'lqz@123.com', '', '1480734571', '1487663602', '0', '2', '');
INSERT INTO `fds_app_user` VALUES ('103', 'c005', '托尔斯泰', '83d7a2e752c6ccf23240d6831eb4b252', '', '0', null, '0', null, 'tuoerst@123.com', '', '1480734571', '1487663596', '0', '1', '');
INSERT INTO `fds_app_user` VALUES ('104', 'c004', '雨果', '83d7a2e752c6ccf23240d6831eb4b252', '', '0', null, '0', null, 'yuguo@123.com', '', '1480734571', '1487663586', '0', '7', '');
INSERT INTO `fds_app_user` VALUES ('105', 'c003', '沈从文', '83d7a2e752c6ccf23240d6831eb4b252', '', '0', null, '0', null, '4234159', '', '1480734571', '1487663576', '0', '6', '');
INSERT INTO `fds_app_user` VALUES ('106', 'c002', '梁秋实', '83d7a2e752c6ccf23240d6831eb4b252', '', '0', null, '0', null, '4234160', '', '1480734571', '1487663563', '0', '5', '');
INSERT INTO `fds_app_user` VALUES ('108', 'c001', '郭敬明', '7c03aeb8031097d35caf3416a1826139', '', '0', null, '0', null, 'guoingming@123.com', '', '1480754438', '1487663554', '0', '4', '');
INSERT INTO `fds_app_user` VALUES ('110', 'c009', '高晓声', '202cb962ac59075b964b07152d234b70', '', '0', null, '0', null, 'gaoxiaosheng@123.com', '', '1482111904', '1487663539', '0', '1', '');

-- ----------------------------
-- Table structure for fds_app_user_local
-- ----------------------------
DROP TABLE IF EXISTS `fds_app_user_local`;
CREATE TABLE `fds_app_user_local` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `x_coord` float(11,7) DEFAULT NULL,
  `y_coord` float(11,7) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fds_app_user_local
-- ----------------------------
INSERT INTO `fds_app_user_local` VALUES ('1', '1', '1488330230', '110.8344269', '24.8369904');
INSERT INTO `fds_app_user_local` VALUES ('2', '1', '1488330235', '110.8345871', '24.8369904');
INSERT INTO `fds_app_user_local` VALUES ('3', '1', '1488330240', '110.8347092', '24.8369904');
INSERT INTO `fds_app_user_local` VALUES ('4', '1', '1488330245', '110.8348465', '24.8369942');
INSERT INTO `fds_app_user_local` VALUES ('5', '1', '1488330250', '110.8349457', '24.8369980');
INSERT INTO `fds_app_user_local` VALUES ('6', '1', '1488330255', '110.8353119', '24.8369942');
INSERT INTO `fds_app_user_local` VALUES ('7', '1', '1488330260', '110.8355179', '24.8369904');
INSERT INTO `fds_app_user_local` VALUES ('8', '1', '1488330265', '110.8355637', '24.8369942');
INSERT INTO `fds_app_user_local` VALUES ('9', '1', '1488330270', '110.8355789', '24.8372936');
INSERT INTO `fds_app_user_local` VALUES ('10', '1', '1488330275', '110.8355637', '24.8374081');
INSERT INTO `fds_app_user_local` VALUES ('11', '1', '1488330280', '110.8355713', '24.8375549');
INSERT INTO `fds_app_user_local` VALUES ('12', '2', '1488330280', '110.8359985', '24.8330002');
INSERT INTO `fds_app_user_local` VALUES ('13', '3', '1488330280', '110.8301239', '24.8381329');
INSERT INTO `fds_app_user_local` VALUES ('14', '4', '1488330280', '110.8331146', '24.8443317');
INSERT INTO `fds_app_user_local` VALUES ('15', '5', '1488330280', '110.8378754', '24.8458214');

-- ----------------------------
-- Table structure for fds_check_record
-- ----------------------------
DROP TABLE IF EXISTS `fds_check_record`;
CREATE TABLE `fds_check_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `task_id` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `x_coord` float(11,7) DEFAULT NULL,
  `y_coord` float(11,7) DEFAULT NULL,
  `apply_check_point` tinyint(2) DEFAULT '0',
  `standard_level` smallint(5) DEFAULT NULL,
  `info` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fds_check_record
-- ----------------------------
INSERT INTO `fds_check_record` VALUES ('1', '1', '2', null, '1488184800', null, null, '0', null, null);

-- ----------------------------
-- Table structure for fds_task
-- ----------------------------
DROP TABLE IF EXISTS `fds_task`;
CREATE TABLE `fds_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `start_time` int(11) DEFAULT NULL,
  `end_time` int(11) DEFAULT NULL,
  `describle` text,
  `department_id` smallint(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fds_task
-- ----------------------------

-- ----------------------------
-- Table structure for fds_task_unit_link
-- ----------------------------
DROP TABLE IF EXISTS `fds_task_unit_link`;
CREATE TABLE `fds_task_unit_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fds_task_unit_link
-- ----------------------------

-- ----------------------------
-- Table structure for fds_task_user_link
-- ----------------------------
DROP TABLE IF EXISTS `fds_task_user_link`;
CREATE TABLE `fds_task_user_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `complete` tinyint(2) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fds_task_user_link
-- ----------------------------

-- ----------------------------
-- Table structure for fds_unit
-- ----------------------------
DROP TABLE IF EXISTS `fds_unit`;
CREATE TABLE `fds_unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_type_id` smallint(5) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `x_coord` float(11,7) DEFAULT NULL,
  `y_coord` float(11,7) DEFAULT NULL,
  `zone_id` smallint(5) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `risk_level` smallint(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fds_unit
-- ----------------------------
INSERT INTO `fds_unit` VALUES ('1', '5', '恭城中学医务室', '恭城中学校园内', '18332511154', '110.8357315', '24.8365555', '2', '1479451705', null);
INSERT INTO `fds_unit` VALUES ('2', '5', '恭城县机关幼儿园医务室', '恭城县机关幼儿园内', '18332518547', '110.8357315', '24.8385181', '2', '1479451705', null);
INSERT INTO `fds_unit` VALUES ('3', '5', '个体诊所1', null, null, '110.8365555', '24.8372269', null, '1479451705', null);
INSERT INTO `fds_unit` VALUES ('4', '18', '恭城瑶族自治县人民医院', '城中东路11号', '0773-3273427', '110.8393097', '24.8407974', null, '1479451705', null);
INSERT INTO `fds_unit` VALUES ('5', '18', 'eeww', 'e', '1', '110.8349838', '24.8367119', null, '1479451705', null);
INSERT INTO `fds_unit` VALUES ('7', '18', '加会永康堂药店', 'ddd22', 'q', '110.8754730', '24.9961967', null, '1479451705', null);

-- ----------------------------
-- Table structure for fds_unit_info_data
-- ----------------------------
DROP TABLE IF EXISTS `fds_unit_info_data`;
CREATE TABLE `fds_unit_info_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_id` int(11) DEFAULT NULL,
  `field_id` int(11) DEFAULT NULL,
  `data` longtext,
  `data_format` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fds_unit_info_data
-- ----------------------------
INSERT INTO `fds_unit_info_data` VALUES ('1', '3', '0', '个体诊所1', null);
INSERT INTO `fds_unit_info_data` VALUES ('2', '3', '1', '鲁班路100号', null);
INSERT INTO `fds_unit_info_data` VALUES ('3', '4', '0', '111', null);
INSERT INTO `fds_unit_info_data` VALUES ('4', '4', '1', '222', null);
INSERT INTO `fds_unit_info_data` VALUES ('5', '3', '2', 'www', null);
INSERT INTO `fds_unit_info_data` VALUES ('6', '4', '18', '恭城瑶族自治县人民医院', null);
INSERT INTO `fds_unit_info_data` VALUES ('7', '4', '19', '城中东路11号', null);
INSERT INTO `fds_unit_info_data` VALUES ('8', '4', '20', '门诊科', null);
INSERT INTO `fds_unit_info_data` VALUES ('9', '4', '21', '陈晓明', null);
INSERT INTO `fds_unit_info_data` VALUES ('10', '4', '22', '李东升', null);
INSERT INTO `fds_unit_info_data` VALUES ('11', '4', '23', '324134124124214', null);
INSERT INTO `fds_unit_info_data` VALUES ('12', '4', '24', '20190204', null);
INSERT INTO `fds_unit_info_data` VALUES ('13', '4', '25', '姜大卫', null);
INSERT INTO `fds_unit_info_data` VALUES ('14', '4', '26', '0773-3273427', null);
INSERT INTO `fds_unit_info_data` VALUES ('21', '5', '18', 'eeww', null);
INSERT INTO `fds_unit_info_data` VALUES ('22', '5', '19', 'e', null);
INSERT INTO `fds_unit_info_data` VALUES ('23', '5', '20', '1', null);
INSERT INTO `fds_unit_info_data` VALUES ('24', '5', '21', '1', null);
INSERT INTO `fds_unit_info_data` VALUES ('25', '5', '22', '1', null);
INSERT INTO `fds_unit_info_data` VALUES ('26', '5', '23', '1', null);
INSERT INTO `fds_unit_info_data` VALUES ('27', '5', '24', '1', null);
INSERT INTO `fds_unit_info_data` VALUES ('28', '5', '25', '1', null);
INSERT INTO `fds_unit_info_data` VALUES ('29', '5', '26', '1', null);
INSERT INTO `fds_unit_info_data` VALUES ('51', '7', '18', '加会永康堂药店', null);
INSERT INTO `fds_unit_info_data` VALUES ('52', '7', '19', 'ddd22', null);
INSERT INTO `fds_unit_info_data` VALUES ('53', '7', '20', 'q', null);
INSERT INTO `fds_unit_info_data` VALUES ('54', '7', '21', 'q', null);
INSERT INTO `fds_unit_info_data` VALUES ('55', '7', '22', 'q', null);
INSERT INTO `fds_unit_info_data` VALUES ('56', '7', '23', 'q', null);
INSERT INTO `fds_unit_info_data` VALUES ('57', '7', '24', 'q', null);
INSERT INTO `fds_unit_info_data` VALUES ('58', '7', '25', 'q', null);
INSERT INTO `fds_unit_info_data` VALUES ('59', '7', '26', 'q', null);
INSERT INTO `fds_unit_info_data` VALUES ('66', '8', '18', 'ww33', null);
INSERT INTO `fds_unit_info_data` VALUES ('67', '8', '19', 'w', null);
INSERT INTO `fds_unit_info_data` VALUES ('68', '8', '20', 'q', null);
INSERT INTO `fds_unit_info_data` VALUES ('69', '8', '21', 'q', null);
INSERT INTO `fds_unit_info_data` VALUES ('70', '8', '22', 'q', null);
INSERT INTO `fds_unit_info_data` VALUES ('71', '8', '23', 'q', null);
INSERT INTO `fds_unit_info_data` VALUES ('72', '8', '24', 'q', null);
INSERT INTO `fds_unit_info_data` VALUES ('73', '8', '25', 'q', null);
INSERT INTO `fds_unit_info_data` VALUES ('74', '8', '26', 'q', null);

-- ----------------------------
-- Table structure for fds_unit_info_field
-- ----------------------------
DROP TABLE IF EXISTS `fds_unit_info_field`;
CREATE TABLE `fds_unit_info_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `short_name` varchar(64) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `unit_type_id` smallint(5) DEFAULT NULL,
  `data_type` varchar(64) DEFAULT NULL,
  `description` longtext,
  `sortorder` smallint(5) DEFAULT NULL,
  `defaultdata` longtext,
  `param1` longtext,
  `param2` longtext,
  `param3` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fds_unit_info_field
-- ----------------------------
INSERT INTO `fds_unit_info_field` VALUES ('2', 'organization_name', '机构名称', '19', null, null, null, null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('3', 'addr', '地址', '19', null, null, null, null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('4', 'diagnosis_subject', '诊疗科目', '19', null, null, null, null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('5', 'eading_official', '负责人', '19', null, null, null, null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('6', 'registration_mark', '医疗机构登记号', '19', null, null, null, null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('7', 'period_of_validity', '证书有效期', '19', null, null, null, null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('8', 'pharmacyleader', '药房负责人', '19', null, null, null, null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('9', 'phone', '联系电话', '19', null, null, null, null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('10', 'organization_name', '机构名称', '20', null, null, null, null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('11', 'addr', '地址', '20', null, null, null, null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('12', 'diagnosis_subject', '诊疗科目', '20', null, null, null, null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('13', 'registration_mark', '医疗机构登记号', '20', null, null, null, null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('14', 'leading_official', '负责人', '20', null, null, null, null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('15', 'period_of_validity', '证书有效期', '20', null, null, null, null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('16', 'pharmacyleader', '药房负责人', '20', null, null, null, null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('17', 'phone', '联系电话', '20', null, null, null, null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('18', 'organization_name', '机构名称', '18', null, null, null, null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('19', 'addr', '地址', '18', null, null, null, null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('20', 'diagnosis_subject', '诊疗科目', '18', null, null, null, null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('21', 'legal_person', '法定代表人', '18', null, null, null, null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('22', 'leading_official', '主要负责人', '18', null, null, null, null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('23', 'registration_mark', '医疗机构登记号', '18', null, null, null, null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('24', 'period_of_validity', '证书有效期', '18', null, null, null, null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('25', 'pharmacyleader', '药房负责人', '18', null, null, null, null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('26', 'phone', '联系电话', '18', null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for fds_unit_type
-- ----------------------------
DROP TABLE IF EXISTS `fds_unit_type`;
CREATE TABLE `fds_unit_type` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `parent_id` smallint(5) DEFAULT NULL,
  `department_id` smallint(5) DEFAULT NULL,
  `level` smallint(5) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fds_unit_type
-- ----------------------------
INSERT INTO `fds_unit_type` VALUES ('1', '食品', null, null, '1', null);
INSERT INTO `fds_unit_type` VALUES ('2', '医药', null, null, '1', null);
INSERT INTO `fds_unit_type` VALUES ('3', '保健品化妆品', null, null, '1', null);
INSERT INTO `fds_unit_type` VALUES ('4', '食品生产', '1', '1', '2', '/unit_type_icon/1488185982cyfw.png');
INSERT INTO `fds_unit_type` VALUES ('5', '食品流通', '1', '2', '2', '/unit_type_icon/1488184733cyfw.png');
INSERT INTO `fds_unit_type` VALUES ('6', '餐饮服务', '1', '0', '2', '/unit_type_icon/1488184788yljg.png');
INSERT INTO `fds_unit_type` VALUES ('7', '医疗机构', '2', '0', '2', '/unit_type_icon/1488185061ypsc.png');
INSERT INTO `fds_unit_type` VALUES ('8', '药品', '2', null, '1', null);
INSERT INTO `fds_unit_type` VALUES ('9', '医疗器械', '8', '0', '2', null);
INSERT INTO `fds_unit_type` VALUES ('10', '保健品', '3', '7', '2', null);
INSERT INTO `fds_unit_type` VALUES ('11', '化妆品', '3', null, '2', null);
INSERT INTO `fds_unit_type` VALUES ('12', '食品生产企业', '4', '1', '2', null);
INSERT INTO `fds_unit_type` VALUES ('13', '小作坊', '4', '1', '3', null);
INSERT INTO `fds_unit_type` VALUES ('14', '食品批发', '5', '2', '3', null);
INSERT INTO `fds_unit_type` VALUES ('15', '食品零售', '5', '2', '3', null);
INSERT INTO `fds_unit_type` VALUES ('16', '餐饮店', '6', null, '3', null);
INSERT INTO `fds_unit_type` VALUES ('17', '学校食堂', '6', null, '3', null);
INSERT INTO `fds_unit_type` VALUES ('18', '县、乡镇卫生院', '7', '0', '3', '/unit_type_icon/1488185897ypsc.png');
INSERT INTO `fds_unit_type` VALUES ('19', '村卫生所/室', '7', null, '3', null);
INSERT INTO `fds_unit_type` VALUES ('20', '个体诊所', '7', null, '3', null);
INSERT INTO `fds_unit_type` VALUES ('21', '药品生产', '8', null, '2', null);
INSERT INTO `fds_unit_type` VALUES ('22', '药品经营', '8', null, '2', null);
INSERT INTO `fds_unit_type` VALUES ('23', '医疗器械生产', '9', '0', '3', null);
INSERT INTO `fds_unit_type` VALUES ('24', '医疗器械批发/配送', '9', '5', '3', '/unit_type_icon/1488186867ypls.png');
INSERT INTO `fds_unit_type` VALUES ('25', '药品零售', '22', '0', '3', '/unit_type_icon/1488184687ypsc.png');
INSERT INTO `fds_unit_type` VALUES ('26', '药品批发', '22', '3', '3', null);

-- ----------------------------
-- Table structure for fds_warning_advance
-- ----------------------------
DROP TABLE IF EXISTS `fds_warning_advance`;
CREATE TABLE `fds_warning_advance` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` tinyint(2) DEFAULT NULL,
  `num_interval` int(11) DEFAULT NULL,
  `start_time` int(11) DEFAULT NULL,
  `end_time` int(11) DEFAULT NULL,
  `department_id` smallint(5) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fds_warning_advance
-- ----------------------------
INSERT INTO `fds_warning_advance` VALUES ('1', '年预警', '1', '1', '1488252628', null, null, null);
INSERT INTO `fds_warning_advance` VALUES ('2', '月预警', '1', '6', '1488252780', null, null, null);
INSERT INTO `fds_warning_advance` VALUES ('3', '天预警', '1', '7', '1488277650', null, null, null);
INSERT INTO `fds_warning_advance` VALUES ('4', '2016餐饮卫生检测', '2', null, '1488124800', '1489507200', '1', null);
INSERT INTO `fds_warning_advance` VALUES ('5', '2016药品质量检测', '2', null, '1487174400', '1488384000', '2', null);
INSERT INTO `fds_warning_advance` VALUES ('11', '2017医疗器械安全检查', '2', null, '1488297600', '1490889600', '2', null);
INSERT INTO `fds_warning_advance` VALUES ('12', '2017食品卫生检查', '2', null, '1488297600', '1498752000', '1', null);
INSERT INTO `fds_warning_advance` VALUES ('13', '2017保健食品抽样调查', '2', null, '1488297600', '1493481600', '7', null);

-- ----------------------------
-- Table structure for fds_warning_unit
-- ----------------------------
DROP TABLE IF EXISTS `fds_warning_unit`;
CREATE TABLE `fds_warning_unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_id` int(11) DEFAULT NULL,
  `warning_id` smallint(5) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=552 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fds_warning_unit
-- ----------------------------
INSERT INTO `fds_warning_unit` VALUES ('540', '2', '3', '1488529823');
INSERT INTO `fds_warning_unit` VALUES ('541', '3', '3', '1488529823');
INSERT INTO `fds_warning_unit` VALUES ('542', '4', '3', '1488529823');
INSERT INTO `fds_warning_unit` VALUES ('543', '5', '3', '1488529823');
INSERT INTO `fds_warning_unit` VALUES ('544', '7', '3', '1488529823');
INSERT INTO `fds_warning_unit` VALUES ('545', '8', '3', '1488529823');
INSERT INTO `fds_warning_unit` VALUES ('546', '2', '5', '1488529823');
INSERT INTO `fds_warning_unit` VALUES ('547', '3', '5', '1488529823');
INSERT INTO `fds_warning_unit` VALUES ('548', '4', '5', '1488529823');
INSERT INTO `fds_warning_unit` VALUES ('549', '5', '5', '1488529823');
INSERT INTO `fds_warning_unit` VALUES ('550', '7', '5', '1488529823');
INSERT INTO `fds_warning_unit` VALUES ('551', '8', '5', '1488529823');

-- ----------------------------
-- Table structure for fds_zone
-- ----------------------------
DROP TABLE IF EXISTS `fds_zone`;
CREATE TABLE `fds_zone` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `level` smallint(5) DEFAULT NULL,
  `parent_id` smallint(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fds_zone
-- ----------------------------
INSERT INTO `fds_zone` VALUES ('1', '恭城瑶族自治县', '1', '0');
INSERT INTO `fds_zone` VALUES ('2', '恭城镇', '2', '1');
INSERT INTO `fds_zone` VALUES ('3', '栗木镇', '2', '1');
INSERT INTO `fds_zone` VALUES ('4', '莲花镇', '2', '1');
INSERT INTO `fds_zone` VALUES ('5', '嘉会镇', '2', '1');
INSERT INTO `fds_zone` VALUES ('6', '平安乡', '2', '1');
INSERT INTO `fds_zone` VALUES ('7', '三江乡', '2', '1');
INSERT INTO `fds_zone` VALUES ('8', '西领乡', '2', '1');
INSERT INTO `fds_zone` VALUES ('9', '观音乡', '2', '1');
INSERT INTO `fds_zone` VALUES ('10', '龙虎乡', '2', '1');
INSERT INTO `fds_zone` VALUES ('11', '恭城镇第一责任区', '3', '2');
INSERT INTO `fds_zone` VALUES ('12', '恭城镇第二责任区', '3', '2');

-- ----------------------------
-- Table structure for fds_zone_user
-- ----------------------------
DROP TABLE IF EXISTS `fds_zone_user`;
CREATE TABLE `fds_zone_user` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `zone_id` smallint(5) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `unit_type_id` smallint(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fds_zone_user
-- ----------------------------
INSERT INTO `fds_zone_user` VALUES ('73', '2', '109', '1');
INSERT INTO `fds_zone_user` VALUES ('74', '2', '108', '1');
INSERT INTO `fds_zone_user` VALUES ('75', '2', '106', '1');
INSERT INTO `fds_zone_user` VALUES ('78', '2', '106', '2');
INSERT INTO `fds_zone_user` VALUES ('79', '2', '105', '2');
INSERT INTO `fds_zone_user` VALUES ('80', '2', '100', '3');
INSERT INTO `fds_zone_user` VALUES ('81', '2', '99', '3');

-- ----------------------------
-- View structure for 人员区域管理
-- ----------------------------
DROP VIEW IF EXISTS `人员区域管理`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`172.16.77.1` SQL SECURITY DEFINER VIEW `人员区域管理` AS select `fds_app_user`.`id` AS `id`,`fds_zone_user`.`user_id` AS `user_id`,`fds_app_user`.`nickname` AS `nickname`,`fds_app_user`.`account` AS `account`,`fds_unit`.`name` AS `name` from ((`fds_app_user` join `fds_zone_user`) join `fds_unit`) where ((`fds_app_user`.`id` = `fds_zone_user`.`user_id`) and (`fds_zone_user`.`zone_id` = `fds_unit`.`zone_id`) and (`fds_zone_user`.`unit_type_id` = `fds_unit`.`unit_type_id`)) ;

-- ----------------------------
-- Function structure for find_sub_unit_type
-- ----------------------------
DROP FUNCTION IF EXISTS `find_sub_unit_type`;
DELIMITER ;;
CREATE DEFINER=`root`@`172.16.77.1` FUNCTION `find_sub_unit_type`(`unit_type_id` int) RETURNS int(11)
BEGIN
	#Routine body goes here...

	RETURN 0;
END
;;
DELIMITER ;
