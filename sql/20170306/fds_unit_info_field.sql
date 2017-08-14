/*
Navicat MySQL Data Transfer

Source Server         : CentOS7
Source Server Version : 50505
Source Host           : 172.16.77.1:3306
Source Database       : fdss

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-03-06 12:03:16
*/

SET FOREIGN_KEY_CHECKS=0;

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
