/*
Navicat MySQL Data Transfer

Source Server         : centOS7
Source Server Version : 50505
Source Host           : 172.16.77.1:3306
Source Database       : fdss

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2016-12-10 09:03:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for fds_unit_type
-- ----------------------------
DROP TABLE IF EXISTS `fds_unit_type`;
CREATE TABLE `fds_unit_type` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
