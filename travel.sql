/*
Navicat MySQL Data Transfer

Source Server         : stark81
Source Server Version : 80013
Source Host           : localhost:3306
Source Database       : travel

Target Server Type    : MYSQL
Target Server Version : 80013
File Encoding         : 65001

Date: 2019-01-11 19:35:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `adminlist`
-- ----------------------------
DROP TABLE IF EXISTS `adminlist`;
CREATE TABLE `adminlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(100) DEFAULT NULL,
  `upwd` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uname` (`uname`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of adminlist
-- ----------------------------
INSERT INTO `adminlist` VALUES ('1', 'admin', 'pbkdf2:sha256:50000$37Ll6qd7$2d8c9b882d84692bbd0d14374d3d2856e724ec48b3f94e07af7b332feab0aeaa');

-- ----------------------------
-- Table structure for `adminlog`
-- ----------------------------
DROP TABLE IF EXISTS `adminlog`;
CREATE TABLE `adminlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`),
  KEY `ix_adminlog_addtime` (`addtime`),
  CONSTRAINT `adminlog_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `adminlist` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of adminlog
-- ----------------------------
INSERT INTO `adminlog` VALUES ('1', '1', '127.0.0.1', '2018-12-31 13:37:12');
INSERT INTO `adminlog` VALUES ('2', '1', '127.0.0.1', '2018-12-31 13:46:45');
INSERT INTO `adminlog` VALUES ('3', '1', '127.0.0.1', '2018-12-31 13:54:31');
INSERT INTO `adminlog` VALUES ('4', '1', '127.0.0.1', '2018-12-31 16:41:53');
INSERT INTO `adminlog` VALUES ('5', '1', '127.0.0.1', '2018-12-31 17:01:04');
INSERT INTO `adminlog` VALUES ('6', '1', '127.0.0.1', '2018-12-31 17:24:54');
INSERT INTO `adminlog` VALUES ('7', '1', '127.0.0.1', '2019-01-02 08:56:24');
INSERT INTO `adminlog` VALUES ('8', '1', '127.0.0.1', '2019-01-02 13:22:35');
INSERT INTO `adminlog` VALUES ('9', '1', '127.0.0.1', '2019-01-02 13:24:05');
INSERT INTO `adminlog` VALUES ('10', '1', '127.0.0.1', '2019-01-02 13:27:31');
INSERT INTO `adminlog` VALUES ('11', '1', '127.0.0.1', '2019-01-02 13:28:31');
INSERT INTO `adminlog` VALUES ('12', '1', '127.0.0.1', '2019-01-02 14:01:21');
INSERT INTO `adminlog` VALUES ('13', '1', '127.0.0.1', '2019-01-02 14:11:47');
INSERT INTO `adminlog` VALUES ('14', '1', '127.0.0.1', '2019-01-02 14:15:43');
INSERT INTO `adminlog` VALUES ('15', '1', '127.0.0.1', '2019-01-02 14:16:28');
INSERT INTO `adminlog` VALUES ('16', '1', '127.0.0.1', '2019-01-02 14:17:08');
INSERT INTO `adminlog` VALUES ('17', '1', '127.0.0.1', '2019-01-02 14:17:51');
INSERT INTO `adminlog` VALUES ('18', '1', '127.0.0.1', '2019-01-02 14:18:48');
INSERT INTO `adminlog` VALUES ('19', '1', '127.0.0.1', '2019-01-02 14:20:13');
INSERT INTO `adminlog` VALUES ('20', '1', '127.0.0.1', '2019-01-02 14:28:45');
INSERT INTO `adminlog` VALUES ('21', '1', '127.0.0.1', '2019-01-02 14:29:48');
INSERT INTO `adminlog` VALUES ('22', '1', '127.0.0.1', '2019-01-02 14:38:03');
INSERT INTO `adminlog` VALUES ('23', '1', '127.0.0.1', '2019-01-02 14:39:25');
INSERT INTO `adminlog` VALUES ('24', '1', '127.0.0.1', '2019-01-02 14:40:23');
INSERT INTO `adminlog` VALUES ('25', '1', '127.0.0.1', '2019-01-02 14:42:14');
INSERT INTO `adminlog` VALUES ('26', '1', '127.0.0.1', '2019-01-02 14:46:33');
INSERT INTO `adminlog` VALUES ('27', '1', '127.0.0.1', '2019-01-02 14:47:19');
INSERT INTO `adminlog` VALUES ('28', '1', '127.0.0.1', '2019-01-02 14:49:29');
INSERT INTO `adminlog` VALUES ('29', '1', '127.0.0.1', '2019-01-02 14:50:28');
INSERT INTO `adminlog` VALUES ('30', '1', '127.0.0.1', '2019-01-02 14:50:59');
INSERT INTO `adminlog` VALUES ('31', '1', '127.0.0.1', '2019-01-02 14:53:49');
INSERT INTO `adminlog` VALUES ('32', '1', '127.0.0.1', '2019-01-02 14:55:10');
INSERT INTO `adminlog` VALUES ('33', '1', '127.0.0.1', '2019-01-02 14:56:28');
INSERT INTO `adminlog` VALUES ('34', '1', '127.0.0.1', '2019-01-02 14:58:48');
INSERT INTO `adminlog` VALUES ('35', '1', '127.0.0.1', '2019-01-02 15:01:08');
INSERT INTO `adminlog` VALUES ('36', '1', '127.0.0.1', '2019-01-02 15:03:15');
INSERT INTO `adminlog` VALUES ('37', '1', '127.0.0.1', '2019-01-02 15:04:05');
INSERT INTO `adminlog` VALUES ('38', '1', '127.0.0.1', '2019-01-02 15:07:07');
INSERT INTO `adminlog` VALUES ('39', '1', '127.0.0.1', '2019-01-02 15:08:12');
INSERT INTO `adminlog` VALUES ('40', '1', '127.0.0.1', '2019-01-02 15:10:18');
INSERT INTO `adminlog` VALUES ('41', '1', '127.0.0.1', '2019-01-03 08:49:22');
INSERT INTO `adminlog` VALUES ('42', '1', '127.0.0.1', '2019-01-03 10:39:26');
INSERT INTO `adminlog` VALUES ('43', '1', '127.0.0.1', '2019-01-03 19:33:05');
INSERT INTO `adminlog` VALUES ('44', '1', '127.0.0.1', '2019-01-04 08:57:33');
INSERT INTO `adminlog` VALUES ('45', '1', '127.0.0.1', '2019-01-04 10:28:54');
INSERT INTO `adminlog` VALUES ('46', '1', '127.0.0.1', '2019-01-04 12:43:04');
INSERT INTO `adminlog` VALUES ('47', '1', '127.0.0.1', '2019-01-04 14:38:35');
INSERT INTO `adminlog` VALUES ('48', '1', '127.0.0.1', '2019-01-04 17:06:53');
INSERT INTO `adminlog` VALUES ('49', '1', '127.0.0.1', '2019-01-05 09:59:18');
INSERT INTO `adminlog` VALUES ('50', '1', '127.0.0.1', '2019-01-06 13:38:08');
INSERT INTO `adminlog` VALUES ('51', '1', '127.0.0.1', '2019-01-07 08:55:23');
INSERT INTO `adminlog` VALUES ('52', '1', '127.0.0.1', '2019-01-07 19:00:25');
INSERT INTO `adminlog` VALUES ('53', '1', '127.0.0.1', '2019-01-07 20:19:19');
INSERT INTO `adminlog` VALUES ('54', '1', '127.0.0.1', '2019-01-08 18:05:20');
INSERT INTO `adminlog` VALUES ('55', '1', '127.0.0.1', '2019-01-09 09:49:54');
INSERT INTO `adminlog` VALUES ('56', '1', '127.0.0.1', '2019-01-09 19:59:24');
INSERT INTO `adminlog` VALUES ('57', '1', '127.0.0.1', '2019-01-09 20:25:33');
INSERT INTO `adminlog` VALUES ('58', '1', '127.0.0.1', '2019-01-10 11:24:59');
INSERT INTO `adminlog` VALUES ('59', '1', '127.0.0.1', '2019-01-11 09:16:15');
INSERT INTO `adminlog` VALUES ('60', '1', '127.0.0.1', '2019-01-11 18:34:10');

-- ----------------------------
-- Table structure for `alembic_version`
-- ----------------------------
DROP TABLE IF EXISTS `alembic_version`;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL,
  PRIMARY KEY (`version_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of alembic_version
-- ----------------------------
INSERT INTO `alembic_version` VALUES ('e970715e7989');

-- ----------------------------
-- Table structure for `area`
-- ----------------------------
DROP TABLE IF EXISTS `area`;
CREATE TABLE `area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `areaName` varchar(100) DEFAULT NULL,
  `is_recommend` tinyint(1) DEFAULT NULL,
  `introduce` text,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_area_addtime` (`addtime`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of area
-- ----------------------------
INSERT INTO `area` VALUES ('1', '广东省', '1', '这里是为了操作日志的广东省的修改后的简介', '2018-12-31 13:28:26');
INSERT INTO `area` VALUES ('2', '北京市', '0', '这里是北京市的简介', '2018-12-31 13:48:36');
INSERT INTO `area` VALUES ('3', '广西壮族自治区', '1', '这里是广西的简介', '2018-12-31 13:55:29');
INSERT INTO `area` VALUES ('4', '云南省', '1', '这里是云南省的最新简介', '2019-01-02 13:21:25');
INSERT INTO `area` VALUES ('5', '新疆维吾尔自治区', '0', '新疆维吾尔自治区，简称“新”，首府乌鲁木齐市，位于中国西北边陲，是中国五个少数民族自治区之一。面积163.1585万平方公里,是中国陆地面积最大的省级行政区，占中国国土总面积六分之一。常住人口2444.67万人（2017年末）。\r\n新疆地处亚欧大陆腹地，陆地边境线5600多公里，周边与俄罗斯、哈萨克斯坦、吉尔吉斯斯坦、塔吉克斯坦、巴基斯坦、蒙古、印度、阿富汗斯坦八国接壤，在历史上是古丝绸之路的重要通道，现在是第二座“亚欧大陆桥”的必经之地，战略位置十分重要。新疆现有47个民族成分，主要居住有汉、维吾尔、哈萨克、回、蒙古、柯尔克孜、锡伯、塔吉克、乌孜别克、满、达斡尔、塔塔尔、俄罗斯等民族，是中国五个少数民族自治区之一。', '2019-01-05 13:12:10');
INSERT INTO `area` VALUES ('6', '四川省', '0', '四川，简称“川”或“蜀”，是中华人民共和国省级行政区，省会成都。四川旅游资源丰富,拥有世界文化遗产1项，世界自然遗产3项，世界文化与自然双重遗产1项，世界灌溉工程遗产1项；国家5A级旅游景区12处，4A级景区185处；中国最佳旅游城市1座，中国优秀旅游城市21座，中国历史文化名城8座，全国重点文物保护单位230处。四川将实施“绿色四川”旅游行动计划，建设世界重要旅游目的地。', '2019-01-06 13:40:02');
INSERT INTO `area` VALUES ('7', '浙江省', '0', '浙江是典型的山水江南、鱼米之乡，被称为“丝绸之府”、“鱼米之乡”。早在5万年前的旧石器时代，就有原始人类“建德人”活动，境内有距今7000年的河姆渡文化、距今6000年的马家浜文化和距今5000年的良渚文化等文化遗存。浙江是吴越文化、江南文化的发源地，中国古代文明的发祥地之一,拥有众多良好的旅游资源。', '2019-01-09 11:11:46');

-- ----------------------------
-- Table structure for `operlog`
-- ----------------------------
DROP TABLE IF EXISTS `operlog`;
CREATE TABLE `operlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `reason` varchar(600) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`),
  KEY `ix_operlog_addtime` (`addtime`),
  CONSTRAINT `operlog_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `adminlist` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of operlog
-- ----------------------------
INSERT INTO `operlog` VALUES ('1', '1', '127.0.0.1', '添加地区广东省', '2018-12-31 13:28:26');
INSERT INTO `operlog` VALUES ('2', '1', '127.0.0.1', '修改地区广东省', '2018-12-31 13:42:58');
INSERT INTO `operlog` VALUES ('3', '1', '127.0.0.1', '修改地区广东省', '2018-12-31 13:47:11');
INSERT INTO `operlog` VALUES ('4', '1', '127.0.0.1', '添加地区北京市', '2018-12-31 13:48:36');
INSERT INTO `operlog` VALUES ('5', '1', '127.0.0.1', '添加地区广西壮族自治区', '2018-12-31 13:55:29');
INSERT INTO `operlog` VALUES ('6', '1', '127.0.0.1', '修改地区北京市', '2018-12-31 13:56:20');
INSERT INTO `operlog` VALUES ('7', '1', '127.0.0.1', '添加景区故宫', '2019-01-02 09:21:33');
INSERT INTO `operlog` VALUES ('8', '1', '127.0.0.1', '添加地区云南省', '2019-01-02 13:21:25');
INSERT INTO `operlog` VALUES ('13', '1', '127.0.0.1', '添加景区漓江风景区', '2019-01-02 17:27:12');
INSERT INTO `operlog` VALUES ('14', '1', '127.0.0.1', '修改地区云南省', '2019-01-02 19:16:17');
INSERT INTO `operlog` VALUES ('15', '1', '127.0.0.1', '修改地区云南省', '2019-01-02 19:44:21');
INSERT INTO `operlog` VALUES ('16', '1', '127.0.0.1', '修改景区漓江风景区', '2019-01-02 20:06:26');
INSERT INTO `operlog` VALUES ('17', '1', '127.0.0.1', '修改景区漓江风景区', '2019-01-02 20:06:41');
INSERT INTO `operlog` VALUES ('18', '1', '127.0.0.1', '修改景区故宫为故宫', '2019-01-02 20:12:55');
INSERT INTO `operlog` VALUES ('19', '1', '127.0.0.1', '修改景区\"漓江风景区\"为\"漓江风景区\"', '2019-01-02 20:14:20');
INSERT INTO `operlog` VALUES ('20', '1', '127.0.0.1', '修改景区\"漓江风景区\"为\"龙胜梯田\"', '2019-01-02 20:15:24');
INSERT INTO `operlog` VALUES ('21', '1', '127.0.0.1', '修改地区\"云南省\"为\"云南省\"', '2019-01-02 20:19:06');
INSERT INTO `operlog` VALUES ('22', '1', '127.0.0.1', '修改景区\"龙胜梯田\"为\"龙胜梯田\"', '2019-01-02 20:24:28');
INSERT INTO `operlog` VALUES ('23', '1', '127.0.0.1', '添加游记\"故宫一日游\"', '2019-01-03 15:36:55');
INSERT INTO `operlog` VALUES ('24', '1', '127.0.0.1', '删除游记故宫一日游', '2019-01-03 19:33:12');
INSERT INTO `operlog` VALUES ('25', '1', '127.0.0.1', '恢复游记故宫一日游', '2019-01-03 19:33:15');
INSERT INTO `operlog` VALUES ('26', '1', '127.0.0.1', '添加游记\"游龙胜梯田有感\"', '2019-01-03 19:59:40');
INSERT INTO `operlog` VALUES ('27', '1', '127.0.0.1', '修改游记\"游龙胜梯田有感\"', '2019-01-03 20:21:27');
INSERT INTO `operlog` VALUES ('28', '1', '127.0.0.1', '修改游记\"游龙胜梯田有感\"', '2019-01-03 20:22:14');
INSERT INTO `operlog` VALUES ('29', '1', '127.0.0.1', '删除游记\"游龙胜梯田有感\"', '2019-01-04 08:57:47');
INSERT INTO `operlog` VALUES ('30', '1', '127.0.0.1', '恢复游记\"游龙胜梯田有感\"', '2019-01-04 08:57:57');
INSERT INTO `operlog` VALUES ('31', '1', '127.0.0.1', '删除游记\"故宫一日游\"', '2019-01-04 10:53:18');
INSERT INTO `operlog` VALUES ('32', '1', '127.0.0.1', '删除游记\"故宫一日游\"', '2019-01-04 10:57:23');
INSERT INTO `operlog` VALUES ('33', '1', '127.0.0.1', '删除游记\"故宫一日游\"', '2019-01-04 10:57:28');
INSERT INTO `operlog` VALUES ('34', '1', '127.0.0.1', '删除游记\"故宫一日游\"', '2019-01-04 10:59:44');
INSERT INTO `operlog` VALUES ('35', '1', '127.0.0.1', '恢复游记\"故宫一日游\"', '2019-01-04 10:59:53');
INSERT INTO `operlog` VALUES ('36', '1', '127.0.0.1', '删除马尔代夫的海风在游记\"游龙胜梯田有感\"中的评论', '2019-01-04 11:06:57');
INSERT INTO `operlog` VALUES ('37', '1', '127.0.0.1', '恢复马尔代夫的海风在游记\"游龙胜梯田有感\"中的评论', '2019-01-04 11:07:34');
INSERT INTO `operlog` VALUES ('38', '1', '127.0.0.1', '修改游记\"北京不得不去的地方——故宫一日游\"', '2019-01-04 11:20:15');
INSERT INTO `operlog` VALUES ('39', '1', '127.0.0.1', '修改景区\"故宫\"为\"故宫\"', '2019-01-05 10:11:32');
INSERT INTO `operlog` VALUES ('40', '1', '127.0.0.1', '添加景区广州长隆旅游度假区', '2019-01-05 10:31:47');
INSERT INTO `operlog` VALUES ('41', '1', '127.0.0.1', '修改游记\"游龙胜梯田有感\"', '2019-01-05 11:55:30');
INSERT INTO `operlog` VALUES ('42', '1', '127.0.0.1', '修改景区\"龙胜梯田\"为\"龙胜梯田\"', '2019-01-05 12:03:27');
INSERT INTO `operlog` VALUES ('43', '1', '127.0.0.1', '修改游记\"邂逅龙脊梯田\"', '2019-01-05 12:09:10');
INSERT INTO `operlog` VALUES ('44', '1', '127.0.0.1', '添加地区新疆维吾尔自治区', '2019-01-05 13:12:10');
INSERT INTO `operlog` VALUES ('45', '1', '127.0.0.1', '添加景区喀纳斯风景区', '2019-01-05 13:17:21');
INSERT INTO `operlog` VALUES ('46', '1', '127.0.0.1', '添加游记\"喀纳斯之旅,带你领略不一样的新疆\"', '2019-01-05 13:31:40');
INSERT INTO `operlog` VALUES ('47', '1', '127.0.0.1', '修改景区\"广州长隆旅游度假区\"为\"广州长隆旅游度假区\"', '2019-01-05 14:57:49');
INSERT INTO `operlog` VALUES ('48', '1', '127.0.0.1', '添加景区九寨沟风景区', '2019-01-05 16:50:56');
INSERT INTO `operlog` VALUES ('49', '1', '127.0.0.1', '修改景区\"龙胜梯田\"为\"龙胜梯田\"', '2019-01-05 17:40:30');
INSERT INTO `operlog` VALUES ('50', '1', '127.0.0.1', '添加地区四川省', '2019-01-06 13:40:02');
INSERT INTO `operlog` VALUES ('51', '1', '127.0.0.1', '修改景区\"九寨沟风景区\"为\"九寨沟风景区\"', '2019-01-06 13:42:55');
INSERT INTO `operlog` VALUES ('52', '1', '127.0.0.1', '修改景区\"九寨沟风景区\"为\"九寨沟风景区\"', '2019-01-06 13:45:34');
INSERT INTO `operlog` VALUES ('53', '1', '127.0.0.1', '修改游记\"北京不得不去的地方——故宫一日游\"', '2019-01-06 13:56:27');
INSERT INTO `operlog` VALUES ('54', '1', '127.0.0.1', '修改游记\"喀纳斯之旅,带你领略不一样的新疆\"', '2019-01-06 16:02:40');
INSERT INTO `operlog` VALUES ('55', '1', '127.0.0.1', '删除游记\"邂逅龙脊梯田\"', '2019-01-06 16:05:58');
INSERT INTO `operlog` VALUES ('56', '1', '127.0.0.1', '恢复游记\"邂逅龙脊梯田\"', '2019-01-06 16:06:12');
INSERT INTO `operlog` VALUES ('57', '1', '127.0.0.1', '删除游记\"喀纳斯之旅,带你领略不一样的新疆\"', '2019-01-06 16:14:13');
INSERT INTO `operlog` VALUES ('58', '1', '127.0.0.1', '恢复游记\"喀纳斯之旅,带你领略不一样的新疆\"', '2019-01-06 16:14:21');
INSERT INTO `operlog` VALUES ('59', '1', '127.0.0.1', '添加游记\"九寨沟游记\"', '2019-01-07 09:00:05');
INSERT INTO `operlog` VALUES ('60', '1', '127.0.0.1', '删除游记\"九寨沟游记\"', '2019-01-07 14:06:40');
INSERT INTO `operlog` VALUES ('61', '1', '127.0.0.1', '恢复游记\"九寨沟游记\"', '2019-01-07 14:31:19');
INSERT INTO `operlog` VALUES ('62', '1', '127.0.0.1', '删除游记\"九寨沟游记\"', '2019-01-07 15:56:18');
INSERT INTO `operlog` VALUES ('63', '1', '127.0.0.1', '恢复游记\"九寨沟游记\"', '2019-01-07 16:08:32');
INSERT INTO `operlog` VALUES ('64', '1', '127.0.0.1', '删除李四在游记\"北京不得不去的地方——故宫一日游\"中的评论', '2019-01-07 19:32:08');
INSERT INTO `operlog` VALUES ('65', '1', '127.0.0.1', '恢复李四在游记\"北京不得不去的地方——故宫一日游\"中的评论', '2019-01-07 19:32:20');
INSERT INTO `operlog` VALUES ('66', '1', '127.0.0.1', '删除李四在游记\"北京不得不去的地方——故宫一日游\"中的评论', '2019-01-09 09:50:08');
INSERT INTO `operlog` VALUES ('67', '1', '127.0.0.1', '恢复李四在游记\"北京不得不去的地方——故宫一日游\"中的评论', '2019-01-09 09:54:10');
INSERT INTO `operlog` VALUES ('68', '1', '127.0.0.1', '删除李四在游记\"北京不得不去的地方——故宫一日游\"中的评论', '2019-01-09 09:54:55');
INSERT INTO `operlog` VALUES ('69', '1', '127.0.0.1', '添加游记\"故宫一日游\"', '2019-01-09 10:53:06');
INSERT INTO `operlog` VALUES ('70', '1', '127.0.0.1', '添加游记\"故宫一日游1\"', '2019-01-09 10:55:24');
INSERT INTO `operlog` VALUES ('71', '1', '127.0.0.1', '修改景区\"喀纳斯风景区\"为\"喀纳斯风景区\"', '2019-01-09 10:58:21');
INSERT INTO `operlog` VALUES ('72', '1', '127.0.0.1', '修改景区\"喀纳斯风景区\"为\"喀纳斯风景区\"', '2019-01-09 10:58:52');
INSERT INTO `operlog` VALUES ('73', '1', '127.0.0.1', '修改景区\"喀纳斯风景区\"为\"喀纳斯风景区\"', '2019-01-09 10:59:15');
INSERT INTO `operlog` VALUES ('74', '1', '127.0.0.1', '修改景区\"喀纳斯风景区\"为\"喀纳斯风景区\"', '2019-01-09 10:59:30');
INSERT INTO `operlog` VALUES ('75', '1', '127.0.0.1', '修改游记\"故宫一日游1\"', '2019-01-09 11:02:47');
INSERT INTO `operlog` VALUES ('76', '1', '127.0.0.1', '删除游记\"故宫一日游\"', '2019-01-09 11:04:29');
INSERT INTO `operlog` VALUES ('77', '1', '127.0.0.1', '恢复游记\"故宫一日游\"', '2019-01-09 11:05:12');
INSERT INTO `operlog` VALUES ('78', '1', '127.0.0.1', '添加地区浙江省', '2019-01-09 11:11:46');
INSERT INTO `operlog` VALUES ('79', '1', '127.0.0.1', '恢复李四在游记\"北京不得不去的地方——故宫一日游\"中的评论', '2019-01-09 11:12:49');
INSERT INTO `operlog` VALUES ('80', '1', '127.0.0.1', '添加景区杭州西湖景区', '2019-01-10 11:39:47');
INSERT INTO `operlog` VALUES ('81', '1', '127.0.0.1', '修改游记\"冬游西湖之人在断桥残雪处\"', '2019-01-10 11:46:19');
INSERT INTO `operlog` VALUES ('82', '1', '127.0.0.1', '修改游记\"冬游西湖之人在断桥残雪处\"', '2019-01-10 11:47:09');
INSERT INTO `operlog` VALUES ('83', '1', '127.0.0.1', '修改游记\"冬游西湖之人在断桥残雪处\"', '2019-01-10 11:48:09');
INSERT INTO `operlog` VALUES ('84', '1', '127.0.0.1', '删除游记\"故宫一日游\"', '2019-01-10 11:49:00');
INSERT INTO `operlog` VALUES ('85', '1', '127.0.0.1', '修改游记\"冬游西湖之人在断桥残雪处\"', '2019-01-10 11:49:09');
INSERT INTO `operlog` VALUES ('86', '1', '127.0.0.1', '修改游记\"冬游西湖之人在断桥残雪处\"', '2019-01-10 13:39:05');
INSERT INTO `operlog` VALUES ('87', '1', '127.0.0.1', '删除游记\"北京不得不去的地方——故宫一日游\"', '2019-01-11 10:27:14');
INSERT INTO `operlog` VALUES ('88', '1', '127.0.0.1', '恢复游记\"北京不得不去的地方——故宫一日游\"', '2019-01-11 10:27:25');
INSERT INTO `operlog` VALUES ('89', '1', '127.0.0.1', '删除游记\"邂逅龙脊梯田\"', '2019-01-11 10:29:24');
INSERT INTO `operlog` VALUES ('90', '1', '127.0.0.1', '删除游记\"冬游西湖之人在断桥残雪处\"', '2019-01-11 10:29:25');
INSERT INTO `operlog` VALUES ('91', '1', '127.0.0.1', '恢复游记\"故宫一日游\"', '2019-01-11 10:29:26');
INSERT INTO `operlog` VALUES ('92', '1', '127.0.0.1', '删除游记\"故宫一日游\"', '2019-01-11 10:29:27');
INSERT INTO `operlog` VALUES ('93', '1', '127.0.0.1', '删除游记\"九寨沟游记\"', '2019-01-11 10:29:29');
INSERT INTO `operlog` VALUES ('94', '1', '127.0.0.1', '删除游记\"喀纳斯之旅,带你领略不一样的新疆\"', '2019-01-11 10:29:30');
INSERT INTO `operlog` VALUES ('95', '1', '127.0.0.1', '恢复游记\"冬游西湖之人在断桥残雪处\"', '2019-01-11 10:30:09');
INSERT INTO `operlog` VALUES ('96', '1', '127.0.0.1', '恢复游记\"九寨沟游记\"', '2019-01-11 10:30:11');
INSERT INTO `operlog` VALUES ('97', '1', '127.0.0.1', '恢复游记\"喀纳斯之旅,带你领略不一样的新疆\"', '2019-01-11 10:30:15');
INSERT INTO `operlog` VALUES ('98', '1', '127.0.0.1', '恢复游记\"邂逅龙脊梯田\"', '2019-01-11 10:30:17');
INSERT INTO `operlog` VALUES ('99', '1', '127.0.0.1', '修改游记\"北京不得不去的地方——故宫一日游\"', '2019-01-11 10:32:57');
INSERT INTO `operlog` VALUES ('100', '1', '127.0.0.1', '删除游记\"北京不得不去的地方——故宫一日游\"', '2019-01-11 10:34:57');
INSERT INTO `operlog` VALUES ('101', '1', '127.0.0.1', '恢复游记\"北京不得不去的地方——故宫一日游\"', '2019-01-11 10:44:55');
INSERT INTO `operlog` VALUES ('102', '1', '127.0.0.1', '删除游记\"北京不得不去的地方——故宫一日游\"', '2019-01-11 10:45:20');
INSERT INTO `operlog` VALUES ('103', '1', '127.0.0.1', '恢复游记\"北京不得不去的地方——故宫一日游\"', '2019-01-11 10:45:35');
INSERT INTO `operlog` VALUES ('104', '1', '127.0.0.1', '删除游记\"北京不得不去的地方——故宫一日游\"', '2019-01-11 10:45:58');
INSERT INTO `operlog` VALUES ('105', '1', '127.0.0.1', '恢复游记\"北京不得不去的地方——故宫一日游\"', '2019-01-11 10:46:11');
INSERT INTO `operlog` VALUES ('106', '1', '127.0.0.1', '删除游记\"冬游西湖之人在断桥残雪处\"', '2019-01-11 10:47:53');
INSERT INTO `operlog` VALUES ('107', '1', '127.0.0.1', '删除游记\"九寨沟游记\"', '2019-01-11 10:47:56');
INSERT INTO `operlog` VALUES ('108', '1', '127.0.0.1', '删除游记\"喀纳斯之旅,带你领略不一样的新疆\"', '2019-01-11 10:47:58');
INSERT INTO `operlog` VALUES ('109', '1', '127.0.0.1', '删除游记\"邂逅龙脊梯田\"', '2019-01-11 10:48:01');
INSERT INTO `operlog` VALUES ('110', '1', '127.0.0.1', '恢复游记\"冬游西湖之人在断桥残雪处\"', '2019-01-11 10:49:20');
INSERT INTO `operlog` VALUES ('111', '1', '127.0.0.1', '删除游记\"北京不得不去的地方——故宫一日游\"', '2019-01-11 10:50:32');
INSERT INTO `operlog` VALUES ('112', '1', '127.0.0.1', '恢复游记\"故宫一日游\"', '2019-01-11 10:50:34');
INSERT INTO `operlog` VALUES ('113', '1', '127.0.0.1', '恢复游记\"喀纳斯之旅,带你领略不一样的新疆\"', '2019-01-11 10:50:38');
INSERT INTO `operlog` VALUES ('114', '1', '127.0.0.1', '恢复游记\"邂逅龙脊梯田\"', '2019-01-11 10:51:22');
INSERT INTO `operlog` VALUES ('115', '1', '127.0.0.1', '恢复游记\"北京不得不去的地方——故宫一日游\"', '2019-01-11 10:51:37');
INSERT INTO `operlog` VALUES ('116', '1', '127.0.0.1', '修改游记\"北京不得不去的地方——故宫一日游\"', '2019-01-11 10:51:44');
INSERT INTO `operlog` VALUES ('117', '1', '127.0.0.1', '删除游记\"北京不得不去的地方——故宫一日游\"', '2019-01-11 10:51:54');
INSERT INTO `operlog` VALUES ('118', '1', '127.0.0.1', '恢复游记\"九寨沟游记\"', '2019-01-11 10:51:59');
INSERT INTO `operlog` VALUES ('119', '1', '127.0.0.1', '删除游记\"故宫一日游\"', '2019-01-11 10:52:17');
INSERT INTO `operlog` VALUES ('120', '1', '127.0.0.1', '删除stark81在游记\"喀纳斯之旅,带你领略不一样的新疆\"中的评论', '2019-01-11 13:29:13');
INSERT INTO `operlog` VALUES ('121', '1', '127.0.0.1', '恢复stark81在游记\"喀纳斯之旅,带你领略不一样的新疆\"中的评论', '2019-01-11 13:29:18');

-- ----------------------------
-- Table structure for `review`
-- ----------------------------
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `travels_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `content` text,
  `addtime` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `travels_id` (`travels_id`),
  KEY `user_id` (`user_id`),
  KEY `ix_review_addtime` (`addtime`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`travels_id`) REFERENCES `travels` (`id`),
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of review
-- ----------------------------
INSERT INTO `review` VALUES ('1', '3', '2', '这篇游记真是不错哟', '2019-01-03 20:48:08', '1');
INSERT INTO `review` VALUES ('2', '4', '1', '这篇游记也真是不错哟', '2019-01-07 09:10:58', '1');
INSERT INTO `review` VALUES ('3', '4', '4', '还行吧', '2019-01-07 13:33:08', '1');
INSERT INTO `review` VALUES ('4', '5', '3', '试试', '2019-01-07 13:56:39', '1');

-- ----------------------------
-- Table structure for `scenic`
-- ----------------------------
DROP TABLE IF EXISTS `scenic`;
CREATE TABLE `scenic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scenicname` varchar(255) DEFAULT NULL,
  `star` int(11) DEFAULT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `introduce` text,
  `content` text,
  `area_id` int(11) DEFAULT NULL,
  `address` text,
  `is_recommend` tinyint(1) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cover` (`cover`),
  UNIQUE KEY `scenicname` (`scenicname`),
  KEY `area_id` (`area_id`),
  KEY `ix_scenic_addtime` (`addtime`),
  CONSTRAINT `scenic_ibfk_1` FOREIGN KEY (`area_id`) REFERENCES `area` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of scenic
-- ----------------------------
INSERT INTO `scenic` VALUES ('1', '故宫', '5', '201901020921333ab7dd9ef669436ab6743a55a45fea98.png', '故宫博物院，是一座特殊的博物馆。成立于1925年的故宫博物院，建立在明清两朝皇宫——紫禁城的基础上。历经五百年兴衰荣辱，帝王宫殿的大门终于向公众敞开。故宫博物院绝无仅有的独特藏品，是世界上规模最大、保存最完整的紫禁城木结构宫殿建筑群。', '<p>这里是故宫的景区内容<img alt=\"\" src=\"/static/uploads/ckeditor/20190102092030ca730d5952dc4dafa2bbbc91ae88947d.png\" style=\"height:210px; width:390px\" /></p>\r\n\r\n<p>这里是第二行的内容</p>\r\n', '2', '北京的某个地方', '1', '2019-01-02 09:21:33');
INSERT INTO `scenic` VALUES ('2', '龙胜梯田', '4', '20190105120327ab62f7f7678a4d949aa0639c04b505e5', '龙脊梯田，是指在龙脊山上开发出的梯田，从广义说叫做龙胜梯田，从狭义上称为龙脊梯田。位于广西龙胜各族自治县龙脊镇平安村龙脊山，距县城22公里。距桂林市80公里，处东经109°32\'～110°14\'北纬25°35\'～26°17\'之间。\r\n龙脊梯田分为金坑（大寨）瑶族梯田观景区，平安壮族梯田观景区。通常意义上的龙脊梯田是指龙脊平安壮族梯田，也是开发较早的梯田。梯田分布在海拔300米至1100米之间，最大坡度达50度，前往梯田几乎都是盘山公路，一直升到约海拔600米以上，到梯田时海拔达到880米。', '<p>这里是龙胜梯田的景区内容<img alt=\"\" src=\"/static/uploads/ckeditor/201901021726557cb3112097a84fc09693f5be07b80e7d.png\" style=\"height:210px; width:390px\" /></p>\r\n\r\n<p>这里是龙胜梯田的第二段内容</p>\r\n', '3', '广西桂林市阳朔某个地方', '0', '2019-01-02 17:27:12');
INSERT INTO `scenic` VALUES ('3', '广州长隆旅游度假区', '5', '201901051457489ff5dc1370cd4f2882c6ba15e360ed59.jpg', '这里是广州长隆的景区介绍', '<p>这里是广州长隆的景区内容<img alt=\"\" src=\"/static/uploads/ckeditor/201901051031382ebd74961ea9465d80eb7fb80e063c1a.png\" style=\"height:210px; width:390px\" /></p>\r\n', '1', '广东省广州市某个地方', '1', '2019-01-05 10:31:47');
INSERT INTO `scenic` VALUES ('4', '喀纳斯风景区', '5', '20190109105929a1ca446e7514446da55b492e933c9a89.jpg', '喀纳斯风景区位于新疆阿尔泰山中段，地处中国与哈萨克斯坦、俄罗斯、蒙古国接壤地带。景区面积10030平方公里喀纳斯景区内共有大小景点55处，分属33种基本类型，主要包括哈纳斯国家级自然保护区、喀纳斯国家地质公园、白哈巴国家森林公园、贾登峪国家森林公园、喀纳斯河谷、禾木河谷、那仁草原、禾木草原及禾木村、白哈巴村、喀纳斯村等国内外享有盛名的八大自然景观区和三大人文景观区。', '<p>喀纳斯风景区位于新疆阿尔泰山中段，地处中国与哈萨克斯坦、俄罗斯、蒙古国接壤地带。景区面积10030平方公里喀纳斯景区内共有大小景点55处，分属33种基本类型，主要包括哈纳斯国家级自然保护区、喀纳斯国家地质公园、白哈巴国家森林公园、贾登峪国家森林公园、喀纳斯河谷、禾木河谷、那仁草原、禾木草原及禾木村、白哈巴村、喀纳斯村等国内外享有盛名的八大自然景观区和三大人文景观区。</p>\r\n\r\n<p><img alt=\"\" src=\"/static/uploads/ckeditor/201901051316212c78f6b2c545424392b4193b9238fec5.jpg\" style=\"height:535px; width:790px\" /></p>\r\n\r\n<p>喀纳斯风景区位于阿尔泰山地地貌与植被垂直带，自高向低，海拔3000米以上为现代冰川与永久积雪覆盖的高山冰雪寒冻带、海拔2400&mdash;3000米为冰缘亚高山寒冻苔原垫状草甸带、海拔1300&mdash;2400米为中山寒温针叶林草原带（由针叶树种西伯利亚落叶松、西伯利亚冷杉、西伯利亚云杉、西伯利亚红松组成）、海拔800&mdash;1500米为低山丘陵灌木草甸草原带、海拔800米以下是山前冲洪积平原绿洲荒漠带，垂直分层明显，阿尔泰山6－7个垂直自然景观带的真貌。</p>\r\n', '5', '新疆阿勒泰地区布尔津县北部', '1', '2019-01-05 13:17:21');
INSERT INTO `scenic` VALUES ('5', '九寨沟风景区', '5', '20190105165056a97a398f6c5f44c8a07a56bd03c246e8', '九寨沟，位于四川省阿坝藏族羌族自治州九寨沟县漳扎镇，是白水沟上游白河的支沟，以有九个藏族村寨（又称何药九寨）而得名。九寨沟平均海拔在2000-3500米，遍布原始森林，沟内分布108个湖泊，有“童话世界”之誉。\r\n1992年12月14日，联合国自然遗产委员会16届会议一致通过将九寨沟列入《世界自然遗产名录》，九寨沟成为世界自然遗产。2007年5月8日，阿坝藏族羌族自治州九寨沟旅游景区，经国家旅游局正式批准，升格为国家AAAAA级旅游景区。', '<p>四川旅游胜地九寨沟,蓝天、白云、雪山、森林、尽融于瀑、河、滩、缀成一串串宛若从天而降的珍珠；篝火、烤羊、锅庄和古老而美丽的传说，展现出藏羌人热情强悍的民族风情。九寨沟，一个五彩斑斓、绚丽奇绝的瑶池玉盆，一个原始古朴、神奇梦幻的人间仙境，一个不见纤尘、自然纯净的&ldquo;童话世界&rdquo;!现代肖草《九寨沟》诗：&ldquo;放眼层林碧水涟，鱼游云顶鸟儿欢。飞流洒落拂衣去，九寨山青誉海天&rdquo;对九寨沟予以真实的诠释。她以神妙奇幻的翠海、飞瀑、彩林、雪峰等无法尽览的自然与人文景观，成为全国唯一拥有&ldquo;世界自然遗产&rdquo;和&ldquo;世界生物圈保护区&rdquo;两顶桂冠的圣地。 九寨沟以原始的生态环境，一尘不染的清新空气和雪山、森林、湖泊组合成神妙、奇幻、幽美的自然风光，显现&ldquo;自然的美，美的自然&rdquo;，被誉为&ldquo;童话世界九寨沟的高峰&rdquo;、彩林、翠海、叠瀑和藏情被称为&ldquo;五绝&rdquo;。因其独有的原始景观，丰富的动植物资源被誉为&ldquo;人间仙境&rdquo;。</p>\r\n\r\n<p>九寨沟纵深40多公里，总面积6万多公顷，三条主沟形成Y形分布，总长达60余公里。由于交通不便，这里几乎成了一个与世隔绝的地方。仅有九个藏族村寨坐落在这片崇山峻岭之中，九寨沟因此得名。这里保存着具有原始风貌的自然景色，有着自己的特殊景观。据说，在世界别的地方已经很难见到。九寨沟既是自然保护区，又是国家级风景名胜区，同时，被列入世界人类自然遗产名录。</p>\r\n\r\n<h2><strong>主要景点</strong></h2>\r\n\r\n<p><strong>珍珠滩瀑布、珍珠滩：</strong>珍珠滩瀑布宽达300多米，宽阔的水帘倾泻而下，气势磅礴。水帘在淡黄色的钙华滩上飞溅，在阳光的照耀下宛如一颗颗璀璨的珍珠，珍珠滩由此得名。86版电视剧《西游记》的片头景就是在此拍摄。</p>\r\n\r\n<p><strong>五花海：</strong>位于日则沟孔雀河尽头，深秋时节，五花海四周五彩斑斓的树木倒映在湖水中，仿佛进入了一个奇幻的梦境。</p>\r\n\r\n<p><strong>树正群海：</strong>树正群海由二三十个大小不一的海子组合而成，呈梯田状，层次分明，绵延数里，颇为壮观。</p>\r\n', '6', '四川省阿坝藏族羌族自治州', '1', '2019-01-05 16:50:56');
INSERT INTO `scenic` VALUES ('6', '杭州西湖景区', '5', '2019011011394664ff1ed8d2ba4329b6549e5859699b43.jpg', '西湖，位于浙江省杭州市西面，是中国大陆首批国家重点风景名胜区和中国十大风景名胜之一。它是中国大陆主要的观赏性淡水湖泊之一，也是现今《世界遗产名录》中少数几个和中国唯一一个湖泊类文化遗产。\r\n西湖三面环山，面积约6.39平方千米，东西宽约2.8千米，南北长约3.2千米，绕湖一周近15千米。湖中被孤山、白堤、苏堤、杨公堤分隔，按面积大小分别为外西湖、西里湖、北里湖、小南湖及岳湖等五片水面，苏堤、白堤越过湖面，小瀛洲、湖心亭、阮公墩三个小岛鼎立于外西湖湖心，夕照山的雷峰塔与宝石山的保俶塔隔湖相映，由此形成了“一山、二塔、三岛、三堤、五湖”的基本格局。', '<p>关于西湖生成的原因，古代有关书籍记载都较简略。明朝《西湖游览志》卷一载：&ldquo;西湖三面环山，溪谷缕注，下有渊泉百道，潴而为湖。&rdquo;近代学者从地形、地质、沉积及水动力学等方面进行了考证，其中较为普遍的观点认为西湖是由海湾逐渐演变而生的一个潟湖。民国九年（1920年），科学家竺可桢考察西湖地形后发表了《杭州西湖生成的原因》，其称：&ldquo;西湖原是钱塘江左边的一个小小湾儿，后来由于钱塘江泥沙沉淀下来，慢慢地把湾口塞住，变成一个潟湖。&rdquo;竺可桢还从沉积率推断，西湖开始形成年代距今一万二千年前。竺氏认为西湖形成之初，后由于三面山区中的溪流注入，所挟沙逐渐填充西湖，湖面随之逐渐缩小，倘若没有历代的不断疏浚，西湖早已湮废。1924年，地质学者章鸿钊发表《杭州西湖成因一解》，对竺氏的观点又进行了补充：西湖之成，其始以潮力所向而积成湖堤，其继以海滩变迁而维持湖面，二者为形成西湖之重要条件。</p>\r\n\r\n<p>但是，潟湖说在现代科学考察中受到了怀疑。1950年以后，地质部门对西湖湖中三岛和湖滨公园地质钻孔取样分析，认为距今一亿五千万年的晚侏罗纪时，以今湖滨公园一带为中心，曾发生过一次强烈的火山爆发，宝石山和西湖湖底（大部分）堆积下大量火山岩块，由此，曾出现火山口陷落，造成马蹄形核心低洼积水，即西湖雏型。1979年，地质工作者对湖滨钻孔采取的岩样作微体古生物分析后著文认为，根据不同化石的组合，西湖的形成过程可划分为早期潟湖、中期海湾、晚期潟湖三个阶段，随着钱塘江沙坎的发育，西湖终于完全封闭，水体逐渐淡化，形成近代的西湖。</p>\r\n\r\n<p>西湖周围的群山，属于天目山余脉。根据岩性差别和山势高低，可分为内、外两圈。外圈有北高峰、天马山、天竺山、五云山等，属高丘陵地形，山体主要由志留、泥盆纪岩屑砂岩、石英砂岩构成，岩性较坚硬，不易风化侵蚀。峰峦挺秀，溪涧纵横，流水清洌，是西湖泉水最多地带。内圈有飞来峰、南高峰、玉皇山、凤凰山、吴山等，山势较低，属低丘陵地形。山体均为向斜山地，主要由石炭、二迭纪石灰岩构成，易受水流溶蚀，形成了烟霞、水乐、石屋、紫来、紫云等溶洞。内圈的群山，除岩溶丘陵外，还有横亘西湖北缘的葛岭、宝石山，由火山碎屑岩组成，海拔在百米左右。</p>\r\n', '7', '浙江杭州市', '0', '2019-01-10 11:39:47');

-- ----------------------------
-- Table structure for `sceniccollect`
-- ----------------------------
DROP TABLE IF EXISTS `sceniccollect`;
CREATE TABLE `sceniccollect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `scenic_id` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `scenic_id` (`scenic_id`),
  KEY `user_id` (`user_id`),
  KEY `ix_sceniccollect_addtime` (`addtime`),
  CONSTRAINT `sceniccollect_ibfk_1` FOREIGN KEY (`scenic_id`) REFERENCES `scenic` (`id`),
  CONSTRAINT `sceniccollect_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sceniccollect
-- ----------------------------

-- ----------------------------
-- Table structure for `suggestion`
-- ----------------------------
DROP TABLE IF EXISTS `suggestion`;
CREATE TABLE `suggestion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(100) DEFAULT NULL,
  `uemail` varchar(100) DEFAULT NULL,
  `content` text,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_suggestion_addtime` (`addtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of suggestion
-- ----------------------------

-- ----------------------------
-- Table structure for `travels`
-- ----------------------------
DROP TABLE IF EXISTS `travels`;
CREATE TABLE `travels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `scenic_id` int(11) DEFAULT NULL,
  `content` text,
  `addtime` datetime DEFAULT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `is_recommend` tinyint(1) DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  UNIQUE KEY `cover` (`cover`),
  KEY `scenic_id` (`scenic_id`),
  KEY `ix_travels_addtime` (`addtime`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `travels_ibfk_1` FOREIGN KEY (`scenic_id`) REFERENCES `scenic` (`id`),
  CONSTRAINT `travels_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of travels
-- ----------------------------
INSERT INTO `travels` VALUES ('1', '北京不得不去的地方——故宫一日游', '1', '<p>故宫门票价格：成人旺季60元，淡季40元，学生票全年20元。珍宝馆和钟表馆另外收费10元/人，学生证半价，价格方面可以说是相当优惠了。<br />\r\n我们去的时候故宫还可以现场售票，回来以后就实行全网络售票参观了。<br />\r\n门票提前10天在网上预售，售完为止，一张身份证每个入院日限购一张门票。和其它博物馆一样，故宫博物院也是周一闭馆。<br />\r\n去之前建议关注一下故宫博物院的官网：http://gugong.228.com.cn/，尤其是跟我们一样自由行的游客，除了可以看到余票和购买门票，还能看到最新的一些消息公告，比如哪里闭馆哪里修缮（虽然有些宫殿临时维修不在官网通告，但有总好过无嘛），对规划路线有很大的帮助。<br />\r\n我们是在美团上提前买的大门票和珍宝馆的门票，刷身份证就可以入园。<br />\r\n【没什么用的讲解器】<br />\r\n过了安检就能看到讲解器服务处。<br />\r\n自助讲解器租赁价格：汉语、粤语、闽南语版20.00元/台，其他语种40.00元/台，免押金，参观完毕在出院前将讲解器归还即可。<br />\r\n我和泡泡一人租了一台，使用下来的感受是缺点多过优点，可以不租。<br />\r\n虽说它是自动感应的，走到哪里讲到哪里，讲解的内容也挺不错，有多个版本，我们听的是王刚老师讲的故事版，生动有趣。但是它的缺点也很明显。<br />\r\n1、因为是单耳佩戴，所以在环境嘈杂的地方，即使声音开的很大，也经常听不清楚说了什么。<br />\r\n2、走到一些建筑密集的地方，讲解器会错乱崩溃。比如我们在珍妃井附近转了很久，它始终就识别不到我们所在的位置。比如我们到了宁寿宫，它却讲的是皇极殿的内容。泡泡一度以为是不是讲解器坏了，还跑到服务处换了一个，工作人员倒是很耿直，说这个就是这样的，不是很灵，到了不放他们也没办法。因为是自动定位讲解，又不能选择自己想听的地方，所以就导致我们很多地方到最后也没能听到讲解。<br />\r\n3、所有内容只讲一次，如果你没听得清，或者中途不小心耳机掉下来，漏听了，也只能自认倒霉。<br />\r\n其实故宫只要不闭馆，根本不可能有人少的时候，一个又一个旅行团，你想不听导游的讲解都很难。当然，这只是我们的看法，讲解器本身不贵，想要的话也可以租一个备用，权当地图用也行。<br />\r\n我和泡泡在故宫走了一整天。从早上的人头攒动待到晚上的人去楼空。<br />\r\n很多人说故宫没意思，就是看看长的差不多的房子。我倒觉得这一趟来的超值。<br />\r\n我建议对历史，尤其是明清史感兴趣的亲们，可以多预留一些时间给这座紫禁城，它会还你无限惊喜。</p>\r\n\r\n<p><img alt=\"\" src=\"/static/uploads/ckeditor/20190104111927b8fba589e3a3451c9799e50940c7b1ed.png\" style=\"height:350px; width:650px\" /></p>\r\n', '2019-01-03 15:36:55', '201901031536549519ca8470254e9da6561a774ea336b4.png', '1', '0', null);
INSERT INTO `travels` VALUES ('3', '邂逅龙脊梯田', '2', '<p>到了桂林仅仅看过山水，显然是不够的，一定要到龙胜看看梯田。龙胜梯田在广西龙胜各族自治县和平乡平安村龙脊山，所以也称龙脊梯田，但那是狭义的称呼，因为再往山里走，还有一处梯田叫做金坑，所以龙胜梯田其实应该包括这两处。龙脊梯田景区内居住着壮族、瑶族两种民族，以壮族为主，但是这里除了部分木质建筑，平时已经看不出鲜明的民族特色了；就梯田本身而言，最壮观的是大寨的金坑梯田，这里居住以红瑶为主也称红瑶梯田，央视12台的片头以及大家经常看见的龙脊梯田宣传图片和影视作品绝大部分都是出自金坑梯田。从流水湍急的河谷，到白云缭绕的山巅，从万木葱茏的林边到石壁崖前，凡有泥土的地方，都开辟了梯田。垂直高度五六里，横向伸延五六里。每个看见这一景色游客的心灵都会被深深地震撼，这是一种难以言表的，一种被大自然的雄奇以及人的伟力所引起的震撼。</p>\r\n\r\n<p><img alt=\"\" src=\"/static/uploads/ckeditor/201901051152485c4a97607c6b42b5877cbd9cccc0eeef.jpeg\" style=\"height:306px; width:460px\" /></p>\r\n\r\n<p>鉴于景区开发先后以及程度的不同，如果时间紧迫或者其他原因只能选看其中之一，那么都是去平安寨。游客无论乘车还是自驾，最好早上就从桂林出发，中午就可以到山寨吃午饭了。从桂林去龙脊梯田距离约100公里，出城后沿着321国道向南走，山路虽然崎岖但路况甚好，用时近两个小时，在距离龙胜县城还差约10公里时会有路牌指向龙脊梯田景区，桂林到这里的公共巴士也很多，到景区口后换乘即可。景区门票每人80元，然后一路开始沿着盘山路行进，过了红瑶长发村不久会有平安寨和金坑的岔路，左转过桥就是去平安寨，金坑则一直往上走。梯田分布在海拔300米至1100米之间，半个小时后，从阴暗的山沟里一直爬到海拔600米的山顶就是平安寨的大门，但是这里仅仅是停车场，过了大门还需要走500米的坡路才能到风雨桥，也就是壮族人迎客的地方。来这里最好先联系好客栈，通知主人出来到桥头接应一下，如果行礼多还可让主人下到停车场接。因为寨子是沿着山路修建的随意狭长，自然嘛为了景观肯定得选择高处，即使过了风雨桥，至少还要沿着千回百转的青石板路爬1公里山路，对于体力是个考验，我放弃去金坑就是因为在这里得知那里的山路比这里还要高得多。</p>\r\n', '2019-01-03 19:59:40', '20190105115529afbcf3cd99ed47418980b43fadace57f', '0', '1', null);
INSERT INTO `travels` VALUES ('4', '喀纳斯之旅,带你领略不一样的新疆', '4', '<p>有人发现了喀纳斯湖里有水怪，有人拍到了喀纳斯湖里的水怪，每年都会有这样的新闻出现。官方之前也做出了解释，其实那不是水怪，是一头史无前例的巨型哲罗鲑，然后经过人们的口口相传和一些带有夸张色彩的新闻报道，喀纳斯就带上了一些神秘的色彩。大多数人来到喀纳斯都是为了喀纳斯湖里的水怪，其实喀纳斯不单单只有传闻中的喀纳斯湖水怪，它还有其他非常美丽的景点和景色。</p>\r\n\r\n<h3><strong>绿色的大海：那仁草原</strong></h3>\r\n\r\n<p>喀纳斯的边缘处就是那仁草原，它是当地哈萨克人的夏季牧场，只有在夏天的时候，他们才会骑着马把一些牛和羊从室内赶到那仁草原，如果想要来看一眼碧绿的那仁草原一定要夏季来，青草的芳香加上牛羊的叫声，那副景色就像是世外桃源一般，让人心旷神怡。</p>\r\n\r\n<p><img alt=\"\" src=\"/static/uploads/ckeditor/20190105132425310ab002d4fc4f0bb6ab81d3df69702f.jpg\" style=\"height:296px; width:640px\" /></p>\r\n\r\n<p>既然走到了这里，也不得不看一下这里有名的金莲花。这是喀纳斯的特色之花，他它不仅仅是空有颜值，它其实还是一种药材。当地的哈萨克人如果有个感冒发烧，他们就会用它来泡水喝，就相当于我们的菊花，具有清热的功效。其实喀纳斯这里的许多花花草草都有重要的功效。</p>\r\n\r\n<p>每年的五月份，这里的金莲花就会盛开，开遍漫山遍野。时间长达一个月之久才会凋谢。就像是金黄色的海洋。但是今年的金莲花的盛开晚了一个月之久。</p>\r\n\r\n<h3><strong>神秘的湖水：喀纳斯湖</strong></h3>\r\n\r\n<p>虽然喀纳斯湖传出来的故事，都带着非常神秘的色彩，但是它的景色真是让人流连忘返，你可以在这里爬山和溯溪，感受大自然。喀纳斯周围都是跌宕起伏的山，景色非常的美，每一处看到的每一帧都可以定格为一幅美丽的画。</p>\r\n\r\n<p><img alt=\"\" src=\"/static/uploads/ckeditor/201901051327053112c110a39a4d779cb7ccaa219cf9ad.jpg\" style=\"height:340px; width:500px\" /></p>\r\n\r\n<p>这里景色最好的观看点就是钓鱼台，登上去，整个景色都落入眼中。安静的湖水静卧在碧绿的青山之中，偶尔有几声鸟叫划破安静的长空。不用传说中的水怪，它自己散发的美丽就足够吸引每一个旅人。</p>\r\n\r\n<h3><strong>桃源仙境：吐别克</strong></h3>\r\n\r\n<p>吐别克很少有人知道这个地方，只有坐船才能到达这里，领略过这里风景的人们都说到了这里就像是到了新西兰。这里的景色只能由自己徒步才能领略，如果你们要去的话要记得提前订好当地的哈萨克家庭，徒步是一件非常消耗体力的事情，要提前预定好家庭，他们好拿出准备好的牛羊肉，让你们自己亲手烤着吃。</p>\r\n\r\n<p>下次来到喀纳斯不要只去寻找喀纳斯湖水怪哦，还可以去这几个地方转转。</p>\r\n', '2019-01-05 13:31:40', '20190105133139a037fa1806954d439a92c64ca2988c6d', '1', '1', '2');
INSERT INTO `travels` VALUES ('5', '九寨沟游记', '5', '<p>这里是九寨沟游记的内容</p>\r\n', '2019-01-07 09:00:05', '2019010709000567ba6eb3ef634797b08a6cd9c7096b36', '1', '1', '1');
INSERT INTO `travels` VALUES ('6', '故宫一日游', '1', '<p>dadad</p>\r\n', '2019-01-09 10:53:06', '201901091053065733284819d8484bba6835522bd43af0.jpg', '0', '0', '1');
INSERT INTO `travels` VALUES ('7', '冬游西湖之人在断桥残雪处', '6', '<p>断桥残雪是西湖上著名的景色，以冬雪时远观桥面若隐若现于湖面而称著。属于西湖十景之一。断桥残雪是欣赏西湖雪景之佳地，中国著名的民间传说《白蛇传》，为断桥景物增添了浪漫的色彩。</p>\r\n\r\n<p>每当瑞雪初霁，站在宝石山上向南眺望，西湖银装素裹，白堤横亘雪柳霜桃。断桥的石桥拱面无遮无拦，在阳光下冰雪消融，露出了斑驳的桥栏，而桥的两端还在皑皑白雪的覆盖下。依稀可辨的石桥身似隐似现，而涵洞中的白雪奕奕生光，桥面灰褐形成反差，远望去似断非断，故称断桥。伫立桥头，放眼四望，远山近水，尽收眼底，给人以生机勃勃的强烈属深刻的印象。</p>\r\n\r\n<h3><strong>宝石山高祥云纷</strong></h3>\r\n\r\n<p>白堤横亘湖上，把西湖划分为外湖和里湖，并将孤山和北山连接在一起。白堤在唐代原名白沙堤，宋代又叫孤山路。明代堤上广植桃柳，又称十锦塘。堤上内层是垂柳，外层是碧桃。</p>\r\n\r\n<p><img alt=\"\" src=\"/static/uploads/ckeditor/201901101144102a140727d72144788f20e090327a5d34.jpg\" style=\"height:408px; width:600px\" /></p>\r\n\r\n<h3><strong>断桥两点娥眉纹</strong></h3>\r\n\r\n<p>断桥是西湖中最出名的一座桥。杭州西湖，有四大爱情桥&ldquo;西泠桥&rdquo;、&ldquo;长桥&rdquo;、&ldquo;断桥&rdquo;、&ldquo;跨虹桥&rdquo;，盛名经久不衰。泠桥、长桥、断桥是古代的爱情桥，跨虹桥是现代爱情桥，是众多情侣约会相游的地方，而最符盛名的却是断桥，它的名字与中国民间故事《白蛇传》中缠绵悲怆的爱情故事联系在一起。在断桥上，流传的那许仙和白娘子动人的爱情故事，让断桥成为西湖上众多桥中最著名的桥。传说，白娘子原本是山野中修炼的一条小白蛇，有一天，小白蛇被一个捕蛇老人抓住了，差一点遭遇杀身之祸，幸亏被一个小牧童所救。经过一千七百年的修炼，白娘子终于化做人形，经观音大士指点，来到杭州西湖寻找前世救命恩人小牧童。</p>\r\n\r\n<p>清明佳节，烟雨蒙蒙，观音菩萨说过&ldquo;有缘千里来相会，须往西湖高处寻&rdquo;。而在西湖的断桥的桥面上，由伞传情，白娘子终于找到了前世的救命恩人许仙，以身相许，结为夫妻。在经历水漫金山之后，又是在断桥邂逅重逢，再续前缘。</p>\r\n', '2019-01-09 10:55:24', '20190110114909a334ca39c14545bbbeab43112291e48f.jpg', '1', '1', '2');

-- ----------------------------
-- Table structure for `travelscollect`
-- ----------------------------
DROP TABLE IF EXISTS `travelscollect`;
CREATE TABLE `travelscollect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `travels_id` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `travels_id` (`travels_id`),
  KEY `user_id` (`user_id`),
  KEY `ix_travelscollect_addtime` (`addtime`),
  CONSTRAINT `travelscollect_ibfk_1` FOREIGN KEY (`travels_id`) REFERENCES `travels` (`id`),
  CONSTRAINT `travelscollect_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of travelscollect
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(100) DEFAULT NULL,
  `upwd` varchar(100) DEFAULT NULL,
  `uemail` varchar(100) DEFAULT NULL,
  `uphone` varchar(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `introduce` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uemail` (`uemail`),
  UNIQUE KEY `uname` (`uname`),
  UNIQUE KEY `uphone` (`uphone`),
  KEY `ix_user_addtime` (`addtime`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'stark81', 'pbkdf2:sha256:50000$O8dBu2P6$410093ba13b14a213ceb481775e81cfaf5f4b4382919a6b22a9f8e6404649d74', 'stark81@qq.com', '18698765432', '2019-01-03 08:58:24', '1', '20190111092515dd238a7a8fcd4ab6af842725a764cad9.jpeg', '不要随便找个参照物就堕落得心安理得');
INSERT INTO `user` VALUES ('2', '马尔代夫的海风', 'pbkdf2:sha256:50000$AxnhagfO$dcb0f6e7a6ea790a33a1c3d580f0513d471a3c3a220ac151fd0368201aa64186', 'laibaochu@qq.com', '18612345678', '2019-01-03 10:43:43', '1', '201901110905590b4f426602904b7fad8300780e293191.jpeg', '不见桐花万里路,故园外,拂去怀中一缕芳');
INSERT INTO `user` VALUES ('3', '李四', 'pbkdf2:sha256:50000$exOOrVo6$19f746234152732de3de162f8deb12217701c76f9c3c0559653ad7fabee414cb', 'lisi@qq.com', '12345678910', '2019-01-04 13:02:39', '1', 'default.png', null);
INSERT INTO `user` VALUES ('4', '王五', 'pbkdf2:sha256:50000$YAnmufOI$06ccc5b8e8787e4a600f5147145ea69a87745ec9438f5b54359a25f2cf7a3b43', 'wangwu@qq.com', null, '2019-01-04 13:20:01', '1', 'default.png', null);
INSERT INTO `user` VALUES ('5', '熊大', 'pbkdf2:sha256:50000$Eool9kbb$12d7dd95c7fa282adc9e1798db8b4f73efe896a2646c1c33f79226aaa57b3b5b', 'xiongda@qq.com', null, '2019-01-04 15:40:44', '1', 'default.png', null);
INSERT INTO `user` VALUES ('6', '熊二', 'pbkdf2:sha256:50000$ds9vxeyC$b6d4a5e9aa979b559dc0fce95b3568713de8a00bbf039aa6f1c88326504a8908', 'xionger@qq.com', null, '2019-01-04 15:41:43', '1', 'default.png', null);
INSERT INTO `user` VALUES ('7', 'aaaa', 'pbkdf2:sha256:50000$ZFzLtU9r$e4cd6ab547af251cd337dd5a75a5eda1e6649d2f45ed6a881c44804315376cd1', 'aaaaa@163.com', null, '2019-01-09 20:09:01', '1', 'default.png', null);
INSERT INTO `user` VALUES ('8', 'bbb', 'pbkdf2:sha256:50000$4B2uyUmL$70511e6f369f24e30e3b1c7caebf2655bc5c321940df964e9a1d553f9e240291', 'bbb@163.com', null, '2019-01-09 20:16:44', '1', 'default.png', null);
INSERT INTO `user` VALUES ('9', 'ccc', 'pbkdf2:sha256:50000$Q97cJGDf$1eed3ea76d80e0301162fefd9c268badd1537adc12a0bee539623ec30e5cdf30', 'ccc@163.com', null, '2019-01-09 20:25:18', '1', 'default.png', null);
INSERT INTO `user` VALUES ('10', 'ddd', 'pbkdf2:sha256:50000$P3s3G1UV$42799aa42127dc16d1ccc32fc8cd38e90105191fe69ffdbadb77307495270b97', 'ddd@163.com', null, '2019-01-09 20:28:10', '1', 'default.png', null);
INSERT INTO `user` VALUES ('11', 'eee', 'pbkdf2:sha256:50000$vv5IPJcV$96d9cd816e3fa19ef69437462f9fd172e2d37023ffd51fa019ce286ee9a67c67', 'eee@163.com', null, '2019-01-09 20:30:13', '1', 'default.png', null);
INSERT INTO `user` VALUES ('12', '光头强', 'pbkdf2:sha256:50000$ACsNJbDh$9e6c62a1202ccced26007733a782b03ef477576f9409c16b02d0bac02ed82890', 'guangtouqiang@qq.com', '15112345678', '2019-01-11 17:43:28', '1', 'default.png', '熊大熊二,我要回家过年啦,我们明年再见');

-- ----------------------------
-- Table structure for `userlog`
-- ----------------------------
DROP TABLE IF EXISTS `userlog`;
CREATE TABLE `userlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `ix_userlog_addtime` (`addtime`),
  CONSTRAINT `userlog_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of userlog
-- ----------------------------
INSERT INTO `userlog` VALUES ('1', '1', '127.0.0.1', '2019-01-03 08:58:33');
INSERT INTO `userlog` VALUES ('2', '1', '127.0.0.1', '2019-01-03 10:42:19');
INSERT INTO `userlog` VALUES ('3', '2', '127.0.0.1', '2019-01-03 10:44:01');
INSERT INTO `userlog` VALUES ('4', '1', '127.0.0.1', '2019-01-03 16:52:55');
INSERT INTO `userlog` VALUES ('5', '1', '127.0.0.1', '2019-01-04 10:31:34');
INSERT INTO `userlog` VALUES ('6', '1', '127.0.0.1', '2019-01-04 10:33:56');
INSERT INTO `userlog` VALUES ('7', '1', '127.0.0.1', '2019-01-04 11:28:55');
INSERT INTO `userlog` VALUES ('8', '1', '127.0.0.1', '2019-01-04 11:30:00');
INSERT INTO `userlog` VALUES ('9', '1', '127.0.0.1', '2019-01-04 11:32:17');
INSERT INTO `userlog` VALUES ('10', '1', '127.0.0.1', '2019-01-04 11:53:16');
INSERT INTO `userlog` VALUES ('11', '1', '127.0.0.1', '2019-01-04 11:54:06');
INSERT INTO `userlog` VALUES ('12', '1', '127.0.0.1', '2019-01-04 14:33:41');
INSERT INTO `userlog` VALUES ('13', '3', '127.0.0.1', '2019-01-04 15:22:27');
INSERT INTO `userlog` VALUES ('14', '3', '127.0.0.1', '2019-01-04 15:49:55');
INSERT INTO `userlog` VALUES ('15', '3', '127.0.0.1', '2019-01-04 16:42:31');
INSERT INTO `userlog` VALUES ('16', '3', '127.0.0.1', '2019-01-04 16:49:15');
INSERT INTO `userlog` VALUES ('17', '1', '127.0.0.1', '2019-01-04 17:47:13');
INSERT INTO `userlog` VALUES ('18', '2', '127.0.0.1', '2019-01-06 16:09:01');
INSERT INTO `userlog` VALUES ('19', '2', '127.0.0.1', '2019-01-06 16:16:02');
INSERT INTO `userlog` VALUES ('20', '1', '127.0.0.1', '2019-01-06 17:53:09');
INSERT INTO `userlog` VALUES ('21', '1', '127.0.0.1', '2019-01-06 17:53:39');
INSERT INTO `userlog` VALUES ('22', '2', '127.0.0.1', '2019-01-06 17:54:07');
INSERT INTO `userlog` VALUES ('23', '2', '127.0.0.1', '2019-01-07 08:54:44');
INSERT INTO `userlog` VALUES ('24', '2', '127.0.0.1', '2019-01-07 19:46:12');
INSERT INTO `userlog` VALUES ('25', '1', '127.0.0.1', '2019-01-08 10:16:55');
INSERT INTO `userlog` VALUES ('26', '2', '127.0.0.1', '2019-01-08 10:34:14');
INSERT INTO `userlog` VALUES ('27', '2', '127.0.0.1', '2019-01-08 10:38:08');
INSERT INTO `userlog` VALUES ('28', '2', '127.0.0.1', '2019-01-08 11:01:24');
INSERT INTO `userlog` VALUES ('29', '2', '127.0.0.1', '2019-01-08 11:23:07');
INSERT INTO `userlog` VALUES ('30', '2', '127.0.0.1', '2019-01-08 11:30:39');
INSERT INTO `userlog` VALUES ('31', '2', '127.0.0.1', '2019-01-08 15:21:00');
INSERT INTO `userlog` VALUES ('32', '2', '127.0.0.1', '2019-01-08 16:20:39');
INSERT INTO `userlog` VALUES ('33', '2', '127.0.0.1', '2019-01-08 16:25:56');
INSERT INTO `userlog` VALUES ('34', '2', '127.0.0.1', '2019-01-08 16:28:15');
INSERT INTO `userlog` VALUES ('35', '2', '127.0.0.1', '2019-01-09 08:52:24');
INSERT INTO `userlog` VALUES ('36', '1', '127.0.0.1', '2019-01-09 13:39:13');
INSERT INTO `userlog` VALUES ('37', '2', '127.0.0.1', '2019-01-09 14:51:13');
INSERT INTO `userlog` VALUES ('38', '3', '127.0.0.1', '2019-01-09 15:02:05');
INSERT INTO `userlog` VALUES ('39', '3', '127.0.0.1', '2019-01-09 16:02:06');
INSERT INTO `userlog` VALUES ('40', '3', '127.0.0.1', '2019-01-09 16:17:01');
INSERT INTO `userlog` VALUES ('41', '2', '127.0.0.1', '2019-01-09 17:33:07');
INSERT INTO `userlog` VALUES ('42', '2', '127.0.0.1', '2019-01-09 17:53:37');
INSERT INTO `userlog` VALUES ('43', '2', '127.0.0.1', '2019-01-09 18:03:31');
INSERT INTO `userlog` VALUES ('44', '3', '127.0.0.1', '2019-01-09 18:03:42');
INSERT INTO `userlog` VALUES ('45', '3', '127.0.0.1', '2019-01-09 18:05:07');
INSERT INTO `userlog` VALUES ('46', '2', '127.0.0.1', '2019-01-09 19:09:43');
INSERT INTO `userlog` VALUES ('47', '7', '127.0.0.1', '2019-01-09 20:10:11');
INSERT INTO `userlog` VALUES ('48', '11', '127.0.0.1', '2019-01-09 20:30:13');
INSERT INTO `userlog` VALUES ('49', '2', '127.0.0.1', '2019-01-09 21:02:06');
INSERT INTO `userlog` VALUES ('50', '2', '127.0.0.1', '2019-01-10 08:42:05');
INSERT INTO `userlog` VALUES ('51', '3', '127.0.0.1', '2019-01-10 09:13:39');
INSERT INTO `userlog` VALUES ('52', '2', '127.0.0.1', '2019-01-10 09:24:02');
INSERT INTO `userlog` VALUES ('53', '3', '127.0.0.1', '2019-01-10 09:29:06');
INSERT INTO `userlog` VALUES ('54', '2', '127.0.0.1', '2019-01-10 09:31:28');
INSERT INTO `userlog` VALUES ('55', '3', '127.0.0.1', '2019-01-10 10:03:56');
INSERT INTO `userlog` VALUES ('56', '2', '127.0.0.1', '2019-01-10 10:05:38');
INSERT INTO `userlog` VALUES ('57', '1', '127.0.0.1', '2019-01-10 10:15:53');
INSERT INTO `userlog` VALUES ('58', '2', '127.0.0.1', '2019-01-10 10:43:27');
INSERT INTO `userlog` VALUES ('59', '2', '127.0.0.1', '2019-01-11 09:05:09');
INSERT INTO `userlog` VALUES ('60', '1', '127.0.0.1', '2019-01-11 09:24:42');
INSERT INTO `userlog` VALUES ('61', '2', '127.0.0.1', '2019-01-11 14:50:36');
INSERT INTO `userlog` VALUES ('62', '12', '127.0.0.1', '2019-01-11 17:43:28');
