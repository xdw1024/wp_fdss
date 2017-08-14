/*
Navicat MySQL Data Transfer

Source Server         : CentOS7
Source Server Version : 50505
Source Host           : 172.16.77.1:3306
Source Database       : fdss

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-03-28 14:49:14
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
INSERT INTO `fds_admin` VALUES ('1', 'admin', '超级管理员', '21232f297a57a5a743894a0e4a801fc3', '', '1490681773', '127.0.0.1', '1005', '8888', 'liu21st@gmail.com', '备注信息', '1222907803', '1239977420', '1', '1', '');
INSERT INTO `fds_admin` VALUES ('38', 'food_admin', '食品股管理员', '21232f297a57a5a743894a0e4a801fc3', '', '1489129074', '192.168.1.4', '12', null, '', '', '1222907803', '1239977420', '1', '0', '');
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
  `phone` varchar(100) DEFAULT NULL,
  `remark` varchar(255) NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `department_id` smallint(5) unsigned DEFAULT '0',
  `info` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`)
) ENGINE=MyISAM AUTO_INCREMENT=4447 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fds_app_user
-- ----------------------------
INSERT INTO `fds_app_user` VALUES ('1', 'test', '测试', '21232f297a57a5a743894a0e4a801fc3', '', '1479461448', '172.16.77.1', '942', '8888', 'liu21st@gmail.com', null, '备注信息', '1222907803', '1488789715', '1', '1', '');
INSERT INTO `fds_app_user` VALUES ('2', 'f001', '张小风', '21232f297a57a5a743894a0e4a801fc3', '', '1479461448', '172.16.77.1', '942', '8888', 'liu21st@gmail.com', null, '备注信息', '1222907803', '1488789634', '1', '4', '');
INSERT INTO `fds_app_user` VALUES ('3', 'f002', '王小雨', '21232f297a57a5a743894a0e4a801fc3', '', '1479461448', '172.16.77.1', '942', '8888', 'liu21st@gmail.com', null, '备注信息', '1222907803', '1488789623', '1', '2', '');
INSERT INTO `fds_app_user` VALUES ('4', 'f003', '盘小白', '21232f297a57a5a743894a0e4a801fc3', '', '1479461448', '172.16.77.1', '942', '8888', 'liu21st@gmail.com', null, '备注信息', '1222907803', '1488789614', '1', '1', '');
INSERT INTO `fds_app_user` VALUES ('5', 'b001', '钱小可', '4297f44b13955235245b2497399d7a93', '', '0', null, '0', null, 'qxk@123.com', null, '', '1488789700', '0', '0', '7', '');
INSERT INTO `fds_app_user` VALUES ('6', 'b002', '孙小品', '4297f44b13955235245b2497399d7a93', '', '0', null, '0', null, 'sxp@123.com', null, '', '1488789781', '0', '0', '7', '');
INSERT INTO `fds_app_user` VALUES ('7', 'f005', '郑小兰', '4297f44b13955235245b2497399d7a93', '', '0', null, '0', null, 'zxl@123.com', null, '', '1488806003', '0', '0', '4', '');
INSERT INTO `fds_app_user` VALUES ('8', 'f004', '赵小黑', '21232f297a57a5a743894a0e4a801fc3', '', '1479461448', '172.16.77.1', '942', '8888', 'liu21st@gmail.com', null, '备注信息', '1222907803', '1488789606', '1', '1', '');
INSERT INTO `fds_app_user` VALUES ('100', 'c007', '巴尔扎克', '83d7a2e752c6ccf23240d6831eb4b252', '', '0', null, '0', null, 'baerzk@123.com', null, '', '1480734571', '1488789597', '0', '6', '');
INSERT INTO `fds_app_user` VALUES ('109', 'c008', '韩寒', '202cb962ac59075b964b07152d234b70', '', '0', null, '0', null, 'hanhan@123.com', null, '', '1481357788', '1488789486', '0', '6', '');
INSERT INTO `fds_app_user` VALUES ('102', 'c006', '李清照', '83d7a2e752c6ccf23240d6831eb4b252', '', '0', null, '0', null, 'lqz@123.com', null, '', '1480734571', '1488789543', '0', '6', '');
INSERT INTO `fds_app_user` VALUES ('103', 'c005', '托尔斯泰', '83d7a2e752c6ccf23240d6831eb4b252', '', '0', null, '0', null, 'tuoerst@123.com', null, '', '1480734571', '1488789535', '0', '5', '');
INSERT INTO `fds_app_user` VALUES ('104', 'c004', '雨果', '83d7a2e752c6ccf23240d6831eb4b252', '', '0', null, '0', null, 'yuguo@123.com', null, '', '1480734571', '1488789526', '0', '5', '');
INSERT INTO `fds_app_user` VALUES ('105', 'c003', '沈从文', '83d7a2e752c6ccf23240d6831eb4b252', '', '0', null, '0', null, 'scw@123.com', null, '', '1480734571', '1489127709', '0', '5', '');
INSERT INTO `fds_app_user` VALUES ('106', 'c002', '梁实秋', '83d7a2e752c6ccf23240d6831eb4b252', '', '0', null, '0', null, 'lqs@123.com', null, '', '1480734571', '1489127695', '0', '5', '');
INSERT INTO `fds_app_user` VALUES ('108', 'c001', '郭敬明', '7c03aeb8031097d35caf3416a1826139', '', '0', null, '0', null, 'guoingming@123.com', null, '', '1480754438', '1488789498', '0', '6', '');
INSERT INTO `fds_app_user` VALUES ('110', 'c009', '高晓声', '202cb962ac59075b964b07152d234b70', '', '0', null, '0', null, 'gaoxiaosheng@123.com', null, '', '1482111904', '1488789477', '0', '6', '');
INSERT INTO `fds_app_user` VALUES ('4446', '111', '111', '4ba36d23a78c7393b4900ef38019d8ff', '', '0', null, '0', null, '', null, '', '1490062943', '0', '0', '0', '');

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
-- Table structure for fds_app_version
-- ----------------------------
DROP TABLE IF EXISTS `fds_app_version`;
CREATE TABLE `fds_app_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` int(11) NOT NULL,
  `apk_url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fds_app_version
-- ----------------------------
INSERT INTO `fds_app_version` VALUES ('1', '2', 'http://120.25.168.113:82/fdss_app/app-release.apk');

-- ----------------------------
-- Table structure for fds_app_webrtc
-- ----------------------------
DROP TABLE IF EXISTS `fds_app_webrtc`;
CREATE TABLE `fds_app_webrtc` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `room_url` varchar(255) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fds_app_webrtc
-- ----------------------------
INSERT INTO `fds_app_webrtc` VALUES ('1', '1', 'https://www.cenxiaogs.cn/r/12321312', '1490682936');

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
  `standard_level` smallint(5) DEFAULT '0',
  `info` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fds_check_record
-- ----------------------------
INSERT INTO `fds_check_record` VALUES ('1', '1', '2', null, '1488184800', null, null, '0', '0', null);
INSERT INTO `fds_check_record` VALUES ('2', '1', '2', null, '1468184800', null, null, '0', '0', null);
INSERT INTO `fds_check_record` VALUES ('3', '1', '3', null, '1433184800', null, null, '0', '0', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fds_unit
-- ----------------------------
INSERT INTO `fds_unit` VALUES ('1', '18', '恭城瑶族自治县中医院', '恭城镇太平街一巷26号', '0773-1234567', '110.8362122', '24.8359241', '2', '1489108892', null);
INSERT INTO `fds_unit` VALUES ('2', '18', '恭城瑶族自治县人民医院', '恭城镇兴隆街108号', '0773-1234567', '110.8400116', '24.8386993', '2', '1489108892', null);
INSERT INTO `fds_unit` VALUES ('3', '18', '恭城瑶族自治县妇幼保健院', '恭城镇城中西路八巷1号', '0773-1112223', '110.8310165', '24.8455429', '2', '1489108892', null);
INSERT INTO `fds_unit` VALUES ('4', '18', '恭城瑶族自治县西岭乡中心卫生院', '西岭乡圩市街422号', '0773-1231233', '110.7977448', '24.9533424', '8', '1489108892', null);
INSERT INTO `fds_unit` VALUES ('6', '18', '恭城瑶族自治县嘉会乡中心卫生院', '嘉会乡嘉会街66号', '', null, null, '5', '1489128409', null);
INSERT INTO `fds_unit` VALUES ('7', '18', '恭城瑶族自治县龙虎乡卫生院', '龙虎乡龙虎街190号', '666666666', '110.9573746', '25.0793343', '10', '1489128409', null);
INSERT INTO `fds_unit` VALUES ('8', '18', '恭城瑶族自治县栗木镇中心卫生院', '栗木镇北极街22号', '', '110.9082642', '25.1327553', '3', '1489128409', null);
INSERT INTO `fds_unit` VALUES ('10', '18', '恭城瑶族自治县观音乡卫生院', '观音乡观音街14号', '1111111111', '110.9757843', '25.1877308', '9', '1489136105', null);
INSERT INTO `fds_unit` VALUES ('11', '18', '恭城瑶族自治县栗木矿区卫生院', '栗木镇马路桥', '', null, null, '3', '1489136105', null);
INSERT INTO `fds_unit` VALUES ('12', '18', '平安乡卫生院', '平安乡桥头村', '11111', '110.8437958', '24.8498096', '6', '1489136105', null);
INSERT INTO `fds_unit` VALUES ('13', '18', '恭城瑶族自治县恭城镇卫生院', '茶西路40号', '11111', '110.8230057', '24.8472614', '2', '1489136105', null);
INSERT INTO `fds_unit` VALUES ('14', '18', '恭城瑶族自治县疾控中心预防医学综合门诊部', '茶南路35号', '11111', '110.8377457', '24.8508606', '2', '1489136105', null);
INSERT INTO `fds_unit` VALUES ('15', '18', '恭城康华医院', '县水果批发城1-12、13号', '11111', '110.8404312', '24.8416958', '2', '1489136105', null);
INSERT INTO `fds_unit` VALUES ('16', '18', '恭城协和门诊部', '恭城镇城中西路78号', '11111', '110.8314972', '24.8653011', '2', '1489136105', null);
INSERT INTO `fds_unit` VALUES ('19', '12', '恭城瑶乡食品厂', '恭城县恭城镇燕新路工业区', null, '110.8359451', '24.8381786', '2', '1490169389', null);
INSERT INTO `fds_unit` VALUES ('34', '29', 'q', 'q', 'q', '110.8352966', '24.8359814', '2', '1490252313', null);
INSERT INTO `fds_unit` VALUES ('35', '12', '桂林恭城华丰米粉厂', '恭城县恭城镇江贝村凤凰山脚屯北面铁路桥旁', '暂无', '110.8382416', '24.8373585', '2', '1490323948', null);
INSERT INTO `fds_unit` VALUES ('36', '13', '平安乡坝头村欧丽军粑粑加工小作坊', '平安乡坝头村69-1号', '13471372827', '110.8395767', '24.8385315', '6', '2017', null);
INSERT INTO `fds_unit` VALUES ('37', '13', '栗木镇陈家酒坊', '栗木镇陈家厂', '13877339407', '110.8364334', '24.8372841', '3', '2017', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=375 DEFAULT CHARSET=utf8;

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
INSERT INTO `fds_unit_info_data` VALUES ('70', '6', '18', '恭城瑶族自治县嘉会乡中心卫生院', null);
INSERT INTO `fds_unit_info_data` VALUES ('71', '6', '19', '嘉会乡嘉会街66号', null);
INSERT INTO `fds_unit_info_data` VALUES ('72', '6', '20', '内科、外科、儿科、妇产科、急诊科、中医科、口腔科、预防保健科、医学影像科、医学检验科、全科医疗科', null);
INSERT INTO `fds_unit_info_data` VALUES ('73', '6', '21', '李吉贤', null);
INSERT INTO `fds_unit_info_data` VALUES ('74', '6', '22', '李吉贤', null);
INSERT INTO `fds_unit_info_data` VALUES ('75', '6', '23', '49923815645033211C2101', null);
INSERT INTO `fds_unit_info_data` VALUES ('76', '6', '24', '1525017600', null);
INSERT INTO `fds_unit_info_data` VALUES ('77', '6', '25', '陈良安', null);
INSERT INTO `fds_unit_info_data` VALUES ('78', '6', '26', '', null);
INSERT INTO `fds_unit_info_data` VALUES ('85', '7', '18', '恭城瑶族自治县龙虎乡卫生院', null);
INSERT INTO `fds_unit_info_data` VALUES ('86', '7', '19', '龙虎乡龙虎街190号', null);
INSERT INTO `fds_unit_info_data` VALUES ('87', '7', '20', '内科、外科、儿科、妇科、急诊科、中医科、全科医疗科、预防保健科、医学影像科、医学检验科', null);
INSERT INTO `fds_unit_info_data` VALUES ('88', '7', '21', '黄翔', null);
INSERT INTO `fds_unit_info_data` VALUES ('89', '7', '22', '黄翔', null);
INSERT INTO `fds_unit_info_data` VALUES ('90', '7', '23', '49923834045033211C2201', null);
INSERT INTO `fds_unit_info_data` VALUES ('91', '7', '24', '1525017600', null);
INSERT INTO `fds_unit_info_data` VALUES ('92', '7', '25', '陈石英', null);
INSERT INTO `fds_unit_info_data` VALUES ('93', '7', '26', '666666666', null);
INSERT INTO `fds_unit_info_data` VALUES ('100', '8', '18', '恭城瑶族自治县栗木镇中心卫生院', null);
INSERT INTO `fds_unit_info_data` VALUES ('101', '8', '19', '栗木镇北极街22号', null);
INSERT INTO `fds_unit_info_data` VALUES ('102', '8', '20', '内科、外科、儿科、妇产科、急诊科、中医科、预防保健科、医学影像科、医学检验科、全科医疗科', null);
INSERT INTO `fds_unit_info_data` VALUES ('103', '8', '21', '李文化', null);
INSERT INTO `fds_unit_info_data` VALUES ('104', '8', '22', '李文化', null);
INSERT INTO `fds_unit_info_data` VALUES ('105', '8', '23', '49923847145033211C2101', null);
INSERT INTO `fds_unit_info_data` VALUES ('106', '8', '24', '1525017600', null);
INSERT INTO `fds_unit_info_data` VALUES ('107', '8', '25', '蒋提琴', null);
INSERT INTO `fds_unit_info_data` VALUES ('108', '8', '26', '', null);
INSERT INTO `fds_unit_info_data` VALUES ('130', '10', '18', '恭城瑶族自治县观音乡卫生院', null);
INSERT INTO `fds_unit_info_data` VALUES ('131', '10', '19', '观音乡观音街14号', null);
INSERT INTO `fds_unit_info_data` VALUES ('132', '10', '20', '内科、外科、儿科、妇科、急诊科、中医科、预防保健科、医学影像科、医学检验科、全科医疗科', null);
INSERT INTO `fds_unit_info_data` VALUES ('133', '10', '21', '刘金旺', null);
INSERT INTO `fds_unit_info_data` VALUES ('134', '10', '22', '刘金旺', null);
INSERT INTO `fds_unit_info_data` VALUES ('135', '10', '23', '49923836745033211C2201', null);
INSERT INTO `fds_unit_info_data` VALUES ('136', '10', '24', '1525017600', null);
INSERT INTO `fds_unit_info_data` VALUES ('137', '10', '25', '冯有庆', null);
INSERT INTO `fds_unit_info_data` VALUES ('138', '10', '26', '1111111111', null);
INSERT INTO `fds_unit_info_data` VALUES ('145', '11', '18', '恭城瑶族自治县栗木矿区卫生院', null);
INSERT INTO `fds_unit_info_data` VALUES ('146', '11', '19', '栗木镇马路桥', null);
INSERT INTO `fds_unit_info_data` VALUES ('147', '11', '20', '内科、外科、儿科、妇科、急诊科、中医科、预防保健科、医学影像科、医学检验科、全科医疗科', null);
INSERT INTO `fds_unit_info_data` VALUES ('148', '11', '21', '梁智玲', null);
INSERT INTO `fds_unit_info_data` VALUES ('149', '11', '22', '梁智玲', null);
INSERT INTO `fds_unit_info_data` VALUES ('150', '11', '23', '72305678-845033211C2201', null);
INSERT INTO `fds_unit_info_data` VALUES ('151', '11', '24', '1525017600', null);
INSERT INTO `fds_unit_info_data` VALUES ('152', '11', '25', '唐东发', null);
INSERT INTO `fds_unit_info_data` VALUES ('153', '11', '26', '', null);
INSERT INTO `fds_unit_info_data` VALUES ('160', '12', '18', '平安乡卫生院', null);
INSERT INTO `fds_unit_info_data` VALUES ('161', '12', '19', '平安乡桥头村', null);
INSERT INTO `fds_unit_info_data` VALUES ('162', '12', '20', '内科、外科、儿科、妇科、急诊科、中医科、全科医疗科、口腔科、预防保健科、医学影像科、医学检验科', null);
INSERT INTO `fds_unit_info_data` VALUES ('163', '12', '21', '梁关连', null);
INSERT INTO `fds_unit_info_data` VALUES ('164', '12', '22', '梁关连', null);
INSERT INTO `fds_unit_info_data` VALUES ('165', '12', '23', '49923844745033211C2201', null);
INSERT INTO `fds_unit_info_data` VALUES ('166', '12', '24', '1525017600', null);
INSERT INTO `fds_unit_info_data` VALUES ('167', '12', '25', '彭华', null);
INSERT INTO `fds_unit_info_data` VALUES ('168', '12', '26', '11111', null);
INSERT INTO `fds_unit_info_data` VALUES ('175', '13', '18', '恭城瑶族自治县恭城镇卫生院', null);
INSERT INTO `fds_unit_info_data` VALUES ('176', '13', '19', '茶西路40号', null);
INSERT INTO `fds_unit_info_data` VALUES ('177', '13', '20', '急诊科、内科、儿科、外科、妇科、预防保健科、医学影像科、医学检验科', null);
INSERT INTO `fds_unit_info_data` VALUES ('178', '13', '21', '黄绍飞', null);
INSERT INTO `fds_unit_info_data` VALUES ('179', '13', '22', '黄绍飞', null);
INSERT INTO `fds_unit_info_data` VALUES ('180', '13', '23', '56678877-345033211C2201', null);
INSERT INTO `fds_unit_info_data` VALUES ('181', '13', '24', '1525017600', null);
INSERT INTO `fds_unit_info_data` VALUES ('182', '13', '25', '郑启宁', null);
INSERT INTO `fds_unit_info_data` VALUES ('183', '13', '26', '11111', null);
INSERT INTO `fds_unit_info_data` VALUES ('190', '14', '18', '恭城瑶族自治县疾控中心预防医学综合门诊部', null);
INSERT INTO `fds_unit_info_data` VALUES ('191', '14', '19', '茶南路35号', null);
INSERT INTO `fds_unit_info_data` VALUES ('192', '14', '20', '医学检验科、预防保健科、皮肤病科、结核病科', null);
INSERT INTO `fds_unit_info_data` VALUES ('193', '14', '21', '何忠', null);
INSERT INTO `fds_unit_info_data` VALUES ('194', '14', '22', '李玉松', null);
INSERT INTO `fds_unit_info_data` VALUES ('195', '14', '23', 'PDY71149-545033211D1101', null);
INSERT INTO `fds_unit_info_data` VALUES ('196', '14', '24', '1525017600', null);
INSERT INTO `fds_unit_info_data` VALUES ('197', '14', '25', '李玉松', null);
INSERT INTO `fds_unit_info_data` VALUES ('198', '14', '26', '11111', null);
INSERT INTO `fds_unit_info_data` VALUES ('205', '15', '18', '恭城康华医院', null);
INSERT INTO `fds_unit_info_data` VALUES ('206', '15', '19', '县水果批发城1-12、13号', null);
INSERT INTO `fds_unit_info_data` VALUES ('207', '15', '20', '预防保健科、内科、外科、妇科、急诊医学科、麻醉科、医学检验科、医学影像科', null);
INSERT INTO `fds_unit_info_data` VALUES ('208', '15', '21', '李亚凡', null);
INSERT INTO `fds_unit_info_data` VALUES ('209', '15', '22', '梁振声', null);
INSERT INTO `fds_unit_info_data` VALUES ('210', '15', '23', 'PDY71137-245033217A1002', null);
INSERT INTO `fds_unit_info_data` VALUES ('211', '15', '24', '1531152000', null);
INSERT INTO `fds_unit_info_data` VALUES ('212', '15', '25', '王进', null);
INSERT INTO `fds_unit_info_data` VALUES ('213', '15', '26', '11111', null);
INSERT INTO `fds_unit_info_data` VALUES ('220', '16', '18', '恭城协和门诊部', null);
INSERT INTO `fds_unit_info_data` VALUES ('221', '16', '19', '恭城镇城中西路78号', null);
INSERT INTO `fds_unit_info_data` VALUES ('222', '16', '20', '内科、外科、妇科、耳鼻喉科、口腔科、医学检验、医学影像科门诊', null);
INSERT INTO `fds_unit_info_data` VALUES ('223', '16', '21', '蔡建华', null);
INSERT INTO `fds_unit_info_data` VALUES ('224', '16', '22', '危祖荣', null);
INSERT INTO `fds_unit_info_data` VALUES ('225', '16', '23', 'PDY60048-845033217D1102', null);
INSERT INTO `fds_unit_info_data` VALUES ('226', '16', '24', '1461945600', null);
INSERT INTO `fds_unit_info_data` VALUES ('227', '16', '25', ' 蔡建华', null);
INSERT INTO `fds_unit_info_data` VALUES ('228', '16', '26', '11111', null);
INSERT INTO `fds_unit_info_data` VALUES ('235', '19', '27', '恭城瑶乡食品厂', null);
INSERT INTO `fds_unit_info_data` VALUES ('236', '19', '28', 'SC10145033200088', null);
INSERT INTO `fds_unit_info_data` VALUES ('237', '19', '29', '91450332090723834L', null);
INSERT INTO `fds_unit_info_data` VALUES ('238', '19', '30', '粮食加工', null);
INSERT INTO `fds_unit_info_data` VALUES ('239', '19', '31', '其他粮食加工品', null);
INSERT INTO `fds_unit_info_data` VALUES ('240', '19', '32', 'DB45/ 319-2007《鲜湿米粉质量安全要求》', null);
INSERT INTO `fds_unit_info_data` VALUES ('241', '19', '33', '1474473600', null);
INSERT INTO `fds_unit_info_data` VALUES ('242', '19', '34', '1632153600', null);
INSERT INTO `fds_unit_info_data` VALUES ('243', '19', '35', '恭城县恭城镇燕新路工业区', null);
INSERT INTO `fds_unit_info_data` VALUES ('244', '19', '36', '', null);
INSERT INTO `fds_unit_info_data` VALUES ('245', '19', '37', '王小海', null);
INSERT INTO `fds_unit_info_data` VALUES ('246', '19', '38', '赵柳仁', null);
INSERT INTO `fds_unit_info_data` VALUES ('247', '19', '39', '', null);
INSERT INTO `fds_unit_info_data` VALUES ('325', '34', '40', 'q', null);
INSERT INTO `fds_unit_info_data` VALUES ('326', '34', '41', 'q', null);
INSERT INTO `fds_unit_info_data` VALUES ('327', '34', '42', 'q', null);
INSERT INTO `fds_unit_info_data` VALUES ('328', '34', '43', '55555', null);
INSERT INTO `fds_unit_info_data` VALUES ('329', '34', '44', '33333', null);
INSERT INTO `fds_unit_info_data` VALUES ('330', '35', '27', '桂林恭城华丰米粉厂', null);
INSERT INTO `fds_unit_info_data` VALUES ('331', '35', '28', 'QS4538 0104 0002', null);
INSERT INTO `fds_unit_info_data` VALUES ('332', '35', '29', '暂无', null);
INSERT INTO `fds_unit_info_data` VALUES ('333', '35', '30', '粮食加工', null);
INSERT INTO `fds_unit_info_data` VALUES ('334', '35', '31', '其他粮食加工品）', null);
INSERT INTO `fds_unit_info_data` VALUES ('335', '35', '32', 'DB45/T 582-2009《干米粉》', null);
INSERT INTO `fds_unit_info_data` VALUES ('336', '35', '33', '1406822400', null);
INSERT INTO `fds_unit_info_data` VALUES ('337', '35', '34', '1501430400', null);
INSERT INTO `fds_unit_info_data` VALUES ('338', '35', '35', '恭城县恭城镇江贝村凤凰山脚屯北面铁路桥旁', null);
INSERT INTO `fds_unit_info_data` VALUES ('339', '35', '36', '暂无', null);
INSERT INTO `fds_unit_info_data` VALUES ('340', '35', '37', '娄小微   ', null);
INSERT INTO `fds_unit_info_data` VALUES ('341', '35', '38', '娄小微 ', null);
INSERT INTO `fds_unit_info_data` VALUES ('342', '35', '39', '暂无', null);
INSERT INTO `fds_unit_info_data` VALUES ('345', '36', '45', '桂（恭）食药监食坊（2017年）备字001-1号', null);
INSERT INTO `fds_unit_info_data` VALUES ('346', '36', '46', '平安乡坝头村欧丽军粑粑加工小作坊', null);
INSERT INTO `fds_unit_info_data` VALUES ('347', '36', '47', '蒸煮类糕点（粑粑）', null);
INSERT INTO `fds_unit_info_data` VALUES ('348', '36', '48', '平安乡坝头村69-1号', null);
INSERT INTO `fds_unit_info_data` VALUES ('349', '36', '49', '欧丽军', null);
INSERT INTO `fds_unit_info_data` VALUES ('350', '36', '50', '13471372827', null);
INSERT INTO `fds_unit_info_data` VALUES ('351', '36', '51', '1490284800', null);
INSERT INTO `fds_unit_info_data` VALUES ('352', '36', '52', '平安', null);
INSERT INTO `fds_unit_info_data` VALUES ('353', '36', '53', '0', null);
INSERT INTO `fds_unit_info_data` VALUES ('360', '37', '45', '桂（恭）食药监食坊（2017年）备字002-1号', null);
INSERT INTO `fds_unit_info_data` VALUES ('361', '37', '46', '栗木镇陈家酒坊', null);
INSERT INTO `fds_unit_info_data` VALUES ('362', '37', '47', '散装白酒（米酒）', null);
INSERT INTO `fds_unit_info_data` VALUES ('363', '37', '48', '栗木镇陈家厂', null);
INSERT INTO `fds_unit_info_data` VALUES ('364', '37', '49', '陈静', null);
INSERT INTO `fds_unit_info_data` VALUES ('365', '37', '50', '13877339407', null);
INSERT INTO `fds_unit_info_data` VALUES ('366', '37', '51', '1490284800', null);
INSERT INTO `fds_unit_info_data` VALUES ('367', '37', '52', '栗木', null);
INSERT INTO `fds_unit_info_data` VALUES ('368', '37', '53', '0', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fds_unit_info_field
-- ----------------------------
INSERT INTO `fds_unit_info_field` VALUES ('2', 'organization_name', '机构名称', '19', 'text', null, '1', null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('3', 'addr', '地址', '19', 'text', null, '2', null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('4', 'diagnosis_subject', '诊疗科目', '19', 'texterea', null, '3', null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('5', 'eading_official', '负责人', '19', 'text', null, '4', null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('6', 'registration_mark', '医疗机构登记号', '19', 'text', null, '5', null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('7', 'period_of_validity', '证书有效期', '19', 'datetime', null, '6', null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('8', 'pharmacyleader', '药房负责人', '19', 'text', null, '7', null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('9', 'phone', '联系电话', '19', 'text', null, '8', null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('10', 'organization_name', '机构名称', '20', 'text', null, '1', null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('11', 'addr', '地址', '20', 'text', null, '2', null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('12', 'diagnosis_subject', '诊疗科目', '20', 'texterea', null, '3', null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('13', 'registration_mark', '医疗机构登记号', '20', 'text', null, '4', null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('14', 'leading_official', '负责人', '20', 'text', null, '5', null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('15', 'period_of_validity', '证书有效期', '20', 'datetime', null, '6', null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('16', 'pharmacyleader', '药房负责人', '20', 'text', null, '7', null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('17', 'phone', '联系电话', '20', 'text', null, '8', null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('18', 'organization_name', '机构名称', '18', 'text', null, '1', null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('19', 'addr', '地址', '18', 'text', null, '2', null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('20', 'diagnosis_subject', '诊疗科目', '18', 'texterea', null, '3', null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('21', 'legal_person', '法定代表人', '18', 'text', null, '4', null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('22', 'leading_official', '主要负责人', '18', 'text', null, '5', null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('23', 'registration_mark', '医疗机构登记号', '18', 'text', null, '6', null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('24', 'period_of_validity', '证书有效期', '18', 'datetime', null, '7', null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('25', 'pharmacyleader', '药房负责人', '18', 'text', null, '8', null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('26', 'phone', '联系电话', '18', 'text', null, '9', null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('27', 'name', '企业名称', '12', 'text', null, '1', null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('28', 'certificate_number', '证书编号', '12', 'text', null, '2', null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('29', 'id_number', '社会信用代码(身份证号码)', '12', 'text', null, '3', null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('30', 'food_type', '食品、食品添加剂类别', '12', 'text', null, '4', null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('31', 'type_name', '类别名称', '12', 'text', null, '5', null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('32', 'type_detial', '食品品种明细', '12', 'text', null, '6', null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('33', 'filing_date', '发证（备案）日期', '12', 'datetime', null, '7', null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('34', 'period_of_validity', '有效期至', '12', 'datetime', null, '8', null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('35', 'addr', '生产地址', '12', 'texterea', null, '9', null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('36', 'warehouse_addr', '外设仓库地址', '12', 'texterea', null, '12', null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('37', 'legal_person', '法人（负责人）', '12', 'text', null, '10', null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('38', 'authorized_person', '授权人', '12', 'text', null, '11', null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('39', 'phone', '联系电话', '12', 'text', null, '13', null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('40', 'name', '名称', '29', 'text', null, '1', null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('41', 'addr', '地址', '29', 'text', null, '2', null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('42', 'phone', '电话', '29', 'text', null, '3', null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('43', 'my01', '呵呵', '29', 'text', null, '4', null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('44', 'bz', '备注', '29', 'text', null, '5', null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('45', 'record_number', '备案编号', '13', 'text', null, '1', null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('46', 'name', '小作坊名称', '13', 'text', null, '2', null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('47', 'food_name', '生产加工的食品名称', '13', 'texterea', null, '3', null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('48', 'addr', '地址', '13', 'texterea', null, '4', null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('49', 'legal_person', '负责人', '13', 'text', null, '5', null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('50', 'phone', '联系电话', '13', 'text', null, '6', null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('51', 'create_time', '办理时间', '13', 'datetime', null, '7', null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('52', 'remarks', '备注', '13', 'text', null, '8', null, null, null, null);
INSERT INTO `fds_unit_info_field` VALUES ('53', 'remarks_num', '去年已备案今年重新备案数', '13', 'text', null, '9', null, null, null, null);

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
  `path` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fds_unit_type
-- ----------------------------
INSERT INTO `fds_unit_type` VALUES ('1', '食品', '0', null, '1', '/1', null);
INSERT INTO `fds_unit_type` VALUES ('2', '医药', '0', null, '1', '/2', null);
INSERT INTO `fds_unit_type` VALUES ('3', '保健品化妆品', '0', null, '1', '/3', null);
INSERT INTO `fds_unit_type` VALUES ('4', '食品生产', '1', '1', '2', '/1/4', '/unit_type_icon/1488185982cyfw.png');
INSERT INTO `fds_unit_type` VALUES ('5', '食品流通', '1', '2', '2', '/1/5', '/unit_type_icon/1488184733cyfw.png');
INSERT INTO `fds_unit_type` VALUES ('6', '餐饮服务', '1', '0', '2', '/1/6', '/unit_type_icon/1488184788yljg.png');
INSERT INTO `fds_unit_type` VALUES ('7', '医疗机构', '2', '0', '2', '/2/7', '/unit_type_icon/1488185061ypsc.png');
INSERT INTO `fds_unit_type` VALUES ('8', '药品', '2', '0', '2', '/2/8', null);
INSERT INTO `fds_unit_type` VALUES ('9', '医疗器械', '2', '0', '2', '/2/9', null);
INSERT INTO `fds_unit_type` VALUES ('10', '保健品', '3', '7', '2', '/3/10', null);
INSERT INTO `fds_unit_type` VALUES ('11', '化妆品', '3', '0', '2', '/3/11', null);
INSERT INTO `fds_unit_type` VALUES ('12', '食品生产企业', '4', '1', '3', '/1/4/12', null);
INSERT INTO `fds_unit_type` VALUES ('13', '小作坊', '4', '1', '3', '/1/4/13', null);
INSERT INTO `fds_unit_type` VALUES ('14', '食品批发', '5', '2', '3', '/1/5/14', null);
INSERT INTO `fds_unit_type` VALUES ('15', '食品零售', '5', '2', '3', '/1/5/15', null);
INSERT INTO `fds_unit_type` VALUES ('16', '餐饮店', '6', '0', '3', '/1/6/16', null);
INSERT INTO `fds_unit_type` VALUES ('17', '学校食堂', '6', '0', '3', '/1/6/17', null);
INSERT INTO `fds_unit_type` VALUES ('18', '县直医疗单位', '7', '0', '3', '/2/7/18', '/unit_type_icon/1489125702yljg.png');
INSERT INTO `fds_unit_type` VALUES ('19', '乡镇卫生院', '7', '0', '3', '/2/7/19', null);
INSERT INTO `fds_unit_type` VALUES ('20', '个体诊所', '7', '0', '3', '/2/7/20', null);
INSERT INTO `fds_unit_type` VALUES ('21', '药品生产', '8', '0', '3', '/2/8/21', null);
INSERT INTO `fds_unit_type` VALUES ('22', '药品经营', '8', '0', '3', '/2/8/22', null);
INSERT INTO `fds_unit_type` VALUES ('23', '医疗器械生产', '9', '0', '3', '/2/9/23', null);
INSERT INTO `fds_unit_type` VALUES ('24', '医疗器械批发/配送', '9', '5', '3', '/2/9/24', '/unit_type_icon/1488186867ypls.png');
INSERT INTO `fds_unit_type` VALUES ('25', '药品零售', '22', '0', '4', '/2/8/22/25', '/unit_type_icon/1488184687ypsc.png');
INSERT INTO `fds_unit_type` VALUES ('26', '药品批发', '22', '0', '4', '/2/8/22/26', null);
INSERT INTO `fds_unit_type` VALUES ('28', '乡镇村卫生所/室', '7', '6', '3', '/2/7/28', null);
INSERT INTO `fds_unit_type` VALUES ('29', '3333333333', '4', '0', '3', '/1/4/29', '/unit_type_icon/14901453231481284130yppf.png');

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
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fds_warning_unit
-- ----------------------------
INSERT INTO `fds_warning_unit` VALUES ('53', '2', '5', '1489136644');
INSERT INTO `fds_warning_unit` VALUES ('54', '3', '5', '1489136644');
INSERT INTO `fds_warning_unit` VALUES ('55', '4', '5', '1489136644');
INSERT INTO `fds_warning_unit` VALUES ('56', '6', '5', '1489136644');
INSERT INTO `fds_warning_unit` VALUES ('57', '7', '5', '1489136644');
INSERT INTO `fds_warning_unit` VALUES ('58', '8', '5', '1489136644');
INSERT INTO `fds_warning_unit` VALUES ('59', '9', '5', '1489136644');
INSERT INTO `fds_warning_unit` VALUES ('60', '10', '5', '1489136644');
INSERT INTO `fds_warning_unit` VALUES ('61', '11', '5', '1489136644');
INSERT INTO `fds_warning_unit` VALUES ('62', '12', '5', '1489136644');
INSERT INTO `fds_warning_unit` VALUES ('63', '13', '5', '1489136644');
INSERT INTO `fds_warning_unit` VALUES ('64', '14', '5', '1489136644');
INSERT INTO `fds_warning_unit` VALUES ('65', '15', '5', '1489136644');
INSERT INTO `fds_warning_unit` VALUES ('66', '16', '5', '1489136644');

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
  `auto_flag` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fds_zone_user
-- ----------------------------
INSERT INTO `fds_zone_user` VALUES ('1', '2', '3', '4', '1');
INSERT INTO `fds_zone_user` VALUES ('2', '2', '4', '4', '1');
INSERT INTO `fds_zone_user` VALUES ('3', '2', '7', '5', '1');
INSERT INTO `fds_zone_user` VALUES ('4', '2', '2', '5', '1');
INSERT INTO `fds_zone_user` VALUES ('7', '2', '106', '9', '1');
INSERT INTO `fds_zone_user` VALUES ('11', '2', '105', '18', '1');
INSERT INTO `fds_zone_user` VALUES ('12', '2', '108', '18', '1');
INSERT INTO `fds_zone_user` VALUES ('15', '2', '104', '9', '1');
INSERT INTO `fds_zone_user` VALUES ('16', null, '0', '0', '0');

-- ----------------------------
-- View structure for 人员区域管理
-- ----------------------------
DROP VIEW IF EXISTS `人员区域管理`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`172.16.77.1` SQL SECURITY DEFINER VIEW `人员区域管理` AS select `fds_app_user`.`id` AS `id`,`fds_zone_user`.`user_id` AS `user_id`,`fds_app_user`.`nickname` AS `nickname`,`fds_app_user`.`account` AS `account`,`fds_unit`.`name` AS `name` from ((`fds_app_user` join `fds_zone_user`) join `fds_unit`) where ((`fds_app_user`.`id` = `fds_zone_user`.`user_id`) and (`fds_zone_user`.`zone_id` = `fds_unit`.`zone_id`) and (`fds_zone_user`.`unit_type_id` = `fds_unit`.`unit_type_id`)) ;

-- ----------------------------
-- Procedure structure for showTreeNodes_yongyupost2000
-- ----------------------------
DROP PROCEDURE IF EXISTS `showTreeNodes_yongyupost2000`;
DELIMITER ;;
CREATE DEFINER=`root`@`172.16.77.1` PROCEDURE `showTreeNodes_yongyupost2000`(IN rootid INT)
BEGIN
 DECLARE Level int ;
 drop TABLE IF EXISTS tmpLst;
 CREATE TABLE tmpLst (
 id int,
 nLevel int,
 sCort varchar(8000)
 );
 Set Level=0 ;
 INSERT into tmpLst SELECT id,`level`,ID FROM fds_unit_type WHERE parent_id=rootid;
 WHILE ROW_COUNT()>0 DO
 SET Level=Level+1 ;
 INSERT into tmpLst
  SELECT A.id,Level,concat(B.sCort,A.id) FROM fds_unit_type A,tmpLst B
  WHERE A.parent_id=B.ID AND B.nLevel=`level`-1 ;
 END WHILE;
END
;;
DELIMITER ;

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

-- ----------------------------
-- Function structure for get_unit_parents
-- ----------------------------
DROP FUNCTION IF EXISTS `get_unit_parents`;
DELIMITER ;;
CREATE DEFINER=`root`@`172.16.77.1` FUNCTION `get_unit_parents`(rootId INT) RETURNS varchar(1000) CHARSET utf8
BEGIN
		DECLARE sTemp VARCHAR(1000);
    DECLARE sTempChd VARCHAR(1000);

    SET sTemp = '$';
    SET sTempChd =cast(rootId as CHAR);

    WHILE sTempChd is not null DO
				SET sTemp = concat(sTemp,',',sTempChd);
        SELECT group_concat(id) INTO sTempChd FROM  fds_unit_type ut where FIND_IN_SET(parent_id,sTempChd)>0;
   	END WHILE; 
    RETURN sTemp; 
END
;;
DELIMITER ;
