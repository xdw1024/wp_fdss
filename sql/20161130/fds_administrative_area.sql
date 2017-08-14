/*
Navicat MySQL Data Transfer

Source Server         : centOS7
Source Server Version : 50505
Source Host           : 172.16.77.1:3306
Source Database       : fdss

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2016-11-30 17:53:49
*/

SET FOREIGN_KEY_CHECKS=0;

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
