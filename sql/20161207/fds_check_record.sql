/*
Navicat MySQL Data Transfer

Source Server         : centOS7
Source Server Version : 50505
Source Host           : 172.16.77.1:3306
Source Database       : fdss

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2016-12-09 10:06:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for fds_check_record
-- ----------------------------
DROP TABLE IF EXISTS `fds_check_record`;
CREATE TABLE `fds_check_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `standard_level` int(11) DEFAULT '0',
  `info` text,
  `time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
