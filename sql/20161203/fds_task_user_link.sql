/*
Navicat MySQL Data Transfer

Source Server         : centOS7
Source Server Version : 50505
Source Host           : 172.16.77.1:3306
Source Database       : fdss

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2016-12-03 17:12:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for fds_task_user_link
-- ----------------------------
DROP TABLE IF EXISTS `fds_task_user_link`;
CREATE TABLE `fds_task_user_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `complete` tinyint(2) DEFAULT '0',
  `time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
