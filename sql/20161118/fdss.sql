/*
Navicat MySQL Data Transfer

Source Server         : centOS7
Source Server Version : 50505
Source Host           : 172.16.77.1:3306
Source Database       : fdss

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2016-11-18 17:43:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for fds_admin
-- ----------------------------
DROP TABLE IF EXISTS `fds_admin`;
CREATE TABLE `fds_admin` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `account` varchar(64) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `password` char(32) NOT NULL,
  `bind_account` varchar(50) NOT NULL,
  `last_login_time` int(11) unsigned DEFAULT '0',
  `last_login_ip` varchar(40) DEFAULT NULL,
  `login_count` mediumint(8) unsigned DEFAULT '0',
  `verify` varchar(32) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `type_id` tinyint(2) unsigned DEFAULT '0',
  `info` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fds_admin
-- ----------------------------
INSERT INTO `fds_admin` VALUES ('1', 'admin', '超级管理员', '21232f297a57a5a743894a0e4a801fc3', '', '1479462040', '172.16.77.1', '944', '8888', 'liu21st@gmail.com', '备注信息', '1222907803', '1239977420', '1', '0', '');

-- ----------------------------
-- Table structure for fds_app_user
-- ----------------------------
DROP TABLE IF EXISTS `fds_app_user`;
CREATE TABLE `fds_app_user` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `account` varchar(64) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `password` char(32) NOT NULL,
  `bind_account` varchar(50) NOT NULL,
  `last_login_time` int(11) unsigned DEFAULT '0',
  `last_login_ip` varchar(40) DEFAULT NULL,
  `login_count` mediumint(8) unsigned DEFAULT '0',
  `verify` varchar(32) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `type_id` tinyint(2) unsigned DEFAULT '0',
  `info` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fds_app_user
-- ----------------------------

-- ----------------------------
-- Table structure for fds_check_record
-- ----------------------------
DROP TABLE IF EXISTS `fds_check_record`;
CREATE TABLE `fds_check_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `info` text,
  `time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fds_check_record
-- ----------------------------

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
  `name` varchar(64) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `x_coord` float DEFAULT NULL,
  `y_coord` float DEFAULT NULL,
  `type` smallint(5) DEFAULT NULL,
  `info` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fds_unit
-- ----------------------------

-- ----------------------------
-- Table structure for fds_unit_type
-- ----------------------------
DROP TABLE IF EXISTS `fds_unit_type`;
CREATE TABLE `fds_unit_type` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fds_unit_type
-- ----------------------------
