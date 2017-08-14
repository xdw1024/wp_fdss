/*
Navicat MySQL Data Transfer

Source Server         : centOS7
Source Server Version : 50505
Source Host           : 172.16.77.1:3306
Source Database       : fdss

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2016-12-09 10:06:15
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
INSERT INTO `fds_admin` VALUES ('1', 'admin', '超级管理员', '21232f297a57a5a743894a0e4a801fc3', '', '1480987844', '172.16.77.128', '951', '8888', 'liu21st@gmail.com', '备注信息', '1222907803', '1239977420', '1', '0', '');

-- ----------------------------
-- Table structure for fds_administrative_area
-- ----------------------------
DROP TABLE IF EXISTS `fds_administrative_area`;
CREATE TABLE `fds_administrative_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_code` int(11) DEFAULT NULL,
  `zone_name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fds_administrative_area
-- ----------------------------
INSERT INTO `fds_administrative_area` VALUES ('1', '450000', '广西壮族自治区');
INSERT INTO `fds_administrative_area` VALUES ('2', '450100', '南宁市');
INSERT INTO `fds_administrative_area` VALUES ('3', '450101', '市辖区');
INSERT INTO `fds_administrative_area` VALUES ('4', '450102', '兴宁区');
INSERT INTO `fds_administrative_area` VALUES ('5', '450103', '青秀区');
INSERT INTO `fds_administrative_area` VALUES ('6', '450105', '江南区');
INSERT INTO `fds_administrative_area` VALUES ('7', '450107', '西乡塘区');
INSERT INTO `fds_administrative_area` VALUES ('8', '450108', '良庆区');
INSERT INTO `fds_administrative_area` VALUES ('9', '450109', '邕宁区');
INSERT INTO `fds_administrative_area` VALUES ('10', '450110', '武鸣区');
INSERT INTO `fds_administrative_area` VALUES ('11', '450123', '隆安县');
INSERT INTO `fds_administrative_area` VALUES ('12', '450124', '马山县');
INSERT INTO `fds_administrative_area` VALUES ('13', '450125', '上林县');
INSERT INTO `fds_administrative_area` VALUES ('14', '450126', '宾阳县');
INSERT INTO `fds_administrative_area` VALUES ('15', '450127', '横县');
INSERT INTO `fds_administrative_area` VALUES ('16', '450200', '柳州市');
INSERT INTO `fds_administrative_area` VALUES ('17', '450201', '市辖区');
INSERT INTO `fds_administrative_area` VALUES ('18', '450202', '城中区');
INSERT INTO `fds_administrative_area` VALUES ('19', '450203', '鱼峰区');
INSERT INTO `fds_administrative_area` VALUES ('20', '450204', '柳南区');
INSERT INTO `fds_administrative_area` VALUES ('21', '450205', '柳北区');
INSERT INTO `fds_administrative_area` VALUES ('22', '450221', '柳江县');
INSERT INTO `fds_administrative_area` VALUES ('23', '450222', '柳城县');
INSERT INTO `fds_administrative_area` VALUES ('24', '450223', '鹿寨县');
INSERT INTO `fds_administrative_area` VALUES ('25', '450224', '融安县');
INSERT INTO `fds_administrative_area` VALUES ('26', '450225', '融水苗族自治县');
INSERT INTO `fds_administrative_area` VALUES ('27', '450226', '三江侗族自治县');
INSERT INTO `fds_administrative_area` VALUES ('28', '450300', '桂林市');
INSERT INTO `fds_administrative_area` VALUES ('29', '450301', '市辖区');
INSERT INTO `fds_administrative_area` VALUES ('30', '450302', '秀峰区');
INSERT INTO `fds_administrative_area` VALUES ('31', '450303', '叠彩区');
INSERT INTO `fds_administrative_area` VALUES ('32', '450304', '象山区');
INSERT INTO `fds_administrative_area` VALUES ('33', '450305', '七星区');
INSERT INTO `fds_administrative_area` VALUES ('34', '450311', '雁山区');
INSERT INTO `fds_administrative_area` VALUES ('35', '450312', '临桂区');
INSERT INTO `fds_administrative_area` VALUES ('36', '450321', '阳朔县');
INSERT INTO `fds_administrative_area` VALUES ('37', '450323', '灵川县');
INSERT INTO `fds_administrative_area` VALUES ('38', '450324', '全州县');
INSERT INTO `fds_administrative_area` VALUES ('39', '450325', '兴安县');
INSERT INTO `fds_administrative_area` VALUES ('40', '450326', '永福县');
INSERT INTO `fds_administrative_area` VALUES ('41', '450327', '灌阳县');
INSERT INTO `fds_administrative_area` VALUES ('42', '450328', '龙胜各族自治县');
INSERT INTO `fds_administrative_area` VALUES ('43', '450329', '资源县');
INSERT INTO `fds_administrative_area` VALUES ('44', '450330', '平乐县');
INSERT INTO `fds_administrative_area` VALUES ('45', '450331', '荔浦县');
INSERT INTO `fds_administrative_area` VALUES ('46', '450332', '恭城瑶族自治县');
INSERT INTO `fds_administrative_area` VALUES ('47', '450400', '梧州市');
INSERT INTO `fds_administrative_area` VALUES ('48', '450401', '市辖区');
INSERT INTO `fds_administrative_area` VALUES ('49', '450403', '万秀区');
INSERT INTO `fds_administrative_area` VALUES ('50', '450405', '长洲区');
INSERT INTO `fds_administrative_area` VALUES ('51', '450406', '龙圩区');
INSERT INTO `fds_administrative_area` VALUES ('52', '450421', '苍梧县');
INSERT INTO `fds_administrative_area` VALUES ('53', '450422', '藤县');
INSERT INTO `fds_administrative_area` VALUES ('54', '450423', '蒙山县');
INSERT INTO `fds_administrative_area` VALUES ('55', '450481', '岑溪市');
INSERT INTO `fds_administrative_area` VALUES ('56', '450500', '北海市');
INSERT INTO `fds_administrative_area` VALUES ('57', '450501', '市辖区');
INSERT INTO `fds_administrative_area` VALUES ('58', '450502', '海城区');
INSERT INTO `fds_administrative_area` VALUES ('59', '450503', '银海区');
INSERT INTO `fds_administrative_area` VALUES ('60', '450512', '铁山港区');
INSERT INTO `fds_administrative_area` VALUES ('61', '450521', '合浦县');
INSERT INTO `fds_administrative_area` VALUES ('62', '450600', '防城港市');
INSERT INTO `fds_administrative_area` VALUES ('63', '450601', '市辖区');
INSERT INTO `fds_administrative_area` VALUES ('64', '450602', '港口区');
INSERT INTO `fds_administrative_area` VALUES ('65', '450603', '防城区');
INSERT INTO `fds_administrative_area` VALUES ('66', '450621', '上思县');
INSERT INTO `fds_administrative_area` VALUES ('67', '450681', '东兴市');
INSERT INTO `fds_administrative_area` VALUES ('68', '450700', '钦州市');
INSERT INTO `fds_administrative_area` VALUES ('69', '450701', '市辖区');
INSERT INTO `fds_administrative_area` VALUES ('70', '450702', '钦南区');
INSERT INTO `fds_administrative_area` VALUES ('71', '450703', '钦北区');
INSERT INTO `fds_administrative_area` VALUES ('72', '450721', '灵山县');
INSERT INTO `fds_administrative_area` VALUES ('73', '450722', '浦北县');
INSERT INTO `fds_administrative_area` VALUES ('74', '450800', '贵港市');
INSERT INTO `fds_administrative_area` VALUES ('75', '450801', '市辖区');
INSERT INTO `fds_administrative_area` VALUES ('76', '450802', '港北区');
INSERT INTO `fds_administrative_area` VALUES ('77', '450803', '港南区');
INSERT INTO `fds_administrative_area` VALUES ('78', '450804', '覃塘区');
INSERT INTO `fds_administrative_area` VALUES ('79', '450821', '平南县');
INSERT INTO `fds_administrative_area` VALUES ('80', '450881', '桂平市');
INSERT INTO `fds_administrative_area` VALUES ('81', '450900', '玉林市');
INSERT INTO `fds_administrative_area` VALUES ('82', '450901', '市辖区');
INSERT INTO `fds_administrative_area` VALUES ('83', '450902', '玉州区');
INSERT INTO `fds_administrative_area` VALUES ('84', '450903', '福绵区');
INSERT INTO `fds_administrative_area` VALUES ('85', '450921', '容县');
INSERT INTO `fds_administrative_area` VALUES ('86', '450922', '陆川县');
INSERT INTO `fds_administrative_area` VALUES ('87', '450923', '博白县');
INSERT INTO `fds_administrative_area` VALUES ('88', '450924', '兴业县');
INSERT INTO `fds_administrative_area` VALUES ('89', '450981', '北流市');
INSERT INTO `fds_administrative_area` VALUES ('90', '451000', '百色市');
INSERT INTO `fds_administrative_area` VALUES ('91', '451001', '市辖区');
INSERT INTO `fds_administrative_area` VALUES ('92', '451002', '右江区');
INSERT INTO `fds_administrative_area` VALUES ('93', '451021', '田阳县');
INSERT INTO `fds_administrative_area` VALUES ('94', '451022', '田东县');
INSERT INTO `fds_administrative_area` VALUES ('95', '451023', '平果县');
INSERT INTO `fds_administrative_area` VALUES ('96', '451024', '德保县');
INSERT INTO `fds_administrative_area` VALUES ('97', '451026', '那坡县');
INSERT INTO `fds_administrative_area` VALUES ('98', '451027', '凌云县');
INSERT INTO `fds_administrative_area` VALUES ('99', '451028', '乐业县');
INSERT INTO `fds_administrative_area` VALUES ('100', '451029', '田林县');
INSERT INTO `fds_administrative_area` VALUES ('101', '451030', '西林县');
INSERT INTO `fds_administrative_area` VALUES ('102', '451031', '隆林各族自治县');
INSERT INTO `fds_administrative_area` VALUES ('103', '451081', '靖西市');
INSERT INTO `fds_administrative_area` VALUES ('104', '451100', '贺州市');
INSERT INTO `fds_administrative_area` VALUES ('105', '451101', '市辖区');
INSERT INTO `fds_administrative_area` VALUES ('106', '451102', '八步区');
INSERT INTO `fds_administrative_area` VALUES ('107', '451119', '平桂管理区');
INSERT INTO `fds_administrative_area` VALUES ('108', '451121', '昭平县');
INSERT INTO `fds_administrative_area` VALUES ('109', '451122', '钟山县');
INSERT INTO `fds_administrative_area` VALUES ('110', '451123', '富川瑶族自治县');
INSERT INTO `fds_administrative_area` VALUES ('111', '451200', '河池市');
INSERT INTO `fds_administrative_area` VALUES ('112', '451201', '市辖区');
INSERT INTO `fds_administrative_area` VALUES ('113', '451202', '金城江区');
INSERT INTO `fds_administrative_area` VALUES ('114', '451221', '南丹县');
INSERT INTO `fds_administrative_area` VALUES ('115', '451222', '天峨县');
INSERT INTO `fds_administrative_area` VALUES ('116', '451223', '凤山县');
INSERT INTO `fds_administrative_area` VALUES ('117', '451224', '东兰县');
INSERT INTO `fds_administrative_area` VALUES ('118', '451225', '罗城仫佬族自治县');
INSERT INTO `fds_administrative_area` VALUES ('119', '451226', '环江毛南族自治县');
INSERT INTO `fds_administrative_area` VALUES ('120', '451227', '巴马瑶族自治县');
INSERT INTO `fds_administrative_area` VALUES ('121', '451228', '都安瑶族自治县');
INSERT INTO `fds_administrative_area` VALUES ('122', '451229', '大化瑶族自治县');
INSERT INTO `fds_administrative_area` VALUES ('123', '451281', '宜州市');
INSERT INTO `fds_administrative_area` VALUES ('124', '451300', '来宾市');
INSERT INTO `fds_administrative_area` VALUES ('125', '451301', '市辖区');
INSERT INTO `fds_administrative_area` VALUES ('126', '451302', '兴宾区');
INSERT INTO `fds_administrative_area` VALUES ('127', '451321', '忻城县');
INSERT INTO `fds_administrative_area` VALUES ('128', '451322', '象州县');
INSERT INTO `fds_administrative_area` VALUES ('129', '451323', '武宣县');
INSERT INTO `fds_administrative_area` VALUES ('130', '451324', '金秀瑶族自治县');
INSERT INTO `fds_administrative_area` VALUES ('131', '451381', '合山市');
INSERT INTO `fds_administrative_area` VALUES ('132', '451400', '崇左市');
INSERT INTO `fds_administrative_area` VALUES ('133', '451401', '市辖区');
INSERT INTO `fds_administrative_area` VALUES ('134', '451402', '江州区');
INSERT INTO `fds_administrative_area` VALUES ('135', '451421', '扶绥县');
INSERT INTO `fds_administrative_area` VALUES ('136', '451422', '宁明县');
INSERT INTO `fds_administrative_area` VALUES ('137', '451423', '龙州县');
INSERT INTO `fds_administrative_area` VALUES ('138', '451424', '大新县');
INSERT INTO `fds_administrative_area` VALUES ('139', '451425', '天等县');
INSERT INTO `fds_administrative_area` VALUES ('140', '451481', '凭祥市');

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
) ENGINE=MyISAM AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;

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
INSERT INTO `fds_app_user` VALUES ('100', '餐饮21', '中华路122', '83d7a2e752c6ccf23240d6831eb4b252', '', '0', null, '0', null, '4234154', '', '1480734571', '0', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('101', '餐饮22', '中华路123', '83d7a2e752c6ccf23240d6831eb4b252', '', '0', null, '0', null, '4234155', '', '1480734571', '0', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('102', '餐饮23', '中华路124', '83d7a2e752c6ccf23240d6831eb4b252', '', '0', null, '0', null, '4234156', '', '1480734571', '0', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('103', '餐饮24', '中华路125', '83d7a2e752c6ccf23240d6831eb4b252', '', '0', null, '0', null, '4234157', '', '1480734571', '0', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('104', '餐饮25', '中华路126', '83d7a2e752c6ccf23240d6831eb4b252', '', '0', null, '0', null, '4234158', '', '1480734571', '0', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('105', '餐饮26', '中华路127', '83d7a2e752c6ccf23240d6831eb4b252', '', '0', null, '0', null, '4234159', '', '1480734571', '0', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('106', '餐饮27', '中华路128', '83d7a2e752c6ccf23240d6831eb4b252', '', '0', null, '0', null, '4234160', '', '1480734571', '1480757053', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('108', 'c001', '郭敬明', '7c03aeb8031097d35caf3416a1826139', '', '0', null, '0', null, 'guoingming@123.com', '', '1480754438', '1481247067', '0', '0', '');

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

-- ----------------------------
-- Records of fds_check_record
-- ----------------------------

-- ----------------------------
-- Table structure for fds_task
-- ----------------------------
DROP TABLE IF EXISTS `fds_task`;
CREATE TABLE `fds_task` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `start_time` int(11) DEFAULT NULL,
  `end_time` int(11) DEFAULT NULL,
  `describle` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fds_task
-- ----------------------------
INSERT INTO `fds_task` VALUES ('1', '医药检查1', '1451577600', '1480521600', '大学东路医药监督检查');
INSERT INTO `fds_task` VALUES ('2', '基地的反抗', '1477929600', '1480435200', '无法方法方法方法方法方法方法');
INSERT INTO `fds_task` VALUES ('14', 'rrrr', '1480348800', '1480348800', 'sdfadfsa');
INSERT INTO `fds_task` VALUES ('15', 'aaaa', '1481817600', '1482336000', 'asfdasf');
INSERT INTO `fds_task` VALUES ('16', 'aaaa', '1481817600', '1482336000', 'asfdasf');
INSERT INTO `fds_task` VALUES ('17', 'aaa', '1480694400', '1483027200', 'fsdafsaf');
INSERT INTO `fds_task` VALUES ('18', '测试2', '1480694400', '1482422400', '检查秀灵路食品安全');
INSERT INTO `fds_task` VALUES ('20', '测试1', '1451577600', '1462032000', '检查大学路的药品经营店铺\r\n\r\n\r\n\r\n\r\n\r\n\r\n');

-- ----------------------------
-- Table structure for fds_task_unit_link
-- ----------------------------
DROP TABLE IF EXISTS `fds_task_unit_link`;
CREATE TABLE `fds_task_unit_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fds_task_unit_link
-- ----------------------------
INSERT INTO `fds_task_unit_link` VALUES ('1', '15', '41');
INSERT INTO `fds_task_unit_link` VALUES ('2', '16', '41');
INSERT INTO `fds_task_unit_link` VALUES ('3', '17', '40');
INSERT INTO `fds_task_unit_link` VALUES ('4', '18', '42');
INSERT INTO `fds_task_unit_link` VALUES ('5', '18', '41');
INSERT INTO `fds_task_unit_link` VALUES ('6', '18', '40');
INSERT INTO `fds_task_unit_link` VALUES ('7', '18', '39');
INSERT INTO `fds_task_unit_link` VALUES ('8', '18', '38');
INSERT INTO `fds_task_unit_link` VALUES ('9', '18', '37');
INSERT INTO `fds_task_unit_link` VALUES ('10', '18', '36');
INSERT INTO `fds_task_unit_link` VALUES ('11', '18', '35');
INSERT INTO `fds_task_unit_link` VALUES ('12', '18', '34');
INSERT INTO `fds_task_unit_link` VALUES ('13', '18', '33');
INSERT INTO `fds_task_unit_link` VALUES ('18', '19', '0');
INSERT INTO `fds_task_unit_link` VALUES ('82', '20', '44');
INSERT INTO `fds_task_unit_link` VALUES ('83', '20', '41');
INSERT INTO `fds_task_unit_link` VALUES ('84', '20', '40');
INSERT INTO `fds_task_unit_link` VALUES ('85', '20', '39');
INSERT INTO `fds_task_unit_link` VALUES ('86', '20', '38');
INSERT INTO `fds_task_unit_link` VALUES ('87', '20', '37');
INSERT INTO `fds_task_unit_link` VALUES ('88', '20', '36');
INSERT INTO `fds_task_unit_link` VALUES ('89', '20', '35');
INSERT INTO `fds_task_unit_link` VALUES ('90', '20', '34');
INSERT INTO `fds_task_unit_link` VALUES ('91', '20', '33');

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

-- ----------------------------
-- Records of fds_task_user_link
-- ----------------------------
INSERT INTO `fds_task_user_link` VALUES ('8', '2', '50', '0', null);
INSERT INTO `fds_task_user_link` VALUES ('9', '1', '1', '0', null);
INSERT INTO `fds_task_user_link` VALUES ('10', '4', '4', '0', null);
INSERT INTO `fds_task_user_link` VALUES ('11', '5', '2', '0', null);
INSERT INTO `fds_task_user_link` VALUES ('12', '14', '2', '0', null);
INSERT INTO `fds_task_user_link` VALUES ('13', '15', '105', '0', null);
INSERT INTO `fds_task_user_link` VALUES ('14', '16', '105', '0', null);
INSERT INTO `fds_task_user_link` VALUES ('15', '17', '104', '0', null);
INSERT INTO `fds_task_user_link` VALUES ('16', '18', '108', '0', null);
INSERT INTO `fds_task_user_link` VALUES ('17', '19', '104', '0', null);
INSERT INTO `fds_task_user_link` VALUES ('18', '20', '108', '0', null);

-- ----------------------------
-- Table structure for fds_unit
-- ----------------------------
DROP TABLE IF EXISTS `fds_unit`;
CREATE TABLE `fds_unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `x_coord` float(11,7) DEFAULT '0.0000000',
  `y_coord` float(11,7) DEFAULT '0.0000000',
  `type` smallint(5) DEFAULT NULL,
  `info` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fds_unit
-- ----------------------------
INSERT INTO `fds_unit` VALUES ('1', '南宁市第一人民医院', '南环路120号', '108.3313522', '22.8165283', '6', '广告广告广告广告广告广告广告广告广告广告广告广告广告广告广告广告广告广告广告广告广告');
INSERT INTO `fds_unit` VALUES ('2', '鲜果蔬', '大学东路78号', '108.2966156', '22.8443089', '7', '诗歌时尚生活事实上是事实上是');
INSERT INTO `fds_unit` VALUES ('3', '西大校医院', '广西大学东校区', '108.2950363', '22.8444252', '6', '框框框框框框框框框框框框框框框框框框框框框框框框框框框框框框框框');
INSERT INTO `fds_unit` VALUES ('6', '广西大学——办公南楼', '崇文路', '108.2963638', '22.8443260', '1', '恶劣浏览量浏览量浏览量浏览量了');
INSERT INTO `fds_unit` VALUES ('7', '南宁市国际会展中心', '民族大道888号', '108.3876724', '22.8174229', '1', '可卡尔冉冉冉冉冉冉冉冉冉冉冉冉冉冉冉冉');
INSERT INTO `fds_unit` VALUES ('9', '西大体育场', '通和路', '108.2957611', '22.8462772', '1', '');
INSERT INTO `fds_unit` VALUES ('10', '环球网吧', '茶南路122号', '110.8365555', '24.8372269', '1', '');
INSERT INTO `fds_unit` VALUES ('11', '中国邮政', '茶南路130号', '110.8357315', '24.8365555', '1', '');
INSERT INTO `fds_unit` VALUES ('12', '恭城烈士纪念馆', '茶南路35号', '110.8343048', '24.8385181', '2', '');
INSERT INTO `fds_unit` VALUES ('13', '小太阳幼儿园', '茶东路231号', '110.8592300', '24.8389492', '3', '');
INSERT INTO `fds_unit` VALUES ('14', 'a', 'a', '108.2978668', '22.8443260', '1', '');
INSERT INTO `fds_unit` VALUES ('15', '餐饮1', '中华路102', null, null, '7', '4234134');
INSERT INTO `fds_unit` VALUES ('16', '餐饮2', '中华路103', null, null, '7', '4234135');
INSERT INTO `fds_unit` VALUES ('17', '餐饮3', '中华路104', null, null, '7', '4234136');
INSERT INTO `fds_unit` VALUES ('18', '餐饮4', '中华路105', null, null, '7', '4234137');
INSERT INTO `fds_unit` VALUES ('19', '餐饮5', '中华路106', null, null, '7', '4234138');
INSERT INTO `fds_unit` VALUES ('20', '餐饮6', '中华路107', null, null, '7', '4234139');
INSERT INTO `fds_unit` VALUES ('21', '餐饮7', '中华路108', null, null, '7', '4234140');
INSERT INTO `fds_unit` VALUES ('22', '餐饮8', '中华路109', null, null, '7', '4234141');
INSERT INTO `fds_unit` VALUES ('23', '餐饮9', '中华路110', null, null, '7', '4234142');
INSERT INTO `fds_unit` VALUES ('24', '餐饮10', '中华路111', null, null, '7', '4234143');
INSERT INTO `fds_unit` VALUES ('25', '餐饮11', '中华路112', null, null, '7', '4234144');
INSERT INTO `fds_unit` VALUES ('26', '餐饮12', '中华路113', null, null, '7', '4234145');
INSERT INTO `fds_unit` VALUES ('27', '餐饮13', '中华路114', null, null, '7', '4234146');
INSERT INTO `fds_unit` VALUES ('28', '餐饮14', '中华路115', null, null, '7', '4234147');
INSERT INTO `fds_unit` VALUES ('29', '餐饮15', '中华路116', null, null, '7', '4234148');
INSERT INTO `fds_unit` VALUES ('30', '餐饮16', '中华路117', null, null, '7', '4234149');
INSERT INTO `fds_unit` VALUES ('31', '餐饮17', '中华路118', null, null, '7', '4234150');
INSERT INTO `fds_unit` VALUES ('32', '餐饮18', '中华路119', null, null, '7', '4234151');
INSERT INTO `fds_unit` VALUES ('33', '餐饮19', '中华路120', null, null, '7', '4234152');
INSERT INTO `fds_unit` VALUES ('34', '餐饮20', '中华路121', null, null, '7', '4234153');
INSERT INTO `fds_unit` VALUES ('35', '餐饮21', '中华路122', null, null, '7', '4234154');
INSERT INTO `fds_unit` VALUES ('36', '餐饮22', '中华路123', null, null, '7', '4234155');
INSERT INTO `fds_unit` VALUES ('37', '餐饮23', '中华路124', null, null, '7', '4234156');
INSERT INTO `fds_unit` VALUES ('38', '餐饮24', '中华路125', null, null, '7', '4234157');
INSERT INTO `fds_unit` VALUES ('39', '餐饮25', '中华路126', null, null, '7', '4234158');
INSERT INTO `fds_unit` VALUES ('40', '绿雕', '中华路127', '111.0026398', '25.2111988', '7', '4234159');
INSERT INTO `fds_unit` VALUES ('41', '环岛集团', '中华路128', '110.8829575', '24.8317261', '5', '4234160');
INSERT INTO `fds_unit` VALUES ('44', '金乌楼', '军的ulu大将军府i', '108.2993393', '22.8441086', '1', '气温为文物文物文物文物文物文物');
INSERT INTO `fds_unit` VALUES ('45', '大礼堂', '所思所', '108.2950211', '22.8444347', '8', '');
INSERT INTO `fds_unit` VALUES ('46', '财务处', '具有广泛', '108.2951431', '22.8449802', '8', '');
INSERT INTO `fds_unit` VALUES ('47', '新闻楼', '四方的', '108.2978516', '22.8444214', '8', '');
INSERT INTO `fds_unit` VALUES ('48', '1教', '散大夫', '108.2977829', '22.8429356', '8', '');
INSERT INTO `fds_unit` VALUES ('49', '2教', '当地的', '108.2977829', '22.8434811', '8', '');
INSERT INTO `fds_unit` VALUES ('50', '计电学院', '地方', '108.2964859', '22.8432846', '8', '');
INSERT INTO `fds_unit` VALUES ('51', '4教', '馆刚果', '108.2963791', '22.8428116', '8', '');
INSERT INTO `fds_unit` VALUES ('52', '西苑餐厅', '对方的', '108.2976990', '22.8450089', '8', '');
INSERT INTO `fds_unit` VALUES ('53', '易乐多', '监听员', '108.2971268', '22.8458328', '8', '');

-- ----------------------------
-- Table structure for fds_unit_type
-- ----------------------------
DROP TABLE IF EXISTS `fds_unit_type`;
CREATE TABLE `fds_unit_type` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fds_unit_type
-- ----------------------------
INSERT INTO `fds_unit_type` VALUES ('1', '药品生产');
INSERT INTO `fds_unit_type` VALUES ('2', '药品批发');
INSERT INTO `fds_unit_type` VALUES ('3', '药品零售');
INSERT INTO `fds_unit_type` VALUES ('4', '器械生产');
INSERT INTO `fds_unit_type` VALUES ('5', '器械经营');
INSERT INTO `fds_unit_type` VALUES ('6', '医疗机构');
INSERT INTO `fds_unit_type` VALUES ('7', '餐饮服务');
INSERT INTO `fds_unit_type` VALUES ('8', '教育机构');
