/*
Navicat MySQL Data Transfer

Source Server         : stark81
Source Server Version : 80013
Source Host           : localhost:3306
Source Database       : travel

Target Server Type    : MYSQL
Target Server Version : 80013
File Encoding         : 65001

Date: 2019-01-21 12:50:46
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
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
INSERT INTO `adminlog` VALUES ('61', '1', '127.0.0.1', '2019-01-12 10:23:34');
INSERT INTO `adminlog` VALUES ('62', '1', '127.0.0.1', '2019-01-12 16:37:13');
INSERT INTO `adminlog` VALUES ('63', '1', '127.0.0.1', '2019-01-13 13:13:55');
INSERT INTO `adminlog` VALUES ('64', '1', '127.0.0.1', '2019-01-14 08:57:59');
INSERT INTO `adminlog` VALUES ('65', '1', '127.0.0.1', '2019-01-15 09:08:17');
INSERT INTO `adminlog` VALUES ('66', '1', '127.0.0.1', '2019-01-16 11:33:28');
INSERT INTO `adminlog` VALUES ('67', '1', '127.0.0.1', '2019-01-17 10:32:21');
INSERT INTO `adminlog` VALUES ('68', '1', '127.0.0.1', '2019-01-18 12:58:42');
INSERT INTO `adminlog` VALUES ('69', '1', '127.0.0.1', '2019-01-19 09:18:23');
INSERT INTO `adminlog` VALUES ('70', '1', '127.0.0.1', '2019-01-21 11:54:58');

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
INSERT INTO `alembic_version` VALUES ('243c5f2b80a5');

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
INSERT INTO `area` VALUES ('1', '广东省', '1', '广东省是中国大陆南端沿海的一个省份，位于南岭以南，南海之滨，潮汕平原素有“海滨邹鲁”之美誉，地处珠江沿岸一带的珠江三角洲一直被称作华南地区的“鱼米之乡”。广东冬暖夏长，属于热带和亚热带气候。冬暖夏凉广东的夏秋季多台风，每年的4月至9月为雨季。珠江三角洲地区更是一个“三冬无雪，四季常花”地区。购物、娱乐、美食，身心无束，玩得尽兴。', '2018-12-31 13:28:26');
INSERT INTO `area` VALUES ('2', '北京市', '0', '北京是一座迷人的城市，既有古典风韵，又具时尚气息。小胡同、老茶馆、新潮酒吧街、繁华商业区，无限的摩登元素与老北京地道的京味儿相互交融，构筑了北京城博大精深的文化底蕴和正统而不失清雅的生活方式。来北京必去的景点非天安门、故宫、长城莫属，除此以外，可根据各人的兴趣爱好进行多样化的选择。不论是情侣出行还是亲子旅游，向往皇家古迹还是时尚街区，都能在北京找到最适合的去处。', '2018-12-31 13:48:36');
INSERT INTO `area` VALUES ('3', '广西壮族自治区', '1', '美丽的八桂之地，蕴藏了丰富的矿产资源；亚热带雨林气候，孕育了大量珍贵的动植物资源；尤其盛产水果，被誉为“水果之乡”.更具特色的是，奇特的喀斯特地貌，灿烂的文物古迹，浓郁的民族风情，使广西的旅游资源独具魅力。', '2018-12-31 13:55:29');
INSERT INTO `area` VALUES ('4', '云南省', '1', '云南动植物种类数为全国之冠，素有“动植物王国”之称，被誉为“有色金属王国”，历史文化悠久，自然风光绚丽，有丽江古城、三江并流、石林、哈尼梯田、大理古城、崇圣寺三塔、玉龙雪山、洱海、滇池、噶丹松赞林寺、西双版纳热带雨林等旅游景点，非常适合与家人朋友以及独自一人前往游玩。', '2019-01-02 13:21:25');
INSERT INTO `area` VALUES ('5', '新疆维吾尔自治区', '0', '新疆维吾尔自治区，简称“新”，首府乌鲁木齐市，位于中国西北边陲，是中国五个少数民族自治区之一。面积163.1585万平方公里,是中国陆地面积最大的省级行政区，占中国国土总面积六分之一。常住人口2444.67万人（2017年末）。\r\n新疆地处亚欧大陆腹地，陆地边境线5600多公里，周边与俄罗斯、哈萨克斯坦、吉尔吉斯斯坦、塔吉克斯坦、巴基斯坦、蒙古、印度、阿富汗斯坦八国接壤，在历史上是古丝绸之路的重要通道，现在是第二座“亚欧大陆桥”的必经之地，战略位置十分重要。新疆现有47个民族成分，主要居住有汉、维吾尔、哈萨克、回、蒙古、柯尔克孜、锡伯、塔吉克、乌孜别克、满、达斡尔、塔塔尔、俄罗斯等民族，是中国五个少数民族自治区之一。', '2019-01-05 13:12:10');
INSERT INTO `area` VALUES ('6', '四川省', '0', '四川，简称“川”或“蜀”，是中华人民共和国省级行政区，省会成都。四川旅游资源丰富,拥有世界文化遗产1项，世界自然遗产3项，世界文化与自然双重遗产1项，世界灌溉工程遗产1项；国家5A级旅游景区12处，4A级景区185处；中国最佳旅游城市1座，中国优秀旅游城市21座，中国历史文化名城8座，全国重点文物保护单位230处。四川将实施“绿色四川”旅游行动计划，建设世界重要旅游目的地。', '2019-01-06 13:40:02');
INSERT INTO `area` VALUES ('7', '浙江省', '0', '浙江是典型的山水江南、鱼米之乡，被称为“丝绸之府”、“鱼米之乡”。早在5万年前的旧石器时代，就有原始人类“建德人”活动，境内有距今7000年的河姆渡文化、距今6000年的马家浜文化和距今5000年的良渚文化等文化遗存。浙江是吴越文化、江南文化的发源地，中国古代文明的发祥地之一,拥有众多良好的旅游资源。', '2019-01-09 11:11:46');

-- ----------------------------
-- Table structure for `friends`
-- ----------------------------
DROP TABLE IF EXISTS `friends`;
CREATE TABLE `friends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `focused_id` int(11) DEFAULT NULL,
  `focuser_id` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_friends_addtime` (`addtime`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of friends
-- ----------------------------
INSERT INTO `friends` VALUES ('4', '2', '1', '2019-01-19 17:04:52');
INSERT INTO `friends` VALUES ('11', '6', '1', '2019-01-19 17:59:51');
INSERT INTO `friends` VALUES ('14', '3', '2', '2019-01-20 13:02:47');
INSERT INTO `friends` VALUES ('15', '1', '2', '2019-01-20 13:07:17');
INSERT INTO `friends` VALUES ('23', '2', '5', '2019-01-20 14:33:27');
INSERT INTO `friends` VALUES ('24', '2', '6', '2019-01-21 09:37:01');

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receiver_id` int(11) DEFAULT NULL,
  `content` text,
  `send_id` int(11) DEFAULT NULL,
  `isalive` tinyint(1) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_message_addtime` (`addtime`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', '2', '这是一天测试留言。', '3', '0', '2019-01-20 15:47:28', '1');
INSERT INTO `message` VALUES ('2', '2', '你写的游记真是太棒了，让我在旅途中少踩了很多坑。', '3', '1', '2019-01-20 15:51:42', '1');
INSERT INTO `message` VALUES ('3', '2', '总之，真是太感谢了！', '3', '0', '2019-01-20 15:53:49', '1');
INSERT INTO `message` VALUES ('4', '1', '被签名打动了，已关注。', '3', '1', '2019-01-20 15:56:48', '1');
INSERT INTO `message` VALUES ('5', '2', '好高产啊！帮的', '1', '0', '2019-01-20 16:22:22', '1');
INSERT INTO `message` VALUES ('6', '2', '希望能出一个九寨沟的游记攻略，最近有九寨沟的出游计划呢。谢谢！', '3', '1', '2019-01-21 09:35:29', '1');
INSERT INTO `message` VALUES ('7', '2', '能出一篇九寨沟的游记攻略吗？先谢谢了！', '6', '1', '2019-01-21 09:37:38', '1');
INSERT INTO `message` VALUES ('8', '1', '收到了你的留言，我这边暂时没有九寨沟的出游计划呢，抱歉哈。', '2', '1', '2019-01-21 10:21:42', '1');
INSERT INTO `message` VALUES ('9', '2', '好的呢，麻烦了', '1', '1', '2019-01-21 10:24:50', '1');
INSERT INTO `message` VALUES ('10', '1', '客气客气~', '2', '1', '2019-01-21 10:39:52', '1');
INSERT INTO `message` VALUES ('11', '2', '为什么没有成功呢？奇怪了', '1', '1', '2019-01-21 10:41:18', '1');
INSERT INTO `message` VALUES ('12', '2', 'give it a try', '3', '1', '2019-01-21 11:14:38', '1');
INSERT INTO `message` VALUES ('13', '2', '新疆--浙江--广东，你的旅程真是太丰富了，期待你的下一篇游记，带我们领略国内的大好河山！', '3', '1', '2019-01-21 11:32:14', '1');
INSERT INTO `message` VALUES ('14', '2', '还不错哟', '3', '1', '2019-01-21 11:40:19', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
INSERT INTO `operlog` VALUES ('122', '1', '127.0.0.1', '删除stark81在游记\"喀纳斯之旅,带你领略不一样的新疆\"中的评论', '2019-01-12 10:50:22');
INSERT INTO `operlog` VALUES ('123', '1', '127.0.0.1', '恢复stark81在游记\"喀纳斯之旅,带你领略不一样的新疆\"中的评论', '2019-01-12 10:50:29');
INSERT INTO `operlog` VALUES ('124', '1', '127.0.0.1', '删除stark81在游记\"喀纳斯之旅,带你领略不一样的新疆\"中的评论', '2019-01-12 12:03:40');
INSERT INTO `operlog` VALUES ('125', '1', '127.0.0.1', '恢复stark81在游记\"喀纳斯之旅,带你领略不一样的新疆\"中的评论', '2019-01-12 12:03:45');
INSERT INTO `operlog` VALUES ('126', '1', '127.0.0.1', '恢复游记\"北京不得不去的地方——故宫一日游\"', '2019-01-12 16:42:01');
INSERT INTO `operlog` VALUES ('127', '1', '127.0.0.1', '删除游记\"北京不得不去的地方——故宫一日游\"', '2019-01-12 16:42:29');
INSERT INTO `operlog` VALUES ('128', '1', '127.0.0.1', '添加游记\"这是一篇测试游记\"', '2019-01-12 16:43:13');
INSERT INTO `operlog` VALUES ('129', '1', '127.0.0.1', '恢复游记\"北京不得不去的地方——故宫一日游\"', '2019-01-12 16:46:30');
INSERT INTO `operlog` VALUES ('130', '1', '127.0.0.1', '删除游记\"北京不得不去的地方——故宫一日游\"', '2019-01-12 16:46:42');
INSERT INTO `operlog` VALUES ('131', '1', '127.0.0.1', '恢复stark81在游记\"喀纳斯之旅,带你领略不一样的新疆\"中的评论', '2019-01-12 17:41:36');
INSERT INTO `operlog` VALUES ('132', '1', '127.0.0.1', '恢复李四在游记\"九寨沟游记\"中的评论', '2019-01-12 17:41:37');
INSERT INTO `operlog` VALUES ('133', '1', '127.0.0.1', '恢复李四在游记\"九寨沟游记\"中的评论', '2019-01-12 17:41:39');
INSERT INTO `operlog` VALUES ('134', '1', '127.0.0.1', '删除stark81在游记\"喀纳斯之旅,带你领略不一样的新疆\"中的评论', '2019-01-12 17:41:40');
INSERT INTO `operlog` VALUES ('135', '1', '127.0.0.1', '恢复stark81在游记\"喀纳斯之旅,带你领略不一样的新疆\"中的评论', '2019-01-12 17:41:42');
INSERT INTO `operlog` VALUES ('136', '1', '127.0.0.1', '恢复李四在游记\"九寨沟游记\"中的评论', '2019-01-12 17:41:46');
INSERT INTO `operlog` VALUES ('137', '1', '127.0.0.1', '恢复李四在游记\"九寨沟游记\"中的评论', '2019-01-12 17:41:51');
INSERT INTO `operlog` VALUES ('138', '1', '127.0.0.1', '修改景区\"故宫\"为\"故宫\"', '2019-01-13 14:12:21');
INSERT INTO `operlog` VALUES ('139', '1', '127.0.0.1', '修改景区\"故宫\"为\"故宫博物院\"', '2019-01-13 14:14:27');
INSERT INTO `operlog` VALUES ('140', '1', '127.0.0.1', '修改景区\"故宫博物院\"为\"故宫博物院\"', '2019-01-13 14:18:05');
INSERT INTO `operlog` VALUES ('141', '1', '127.0.0.1', '修改景区\"故宫博物院\"为\"故宫博物院\"', '2019-01-13 14:20:02');
INSERT INTO `operlog` VALUES ('142', '1', '127.0.0.1', '修改景区\"故宫博物院\"为\"故宫博物院\"', '2019-01-13 14:38:57');
INSERT INTO `operlog` VALUES ('143', '1', '127.0.0.1', '修改景区\"故宫博物院\"为\"故宫博物院\"', '2019-01-13 14:39:49');
INSERT INTO `operlog` VALUES ('144', '1', '127.0.0.1', '修改景区\"故宫博物院\"为\"故宫博物院\"', '2019-01-13 14:40:23');
INSERT INTO `operlog` VALUES ('145', '1', '127.0.0.1', '修改景区\"故宫博物院\"为\"故宫博物院\"', '2019-01-13 14:42:31');
INSERT INTO `operlog` VALUES ('146', '1', '127.0.0.1', '修改景区\"故宫博物院\"为\"故宫博物院\"', '2019-01-13 14:43:41');
INSERT INTO `operlog` VALUES ('147', '1', '127.0.0.1', '修改景区\"故宫博物院\"为\"故宫博物院\"', '2019-01-13 14:44:49');
INSERT INTO `operlog` VALUES ('148', '1', '127.0.0.1', '修改景区\"故宫博物院\"为\"故宫博物院\"', '2019-01-13 14:45:25');
INSERT INTO `operlog` VALUES ('149', '1', '127.0.0.1', '修改景区\"故宫博物院\"为\"故宫博物院\"', '2019-01-13 14:45:45');
INSERT INTO `operlog` VALUES ('150', '1', '127.0.0.1', '修改景区\"故宫博物院\"为\"故宫博物院\"', '2019-01-13 14:46:10');
INSERT INTO `operlog` VALUES ('151', '1', '127.0.0.1', '修改景区\"故宫博物院\"为\"故宫博物院\"', '2019-01-13 14:46:32');
INSERT INTO `operlog` VALUES ('152', '1', '127.0.0.1', '修改景区\"故宫博物院\"为\"故宫博物院\"', '2019-01-13 14:47:07');
INSERT INTO `operlog` VALUES ('153', '1', '127.0.0.1', '修改景区\"故宫博物院\"为\"故宫博物院\"', '2019-01-13 14:54:16');
INSERT INTO `operlog` VALUES ('154', '1', '127.0.0.1', '修改景区\"故宫博物院\"为\"故宫博物院\"', '2019-01-13 14:54:57');
INSERT INTO `operlog` VALUES ('155', '1', '127.0.0.1', '修改景区\"故宫博物院\"为\"故宫博物院\"', '2019-01-13 14:55:31');
INSERT INTO `operlog` VALUES ('156', '1', '127.0.0.1', '修改景区\"故宫博物院\"为\"故宫博物院\"', '2019-01-13 14:55:47');
INSERT INTO `operlog` VALUES ('157', '1', '127.0.0.1', '修改景区\"故宫博物院\"为\"故宫博物院\"', '2019-01-13 14:56:06');
INSERT INTO `operlog` VALUES ('158', '1', '127.0.0.1', '修改景区\"故宫博物院\"为\"故宫博物院\"', '2019-01-13 15:04:49');
INSERT INTO `operlog` VALUES ('159', '1', '127.0.0.1', '修改景区\"故宫博物院\"为\"故宫博物院\"', '2019-01-13 15:10:05');
INSERT INTO `operlog` VALUES ('160', '1', '127.0.0.1', '添加游记\"故宫一日游2\"', '2019-01-15 14:36:23');
INSERT INTO `operlog` VALUES ('161', '1', '127.0.0.1', '删除游记\"故宫一日游2\"', '2019-01-15 14:36:43');
INSERT INTO `operlog` VALUES ('162', '1', '127.0.0.1', '添加景区长城', '2019-01-15 17:27:07');
INSERT INTO `operlog` VALUES ('163', '1', '127.0.0.1', '添加游记\"长城一日游\"', '2019-01-15 17:43:04');
INSERT INTO `operlog` VALUES ('164', '1', '127.0.0.1', '删除游记\"长城一日游\"', '2019-01-15 17:52:41');
INSERT INTO `operlog` VALUES ('165', '1', '127.0.0.1', '删除游记\"钱塘江春行\"', '2019-01-15 18:36:44');
INSERT INTO `operlog` VALUES ('166', '1', '127.0.0.1', '删除游记\"长城1\"', '2019-01-15 18:36:45');
INSERT INTO `operlog` VALUES ('167', '1', '127.0.0.1', '删除游记\"这是一篇测试游记\"', '2019-01-15 19:14:15');
INSERT INTO `operlog` VALUES ('168', '1', '127.0.0.1', '删除游记\"故宫一日游222\"', '2019-01-16 13:30:27');
INSERT INTO `operlog` VALUES ('169', '1', '127.0.0.1', '恢复游记\"故宫一日游222\"', '2019-01-16 13:30:30');
INSERT INTO `operlog` VALUES ('170', '1', '127.0.0.1', '恢复游记\"一定要再见--广州长隆的欢乐之旅\"', '2019-01-16 14:10:13');
INSERT INTO `operlog` VALUES ('171', '1', '127.0.0.1', '恢复游记\"一定要再见--广州长隆的欢乐之旅\"', '2019-01-16 14:13:24');
INSERT INTO `operlog` VALUES ('172', '1', '127.0.0.1', '恢复游记\"一定要再见--广州长隆的欢乐之旅\"', '2019-01-16 14:34:14');
INSERT INTO `operlog` VALUES ('173', '1', '127.0.0.1', '恢复游记\"一定要再见--广州长隆的欢乐之旅\"', '2019-01-16 18:48:08');
INSERT INTO `operlog` VALUES ('174', '1', '127.0.0.1', '恢复stark81在游记\"喀纳斯之旅,带你领略不一样的新疆\"中的评论', '2019-01-16 19:00:04');
INSERT INTO `operlog` VALUES ('175', '1', '127.0.0.1', '恢复stark81在游记\"喀纳斯之旅,带你领略不一样的新疆\"中的评论', '2019-01-16 19:00:33');
INSERT INTO `operlog` VALUES ('176', '1', '127.0.0.1', '恢复面朝大海在游记\"九寨沟游记\"中的评论', '2019-01-16 19:01:49');
INSERT INTO `operlog` VALUES ('177', '1', '127.0.0.1', '修改景区\"杭州西湖景区\"为\"杭州西湖景区\"', '2019-01-16 19:28:34');
INSERT INTO `operlog` VALUES ('178', '1', '127.0.0.1', '修改景区\"九寨沟风景区\"为\"九寨沟风景区\"', '2019-01-17 10:49:28');
INSERT INTO `operlog` VALUES ('179', '1', '127.0.0.1', '恢复游记\"这是一篇测试游记\"', '2019-01-17 16:52:13');
INSERT INTO `operlog` VALUES ('180', '1', '127.0.0.1', '恢复游记\"长城1\"', '2019-01-17 16:52:19');
INSERT INTO `operlog` VALUES ('181', '1', '127.0.0.1', '恢复游记\"长城一日游\"', '2019-01-17 16:52:22');
INSERT INTO `operlog` VALUES ('182', '1', '127.0.0.1', '删除游记\"长城一日游\"', '2019-01-17 16:53:01');
INSERT INTO `operlog` VALUES ('183', '1', '127.0.0.1', '删除游记\"长城1\"', '2019-01-17 16:53:04');
INSERT INTO `operlog` VALUES ('184', '1', '127.0.0.1', '删除游记\"故宫一日游222\"', '2019-01-17 16:53:05');
INSERT INTO `operlog` VALUES ('185', '1', '127.0.0.1', '修改景区\"杭州西湖景区\"为\"杭州西湖景区\"', '2019-01-17 16:59:40');
INSERT INTO `operlog` VALUES ('186', '1', '127.0.0.1', '修改景区\"九寨沟风景区\"为\"九寨沟风景区\"', '2019-01-17 16:59:55');
INSERT INTO `operlog` VALUES ('187', '1', '127.0.0.1', '修改景区\"杭州西湖景区\"为\"杭州西湖景区\"', '2019-01-17 17:00:54');
INSERT INTO `operlog` VALUES ('188', '1', '127.0.0.1', '修改景区\"九寨沟风景区\"为\"九寨沟风景区\"', '2019-01-17 17:01:04');
INSERT INTO `operlog` VALUES ('189', '1', '127.0.0.1', '修改地区\"广东省\"为\"广东省\"', '2019-01-18 14:42:55');
INSERT INTO `operlog` VALUES ('190', '1', '127.0.0.1', '修改地区\"北京市\"为\"北京市\"', '2019-01-18 14:44:03');
INSERT INTO `operlog` VALUES ('191', '1', '127.0.0.1', '修改地区\"广西壮族自治区\"为\"广西壮族自治区\"', '2019-01-18 14:47:39');
INSERT INTO `operlog` VALUES ('192', '1', '127.0.0.1', '修改地区\"云南省\"为\"云南省\"', '2019-01-18 14:53:17');
INSERT INTO `operlog` VALUES ('193', '1', '127.0.0.1', '修改游记\"这是一篇测试游记\"', '2019-01-18 14:57:44');
INSERT INTO `operlog` VALUES ('194', '1', '127.0.0.1', '修改游记\"这是一篇测试游记\"', '2019-01-18 14:59:15');
INSERT INTO `operlog` VALUES ('195', '1', '127.0.0.1', '修改游记\"这是一篇测试游记\"', '2019-01-18 14:59:38');
INSERT INTO `operlog` VALUES ('196', '1', '127.0.0.1', '修改游记\"领略明清的风采--故宫一日游\"', '2019-01-18 15:01:48');
INSERT INTO `operlog` VALUES ('197', '1', '127.0.0.1', '修改游记\"领略明清的风采--故宫一日游\"', '2019-01-18 15:02:53');
INSERT INTO `operlog` VALUES ('198', '1', '127.0.0.1', '修改游记\"领略明清的风采--故宫一日游\"', '2019-01-18 15:03:21');
INSERT INTO `operlog` VALUES ('199', '1', '127.0.0.1', '修改游记\"领略明清的风采--故宫一日游\"', '2019-01-18 15:03:50');
INSERT INTO `operlog` VALUES ('200', '1', '127.0.0.1', '恢复游记\"北京不得不去的地方——故宫一日游\"', '2019-01-18 15:04:25');
INSERT INTO `operlog` VALUES ('201', '1', '127.0.0.1', '修改游记\"北京不得不去的地方——故宫一日游\"', '2019-01-18 15:04:43');
INSERT INTO `operlog` VALUES ('202', '1', '127.0.0.1', '修改游记\"领略明清的风采--故宫一日游\"', '2019-01-18 15:05:19');
INSERT INTO `operlog` VALUES ('203', '1', '127.0.0.1', '修改游记\"领略明清的风采--故宫一日游\"', '2019-01-18 15:05:47');
INSERT INTO `operlog` VALUES ('204', '1', '127.0.0.1', '修改游记\"领略明清的风采--故宫一日游\"', '2019-01-18 15:06:02');
INSERT INTO `operlog` VALUES ('205', '1', '127.0.0.1', '修改游记\"领略明清的风采--故宫一日游\"', '2019-01-18 15:06:22');
INSERT INTO `operlog` VALUES ('206', '1', '127.0.0.1', '修改游记\"领略明清的风采--故宫一日游\"', '2019-01-18 15:07:33');
INSERT INTO `operlog` VALUES ('207', '1', '127.0.0.1', '修改游记\"领略明清的风采--故宫一日游\"', '2019-01-18 15:08:07');
INSERT INTO `operlog` VALUES ('208', '1', '127.0.0.1', '修改游记\"领略明清的风采--故宫一日游\"', '2019-01-18 15:12:32');
INSERT INTO `operlog` VALUES ('209', '1', '127.0.0.1', '修改游记\"领略明清的风采--故宫一日游\"', '2019-01-18 15:14:18');
INSERT INTO `operlog` VALUES ('210', '1', '127.0.0.1', '修改景区\"故宫博物院\"为\"故宫博物院\"', '2019-01-18 15:15:13');
INSERT INTO `operlog` VALUES ('211', '1', '127.0.0.1', '修改游记\"邂逅龙脊梯田\"', '2019-01-18 15:20:30');
INSERT INTO `operlog` VALUES ('212', '1', '127.0.0.1', '修改游记\"北京不得不去的地方——故宫一日游\"', '2019-01-18 15:24:53');
INSERT INTO `operlog` VALUES ('213', '1', '127.0.0.1', '修改游记\"邂逅龙脊梯田\"', '2019-01-18 15:26:03');
INSERT INTO `operlog` VALUES ('214', '1', '127.0.0.1', '修改游记\"邂逅龙脊梯田\"', '2019-01-18 15:26:46');
INSERT INTO `operlog` VALUES ('215', '1', '127.0.0.1', '修改游记\"邂逅龙脊梯田\"', '2019-01-18 15:39:43');
INSERT INTO `operlog` VALUES ('216', '1', '127.0.0.1', '修改游记\"领略明清的风采--故宫一日游\"', '2019-01-18 15:40:28');
INSERT INTO `operlog` VALUES ('217', '1', '127.0.0.1', '修改游记\"领略明清的风采--故宫一日游\"', '2019-01-18 15:43:12');
INSERT INTO `operlog` VALUES ('218', '1', '127.0.0.1', '恢复游记\"长城一日游\"', '2019-01-18 15:53:20');
INSERT INTO `operlog` VALUES ('219', '1', '127.0.0.1', '修改游记\"长城一日游\"', '2019-01-18 16:33:29');
INSERT INTO `operlog` VALUES ('220', '1', '127.0.0.1', '修改景区\"长城\"为\"八达岭长城\"', '2019-01-18 16:42:43');
INSERT INTO `operlog` VALUES ('221', '1', '127.0.0.1', '删除stark81在游记\"喀纳斯之旅,带你领略不一样的新疆\"中的评论', '2019-01-18 18:07:25');
INSERT INTO `operlog` VALUES ('222', '1', '127.0.0.1', '修改游记\"领略明清的风采--故宫一日游\"', '2019-01-18 18:16:47');
INSERT INTO `operlog` VALUES ('223', '1', '127.0.0.1', '修改游记\"领略明清的风采--故宫一日游\"', '2019-01-18 18:17:33');
INSERT INTO `operlog` VALUES ('224', '1', '127.0.0.1', '修改游记\"领略明清的风采--故宫一日游\"', '2019-01-18 18:19:24');
INSERT INTO `operlog` VALUES ('225', '1', '127.0.0.1', '修改游记\"领略明清的风采--故宫一日游\"', '2019-01-18 18:19:51');
INSERT INTO `operlog` VALUES ('226', '1', '127.0.0.1', '修改景区\"九寨沟风景区\"为\"九寨沟风景区\"', '2019-01-18 18:25:13');
INSERT INTO `operlog` VALUES ('227', '1', '127.0.0.1', '修改景区\"九寨沟风景区\"为\"九寨沟风景区\"', '2019-01-18 18:25:49');
INSERT INTO `operlog` VALUES ('228', '1', '127.0.0.1', '修改景区\"龙胜梯田\"为\"龙胜梯田\"', '2019-01-18 18:54:45');
INSERT INTO `operlog` VALUES ('229', '1', '127.0.0.1', '修改景区\"广州长隆旅游度假区\"为\"广州长隆旅游度假区\"', '2019-01-18 19:02:50');
INSERT INTO `operlog` VALUES ('230', '1', '127.0.0.1', '修改景区\"广州长隆旅游度假区\"为\"广州长隆旅游度假区\"', '2019-01-18 19:03:23');
INSERT INTO `operlog` VALUES ('231', '1', '127.0.0.1', '添加景区象鼻山', '2019-01-18 19:15:51');
INSERT INTO `operlog` VALUES ('232', '1', '127.0.0.1', '添加景区大梅沙海滨公园', '2019-01-18 19:36:49');
INSERT INTO `operlog` VALUES ('233', '1', '127.0.0.1', '添加景区天山天池风景名胜区', '2019-01-18 19:48:21');
INSERT INTO `operlog` VALUES ('234', '1', '127.0.0.1', '添加景区乐山大佛', '2019-01-18 20:02:11');
INSERT INTO `operlog` VALUES ('235', '1', '127.0.0.1', '添加景区千岛湖风景区', '2019-01-18 20:12:47');
INSERT INTO `operlog` VALUES ('236', '1', '127.0.0.1', '修改游记\"北京不得不去的地方——故宫一日游\"', '2019-01-18 20:15:39');
INSERT INTO `operlog` VALUES ('237', '1', '127.0.0.1', '修改游记\"领略明清的风采--故宫一日游\"', '2019-01-18 20:17:37');
INSERT INTO `operlog` VALUES ('238', '1', '127.0.0.1', '修改景区\"象鼻山\"为\"象鼻山景区\"', '2019-01-19 09:28:44');
INSERT INTO `operlog` VALUES ('239', '1', '127.0.0.1', '修改景区\"大梅沙海滨公园\"', '2019-01-19 09:29:36');
INSERT INTO `operlog` VALUES ('240', '1', '127.0.0.1', '修改景区\"大梅沙海滨公园\"', '2019-01-19 09:34:50');
INSERT INTO `operlog` VALUES ('241', '1', '127.0.0.1', '恢复游记\"冬游西湖之人在断桥残雪处\"', '2019-01-21 11:55:09');

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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of review
-- ----------------------------
INSERT INTO `review` VALUES ('1', '3', '2', '这篇游记真是不错哟', '2019-01-03 20:48:08', '1');
INSERT INTO `review` VALUES ('2', '4', '1', '这篇游记也真是不错哟', '2019-01-07 09:10:58', '1');
INSERT INTO `review` VALUES ('3', '4', '4', '还行吧', '2019-01-07 13:33:08', '0');
INSERT INTO `review` VALUES ('4', '5', '3', '试试', '2019-01-07 13:56:39', '1');
INSERT INTO `review` VALUES ('5', '4', '1', '试一哈', '2019-01-12 11:33:13', '1');
INSERT INTO `review` VALUES ('6', '4', '2', '试一下评论之后的加载评论功能是否正常', '2019-01-12 11:37:08', '1');
INSERT INTO `review` VALUES ('7', '4', '2', '刚才出问题了,再试一下', '2019-01-12 11:37:49', '1');
INSERT INTO `review` VALUES ('8', '4', '2', '再试试', '2019-01-12 11:38:04', '0');
INSERT INTO `review` VALUES ('9', '5', '2', '试试评论之后输入框是否清空了', '2019-01-12 11:40:56', '0');
INSERT INTO `review` VALUES ('10', '5', '2', ' 试试评论之后输入框是否清空', '2019-01-12 11:42:16', '1');
INSERT INTO `review` VALUES ('11', '5', '2', '再次测试', '2019-01-12 11:42:49', '0');
INSERT INTO `review` VALUES ('12', '5', '2', '再次测试', '2019-01-12 11:45:34', '0');
INSERT INTO `review` VALUES ('13', '4', '2', '喀纳斯的边缘处就是那仁草原，它是当地哈萨克人的夏季牧场，只有在夏天的时候，他们才会骑着马把一些牛和羊从室内赶到那仁草原，如果想要来看一眼碧绿的那仁草原一定要夏季来，青草的芳香加上牛羊的叫声，那副景色就像是世外桃源一般，让人心旷神怡。吐别克很少有人知道这个地方，只有坐船才能到达这里，领略过这里风景的人们都说到了这里就像是到了新西兰。这里的景色只能由自己徒步才能领略，如果你们要去的话要记得提前订好当地的哈萨克家庭，徒步是一件非常消耗体力的事情，要提前预定好家庭，他们好拿出准备好的牛羊肉，让你们自己亲手烤着吃。', '2019-01-12 11:49:11', '0');
INSERT INTO `review` VALUES ('14', '4', '1', '哈哈哈', '2019-01-12 13:13:33', '1');
INSERT INTO `review` VALUES ('15', '4', '1', '最后一次测试', '2019-01-12 13:51:26', '1');
INSERT INTO `review` VALUES ('16', '4', '2', '测试是否刷新', '2019-01-12 14:52:32', '1');
INSERT INTO `review` VALUES ('17', '4', '2', '怎么回事???', '2019-01-12 15:14:10', '1');
INSERT INTO `review` VALUES ('18', '11', '2', '官方的游记,赶紧抢个沙发~', '2019-01-12 17:45:21', '1');
INSERT INTO `review` VALUES ('19', '7', '2', '第一是我的嘿嘿', '2019-01-12 17:52:29', '0');
INSERT INTO `review` VALUES ('20', '7', '3', '二楼', '2019-01-13 13:01:22', '0');
INSERT INTO `review` VALUES ('21', '7', '3', '三楼', '2019-01-13 13:01:39', '1');
INSERT INTO `review` VALUES ('22', '11', '3', '试一下这里写了评论,外面主页能否刷新到', '2019-01-13 13:02:32', '1');
INSERT INTO `review` VALUES ('23', '7', '3', '试一下这里写的评论,主页的评论数是否会刷新', '2019-01-13 13:05:18', '1');
INSERT INTO `review` VALUES ('24', '4', '2', '你好', '2019-01-14 19:15:27', '0');
INSERT INTO `review` VALUES ('25', '14', '3', '发表了这么久，都没人评论，挽个尊。。。', '2019-01-21 11:27:31', '1');
INSERT INTO `review` VALUES ('26', '13', '3', '真是及时，假期准备带家人去长隆玩。', '2019-01-21 11:51:50', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of scenic
-- ----------------------------
INSERT INTO `scenic` VALUES ('1', '故宫博物院', '5', '201901020921333ab7dd9ef669436ab6743a55a45fea98.png', '北京故宫是中国明清两代的皇家宫殿，旧称为紫禁城，位于北京中轴线的中心，是中国古代宫廷建筑之精华。北京故宫以三大殿为中心，占地面积72万平方米，建筑面积约15万平方米，有大小宫殿七十多座，房屋九千余间。是世界上现存规模最大、保存最为完整的木质结构古建筑之一。\r\n1949年中华人民共和国成立以后，对故宫建筑进行了大规模的修缮，同时整理出大量的文物。1961年国务院颁布故宫为全国重点文物保护单位。故宫博物院现存文物150万件（套）。1987年故宫被联合国教科文组织列为“世界文化遗产”，辟为“故宫博物院”。\r\n\r\n有1.2万盆从洛阳抵京的牡丹被分散布置于慈宁宫花园、乾清门广场、慈宁宫、寿康宫、永康左门—右门、隆宗门外等区域，重现了清代紫禁城牡丹花开盛况。2018年5月24日，故宫博物院决定自2018年6月开始实行周一全年闭馆，国家法定节假日除外。', '<p>紫禁城占地面积广，各种景点也是相当丰富。总体上看，紫禁城主要是分为<strong>前朝（外朝）、后寝（内廷）</strong>；从小的方面来看，紫禁城主要分为：<strong>大朝典礼区</strong>、<strong>宫寝生活区</strong>、<strong>太上皇宫殿区</strong>、<strong>太后太妃养老区</strong>、<strong>太子宫殿区</strong>、<strong>皇子生活区</strong>、<strong>御苑与庙宇区</strong>、<strong>城池侍卫区</strong>、<strong>府库与衙署区</strong>。</p>\r\n\r\n<h3><strong>前朝（外朝）：</strong></h3>\r\n\r\n<p>所谓前朝，或称外朝，占据着紫禁城南部宽阔广大的区域。这里的宫殿宏伟、庄重，庭院壮阔、坦荡，以禁城午门、宫门太和门以及太和、中和、保和三大殿为中央轴线，体仁阁、弘义阁两厢辅立，文华殿、武英殿东、西翼护，构成了皇帝举行重大礼仪，群臣朝见天子的庄严场合。</p>\r\n\r\n<h3><strong>后寝（内廷）：</strong></h3>\r\n\r\n<p>后寝区，又称内廷，为紫禁城北部皇室生活区域的统称。这里以皇帝、皇后的正寝宫殿乾清、坤宁二宫为中央，东、西分布皇帝的便殿，和后妃们居住的东六宫、西六宫，以及皇子们生活的乾东五所、乾西五所等院落。再向东为乾隆皇帝兴建起的太上皇宫殿院落宁寿宫区，外西路则是供太后、太妃们养老的慈宁宫、寿康宫、寿安宫等区域。后寝区域院落重重，宫壼深深，建筑格局严谨中有巧妙，装饰风格豪华中有秀雅，内廷礼仪、寝居场合之外、又有书房、佛堂、苑囿等处所，留有古代皇家生活的许多遗迹。</p>\r\n\r\n<h3><strong>旅游须知：</strong></h3>\r\n\r\n<p><small><big>电话：010-85007421</big></small></p>\r\n\r\n<p><small><big>网址：http://www.dpm.org.cn</big></small></p>\r\n\r\n<p><small><big>开放时间：除法定节假日和暑期（每年7月1日至8月31日）外，故宫博物院全年实行周一全天闭馆的措施。</big></small></p>\r\n\r\n<p><small><big>门票：</big></small></p>\r\n\r\n<p><small><big>（1）每年4月1日至10月31日为旺季，大门票60元/人；（2）每年11月1日至次年3月31日为淡季，大门票40元/人。</big></small></p>\r\n', '2', '北京市东城区长安街', '1', '2019-01-02 09:21:33');
INSERT INTO `scenic` VALUES ('2', '龙胜梯田', '4', '201901181854452f3e186e76104d4db12bf76d976ab347.jpg', '龙脊梯田，是指在龙脊山上开发出的梯田，从广义说叫做龙胜梯田，从狭义上称为龙脊梯田。位于广西龙胜各族自治县龙脊镇平安村龙脊山，距县城22公里。距桂林市80公里，处东经109°32\'～110°14\'北纬25°35\'～26°17\'之间。\r\n龙脊梯田分为金坑（大寨）瑶族梯田观景区，平安壮族梯田观景区。通常意义上的龙脊梯田是指龙脊平安壮族梯田，也是开发较早的梯田。梯田分布在海拔300米至1100米之间，最大坡度达50度，前往梯田几乎都是盘山公路，一直升到约海拔600米以上，到梯田时海拔达到880米。', '<h3>金竹壮寨</h3>\r\n\r\n<p>金竹壮寨位于和平乡金竹寨，距县城约17公里。传说在壮族先民定居以前，这里是一片金色的竹林，乃是石龙之身．后壮族世代定居在此风水宝地后，取名&ldquo;金竹&rdquo;壮寨。此寨建于清末，世为壮族聚居，长期封闭，是典型的壮寨。1992年被联合国教科文组织誉为壮寨楷模。它是龙脊十三寨之首。村寨为原汁原味的古干栏建筑。石板台级路通达村寨的里里外外，虽经多年沧桑，&ldquo;麻栏&rdquo;木楼依然错落挺立。村中鸟语花香，四周为梯田和生态林，环境幽雅。村中有戏台一个，能同时容纳100多人。金竹壮寨的旅游可进入性较好，旅游接待设施和服务较为完备，吃、娱、游、购基本具备。来到金竹壮寨，你能够了解到壮民崇拜物&mdash;&mdash;莫一大王，听到优美的壮族山歌，欣赏到传统古朴的反映壮族先民生活原始情景的师公舞、竹竿舞、竹梆舞、扁担舞、绣绣球等。</p>\r\n\r\n<h3>龙脊古壮寨</h3>\r\n\r\n<p>位于和平乡龙脊寨。因海拔600余米，寨楼终日被水光映照，云影拂弄，犹如天宫仙境，与千亩梯田成为奇景。村寨有200多户，1000多人，为潘、廖、侯三姓的壮族聚居区。村寨最大特点是其建筑相当古朴，历史久远，有几处甚至有上百年的历史，且保持相当完好．古壮寨的特色十分突出。在龙脊古壮寨不仅能观赏到最为原始的壮寨建筑格调，而且可以步行石板路观赏到古壮寨内的三鱼共首石桥、龙泉亭、康熙兵营旧址、清乾隆潘天红廉政碑、太平清缸、石碾以及古石寨门等古朴的名胜古迹和纯朴的民风民俗。</p>\r\n\r\n<h3>平安壮寨</h3>\r\n\r\n<p>位于和平乡龙脊梯田景区，建于清至民国，是龙脊观光的核心寨。下距金竹寨6公里，上距龙脊古壮寨2公里，全为壮族世居。1990年开辟成龙脊游览观赏村寨之一。该寨高耸在龙脊梯田的山梁上，是一大型壮寨，有180多户，740多人。村寨保持传统的麻栏式三层木楼，全杉木结构，是桂北地区典型的高脚干栏型建筑。&ldquo;之&rdquo;字型的石板道把全寨各户相连。</p>\r\n', '3', '广西桂林市龙胜县东南部和平乡境内的平安村', '0', '2019-01-02 17:27:12');
INSERT INTO `scenic` VALUES ('3', '广州长隆旅游度假区', '5', '201901051457489ff5dc1370cd4f2882c6ba15e360ed59.jpg', '长隆旅游度假区，国家级AAAAA景区，占地面积1万亩，是一家集旅游景点、酒店餐饮、娱乐休闲于一体的大型企业集团，坐落于羊城广州。作为广东省旅游龙头企业集团，长隆集团曾先后接待过众多党和国家领导人、国际政要，除此外还接待过众多社会名流。', '<h3>长隆欢乐世界</h3>\r\n\r\n<p>长隆欢乐世界位于中国首批5A级旅游景区长隆旅游度假区的中心位置，占地面积约2000亩，是长隆集团斥资20亿元人民币倾力打造的集乘骑游乐、特技剧场、巡游表演、生态休闲、特色餐饮、主题商店、综合服务于一体的具国际先进技术和管理水平的超大型世界顶尖主题游乐园。<br />\r\n　　长隆欢乐世界拥有游乐设施70余套，是目前国内在设备上投入至多、引进至多的全球大型游乐园。大部分游乐设备均从欧洲原装进口，其设计与技术均保持国际领先水平，其中独有八项亚洲及世界之最，包括：垂直过山车、十环过山车、摩托过山车、飞马家庭过山车、U型滑板、超级水战、特技表演、超级大摆锤以及世界上至先进的四维影院。其中垂直过山车、十环过山车为全球仅有的第二台，而垂直过山车仅单项投资就超过2亿元人民币，由全球著名游乐设备提供商Intamin提供。<br />\r\n　　除游乐项目外，园区内还邀请体现美国牛子力量的北美伐木表演专业队伍加盟。此外，还有来自二十多个国家的200多位演艺精英组成的娱乐大巡游以及《欢乐剧场》的魔术表演等多种节目供游客观看。</p>\r\n\r\n<h3>长隆野生动物世界</h3>\r\n\r\n<p>广州长隆野生动物世界，是全世界动物种群最多、最大的野生动物主题公园，园区占地2000多亩，拥有华南地区亚热带雨林大面积原始生态，是目前国内最大的原生态动物园；</p>\r\n\r\n<p>珍稀濒危动物最多，园区拥有10只大熊猫、22多只树熊（考拉）、150多只白虎等世界各国国宝在内的500多种20,000余只珍奇动物，园区内的珍稀动物物种，以种群的形式生活，使得整个物种得以繁衍生息；拥有全国首创的自驾车看动物模式，自驾园区占地面积近100万平方米；拥有全世界表演阵容最强大的白虎表演等四大动物表演秀。拥有全球顶尖的动态高仿真实景恐龙园。</p>\r\n\r\n<h3>长隆飞鸟乐园</h3>\r\n\r\n<p>长隆飞鸟乐园（原广州鳄鱼公园）隶属全国首批、广州唯一5A国家级旅游景区长隆旅游度假区，园区坐拥2000余亩苍翠绿地，是广州少有的大型的湿地生态动物公园，拥有各种珍稀湿地鸟类数十种，婀娜多姿。同时，这里还是全球最大的鳄鱼主题公园，拥有鳄鱼总数超过10万条。园内包括多个分区，其中包括鹈鹕湾、仙鹤湾、天鹅湾、钓鳄岛、鳄鱼长廊、爬行动物科普馆等展区集动物观赏、科普教育、生态观光于一体，十大精彩湿地动物表演趣味纷呈、寓教于乐。</p>\r\n', '1', '广东省广州市番禺区迎宾路长隆旅游度假村', '1', '2019-01-05 10:31:47');
INSERT INTO `scenic` VALUES ('4', '喀纳斯风景区', '5', '20190109105929a1ca446e7514446da55b492e933c9a89.jpg', '喀纳斯风景区位于新疆阿尔泰山中段，地处中国与哈萨克斯坦、俄罗斯、蒙古国接壤地带。景区面积10030平方公里喀纳斯景区内共有大小景点55处，分属33种基本类型，主要包括哈纳斯国家级自然保护区、喀纳斯国家地质公园、白哈巴国家森林公园、贾登峪国家森林公园、喀纳斯河谷、禾木河谷、那仁草原、禾木草原及禾木村、白哈巴村、喀纳斯村等国内外享有盛名的八大自然景观区和三大人文景观区。', '<p>喀纳斯风景区位于新疆阿尔泰山中段，地处中国与哈萨克斯坦、俄罗斯、蒙古国接壤地带。景区面积10030平方公里喀纳斯景区内共有大小景点55处，分属33种基本类型，主要包括哈纳斯国家级自然保护区、喀纳斯国家地质公园、白哈巴国家森林公园、贾登峪国家森林公园、喀纳斯河谷、禾木河谷、那仁草原、禾木草原及禾木村、白哈巴村、喀纳斯村等国内外享有盛名的八大自然景观区和三大人文景观区。</p>\r\n\r\n<p><img alt=\"\" src=\"/static/uploads/ckeditor/201901051316212c78f6b2c545424392b4193b9238fec5.jpg\" style=\"height:535px; width:790px\" /></p>\r\n\r\n<p>喀纳斯风景区位于阿尔泰山地地貌与植被垂直带，自高向低，海拔3000米以上为现代冰川与永久积雪覆盖的高山冰雪寒冻带、海拔2400&mdash;3000米为冰缘亚高山寒冻苔原垫状草甸带、海拔1300&mdash;2400米为中山寒温针叶林草原带（由针叶树种西伯利亚落叶松、西伯利亚冷杉、西伯利亚云杉、西伯利亚红松组成）、海拔800&mdash;1500米为低山丘陵灌木草甸草原带、海拔800米以下是山前冲洪积平原绿洲荒漠带，垂直分层明显，阿尔泰山6－7个垂直自然景观带的真貌。</p>\r\n', '5', '新疆阿勒泰地区布尔津县北部', '1', '2019-01-05 13:17:21');
INSERT INTO `scenic` VALUES ('5', '九寨沟风景区', '5', '20190105165056a97a398f6c5f44c8a07a56bd03c246e8', '九寨沟的得名来自于景区内九个藏族寨子（树正寨、则查洼寨、黑角寨、荷叶寨、盘亚寨、亚拉寨、尖盘寨、热西寨、郭都寨），这九个寨子又称为“何药九寨”。由于有九个寨子的藏民世代居住于此，故名为“九寨沟”。\r\n九寨沟——世界自然遗产、国家重点风景名胜区、国家AAAAA级旅游景区、国家级自然保护区、国家地质公园、世界生物圈保护区网络，是中国第一个以保护自然风景为主要目的的自然保护区。九寨沟景区在外也美名远播，东方人称之为“人间仙境”，西方人则将之誉为“童话世界”。', '<p>四川旅游胜地九寨沟,蓝天、白云、雪山、森林、尽融于瀑、河、滩、缀成一串串宛若从天而降的珍珠；篝火、烤羊、锅庄和古老而美丽的传说，展现出藏羌人热情强悍的民族风情。九寨沟，一个五彩斑斓、绚丽奇绝的瑶池玉盆，一个原始古朴、神奇梦幻的人间仙境，一个不见纤尘、自然纯净的&ldquo;童话世界&rdquo;!现代肖草《九寨沟》诗：&ldquo;放眼层林碧水涟，鱼游云顶鸟儿欢。飞流洒落拂衣去，九寨山青誉海天&rdquo;对九寨沟予以真实的诠释。她以神妙奇幻的翠海、飞瀑、彩林、雪峰等无法尽览的自然与人文景观，成为全国唯一拥有&ldquo;世界自然遗产&rdquo;和&ldquo;世界生物圈保护区&rdquo;两顶桂冠的圣地。 九寨沟以原始的生态环境，一尘不染的清新空气和雪山、森林、湖泊组合成神妙、奇幻、幽美的自然风光，显现&ldquo;自然的美，美的自然&rdquo;，被誉为&ldquo;童话世界九寨沟的高峰&rdquo;、彩林、翠海、叠瀑和藏情被称为&ldquo;五绝&rdquo;。因其独有的原始景观，丰富的动植物资源被誉为&ldquo;人间仙境&rdquo;。</p>\r\n\r\n<p>九寨沟纵深40多公里，总面积6万多公顷，三条主沟形成Y形分布，总长达60余公里。由于交通不便，这里几乎成了一个与世隔绝的地方。仅有九个藏族村寨坐落在这片崇山峻岭之中，九寨沟因此得名。这里保存着具有原始风貌的自然景色，有着自己的特殊景观。据说，在世界别的地方已经很难见到。九寨沟既是自然保护区，又是国家级风景名胜区，同时，被列入世界人类自然遗产名录。</p>\r\n\r\n<h3><strong>主要景点</strong></h3>\r\n\r\n<p><strong>珍珠滩瀑布、珍珠滩：</strong>珍珠滩瀑布宽达300多米，宽阔的水帘倾泻而下，气势磅礴。水帘在淡黄色的钙华滩上飞溅，在阳光的照耀下宛如一颗颗璀璨的珍珠，珍珠滩由此得名。86版电视剧《西游记》的片头景就是在此拍摄。</p>\r\n\r\n<p><strong>五花海：</strong>位于日则沟孔雀河尽头，深秋时节，五花海四周五彩斑斓的树木倒映在湖水中，仿佛进入了一个奇幻的梦境。</p>\r\n\r\n<p><strong>树正群海：</strong>树正群海由二三十个大小不一的海子组合而成，呈梯田状，层次分明，绵延数里，颇为壮观。</p>\r\n', '6', '四川省阿坝藏族羌族自治州', '1', '2019-01-05 16:50:56');
INSERT INTO `scenic` VALUES ('6', '杭州西湖景区', '5', '2019011011394664ff1ed8d2ba4329b6549e5859699b43.jpg', '西湖，位于浙江省杭州市西面，是中国大陆首批国家重点风景名胜区和中国十大风景名胜之一。它是中国大陆主要的观赏性淡水湖泊之一，也是现今《世界遗产名录》中少数几个和中国唯一一个湖泊类文化遗产。\r\n西湖三面环山，面积约6.39平方千米，东西宽约2.8千米，南北长约3.2千米，绕湖一周近15千米。湖中被孤山、白堤、苏堤、杨公堤分隔，按面积大小分别为外西湖、西里湖、北里湖、小南湖及岳湖等五片水面，苏堤、白堤越过湖面，小瀛洲、湖心亭、阮公墩三个小岛鼎立于外西湖湖心，夕照山的雷峰塔与宝石山的保俶塔隔湖相映，由此形成了“一山、二塔、三岛、三堤、五湖”的基本格局。', '<p>关于西湖生成的原因，古代有关书籍记载都较简略。明朝《西湖游览志》卷一载：&ldquo;西湖三面环山，溪谷缕注，下有渊泉百道，潴而为湖。&rdquo;近代学者从地形、地质、沉积及水动力学等方面进行了考证，其中较为普遍的观点认为西湖是由海湾逐渐演变而生的一个潟湖。民国九年（1920年），科学家竺可桢考察西湖地形后发表了《杭州西湖生成的原因》，其称：&ldquo;西湖原是钱塘江左边的一个小小湾儿，后来由于钱塘江泥沙沉淀下来，慢慢地把湾口塞住，变成一个潟湖。&rdquo;竺可桢还从沉积率推断，西湖开始形成年代距今一万二千年前。竺氏认为西湖形成之初，后由于三面山区中的溪流注入，所挟沙逐渐填充西湖，湖面随之逐渐缩小，倘若没有历代的不断疏浚，西湖早已湮废。1924年，地质学者章鸿钊发表《杭州西湖成因一解》，对竺氏的观点又进行了补充：西湖之成，其始以潮力所向而积成湖堤，其继以海滩变迁而维持湖面，二者为形成西湖之重要条件。</p>\r\n\r\n<p>但是，潟湖说在现代科学考察中受到了怀疑。1950年以后，地质部门对西湖湖中三岛和湖滨公园地质钻孔取样分析，认为距今一亿五千万年的晚侏罗纪时，以今湖滨公园一带为中心，曾发生过一次强烈的火山爆发，宝石山和西湖湖底（大部分）堆积下大量火山岩块，由此，曾出现火山口陷落，造成马蹄形核心低洼积水，即西湖雏型。1979年，地质工作者对湖滨钻孔采取的岩样作微体古生物分析后著文认为，根据不同化石的组合，西湖的形成过程可划分为早期潟湖、中期海湾、晚期潟湖三个阶段，随着钱塘江沙坎的发育，西湖终于完全封闭，水体逐渐淡化，形成近代的西湖。</p>\r\n\r\n<p>西湖周围的群山，属于天目山余脉。根据岩性差别和山势高低，可分为内、外两圈。外圈有北高峰、天马山、天竺山、五云山等，属高丘陵地形，山体主要由志留、泥盆纪岩屑砂岩、石英砂岩构成，岩性较坚硬，不易风化侵蚀。峰峦挺秀，溪涧纵横，流水清洌，是西湖泉水最多地带。内圈有飞来峰、南高峰、玉皇山、凤凰山、吴山等，山势较低，属低丘陵地形。山体均为向斜山地，主要由石炭、二迭纪石灰岩构成，易受水流溶蚀，形成了烟霞、水乐、石屋、紫来、紫云等溶洞。内圈的群山，除岩溶丘陵外，还有横亘西湖北缘的葛岭、宝石山，由火山碎屑岩组成，海拔在百米左右。</p>\r\n', '7', '浙江杭州市', '1', '2019-01-10 11:39:47');
INSERT INTO `scenic` VALUES ('7', '八达岭长城', '5', '201901151727065857ad2f2162468bac2c01f547f206b9', '1991年8月，八达岭作为万里长城的精华，在北京故宫博物馆，接受了联合国教科文组织颁发的人类文化遗产证书。 [4]  1991年12月，在珠海举行的中国旅游胜地四十佳评选活动揭晓命名大会上（全国候选景点94个，回收有效选票48万张），八达岭因其景点著名，以37万张的绝对多票数，成为中国旅游胜地四十佳之首。\r\n2000~2009年，共有500余名世界各国的国家元首、政府首脑或执政党领袖登上过八达岭长城。\r\n2007年5月8日，八达岭长城经国家旅游局正式批准为国家5A级旅游景区。', '<h3>望京石</h3>\r\n\r\n<p>位于八达岭关城东门外，&ldquo;居庸外镇&rdquo;关门前大道南侧。为一块高1米、长15米的天然花岗石，上刻&ldquo;望京石&rdquo;三个字。</p>\r\n\r\n<h3>天险留题</h3>\r\n\r\n<p>位于东关门内侧，今熊乐园右上方山崖上。在一块凿平的崖壁上，刻有&ldquo;天险&rdquo;二字，为清道光十五年（1835年）延庆州知州童恩所题，保阳刘振宗镌刻。</p>\r\n\r\n<h3>关隘</h3>\r\n\r\n<p>八达岭原为隘口，后建关城。明隆庆三年（1569年）至万历十年（1582年）在各口修建障塞，并在各口两侧的山上建起边城、梢墙、挡马墙等，后来逐渐增建为长城，并修筑敌楼、墩台。起自川草花顶，经石佛寺口、青龙桥东口、青龙桥西口、王瓜峪口、八达岭口、化木梁口、于家冲口、黑豆谷口至石峡峪，全长约12千米。八达岭长城、关城、城墙、要塞及关沟中部的居庸关构成明代北京完整的军事防御体系。</p>\r\n', '2', '北京市延庆区军都山关沟古道北口', '0', '2019-01-15 17:27:07');
INSERT INTO `scenic` VALUES ('8', '象鼻山景区', '5', '20190118191550300d625d2bdf414da8d06270d6e7395f.jpg', '象鼻山原名漓山，位于广西区桂林市内桃花江与漓江汇流处，山因酷似一只站在江边伸鼻豪饮漓江甘泉的巨象而得名，被人们称为桂林山水的象征。\r\n象鼻山以神奇著称。其神奇，首先是形神毕似，其次是在鼻腿之间造就一轮临水明月，构成“象山水月”奇景。因此，象鼻山是桂林的城徽山，是桂林旅游的标志山，它坐落在桂林市中心的漓江与桃花江汇流处，形似一头巨象，象鼻和象腿之间是面积约一百五十平米的圆洞，江水穿洞而过，如明月浮水。坐落西岸的象山水月与漓江东岸的穿月岩相对，一挂于天，一浮于水，形成“漓江双月”的奇特景观。', '<h3>水月洞<a href=\"https://baike.baidu.com/pic/%E8%B1%A1%E9%BC%BB%E5%B1%B1/26203/0/ca1349540923dd54ad54087adc09b3de9c8248f9?fr=lemma&amp;ct=single\" target=\"_blank\"><img alt=\"象鼻山\" src=\"https://gss3.bdstatic.com/-Po3dSag_xI4khGkpoWK1HF6hhy/baike/s%3D220/sign=2bb896d63cadcbef053479049caf2e0e/ca1349540923dd54ad54087adc09b3de9c8248f9.jpg\" style=\"float:right; height:120px; margin:10px; width:160px\" /></a></h3>\r\n\r\n<p>在象鼻山的象鼻和象腿之间。距今约1.2万年前， 地壳抬升，漓江缩小，加速了水月洞的发育，形成一个通透的圆洞。长17米，宽9.5，高12米，面积约150平方米。《象山记》载， &ldquo;有石穴一，彼此可以相望，形圆而长，其半入于漓水中，水时高时下，故其穴亦时有大小&rdquo;。</p>\r\n\r\n<p>水月洞洞口朝阳，亦名朝阳洞。但洞在水上，如明月浮水，十分形象，所以水月之名，一直沿用至今。&ldquo;象山水月&rdquo;是桂林山水一大奇景，文人学士属文赋句，莫不叹为观止。宋蓟北处士《水月洞》诗有&ldquo;水底有明月，水上明月浮。水流月不去，月去水还流&rdquo;之句，细致刻画了天上、洞中，水底月亮相互辉映的奇迹。象山的水月与南望的穿山月岩相对， 一悬于天，一浮于水，形成&ldquo;漓江双月&rdquo;的奇特景观。</p>\r\n\r\n<h3>朝阳亭</h3>\r\n\r\n<p>在象鼻山水月洞内，始建于宋，亭已早废，但远在800多年前，围绕水月洞的命名，两位桂州前后任的地方长官之间展开的一场背靠背的笔墨官司，一直成为到此游览的人们永恒的话题。原来，南宋乾道二年（公元1166年），张孝祥游水月洞留连至晚不归，不久再度重游， 一高兴题诗作序，因洞口东向，把亭名、洞名、岩名统统已为&ldquo;朝阳&rdquo;，并把记述其事的《朝阳亭诗序》刻在水月洞北壁。其后，范成大主桂，持不同意见，恢复了原名，写下《复水月洞铭》，并镌在洞的南壁。</p>\r\n\r\n<h3>舍利塔</h3>\r\n\r\n<p>舍利塔在开元寺遗址内，开元寺建于隋代，唐时称善兴寺，宋改为宁寿寺，其殿宇恢弘幽深，是桂林最古老的一座佛寺。塔高13.2米，始建于唐朝，于明朝重建。位于象鼻山的西南面，桃花江畔。宝瓶式塔身，伞盖般塔顶，有相轮五圈，冠以葫芦形铜质宝顶。据记载，唐天宝七年，鉴真和尚5次东渡日本受阻，转辗来到桂林，曾与数十位日本僧人居留寺中年余。</p>\r\n', '3', ' 广西壮族自治区桂林市桃花江与漓江汇流处', '1', '2019-01-18 19:15:51');
INSERT INTO `scenic` VALUES ('9', '大梅沙海滨公园', '5', '201901181936489c540e4a7d34451d81af94bde8681ab3.jpg', '大梅沙海滨公园于1999年6月18日建成，建设总投入高达1.2亿元，是广东省5A级旅游景区。位于深圳特区的东部、风光旖旎的大鹏湾畔。这里三面环山，中间开阔平缓，一面临海，1800米的沙滩就镶嵌在这环碧艺海路之间。\r\n大梅沙海滨公园作为深圳市委、市政府在99年度为民办十件实事之一，免费向公众开放。大梅沙海滨公园拥有独特的山海景观资源。公园三面环山，一面临海，中间则是平缓开阔的沙滩。', '<h3>太阳--月亮广场<img alt=\"\" src=\"/static/uploads/ckeditor/201901181936139bf606531bed4d53a7d631624b26791a.jpg\" style=\"float:right; height:144px; margin:10px; width:200px\" /></h3>\r\n\r\n<p>太阳广场处于公园的中心，总面积达13万平方米，有3个大小不一，风格各异的张拉膜，每个张拉膜下都设有供游客休闲、更衣、洗手的各种设施。月亮广场位于公园的西部，总面积4000余平方米，周边建有3个张拉膜及多间商铺。而两者之间是阳光走廊，全长432米，是太阳广场和月亮广场之间的通道之一。走廊内设有供游客休憩的磨光石凳，走廊的顶棚则覆盖。</p>\r\n\r\n<h3>愿望塔</h3>\r\n\r\n<p>高83.6米，耸立于太阳广场的最东侧，内设电梯及愿望台。塔身采用钢结构。愿望塔是&ldquo;愿望山-愿望湖-愿望搭&rdquo;体系的最后一环。并设有动力伞、摩托艇、月光酒吧、烧烤场等娱乐服务。</p>\r\n', '1', '深圳市盐田区大梅沙94号', '0', '2019-01-18 19:36:49');
INSERT INTO `scenic` VALUES ('10', '天山天池风景名胜区', '5', '20190118194820020f0971f14544b3bf4e1578488f3eaf.jpg', '新疆天山天池风景名胜区是中国国家级风景名胜区、国家AAAAA级风景区。风景区总面积达160平方公里（规划面积548平方公里），以天池为中心，北起石门、南到雪线、西达马牙山、东至大东沟，有完整的4个垂直自然景观带。\r\n2013年，新疆天山天池风景名胜区被列入联合国教科文组织世界遗产名录。2015年6月，天山天池的西王母神话列入中国第四批国家级非物质文化遗产代表性项目。2015年，被国家旅游局评为首批“中国旅游价格信得过景区。2016年，荣登“十一”假日旅游红榜，被国家旅游局评为“旅游秩序最佳景区”。主要景点有、小天池、灯杆山、天池北坡游览区、醴泉洞等等。', '<h3>石门</h3>\r\n\r\n<p>天池石门，景名为&ldquo;石门一线&rdquo;，海拔1500米，位于大天池以北5.9公里处，为一段被三工河古河道切割形成的石峡谷，这道山口是进入风景区的天然门户；峡谷长约百余米，最窄处仅十来米宽，两侧直立的岩壁高逾数十米，形势峻险，仰视见一线天，侧边盘绕三工河水。</p>\r\n\r\n<p>五十盘，景名为五十盘天，是在石门以下的一处纡回山径，<em>（今）</em>过石门后，从其上的平岗&ldquo;又一村&rdquo;开始上天池顶的盘山公路，约五十盘。</p>\r\n\r\n<h3>西小天池</h3>\r\n\r\n<p>西小天池，海拔1600米（一说1660米），位于主湖（天池大海子）西北，在其脚下西北侧约两公里处，五十盘公路第三盘的右下方，湖水由天池大坝西南渗漏，以瀑布形式注入潭中，并泻入三工河；古称玉女潭，相传为西王母洗脚处，景名为&ldquo;王母脚盆&rdquo;，又称小龙潭，因而也称作&ldquo;龙潭碧月&rdquo;。</p>\r\n\r\n<p>西小天池瀑布，景称为&ldquo;玉带银帘&rdquo;飞挂在过西小天池不远的路右侧，凌空垂落数十米，下泻即形成西小天池；传说是王母娘娘的洗澡水，对面山巅上光绪年间建有六角、尖顶的&ldquo;观瀑亭&quot;。</p>\r\n\r\n<p>醴泉洞，为西小天池瀑布的源头，此处似洞非洞，隐蔽难寻，又称&ldquo;隐乳洞&rdquo;，故景名为&ldquo;醴泉隐乳&rdquo;；泉水从地下涌出，清净甘甜，传说是王母娘娘的醴泉。《史记》卷一百二十三曰：&ldquo;《禹本记》言：&lsquo;河山昆仑。昆仑其高二千五百余里，日月所避隐为光明也，其上有醴泉、瑶池&rsquo;。</p>\r\n\r\n<h3>铁瓦寺遗址</h3>\r\n\r\n<p>铁瓦寺遗址，位于天池西侧距湖边700米处，坐落在一块四千多平方的台地上，座西南、向东北，背靠山面天池；三面青松环绕，幽静清雅，正前方平坦开阔，天然留出一道视野；海北堤坝、湖水，海东卧龙山景，以及游人行色尽收眼底；铁瓦寺建造时间有两种说法；元代初年，全真派道主邱处机应召面觐西征途中的成吉思汗，带领十八弟子来到天山脚下，邱处机师徒在天池岸边山上修建一寺，以铁瓦盖顶因而叫铁瓦寺；另一种说法是铁瓦寺建于清代乾隆四十一年（1776年），因用青砖砌墙铁瓦铺顶，故名；铁瓦寺在历史上曾三建三毁，清代更名为福寿寺，1946年于右任游览天池时下榻福寿寺中，看到佛道杂糅、道观以寺命名的状况不解，提笔书了一个名称&ldquo;灵山道观&rdquo;。</p>\r\n', '5', '新疆维吾尔自治区昌吉回族自治州阜康市境内博格达峰下的半山腰', '0', '2019-01-18 19:48:21');
INSERT INTO `scenic` VALUES ('11', '乐山大佛', '5', '201901182002115712e1d42d72417bbb75f971e8207fb3.jpg', '古代的乐山三江汇流之处，岷江、青衣江、大渡河三江汇聚凌云山麓，水势相当的凶猛，舟辑至此往往被颠覆。每当夏汛，江水直捣山壁，常常造成船毁人亡的悲剧。海通禅师为减杀水势，普渡众生而发起，招集人力，物力修凿的。\r\n佛像于唐玄宗开元初年（公元713年）开始动工，当大佛修到肩部的时候，海通和尚就去世了。海通死后，工程一度中断。多年后，剑南西川节度使章仇兼琼捐赠俸金，海通的徒弟领着工匠继续修造大佛，由于工程浩大，朝廷下令赐麻盐税款，使工程进展迅速。当乐山大佛修到膝盖的时候，续建者章仇兼琼迁家任户部尚书，工程再次停工。四十年后，剑南西川节度使韦皋捐赠俸金继续修建乐山大佛。在经三代工匠的努力之下，至唐德宗贞元十九年（公元803年），前后历经90年时间才完工。', '<h3>基本面貌</h3>\r\n\r\n<p>乐山大佛头与山齐，足踏大江，双手抚膝，大佛体态匀称，神势肃穆，依山凿成临江危坐。大佛通高71米，头高14.7米，头宽10米，发髻1021个，耳长7米，鼻长5.6米，眉长5.6米，嘴巴和眼长3.3米，颈高3米，肩宽24米，手指长8.3米，从膝盖到脚背28米，脚背宽8.5米，脚面可围坐百人以上。</p>\r\n\r\n<p>在大佛左右两侧沿江崖壁上，还有两尊身高超过16米的护法天王石刻，与大佛一起形成了一佛二天王的格局。与天王共存的还有数百龛上千尊石刻造像，宛然汇集成庞大的佛教石刻艺术群。大佛左侧，沿&ldquo;洞天&rdquo;下去就是近代开凿的凌云栈道的始端，全长近500米。右侧是唐代开凿大佛时留下的施工和礼佛通道&mdash;&mdash;九曲栈道。佛像雕刻成之后，曾建有七层楼阁覆盖（一说九层或十三层），时称&ldquo;大佛阁&rdquo;、&ldquo;大像阁&rdquo;；佛阁屡建屡毁，宋时重建&ldquo;凌云阁&rdquo;、&ldquo;天宁阁&rdquo;；元代建&ldquo;宝鸿阁&rdquo;；明代崇祯年间建&ldquo;佛棚&rdquo;、清代建&ldquo;佛亭&rdquo;，最终废毁殆尽。</p>\r\n\r\n<h3>石块发鬈</h3>\r\n\r\n<p>大佛顶上共有螺髻1051个，这是1962年维修时，以粉笔编号数清的。远看发髻与头部浑然一体，实则以石块逐个嵌就。单块螺髻根部裸露处，有明显的拼嵌裂隙，无沙浆粘接。螺髻表面抹灰两层，内层为石灰，厚度各为5-15毫米。1991年维修时，在佛像右腿凹部中拾得遗存螺髻石3块，其中两块较完整，长78厘米，顶部31.5&times;31.5厘米，根部24&times;24厘米。</p>\r\n\r\n<h3>木质双耳</h3>\r\n\r\n<p>大佛右耳耳垂根部内侧，有一深约25厘米的窟窿，维修工人从中掏出许多破碎物，细看乃腐朽了的木泥。这证实了南宋范成大在《吴船录》中的记载&ldquo;极天下佛像之大，两耳犹以木为之&rdquo;。由此可知，内则露出三截木头，成品字形。说明隆起的鼻梁，也是以木衬之，外饰锤灰而成。不过，这是唐代贞元十九年竣工时就是如此，还是后人维修时用这种工艺修补，已不可考证。</p>\r\n\r\n<h3>排水系统</h3>\r\n\r\n<p>乐山大佛有非常巧妙的排水系统。乐山大佛的两耳和头颅后面，具有一套设计巧妙，隐而不见的排水系统，对保护大佛起到了重要的作用。使佛像不至为雨水侵蚀。清代诗人王士祯有咏乐山大佛诗&ldquo;泉从古佛髻中流&rdquo;。在大佛头部共18层螺髻中，第4层、9层、18层各有一条横向排水沟，分别用锤灰垒砌修饰而成，远望看不出。衣领和衣纹皱折也有排水沟，正胸有向左侧分解表水沟，与右臂后侧水沟相连。两耳背后靠山崖处，有长9.15米、宽1.26米、高3.38米的左右相通洞穴；胸部背侧两端各有一洞，互未凿通，右洞深16.5米、宽0.95米、高1.35米，左洞深8.1米、宽0.95米、高1.1米。这些妙的水沟和洞穴，组成了科学的排水、隔湿和通风系统，千百年来对保护大佛，防止侵蚀性风化，起到了重要的作用。左右互通的两洞，由于可汇山泉，内崖壁上凝结了厚约5-10厘米的石灰质化合物，而佛身一侧 崖壁仍是红砂原岩，而且比较干燥。那左右不通的两洞穴，孔壁湿润，底部积水，洞口不断有水淌出，因而大佛胸部约有2米宽的浸水带。显然，这是由于洞未贯通的缘故。不知道当年修建者为何不把它打通。</p>\r\n\r\n<h3>胸部残碑</h3>\r\n\r\n<p>据1962年维修的负责人黄高彬和罗伯衡介绍，当时发现大佛胸部有一封闭的藏脏洞。开洞一看，里面装的是废铁、破旧铅皮、砖头等，而封门石竟是宋代重建天宁阁的纪事残碑。唐代大佛竣工后，曾建有木阁覆盖保护，以免日晒雨淋。从大佛膝、腿臂胸和脚背上残存的许多柱础和桩洞，证明确曾有过大佛阁。宋代重建之，称为&ldquo;天宁阁&rdquo;，后毁。但不知何年，因何原因，这天宁阁的纪事残碑唐竟然嵌在了大佛的胸部。维修者将此残碑移到海通洞里保存，可惜在1966年被人毁掉了。</p>\r\n', '6', '四川省乐山市南岷江东岸凌云寺侧', '0', '2019-01-18 20:02:11');
INSERT INTO `scenic` VALUES ('12', '千岛湖风景区', '5', '2019011820124645900d6920644aa292815949674fe3a6.jpg', '千岛湖湖形呈树枝型，湖中大小岛屿1078个，千岛湖中大小岛屿形态各异，群岛分布有疏有密，罗列有致。\r\n1982年，千岛湖发展旅游业。1986年11月，千岛湖风景区被林业部批复为国家森林公园。2010年，千岛湖风景区被评为国家AAAAA级景区。2002年，千岛湖风景区被评为中国保护旅游消费者权益示范景区和浙江青年文明号示范景区。', '<h3>千岛百姿 港湾幽深</h3>\r\n\r\n<p>千岛湖湖形呈树枝型，湖中大&nbsp;小岛屿1078个，中国最大的人工湖。千岛湖中大小岛屿形态各异，群岛分布有疏有密，罗列有致。</p>\r\n\r\n<h3>主要岛屿</h3>\r\n\r\n<p>梅峰岛：位于千岛湖中心湖区西端的状元半岛上，距千岛湖镇12公里。它以群岛星罗棋布、港湾纵横交错、生态环境而被确定为千岛湖的一级景点。天气晴好的日子，登上梅峰观景台，可以纵览300余座大小岛屿。</p>\r\n\r\n<p>猴岛：原名云蒙列岛，由十余青翠的大小岛屿组成。中国科学院利用水困法，使这里成为名副其实的猴。</p>\r\n\r\n<p>龙山岛：古为浙西名胜。1959年秋，由于新安江水库建成蓄水，龙山便成了龙山岛。岛上建有海瑞祠，飞檐翘角，从海瑞祠拾级而上，约行五百级石阶小径可直达宁古钟楼。</p>\r\n\r\n<p>锁岛：这里是锁的世界，共有十六万把各式心锁挂满全岛，建有开心锁、智慧锁中国第一座锁具博物馆&mdash;&mdash;中华锁展馆和获世界吉尼斯之最的平安锁也在此安家。</p>\r\n\r\n<p>三潭岛：位于千岛湖中心湖区与东南湖区交界处，距千岛湖镇10千米，景点占地面积80公顷。</p>\r\n', '7', '浙江省杭州市淳安县境内', '0', '2019-01-18 20:12:47');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of suggestion
-- ----------------------------
INSERT INTO `suggestion` VALUES ('1', 'wodetianna', 'lisi@qq.com', '试一下', '2019-01-18 12:56:06');
INSERT INTO `suggestion` VALUES ('2', 'stark81', 'stark81@qq.com', '很喜欢你们的网站，继续努力哟', '2019-01-18 12:56:16');
INSERT INTO `suggestion` VALUES ('3', '马尔代夫的海风', 'haha@163.com', '网站有点调单哟', '2019-01-18 13:00:58');
INSERT INTO `suggestion` VALUES ('4', '郭靖', 'guojing@163.com', '很喜欢你们的网站，希望继续努力哟~', '2019-01-18 18:21:23');
INSERT INTO `suggestion` VALUES ('5', '黄蓉', 'huangrong@qq.com', '希望能增加一个旅游目的地的天气，以方便决定去不去玩呢', '2019-01-20 12:44:47');

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
  `isdrafts` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  UNIQUE KEY `cover` (`cover`),
  KEY `scenic_id` (`scenic_id`),
  KEY `ix_travels_addtime` (`addtime`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `travels_ibfk_1` FOREIGN KEY (`scenic_id`) REFERENCES `scenic` (`id`),
  CONSTRAINT `travels_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of travels
-- ----------------------------
INSERT INTO `travels` VALUES ('1', '北京不得不去的地方——故宫一日游', '1', '<p>故宫门票价格：成人旺季60元，淡季40元，学生票全年20元。珍宝馆和钟表馆另外收费10元/人，学生证半价，价格方面可以说是相当优惠了。<br />\r\n我们去的时候故宫还可以现场售票，回来以后就实行全网络售票参观了。<br />\r\n门票提前10天在网上预售，售完为止，一张身份证每个入院日限购一张门票。和其它博物馆一样，故宫博物院也是周一闭馆。<br />\r\n去之前建议关注一下故宫博物院的官网：http://gugong.228.com.cn/，尤其是跟我们一样自由行的游客，除了可以看到余票和购买门票，还能看到最新的一些消息公告，比如哪里闭馆哪里修缮（虽然有些宫殿临时维修不在官网通告，但有总好过无嘛），对规划路线有很大的帮助。<br />\r\n我们是在美团上提前买的大门票和珍宝馆的门票，刷身份证就可以入园。<br />\r\n【没什么用的讲解器】<br />\r\n过了安检就能看到讲解器服务处。<br />\r\n自助讲解器租赁价格：汉语、粤语、闽南语版20.00元/台，其他语种40.00元/台，免押金，参观完毕在出院前将讲解器归还即可。<br />\r\n我和泡泡一人租了一台，使用下来的感受是缺点多过优点，可以不租。<br />\r\n虽说它是自动感应的，走到哪里讲到哪里，讲解的内容也挺不错，有多个版本，我们听的是王刚老师讲的故事版，生动有趣。但是它的缺点也很明显。<br />\r\n1、因为是单耳佩戴，所以在环境嘈杂的地方，即使声音开的很大，也经常听不清楚说了什么。<br />\r\n2、走到一些建筑密集的地方，讲解器会错乱崩溃。比如我们在珍妃井附近转了很久，它始终就识别不到我们所在的位置。比如我们到了宁寿宫，它却讲的是皇极殿的内容。泡泡一度以为是不是讲解器坏了，还跑到服务处换了一个，工作人员倒是很耿直，说这个就是这样的，不是很灵，到了不放他们也没办法。因为是自动定位讲解，又不能选择自己想听的地方，所以就导致我们很多地方到最后也没能听到讲解。<br />\r\n3、所有内容只讲一次，如果你没听得清，或者中途不小心耳机掉下来，漏听了，也只能自认倒霉。<br />\r\n其实故宫只要不闭馆，根本不可能有人少的时候，一个又一个旅行团，你想不听导游的讲解都很难。当然，这只是我们的看法，讲解器本身不贵，想要的话也可以租一个备用，权当地图用也行。<br />\r\n我和泡泡在故宫走了一整天。从早上的人头攒动待到晚上的人去楼空。<br />\r\n很多人说故宫没意思，就是看看长的差不多的房子。我倒觉得这一趟来的超值。<br />\r\n我建议对历史，尤其是明清史感兴趣的亲们，可以多预留一些时间给这座紫禁城，它会还你无限惊喜。</p>\r\n\r\n<p><img alt=\"\" src=\"/static/uploads/ckeditor/201901182015162980d00ca14f4aaa9d222bbf7a239acc.jpg\" style=\"height:350px; margin:10px; width:600px\" /></p>\r\n', '2019-01-03 15:36:55', '20190118201538a0105c6e825f43e08f14b5b81fc9100b.jpg', '1', '1', null, null);
INSERT INTO `travels` VALUES ('3', '邂逅龙脊梯田', '2', '<p>到了桂林仅仅看过山水，显然是不够的，一定要到龙胜看看梯田。龙胜梯田在广西龙胜各族自治县和平乡平安村龙脊山，所以也称龙脊梯田，但那是狭义的称呼，因为再往山里走，还有一处梯田叫做金坑，所以龙胜梯田其实应该包括这两处。龙脊梯田景区内居住着壮族、瑶族两种民族，以壮族为主，但是这里除了部分木质建筑，平时已经看不出鲜明的民族特色了；就梯田本身而言，最壮观的是大寨的金坑梯田，这里居住以红瑶为主也称红瑶梯田，央视12台的片头以及大家经常看见的龙脊梯田宣传图片和影视作品绝大部分都是出自金坑梯田。从流水湍急的河谷，到白云缭绕的山巅，从万木葱茏的林边到石壁崖前，凡有泥土的地方，都开辟了梯田。垂直高度五六里，横向伸延五六里。每个看见这一景色游客的心灵都会被深深地震撼，这是一种难以言表的，一种被大自然的雄奇以及人的伟力所引起的震撼。</p>\r\n\r\n<p><img alt=\"\" src=\"/static/uploads/ckeditor/201901051152485c4a97607c6b42b5877cbd9cccc0eeef.jpeg\" style=\"height:306px; width:460px\" /></p>\r\n\r\n<p>鉴于景区开发先后以及程度的不同，如果时间紧迫或者其他原因只能选看其中之一，那么都是去平安寨。游客无论乘车还是自驾，最好早上就从桂林出发，中午就可以到山寨吃午饭了。从桂林去龙脊梯田距离约100公里，出城后沿着321国道向南走，山路虽然崎岖但路况甚好，用时近两个小时，在距离龙胜县城还差约10公里时会有路牌指向龙脊梯田景区，桂林到这里的公共巴士也很多，到景区口后换乘即可。景区门票每人80元，然后一路开始沿着盘山路行进，过了红瑶长发村不久会有平安寨和金坑的岔路，左转过桥就是去平安寨，金坑则一直往上走。梯田分布在海拔300米至1100米之间，半个小时后，从阴暗的山沟里一直爬到海拔600米的山顶就是平安寨的大门，但是这里仅仅是停车场，过了大门还需要走500米的坡路才能到风雨桥，也就是壮族人迎客的地方。来这里最好先联系好客栈，通知主人出来到桥头接应一下，如果行礼多还可让主人下到停车场接。因为寨子是沿着山路修建的随意狭长，自然嘛为了景观肯定得选择高处，即使过了风雨桥，至少还要沿着千回百转的青石板路爬1公里山路，对于体力是个考验，我放弃去金坑就是因为在这里得知那里的山路比这里还要高得多。</p>\r\n', '2019-01-03 19:59:40', '20190105115529afbcf3cd99ed47418980b43fadace57f', '0', '1', null, null);
INSERT INTO `travels` VALUES ('4', '喀纳斯之旅,带你领略不一样的新疆', '4', '<p>有人发现了喀纳斯湖里有水怪，有人拍到了喀纳斯湖里的水怪，每年都会有这样的新闻出现。官方之前也做出了解释，其实那不是水怪，是一头史无前例的巨型哲罗鲑，然后经过人们的口口相传和一些带有夸张色彩的新闻报道，喀纳斯就带上了一些神秘的色彩。大多数人来到喀纳斯都是为了喀纳斯湖里的水怪，其实喀纳斯不单单只有传闻中的喀纳斯湖水怪，它还有其他非常美丽的景点和景色。</p>\r\n\r\n<h3><strong>绿色的大海：那仁草原</strong></h3>\r\n\r\n<p>喀纳斯的边缘处就是那仁草原，它是当地哈萨克人的夏季牧场，只有在夏天的时候，他们才会骑着马把一些牛和羊从室内赶到那仁草原，如果想要来看一眼碧绿的那仁草原一定要夏季来，青草的芳香加上牛羊的叫声，那副景色就像是世外桃源一般，让人心旷神怡。</p>\r\n\r\n<p><img alt=\"\" src=\"/static/uploads/ckeditor/20190105132425310ab002d4fc4f0bb6ab81d3df69702f.jpg\" style=\"height:296px; width:640px\" /></p>\r\n\r\n<p>既然走到了这里，也不得不看一下这里有名的金莲花。这是喀纳斯的特色之花，他它不仅仅是空有颜值，它其实还是一种药材。当地的哈萨克人如果有个感冒发烧，他们就会用它来泡水喝，就相当于我们的菊花，具有清热的功效。其实喀纳斯这里的许多花花草草都有重要的功效。</p>\r\n\r\n<p>每年的五月份，这里的金莲花就会盛开，开遍漫山遍野。时间长达一个月之久才会凋谢。就像是金黄色的海洋。但是今年的金莲花的盛开晚了一个月之久。</p>\r\n\r\n<h3><strong>神秘的湖水：喀纳斯湖</strong></h3>\r\n\r\n<p>虽然喀纳斯湖传出来的故事，都带着非常神秘的色彩，但是它的景色真是让人流连忘返，你可以在这里爬山和溯溪，感受大自然。喀纳斯周围都是跌宕起伏的山，景色非常的美，每一处看到的每一帧都可以定格为一幅美丽的画。</p>\r\n\r\n<p><img alt=\"\" src=\"/static/uploads/ckeditor/201901051327053112c110a39a4d779cb7ccaa219cf9ad.jpg\" style=\"height:340px; width:500px\" /></p>\r\n\r\n<p>这里景色最好的观看点就是钓鱼台，登上去，整个景色都落入眼中。安静的湖水静卧在碧绿的青山之中，偶尔有几声鸟叫划破安静的长空。不用传说中的水怪，它自己散发的美丽就足够吸引每一个旅人。</p>\r\n\r\n<h3><strong>桃源仙境：吐别克</strong></h3>\r\n\r\n<p>吐别克很少有人知道这个地方，只有坐船才能到达这里，领略过这里风景的人们都说到了这里就像是到了新西兰。这里的景色只能由自己徒步才能领略，如果你们要去的话要记得提前订好当地的哈萨克家庭，徒步是一件非常消耗体力的事情，要提前预定好家庭，他们好拿出准备好的牛羊肉，让你们自己亲手烤着吃。</p>\r\n\r\n<p>下次来到喀纳斯不要只去寻找喀纳斯湖水怪哦，还可以去这几个地方转转。</p>\r\n', '2019-01-05 13:31:40', '20190118203627d2ee6bd295c44a8db4338d4dd2b0481c', '0', '1', '2', null);
INSERT INTO `travels` VALUES ('5', '九寨沟游记', '5', '<p>十一月,九寨沟开始连绵不绝的下雨,今年的旅行本来是要去远足的,但是各种原因未能成行,加上同行的朋友只能适合低烈度的游玩,所以选择了九寨沟 ,前后共五天,来回两天,川主寺一天,九寨沟内两天,遇上了一些人,经历了一些事,谨发此文纪念这段美好的时光.走之前在这里查询了大量的攻略,所以回来后整理一下跟大家共享。</p>\r\n\r\n<p>这是在去&nbsp;九寨沟&nbsp;的班车上，大概是过&nbsp;汶川&nbsp;时候吧，当时下雨，车上睡不着，其实在车上可以拍到一些好风景，前几年去&nbsp;亚丁&nbsp;的路上就是在车上拍到折多山的云海，很漂亮。</p>\r\n\r\n<p><img alt=\"\" src=\"/static/uploads/ckeditor/201901181829269cdca8f625954a4488a6b4b964dbe889.jpeg\" style=\"height:300px; margin:10px; width:500px\" /></p>\r\n\r\n<p>这是在&nbsp;九寨沟&nbsp;景区入口的外面，沟内水和沟外水的汇集，就是在这里碰到&nbsp;东北&nbsp;的大哥。说起这件事，我一直都很庆幸当时运气，因为到&nbsp;九寨沟&nbsp;的第二天是下雨，所以想去其他地方逛上一天，等第二天多云了才进沟，刚好遇到一个大哥，他是一路从&nbsp;东北&nbsp;自驾 过来的，也是打算第二天进沟，所以一合计，就打算去川主寺逛逛。<img alt=\"\" src=\"/static/uploads/ckeditor/20190118183342696745d0ac4540809ee7d032a7368caf.jpeg\" style=\"height:246px; margin:10px; width:500px\" /></p>\r\n\r\n<p>这是半路上的一处停车点，古城哪里，那里有很多当地的藏民在带着马求合影，当然是要骑马费用的，还有好多推销工艺品之类的，景色相当不错。</p>\r\n\r\n<p>&nbsp;</p>\r\n', '2019-01-07 09:00:05', '20190118203153d2b2ec2573a44e988aab03977b390b14.jpg', '0', '1', '1', null);
INSERT INTO `travels` VALUES ('6', '故宫一日游', '1', '<p>dadad</p>\r\n', '2019-01-09 10:53:06', '201901091053065733284819d8484bba6835522bd43af0.jpg', '0', '0', '1', null);
INSERT INTO `travels` VALUES ('7', '冬游西湖之人在断桥残雪处', '6', '<p>断桥残雪是西湖上著名的景色，以冬雪时远观桥面若隐若现于湖面而称著。属于西湖十景之一。断桥残雪是欣赏西湖雪景之佳地，中国著名的民间传说《白蛇传》，为断桥景物增添了浪漫的色彩。</p>\r\n\r\n<p>每当瑞雪初霁，站在宝石山上向南眺望，西湖银装素裹，白堤横亘雪柳霜桃。断桥的石桥拱面无遮无拦，在阳光下冰雪消融，露出了斑驳的桥栏，而桥的两端还在皑皑白雪的覆盖下。依稀可辨的石桥身似隐似现，而涵洞中的白雪奕奕生光，桥面灰褐形成反差，远望去似断非断，故称断桥。伫立桥头，放眼四望，远山近水，尽收眼底，给人以生机勃勃的强烈属深刻的印象。</p>\r\n\r\n<h3>宝石山高祥云纷</h3>\r\n\r\n<p>白堤横亘湖上，把西湖划分为外湖和里湖，并将孤山和北山连接在一起。白堤在唐代原名白沙堤，宋代又叫孤山路。明代堤上广植桃柳，又称十锦塘。堤上内层是垂柳，外层是碧桃。</p>\r\n\r\n<p><img alt=\"\" src=\"/static/uploads/ckeditor/201901101144102a140727d72144788f20e090327a5d34.jpg\" style=\"height:408px; width:600px\" /></p>\r\n\r\n<h3>断桥两点娥眉纹</h3>\r\n\r\n<p>断桥是西湖中最出名的一座桥。杭州西湖，有四大爱情桥&ldquo;西泠桥&rdquo;、&ldquo;长桥&rdquo;、&ldquo;断桥&rdquo;、&ldquo;跨虹桥&rdquo;，盛名经久不衰。泠桥、长桥、断桥是古代的爱情桥，跨虹桥是现代爱情桥，是众多情侣约会相游的地方，而最符盛名的却是断桥，它的名字与中国民间故事《白蛇传》中缠绵悲怆的爱情故事联系在一起。在断桥上，流传的那许仙和白娘子动人的爱情故事，让断桥成为西湖上众多桥中最著名的桥。传说，白娘子原本是山野中修炼的一条小白蛇，有一天，小白蛇被一个捕蛇老人抓住了，差一点遭遇杀身之祸，幸亏被一个小牧童所救。经过一千七百年的修炼，白娘子终于化做人形，经观音大士指点，来到杭州西湖寻找前世救命恩人小牧童。</p>\r\n\r\n<p>清明佳节，烟雨蒙蒙，观音菩萨说过&ldquo;有缘千里来相会，须往西湖高处寻&rdquo;。而在西湖的断桥的桥面上，由伞传情，白娘子终于找到了前世的救命恩人许仙，以身相许，结为夫妻。在经历水漫金山之后，又是在断桥邂逅重逢，再续前缘。</p>\r\n', '2019-01-09 10:55:24', '2019011820263791b6714b4d08468f841e199aa0580fc0.jpg', '0', '1', '2', null);
INSERT INTO `travels` VALUES ('11', '领略明清的风采--故宫一日游', '1', '<p>北京故宫由明朝皇帝朱棣始建，设计者为蒯祥（1397&mdash;1481年，字廷瑞，苏州人）。占地72万平方米（长961米，宽753米），建筑面积约15万平方米，占地面积72万平方米，用100万民工，共建了14年，有房屋9999间半，实际据1973年专家现场测量故宫有大小院落90多座，房屋有980座，共计8707间（这里的间并非现今房间之概念，此处&ldquo;间&rdquo;指四根房柱所形成的空间）。</p>\r\n\r\n<p>一日游规划路线几乎包括故宫博物院所有开放区域的重要宫殿和展馆，游客们可以深入了解皇家生活。但是，由于馆区面积较大，如何选择浏览路线也成为了游客们的游览故宫时所面临的巨大难题。根据笔者的游览经验，本文将罗列一下游览的顺序，以方便其他游客合理安排时间进行游玩。</p>\r\n\r\n<h3>一日游推荐</h3>\r\n\r\n<p><img alt=\"\" src=\"/static/uploads/ckeditor/20190113142743d4848b68810848048ff86383aba6c00b.jpg\" style=\"float:left; height:650px; width:386px\" /></p>\r\n\r\n<p>1.&nbsp;午门</p>\r\n\r\n<p>2.&nbsp;武英殿</p>\r\n\r\n<p>3.&nbsp;文华殿（书画馆）</p>\r\n\r\n<p>4.&nbsp;太和门</p>\r\n\r\n<p>5.&nbsp;太和殿</p>\r\n\r\n<p>6.&nbsp;中和殿</p>\r\n\r\n<p>7.&nbsp;保和殿</p>\r\n\r\n<p>8.&nbsp;乾清宫</p>\r\n\r\n<p>9.&nbsp;交泰殿</p>\r\n\r\n<p>10.坤宁宫</p>\r\n\r\n<p>11.养心殿</p>\r\n\r\n<p>12.西六宫区</p>\r\n\r\n<p>13.御花园</p>\r\n\r\n<p>14.东六宫区</p>\r\n\r\n<p>15.奉先殿（钟表馆）</p>\r\n\r\n<p>16.宁寿宫区（珍宝馆、戏曲馆）</p>\r\n\r\n<p>17.神武门</p>\r\n', '2019-01-12 16:43:13', '20190118201737ab380696af9646c2978cb19ba923477b.jpg', '0', '1', null, null);
INSERT INTO `travels` VALUES ('12', '故宫一日游2', '1', '<p>快乐大本营</p>\r\n', '2019-01-15 14:36:23', '20190115143622614839c1261f4964aa7695539efd8fa7.jpg', '0', '0', null, '0');
INSERT INTO `travels` VALUES ('13', '一定要再见--广州长隆的欢乐之旅', '3', '<p>旅游除了去看风景名胜，还有一个很重要的事情就是玩，要疯玩。那么要疯玩就必须去游乐场，那才能放开了心去玩。我们国家有两个迪士尼，迪士尼是非常好玩，可是价格有点偏贵。还有很多著名的游乐场像方特啊，欢乐谷之类的，今天就给大家讲一讲广州长隆，这是一个集动物，游乐场，水上乐园于一体的度假区，可以疯狂玩，疯狂看，就是这么爽。</p>\r\n\r\n<p>广州长隆分为欢乐世界，动物园，水上乐园，飞鸟乐园和马戏团。我是建议大家去购买套票，会比较划算，还有建议大家选择欢乐世界，动物园和水上乐园，飞鸟乐园都是鸟，没什么多大乐趣。这里就重点讲一讲欢乐世界和动物园。欢乐世界是可以带包的，有些游乐设施是可以带包玩的，大部分都是有存包的地方，所以不用担心。可以带食物进园区，水的话在安检的时候会让你喝一口，建议是自己带水，欢乐世界里的水十元一瓶。在欢乐世界绝对不要穿拖鞋，为了安全着想，工作人员看到穿拖鞋的都会让你脱掉的。去长隆是要坐地铁三号线，而在广州的朋友们都知道三号线是最最多人的恶魔线，就算避开上班高峰，还是会很多人，所以做好挤的准备吧。</p>\r\n\r\n<p><img alt=\"\" src=\"/static/uploads/ckeditor/20190118165125973a2c9ea47a4e038593f45f96046e41.jpg\" style=\"float:left; height:258px; margin:10px; width:600px\" /></p>\r\n\r\n<p>欢乐世界闭馆时间是晚上七点，所以大家可以玩一整天。有些热门项目是避免不了排队的，这个也要做好排队的准备。一进门就是垂直过山车，整个欢乐世界的主题所在，可是我真的没有胆量去玩，有胆量的朋友千万不要错过。还有一个过山车是十环过山车，这个也是经典项目。上午就把大型项目都玩了，中午在园区内吃饭，普遍会比较贵。吃完饭也不要浪费时间，去玩一些比较轻松的项目，像旋转木马这样的。有两个项目是会湿身的，而且是肯定要湿鞋的，大家做好准备。有三个跳楼机，最高的那个跳楼机出过事，不过现在严格管理了。大摆锤也是刺激项目，U型滑板也是很刺激的。到了下午可以去看看半小时的5D短片，拿上地图尽量把每个项目都玩了。</p>\r\n\r\n<p>水上乐园的话，离地铁最近。你一出地铁就会有很多人问你要不要买防水套之类的。水上乐园还是很好玩的，去一次还是很值得的。长隆没有迪士尼这么大，但是比较多类型。在珠海的长隆是海洋世界，就已经很齐全了。来到广州全都玩一遍。《爸爸回来了》还去过长隆拍过电影呢。</p>\r\n\r\n<p>&nbsp;</p>\r\n', '2019-01-15 15:32:49', '20190118202507775e3fcc869c4466b9bafbfafd7d2e27.png', '0', '1', '2', '0');
INSERT INTO `travels` VALUES ('14', '长城一日游', '7', '<p>一直想去一睹蜿蜒数十里的长城之雄姿。在北京的第三天，决定去爬八达岭长城。&ldquo;不到长城非好汉，到了长城很遗憾。&rdquo;不知从哪儿听来这句，无厘头的后半句读起来还蛮押韵，朗朗上口，这应该算是对前半句原意的亵渎了吧。但遗憾还真的有。其一是差点被看起来善良淳朴的导游给骗了。</p>\r\n\r\n<p>在去长城的车上，导游介绍长城景区自从08年开始实行联票政策，即滑车票和门票只能一起购买，共一百二十元。我当时心里一惊，这下坏了，习惯了出门用支付宝，现金没带够。同去的好友很镇定，小声说门票其实只要20元。于是我们下了车立即脱离导游，擅自走了一段路程到真正的售票窗口。</p>\r\n\r\n<p><img alt=\"\" src=\"/static/uploads/ckeditor/20190118163140b2906441662f48959d25e4180815c69e.jpg\" style=\"float:left; height:397px; margin:10px; width:640px\" /></p>\r\n\r\n<p>每天最高温度直逼40℃，被炙热的阳光灼烧的室外是不适合待人的。况且长城是修在山脊之上，并没有可以纳凉的林荫处，但这热浪竟没有阻拦游人慕名而来的脚步，一眼望去尽是色彩斑斓的人影，长城黑褐色的墙体仿佛也被艳丽的游人衬得有几分黯淡。好不容易爬到一个关口，想在城楼里面歇歇脚凉快凉快。</p>\r\n\r\n<p>但原本不大的空间里挤了不少的人，清风吹过，带来一股只可意会不可言传的骚臭味，还是接着爬吧！八达岭的北长城段最高可到第八个关口，在炎热的天气里爬长城真的是项体力活，但既然来了怎能不去看看最高处的风景呢。路途中，抬头去数还剩几个关口，发现第八个关口还在一眼望不到尽头的远处，好似一个很难企及的高度。</p>\r\n\r\n<p>更觉脚步的沉重了。正当此时，冷不丁被脚下的石砖绊了一脚，好险摔倒。于是逼着自己不去看远处，只着眼脚下的每一个石阶。一步又一步，过了一个关口又一个关口，不知不觉就离终点再近了些。看来有时专注于脚下的路比着眼于远处的目的地更重要，也走得更快更踏实。路途中停下来透过垛口望远处的景，是山的墨绿，是天的蔚蓝。</p>\r\n\r\n<p>是隐隐约约的市景。望身后走过的路，是衬托在林绿里的褐色城墙，是蜿蜒盘踞在山脊之上的长城，是熙熙攘攘的人群。几百年前，一代名将常遇春、徐达曾被派来主持长城的修筑事务，抗倭名将戚继光也曾在此处镇守边疆。真的很难体会当年英姿飒爽的将士们身披盔甲立于长城之上的心情。望长城外，是不甘心的元军。</p>\r\n\r\n<p>那满腔的心事只能与不曾变过的关外明月诉说。和平年代的确难得，但对于长城而言，是多么希望有一天还能遇见常遇春、徐达、戚继光等一代名将，带领士兵日日巡视，夜夜守卫啊！</p>\r\n', '2019-01-15 17:43:04', '201901151743034adf503541c54e5bb6dc29610137e96c', '0', '1', null, '0');
INSERT INTO `travels` VALUES ('15', '长城1', '7', '<p>这里是用户写的游记</p>\r\n', '2019-01-15 17:50:14', '201901151750148405b8afdc834443b9a8112763f89566', '0', '0', '2', '0');
INSERT INTO `travels` VALUES ('16', '钱塘江春行', '6', '<p>这里是钱塘江游记的内容</p>\r\n', '2019-01-15 17:53:52', '201901151753513bc4945dc5694b369de618d715d739db.jpg', '0', '0', '2', '0');
INSERT INTO `travels` VALUES ('17', '故宫一日游222', '1', '<p>修改一下</p>\r\n', '2019-01-15 18:54:46', '20190115185446601aa479b1184353936742425f49bb28.jpg', '0', '0', '3', '0');
INSERT INTO `travels` VALUES ('18', '天山游', '1', '<p>这里是天山<img alt=\"\" src=\"/static/uploads/ckeditor/20190119115739c3ff29fa65aa41a08f086c5b6504afb1.jpg\" style=\"float:left; height:281px; margin:10px; width:500px\" /></p>\r\n\r\n<p>这里也是天山</p>\r\n', '2019-01-19 11:58:25', '20190119115825c9da914562f842ec95d35270be452dbb.jpg', '0', '0', '3', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of travelscollect
-- ----------------------------
INSERT INTO `travelscollect` VALUES ('21', '1', '4', '2019-01-17 12:49:54');

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
INSERT INTO `user` VALUES ('3', '面朝大海', 'pbkdf2:sha256:50000$exOOrVo6$19f746234152732de3de162f8deb12217701c76f9c3c0559653ad7fabee414cb', 'lisi@qq.com', '12345678910', '2019-01-04 13:02:39', '1', '20190113135430af8eba2d49214d01b282f9480ec7c4cc.jpeg', '从明天起做一个幸福的人');
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
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
INSERT INTO `userlog` VALUES ('63', '2', '127.0.0.1', '2019-01-12 09:30:37');
INSERT INTO `userlog` VALUES ('64', '2', '127.0.0.1', '2019-01-12 09:32:38');
INSERT INTO `userlog` VALUES ('65', '1', '127.0.0.1', '2019-01-12 10:14:40');
INSERT INTO `userlog` VALUES ('66', '2', '127.0.0.1', '2019-01-12 11:36:46');
INSERT INTO `userlog` VALUES ('67', '3', '127.0.0.1', '2019-01-12 12:15:39');
INSERT INTO `userlog` VALUES ('68', '1', '127.0.0.1', '2019-01-12 13:13:24');
INSERT INTO `userlog` VALUES ('69', '2', '127.0.0.1', '2019-01-12 14:19:29');
INSERT INTO `userlog` VALUES ('70', '3', '127.0.0.1', '2019-01-13 12:59:49');
INSERT INTO `userlog` VALUES ('71', '2', '127.0.0.1', '2019-01-14 08:47:15');
INSERT INTO `userlog` VALUES ('72', '2', '127.0.0.1', '2019-01-14 20:51:53');
INSERT INTO `userlog` VALUES ('73', '2', '127.0.0.1', '2019-01-15 09:49:43');
INSERT INTO `userlog` VALUES ('74', '3', '127.0.0.1', '2019-01-15 18:54:24');
INSERT INTO `userlog` VALUES ('75', '3', '127.0.0.1', '2019-01-15 19:31:02');
INSERT INTO `userlog` VALUES ('76', '2', '127.0.0.1', '2019-01-16 09:21:08');
INSERT INTO `userlog` VALUES ('77', '1', '127.0.0.1', '2019-01-17 09:19:46');
INSERT INTO `userlog` VALUES ('78', '2', '127.0.0.1', '2019-01-18 09:37:40');
INSERT INTO `userlog` VALUES ('79', '2', '127.0.0.1', '2019-01-18 10:51:40');
INSERT INTO `userlog` VALUES ('80', '2', '127.0.0.1', '2019-01-18 13:09:25');
INSERT INTO `userlog` VALUES ('81', '1', '127.0.0.1', '2019-01-18 18:23:07');
INSERT INTO `userlog` VALUES ('82', '1', '127.0.0.1', '2019-01-18 18:45:26');
INSERT INTO `userlog` VALUES ('83', '2', '127.0.0.1', '2019-01-18 20:18:30');
INSERT INTO `userlog` VALUES ('84', '1', '127.0.0.1', '2019-01-18 20:31:23');
INSERT INTO `userlog` VALUES ('85', '2', '127.0.0.1', '2019-01-18 20:35:37');
INSERT INTO `userlog` VALUES ('86', '2', '127.0.0.1', '2019-01-19 09:11:48');
INSERT INTO `userlog` VALUES ('87', '3', '127.0.0.1', '2019-01-19 11:01:18');
INSERT INTO `userlog` VALUES ('88', '3', '127.0.0.1', '2019-01-19 11:07:10');
INSERT INTO `userlog` VALUES ('89', '3', '127.0.0.1', '2019-01-19 11:26:23');
INSERT INTO `userlog` VALUES ('90', '3', '127.0.0.1', '2019-01-19 14:20:26');
INSERT INTO `userlog` VALUES ('91', '2', '127.0.0.1', '2019-01-19 15:42:20');
INSERT INTO `userlog` VALUES ('92', '1', '127.0.0.1', '2019-01-19 17:04:39');
INSERT INTO `userlog` VALUES ('93', '2', '127.0.0.1', '2019-01-20 12:45:19');
INSERT INTO `userlog` VALUES ('94', '3', '127.0.0.1', '2019-01-20 13:54:13');
INSERT INTO `userlog` VALUES ('95', '4', '127.0.0.1', '2019-01-20 14:06:45');
INSERT INTO `userlog` VALUES ('96', '3', '127.0.0.1', '2019-01-20 14:07:27');
INSERT INTO `userlog` VALUES ('97', '3', '127.0.0.1', '2019-01-20 14:08:17');
INSERT INTO `userlog` VALUES ('98', '5', '127.0.0.1', '2019-01-20 14:28:58');
INSERT INTO `userlog` VALUES ('99', '3', '127.0.0.1', '2019-01-20 15:28:04');
INSERT INTO `userlog` VALUES ('100', '3', '127.0.0.1', '2019-01-20 15:30:20');
INSERT INTO `userlog` VALUES ('101', '2', '127.0.0.1', '2019-01-20 15:57:26');
INSERT INTO `userlog` VALUES ('102', '1', '127.0.0.1', '2019-01-20 16:21:55');
INSERT INTO `userlog` VALUES ('103', '2', '127.0.0.1', '2019-01-20 16:22:38');
INSERT INTO `userlog` VALUES ('104', '2', '127.0.0.1', '2019-01-21 08:58:16');
INSERT INTO `userlog` VALUES ('105', '3', '127.0.0.1', '2019-01-21 09:34:17');
INSERT INTO `userlog` VALUES ('106', '6', '127.0.0.1', '2019-01-21 09:36:53');
INSERT INTO `userlog` VALUES ('107', '1', '127.0.0.1', '2019-01-21 09:56:07');
INSERT INTO `userlog` VALUES ('108', '1', '127.0.0.1', '2019-01-21 09:56:08');
INSERT INTO `userlog` VALUES ('109', '2', '127.0.0.1', '2019-01-21 09:56:35');
INSERT INTO `userlog` VALUES ('110', '2', '127.0.0.1', '2019-01-21 10:17:25');
INSERT INTO `userlog` VALUES ('111', '1', '127.0.0.1', '2019-01-21 10:21:59');
INSERT INTO `userlog` VALUES ('112', '2', '127.0.0.1', '2019-01-21 10:25:17');
INSERT INTO `userlog` VALUES ('113', '1', '127.0.0.1', '2019-01-21 10:40:03');
INSERT INTO `userlog` VALUES ('114', '2', '127.0.0.1', '2019-01-21 10:41:33');
INSERT INTO `userlog` VALUES ('115', '2', '127.0.0.1', '2019-01-21 11:09:24');
INSERT INTO `userlog` VALUES ('116', '3', '127.0.0.1', '2019-01-21 11:13:54');
