/*
Navicat MySQL Data Transfer

Source Server         : ALY_远程
Source Server Version : 50505
Source Host           : 120.25.168.113:3306
Source Database       : fdss

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2016-11-30 17:57:45
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
INSERT INTO `fds_admin` VALUES ('1', 'admin', '超级管理员', '21232f297a57a5a743894a0e4a801fc3', '', '1479994961', '0.0.0.0', '951', '8888', 'liu21st@gmail.com', '备注信息', '1222907803', '1239977420', '1', '0', '');

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
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fds_app_user
-- ----------------------------
INSERT INTO `fds_app_user` VALUES ('1', 'd001', '冬季', '6537e99af2c2223642df9f70a0b5afca', '', '0', null, '0', null, 'dongji@drug.com', '', '1479833376', '1479994765', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('2', 'd002', '李时珍', '202cb962ac59075b964b07152d234b70', '', '0', '', '0', '', 'lishizhen@drug.com', '', '1479995265', '1479995444', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('3', 'd003', '齐白石', '202cb962ac59075b964b07152d234b70', '', '0', null, '0', null, 'qibaishi@drug.com', '', '1479995123', '0', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('4', 'd004', '扁鹊', '202cb962ac59075b964b07152d234b70', '', '0', null, '0', null, 'bianque@drug.com', '', '1479995265', '1479995652', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('48', 'd005', '张仲景', '202cb962ac59075b964b07152d234b70', '', '0', null, '0', null, 'zhangzhongjin@drug.com', '', '1480002202', '1480003732', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('49', 'f001', '欧文', '202cb962ac59075b964b07152d234b70', '', '0', null, '0', null, 'ouwen@food.com', '', '1480002335', '1480036127', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('50', 'f002', '蒙田', '202cb962ac59075b964b07152d234b70', '', '0', null, '0', null, 'mengtian@food.com', '', '1480002516', '1480036144', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('52', 'f003', '巴尔扎克', '202cb962ac59075b964b07152d234b70', '', '0', null, '0', null, 'baerzhake@food.com', '', '1480005552', '1480036194', '0', '0', '');
INSERT INTO `fds_app_user` VALUES ('53', 'f004', '歌德', '202cb962ac59075b964b07152d234b70', '', '0', null, '0', null, 'gede@food.com', '', '1480036230', '0', '0', '0', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fds_task
-- ----------------------------
INSERT INTO `fds_task` VALUES ('1', '大学路医药安全检查', '1477929600', '1483113600', '真理惟一可靠的标准就是永远自相符合。 ');
INSERT INTO `fds_task` VALUES ('2', '团结地', '1478534400', '1479830400', '我需要三件东西：爱情友谊和图书。然而这三者之间何其相通！炽热的爱情可以充实图书的内容，图书又是人们最忠实的朋友');
INSERT INTO `fds_task` VALUES ('4', 'c', '1480003200', '1480003200', '哈哈哈哈哈哈哈哈哈哈哈哈哈');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fds_task_user_link
-- ----------------------------
INSERT INTO `fds_task_user_link` VALUES ('1', '2', '1', null, null);
INSERT INTO `fds_task_user_link` VALUES ('2', '2', '2', null, null);
INSERT INTO `fds_task_user_link` VALUES ('3', '4', '52', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fds_unit
-- ----------------------------
INSERT INTO `fds_unit` VALUES ('1', '秀灵农贸市场', '西乡塘区秀灵路001号', null, null, '1', '俯首向下看，整个世界丰富多彩，周围充满温暖的阳光，又不失清风相伴，轻踏着时光细嗅着空气里的淡淡花香，静静聆听着世间的善恶美，默默感受每一次邂逅的怦然心动，来去随风，简简单单，无声无息。');
INSERT INTO `fds_unit` VALUES ('2', '南宁百货', '大学东路20号', null, null, '1', '我坐在时光的长廊上，看那沐浴着光辉的流云如浮水一般静静地倚在天际一隅，映出淡淡的蓝；看那季节的风，吹过沧然世事后留下淡淡的痕；看那川流不息的人群，纷纷驻足荣华却最终一梦。');
INSERT INTO `fds_unit` VALUES ('3', '易乐多', '溶江路222号', null, null, '1', '漂泊在匿名的河流上，看过落花流水的姿态，路过千万重山川。当老去的那日，不问因果循环，不说离合悲欢，独握那存于心田一隅渺小的感动，独念早已与自己分道扬镳的天涯人，从此负手，无关云和月，不问风和雨，那这般心态，便真的简单了。');
INSERT INTO `fds_unit` VALUES ('6', '沃尔玛', '朝阳路332号', null, null, '1', '如流往事，总会在不觉然时袭上心头，然后漫卷整个心扉，将难得浅浅遗忘的心事再次勾出，而后深深的怀念，直到彼岸的花开到荼蘼，染了一片又一片不再的浮华。于是，慢慢懂得，一份如歌的回忆，在经年的安静无声的古巷里，有过离合聚散，忘却过忧愁，欢乐时像莲花的香，甜而不腻，忧愁时像一个梦境，幻而不真。');
INSERT INTO `fds_unit` VALUES ('7', '南宁市第六人民医院', '秀灵路342号', null, null, '2', '吹过沧然世事后留下淡淡的痕；看那川流不息的人群，纷纷驻足荣华却最终一梦。');
INSERT INTO `fds_unit` VALUES ('8', '广西中医药', '明秀路748号', null, null, '2', '看那川流不息的人群，纷纷驻足荣华却最终一梦');

-- ----------------------------
-- Table structure for fds_unit_type
-- ----------------------------
DROP TABLE IF EXISTS `fds_unit_type`;
CREATE TABLE `fds_unit_type` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fds_unit_type
-- ----------------------------
INSERT INTO `fds_unit_type` VALUES ('1', '食品');
INSERT INTO `fds_unit_type` VALUES ('2', '药品');
