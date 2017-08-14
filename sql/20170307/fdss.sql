/*
Navicat MySQL Data Transfer

Source Server         : CentOS7
Source Server Version : 50505
Source Host           : 172.16.77.1:3306
Source Database       : fdss

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-03-07 09:37:45
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
INSERT INTO `fds_admin` VALUES ('1', 'admin', '超级管理员', '21232f297a57a5a743894a0e4a801fc3', '', '1488849933', '192.168.1.4', '985', '8888', 'liu21st@gmail.com', '备注信息', '1222907803', '1239977420', '1', '1', '');
INSERT INTO `fds_admin` VALUES ('38', 'food_admin', '食品股管理员', '21232f297a57a5a743894a0e4a801fc3', '', '1488791094', '192.168.1.4', '11', null, '', '', '1222907803', '1239977420', '1', '0', '');
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
) ENGINE=MyISAM AUTO_INCREMENT=4446 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fds_app_user
-- ----------------------------
INSERT INTO `fds_app_user` VALUES ('1', 'test', '测试', '21232f297a57a5a743894a0e4a801fc3', '', '1479461448', '172.16.77.1', '942', '8888', 'liu21st@gmail.com', '备注信息', '1222907803', '1488789715', '1', '1', '');
INSERT INTO `fds_app_user` VALUES ('2', 'f001', '张小风', '21232f297a57a5a743894a0e4a801fc3', '', '1479461448', '172.16.77.1', '942', '8888', 'liu21st@gmail.com', '备注信息', '1222907803', '1488789634', '1', '4', '');
INSERT INTO `fds_app_user` VALUES ('3', 'f002', '王小雨', '21232f297a57a5a743894a0e4a801fc3', '', '1479461448', '172.16.77.1', '942', '8888', 'liu21st@gmail.com', '备注信息', '1222907803', '1488789623', '1', '2', '');
INSERT INTO `fds_app_user` VALUES ('4', 'f003', '盘小白', '21232f297a57a5a743894a0e4a801fc3', '', '1479461448', '172.16.77.1', '942', '8888', 'liu21st@gmail.com', '备注信息', '1222907803', '1488789614', '1', '1', '');
INSERT INTO `fds_app_user` VALUES ('5', 'b001', '钱小可', '4297f44b13955235245b2497399d7a93', '', '0', null, '0', null, 'qxk@123.com', '', '1488789700', '0', '0', '7', '');
INSERT INTO `fds_app_user` VALUES ('6', 'b002', '孙小品', '4297f44b13955235245b2497399d7a93', '', '0', null, '0', null, 'sxp@123.com', '', '1488789781', '0', '0', '7', '');
INSERT INTO `fds_app_user` VALUES ('7', 'f005', '郑小兰', '4297f44b13955235245b2497399d7a93', '', '0', null, '0', null, 'zxl@123.com', '', '1488806003', '0', '0', '4', '');
INSERT INTO `fds_app_user` VALUES ('8', 'f004', '赵小黑', '21232f297a57a5a743894a0e4a801fc3', '', '1479461448', '172.16.77.1', '942', '8888', 'liu21st@gmail.com', '备注信息', '1222907803', '1488789606', '1', '1', '');
INSERT INTO `fds_app_user` VALUES ('100', 'c007', '巴尔扎克', '83d7a2e752c6ccf23240d6831eb4b252', '', '0', null, '0', null, 'baerzk@123.com', '', '1480734571', '1488789597', '0', '6', '');
INSERT INTO `fds_app_user` VALUES ('109', 'c008', '韩寒', '202cb962ac59075b964b07152d234b70', '', '0', null, '0', null, 'hanhan@123.com', '', '1481357788', '1488789486', '0', '6', '');
INSERT INTO `fds_app_user` VALUES ('102', 'c006', '李清照', '83d7a2e752c6ccf23240d6831eb4b252', '', '0', null, '0', null, 'lqz@123.com', '', '1480734571', '1488789543', '0', '6', '');
INSERT INTO `fds_app_user` VALUES ('103', 'c005', '托尔斯泰', '83d7a2e752c6ccf23240d6831eb4b252', '', '0', null, '0', null, 'tuoerst@123.com', '', '1480734571', '1488789535', '0', '5', '');
INSERT INTO `fds_app_user` VALUES ('104', 'c004', '雨果', '83d7a2e752c6ccf23240d6831eb4b252', '', '0', null, '0', null, 'yuguo@123.com', '', '1480734571', '1488789526', '0', '5', '');
INSERT INTO `fds_app_user` VALUES ('105', 'c003', '沈从文', '83d7a2e752c6ccf23240d6831eb4b252', '', '0', null, '0', null, '4234159', '', '1480734571', '1488789509', '0', '5', '');
INSERT INTO `fds_app_user` VALUES ('106', 'c002', '梁秋实', '83d7a2e752c6ccf23240d6831eb4b252', '', '0', null, '0', null, '4234160', '', '1480734571', '1487663563', '0', '5', '');
INSERT INTO `fds_app_user` VALUES ('108', 'c001', '郭敬明', '7c03aeb8031097d35caf3416a1826139', '', '0', null, '0', null, 'guoingming@123.com', '', '1480754438', '1488789498', '0', '6', '');
INSERT INTO `fds_app_user` VALUES ('110', 'c009', '高晓声', '202cb962ac59075b964b07152d234b70', '', '0', null, '0', null, 'gaoxiaosheng@123.com', '', '1482111904', '1488789477', '0', '6', '');

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
  `start_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  `describle` text,
  `department_id` smallint(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fds_task
-- ----------------------------
INSERT INTO `fds_task` VALUES ('1', '2017学校食堂卫生检查', '1488795444', '1488805653', '对县城内各学校食堂食品卫生进行安全检查', null);
INSERT INTO `fds_task` VALUES ('2', '2017餐饮食品卫生检查', '1488795444', '1488947364', '对餐饮店食品采购处理等进行检查', null);
INSERT INTO `fds_task` VALUES ('3', '2017医疗器械质量检查', '1488795444', '1488874653', '对医疗用具质量卫生等抽样检测', null);
INSERT INTO `fds_task` VALUES ('4', '2017乡镇医院规范性检查', '1488795444', '1488874653', '检查乡镇医院是否符合经营规范', null);
INSERT INTO `fds_task` VALUES ('5', '2017医药质量检查', '1488795444', '1488874653', '对各药品销售点进行医药抽样检查', null);

-- ----------------------------
-- Table structure for fds_task_unit_link
-- ----------------------------
DROP TABLE IF EXISTS `fds_task_unit_link`;
CREATE TABLE `fds_task_unit_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fds_task_unit_link
-- ----------------------------
INSERT INTO `fds_task_unit_link` VALUES ('1', '4', '1');
INSERT INTO `fds_task_unit_link` VALUES ('2', '4', '2');
INSERT INTO `fds_task_unit_link` VALUES ('3', '5', '1');
INSERT INTO `fds_task_unit_link` VALUES ('4', '5', '2');
INSERT INTO `fds_task_unit_link` VALUES ('5', '5', '3');

-- ----------------------------
-- Table structure for fds_task_user_link
-- ----------------------------
DROP TABLE IF EXISTS `fds_task_user_link`;
CREATE TABLE `fds_task_user_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `complete` tinyint(2) DEFAULT '0',
  `time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fds_task_user_link
-- ----------------------------
INSERT INTO `fds_task_user_link` VALUES ('1', '4', '1', '0', '0');
INSERT INTO `fds_task_user_link` VALUES ('2', '4', '108', '0', '0');
INSERT INTO `fds_task_user_link` VALUES ('3', '5', '1', '0', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fds_unit
-- ----------------------------
INSERT INTO `fds_unit` VALUES ('1', '18', '恭城瑶族自治县中医院', '恭城镇太平街一巷26号', '11111111', '110.8362122', '24.8359241', null, '1488795444', null);
INSERT INTO `fds_unit` VALUES ('2', '18', '恭城瑶族自治县人民医院', '恭城镇兴隆街108号', '0773-1234567', '110.8393021', '24.8407497', null, '1488805253', null);
INSERT INTO `fds_unit` VALUES ('3', '18', '恭城瑶族自治县妇幼保健院', '恭城镇城中西路八巷1号', '0773-1112223', '110.8310165', '24.8455429', null, '1488805412', null);
INSERT INTO `fds_unit` VALUES ('4', '18', '恭城瑶族自治县西岭乡中心卫生院', '西岭乡圩市街422号', '0773-1231233', '110.7977448', '24.9533424', null, '1488805522', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fds_unit_info_data
-- ----------------------------
INSERT INTO `fds_unit_info_data` VALUES ('1', '1', '18', '恭城瑶族自治县中医院', null);
INSERT INTO `fds_unit_info_data` VALUES ('2', '1', '19', '恭城镇太平街一巷26号', null);
INSERT INTO `fds_unit_info_data` VALUES ('3', '1', '20', '预防保健科、内科、外科、妇产科、儿科、眼科、耳鼻喉科、口腔科、皮肤科（门诊）、传染科、急诊医学科、麻醉科、医学检验科、医学影像科、中医科（二级科目详见诊疗科目核准记录）', null);
INSERT INTO `fds_unit_info_data` VALUES ('4', '1', '21', '陆景荣', null);
INSERT INTO `fds_unit_info_data` VALUES ('5', '1', '22', '陆景荣', null);
INSERT INTO `fds_unit_info_data` VALUES ('6', '1', '23', 'PDYO1189445033211A2101', null);
INSERT INTO `fds_unit_info_data` VALUES ('7', '1', '24', '1523635200', null);
INSERT INTO `fds_unit_info_data` VALUES ('8', '1', '25', '林太义', null);
INSERT INTO `fds_unit_info_data` VALUES ('9', '1', '26', '0773-1234567', null);
INSERT INTO `fds_unit_info_data` VALUES ('16', '2', '18', '恭城瑶族自治县人民医院', null);
INSERT INTO `fds_unit_info_data` VALUES ('17', '2', '19', '恭城镇兴隆街108号', null);
INSERT INTO `fds_unit_info_data` VALUES ('18', '2', '20', '预防保健科、内科、外科、妇产科、儿科、眼科、耳鼻喉科、口腔科、皮肤科（门诊）、传染科、急诊医学科、麻醉科、医学检验科、医学影像科、中医科（二级科目详见诊疗科目核准记录）', null);
INSERT INTO `fds_unit_info_data` VALUES ('19', '2', '21', '梁波', null);
INSERT INTO `fds_unit_info_data` VALUES ('20', '2', '22', '梁波', null);
INSERT INTO `fds_unit_info_data` VALUES ('21', '2', '23', 'PDYO11914X45033211A1001', null);
INSERT INTO `fds_unit_info_data` VALUES ('22', '2', '24', '1523635200', null);
INSERT INTO `fds_unit_info_data` VALUES ('23', '2', '25', '莫月仕', null);
INSERT INTO `fds_unit_info_data` VALUES ('24', '2', '26', '0773-1234567', null);
INSERT INTO `fds_unit_info_data` VALUES ('31', '3', '18', '恭城瑶族自治县妇幼保健院', null);
INSERT INTO `fds_unit_info_data` VALUES ('32', '3', '19', '恭城镇城中西路八巷1号', null);
INSERT INTO `fds_unit_info_data` VALUES ('33', '3', '20', '预防保健科（门诊）、外科、妇产科、妇女保健科（门诊）儿科、儿童保健科（门诊）、急诊医学科、麻醉科、医学检验科、医学影像科（二级科目详见诊疗科目核准记录）', null);
INSERT INTO `fds_unit_info_data` VALUES ('34', '3', '21', '许立涛', null);
INSERT INTO `fds_unit_info_data` VALUES ('35', '3', '22', '许立涛', null);
INSERT INTO `fds_unit_info_data` VALUES ('36', '3', '23', 'PDYO1244045033211G1001', null);
INSERT INTO `fds_unit_info_data` VALUES ('37', '3', '24', '1461340800', null);
INSERT INTO `fds_unit_info_data` VALUES ('38', '3', '25', '尹滔', null);
INSERT INTO `fds_unit_info_data` VALUES ('39', '3', '26', '0773-1112223', null);
INSERT INTO `fds_unit_info_data` VALUES ('46', '4', '18', '恭城瑶族自治县西岭乡中心卫生院', null);
INSERT INTO `fds_unit_info_data` VALUES ('47', '4', '19', '西岭乡圩市街422号', null);
INSERT INTO `fds_unit_info_data` VALUES ('48', '4', '20', '内科、外科、儿科、妇产科、急诊科、中医科、肛肠科、预防保健科、医学影像科、医学检验科、全科医疗科', null);
INSERT INTO `fds_unit_info_data` VALUES ('49', '4', '21', '肖高荣', null);
INSERT INTO `fds_unit_info_data` VALUES ('50', '4', '22', '肖高荣', null);
INSERT INTO `fds_unit_info_data` VALUES ('51', '4', '23', '49923906045033211C2201', null);
INSERT INTO `fds_unit_info_data` VALUES ('52', '4', '24', '1525017600', null);
INSERT INTO `fds_unit_info_data` VALUES ('53', '4', '25', '祝志超', null);
INSERT INTO `fds_unit_info_data` VALUES ('54', '4', '26', '0773-1231233', null);

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
INSERT INTO `fds_warning_advance` VALUES ('1', '年预警', '1', '1', '1483200000', '1514736000', null, null);
INSERT INTO `fds_warning_advance` VALUES ('2', '月预警', '1', '6', '1483200000', '1498838400', null, null);
INSERT INTO `fds_warning_advance` VALUES ('3', '天预警', '1', '7', '1488816000', '1489420800', null, null);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fds_warning_unit
-- ----------------------------
INSERT INTO `fds_warning_unit` VALUES ('8', '1', '3', '1488850620');
INSERT INTO `fds_warning_unit` VALUES ('9', '2', '5', '1488850620');
INSERT INTO `fds_warning_unit` VALUES ('10', '3', '5', '1488850620');
INSERT INTO `fds_warning_unit` VALUES ('11', '4', '5', '1488850620');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fds_zone_user
-- ----------------------------
INSERT INTO `fds_zone_user` VALUES ('1', '2', '3', '4');
INSERT INTO `fds_zone_user` VALUES ('2', '2', '4', '4');
INSERT INTO `fds_zone_user` VALUES ('3', '2', '7', '5');
INSERT INTO `fds_zone_user` VALUES ('4', '2', '2', '5');
INSERT INTO `fds_zone_user` VALUES ('5', '2', '110', '22');
INSERT INTO `fds_zone_user` VALUES ('6', '2', '109', '22');
INSERT INTO `fds_zone_user` VALUES ('7', '2', '106', '9');
INSERT INTO `fds_zone_user` VALUES ('8', '2', '105', '9');
INSERT INTO `fds_zone_user` VALUES ('9', '4', '6', '3');
INSERT INTO `fds_zone_user` VALUES ('10', '4', '5', '3');

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
