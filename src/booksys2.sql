/*
Navicat MySQL Data Transfer

Source Server         : ads
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : booksys

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2015-01-03 10:35:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `sexry_awardhistory`
-- ----------------------------
DROP TABLE IF EXISTS `sexry_awardhistory`;
CREATE TABLE `sexry_awardhistory` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `period` varchar(12) NOT NULL COMMENT '开奖期数',
  `awardtime` varchar(64) NOT NULL COMMENT '开间时间',
  `awardcode` varchar(9) NOT NULL COMMENT '开出号码',
  `plusnumber` int(3) unsigned NOT NULL COMMENT '总和',
  `dt` varchar(10) NOT NULL COMMENT 'dragon - tiger 龙虎',
  `fthree` varchar(10) NOT NULL COMMENT '前三',
  `mthree` varchar(10) NOT NULL COMMENT '中三',
  `bthree` varchar(10) NOT NULL COMMENT '后三',
  `odevity` varchar(10) NOT NULL COMMENT '单双',
  `size` varchar(10) NOT NULL COMMENT '大小',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sexry_awardhistory
-- ----------------------------
INSERT INTO `sexry_awardhistory` VALUES ('21', '150101044', '1420089644649', '86499', '36', '和', '杂六', '杂六', '对子', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('22', '150101045', '1420090245296', '84252', '21', '龙', '杂六', '半顺', '对子', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('23', '150101046', '1420090842782', '06530', '14', '虎', '半顺', '半顺', '杂六', '总和双', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('24', '150101047', '1420091444878', '75924', '27', '龙', '杂六', '杂六', '杂六', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('25', '150101048', '1420092042825', '21674', '20', '和', '半顺', '半顺', '半顺', '总和双', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('26', '150101049', '1420092643408', '49510', '19', '龙', '半顺', '杂六', '半顺', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('27', '150101050', '1420093244968', '75984', '33', '龙', '杂六', '半顺', '半顺', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('28', '150101051', '1420093843410', '66270', '21', '龙', '对子', '半顺', '杂六', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('29', '150101052', '1420094444646', '01759', '22', '和', '半顺', '杂六', '杂六', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('30', '150101053', '1420095045472', '28916', '26', '和', '半顺', '半顺', '杂六', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('31', '150101054', '1420095647052', '06810', '15', '虎', '杂六', '杂六', '半顺', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('32', '150101055', '1420096246917', '99906', '33', '龙', '豹子', '对子', '半顺', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('33', '150101056', '1420096845255', '21938', '23', '和', '半顺', '杂六', '半顺', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('34', '150101057', '1420097444625', '43308', '18', '和', '对子', '对子', '杂六', '总和双', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('35', '150101058', '1420098045308', '63668', '29', '和', '对子', '对子', '对子', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('36', '150101059', '1420098645528', '37065', '21', '和', '杂六', '半顺', '半顺', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('37', '150101060', '1420099244877', '76291', '25', '龙', '半顺', '杂六', '半顺', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('38', '150101061', '1420099842818', '03651', '15', '和', '杂六', '半顺', '半顺', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('39', '150101062', '1420100448049', '60535', '19', '龙', '半顺', '杂六', '对子', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('40', '150101063', '1420101042666', '38716', '25', '和', '半顺', '半顺', '半顺', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('41', '150101064', '1420101644932', '80685', '27', '龙', '杂六', '杂六', '半顺', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('42', '150101065', '1420102243018', '97530', '24', '龙', '杂六', '杂六', '杂六', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('43', '150101066', '1420102844854', '28222', '16', '虎', '对子', '对子', '豹子', '总和双', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('44', '150101067', '1420103442527', '66938', '32', '和', '对子', '杂六', '半顺', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('45', '150101068', '1420104042846', '91863', '27', '龙', '半顺', '杂六', '杂六', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('46', '150101069', '1420104647211', '47801', '20', '龙', '半顺', '半顺', '半顺', '总和双', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('47', '150101070', '1420105255125', '83787', '33', '龙', '半顺', '半顺', '对子', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('48', '150101071', '1420105845350', '44238', '21', '和', '对子', '顺子', '半顺', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('49', '150101072', '1420106442629', '23449', '22', '和', '顺子', '对子', '对子', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('50', '150101073', '1420107044992', '27442', '19', '虎', '杂六', '对子', '对子', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('51', '150101074', '1420107642534', '92543', '23', '龙', '杂六', '半顺', '顺子', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('52', '150101075', '1420108245301', '80105', '14', '龙', '半顺', '对子', '半顺', '总和双', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('53', '150101076', '1420108844676', '55474', '25', '龙', '对子', '半顺', '对子', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('54', '150101077', '1420109442544', '30858', '24', '和', '杂六', '杂六', '对子', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('55', '150101078', '1420110044947', '56315', '20', '虎', '半顺', '杂六', '杂六', '总和双', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('56', '150101079', '1420110645054', '19764', '27', '和', '杂六', '半顺', '半顺', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('57', '150101080', '1420111244687', '96516', '27', '龙', '半顺', '半顺', '半顺', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('58', '150101081', '1420111845264', '02722', '13', '和', '杂六', '对子', '对子', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('59', '150101082', '1420112442533', '25983', '27', '和', '杂六', '半顺', '半顺', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('60', '150101083', '1420113045227', '94735', '28', '龙', '杂六', '半顺', '杂六', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('61', '150101084', '1420113644607', '65997', '36', '和', '半顺', '对子', '对子', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('62', '150101085', '1420114243159', '64378', '28', '和', '半顺', '半顺', '半顺', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('63', '150101086', '1420114842933', '03556', '19', '和', '杂六', '对子', '对子', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('64', '150101087', '1420115444761', '75182', '23', '龙', '杂六', '杂六', '半顺', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('65', '150101088', '1420116044596', '09717', '24', '和', '半顺', '杂六', '对子', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('66', '150101089', '1420116644721', '13874', '23', '和', '杂六', '半顺', '半顺', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('67', '150101090', '1420117245174', '18498', '30', '和', '杂六', '半顺', '半顺', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('68', '150101091', '1420117842618', '66991', '31', '龙', '对子', '对子', '对子', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('69', '150101092', '1420118447305', '23232', '12', '虎', '对子', '对子', '对子', '总和双', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('70', '150101093', '1420119047058', '00502', '7', '和', '对子', '对子', '杂六', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('71', '150101094', '1420119644869', '62736', '24', '虎', '半顺', '半顺', '半顺', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('72', '150101095', '1420120245023', '91705', '22', '龙', '杂六', '半顺', '杂六', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('73', '150101096', '1420120842693', '36204', '15', '和', '半顺', '杂六', '杂六', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('74', '150101097', '1420121145228', '84496', '31', '龙', '对子', '对子', '杂六', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('75', '150101098', '1420121444653', '67693', '31', '龙', '对子', '半顺', '杂六', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('76', '150101099', '1420121744541', '34527', '21', '和', '顺子', '半顺', '杂六', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('77', '150101100', '1420122044533', '26751', '21', '龙', '半顺', '顺子', '杂六', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('78', '150101101', '1420122344832', '95467', '31', '龙', '半顺', '顺子', '半顺', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('79', '150101102', '1420122645120', '04233', '12', '和', '杂六', '顺子', '对子', '总和双', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('80', '150101103', '1420122945225', '91398', '30', '龙', '杂六', '杂六', '半顺', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('81', '150101104', '1420123242657', '81430', '16', '龙', '杂六', '半顺', '半顺', '总和双', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('82', '150101105', '1420123542657', '56395', '28', '虎', '半顺', '杂六', '杂六', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('83', '150101106', '1420123844680', '57943', '28', '龙', '杂六', '杂六', '半顺', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('84', '150101107', '1420124144653', '25619', '23', '和', '半顺', '半顺', '杂六', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('85', '150101108', '1420124442638', '59121', '18', '龙', '杂六', '半顺', '对子', '总和双', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('86', '150101109', '1420124744662', '98092', '28', '龙', '顺子', '顺子', '半顺', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('87', '150101110', '1420125044735', '21811', '13', '龙', '半顺', '对子', '对子', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('88', '150101111', '1420125345308', '73957', '31', '虎', '杂六', '杂六', '杂六', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('89', '150101112', '1420125647542', '12364', '16', '和', '顺子', '半顺', '半顺', '总和双', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('90', '150101113', '1420125944837', '31531', '13', '龙', '杂六', '杂六', '杂六', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('91', '150101114', '1420126248607', '29946', '30', '和', '对子', '对子', '杂六', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('92', '150101115', '1420126547769', '09189', '27', '和', '顺子', '半顺', '半顺', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('93', '150102024', '1420164108804', '32988', '30', '和', '半顺', '半顺', '对子', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('94', '150102025', '1420164647530', '40295', '20', '和', '杂六', '半顺', '杂六', '总和双', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('95', '150102026', '1420165244936', '71120', '11', '龙', '对子', '对子', '顺子', '总和单', '总和小');

-- ----------------------------
-- Table structure for `sexry_bookdefine`
-- ----------------------------
DROP TABLE IF EXISTS `sexry_bookdefine`;
CREATE TABLE `sexry_bookdefine` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `booktype` int(11) NOT NULL COMMENT '下注类型，大小单双，龙虎',
  `multiple_number` float(11,1) NOT NULL,
  `description` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `key1` (`multiple_number`),
  KEY `booktype` (`booktype`),
  CONSTRAINT `multiple` FOREIGN KEY (`multiple_number`) REFERENCES `sexry_multiple` (`multiple`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sexry_bookdefine
-- ----------------------------
INSERT INTO `sexry_bookdefine` VALUES ('1', '1', '4.8', '大');
INSERT INTO `sexry_bookdefine` VALUES ('2', '2', '4.8', '小');
INSERT INTO `sexry_bookdefine` VALUES ('3', '3', '4.8', '单');
INSERT INTO `sexry_bookdefine` VALUES ('4', '4', '4.8', '双');
INSERT INTO `sexry_bookdefine` VALUES ('5', '5', '2.8', '总和大');
INSERT INTO `sexry_bookdefine` VALUES ('6', '6', '2.8', '总和小');
INSERT INTO `sexry_bookdefine` VALUES ('7', '7', '2.8', '总和单');
INSERT INTO `sexry_bookdefine` VALUES ('8', '8', '2.8', '总和双');
INSERT INTO `sexry_bookdefine` VALUES ('9', '9', '3.9', '龙');
INSERT INTO `sexry_bookdefine` VALUES ('10', '10', '4.9', '虎');
INSERT INTO `sexry_bookdefine` VALUES ('11', '11', '6.9', '和');
INSERT INTO `sexry_bookdefine` VALUES ('12', '12', '3.8', '豹子');
INSERT INTO `sexry_bookdefine` VALUES ('13', '13', '1.8', '顺子');
INSERT INTO `sexry_bookdefine` VALUES ('14', '14', '5.9', '对子');
INSERT INTO `sexry_bookdefine` VALUES ('15', '15', '7.9', '半顺');
INSERT INTO `sexry_bookdefine` VALUES ('16', '16', '2.9', '杂六');
INSERT INTO `sexry_bookdefine` VALUES ('17', '17', '1.9', '单球1-5号数字');

-- ----------------------------
-- Table structure for `sexry_bookdetail`
-- ----------------------------
DROP TABLE IF EXISTS `sexry_bookdetail`;
CREATE TABLE `sexry_bookdetail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bookcode` varchar(255) NOT NULL,
  `ballnumber` int(11) NOT NULL,
  `number` int(11) DEFAULT NULL,
  `booktype` int(11) DEFAULT NULL,
  `money` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `code` (`bookcode`),
  KEY `type` (`booktype`),
  CONSTRAINT `code` FOREIGN KEY (`bookcode`) REFERENCES `sexry_bookhistory` (`bookcode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `type` FOREIGN KEY (`booktype`) REFERENCES `sexry_bookdefine` (`booktype`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sexry_bookdetail
-- ----------------------------

-- ----------------------------
-- Table structure for `sexry_bookhistory`
-- ----------------------------
DROP TABLE IF EXISTS `sexry_bookhistory`;
CREATE TABLE `sexry_bookhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookcode` varchar(20) NOT NULL DEFAULT '000000' COMMENT '订单号',
  `bookuser_name` varchar(20) NOT NULL,
  `awardperiods` varchar(20) NOT NULL COMMENT '下注期数',
  `booktime` bigint(40) DEFAULT NULL COMMENT '下注时间',
  `isAwarded` tinyint(1) NOT NULL DEFAULT '1' COMMENT '表示订单是未处理还是已经处理了的。 0表示没处理，1表示处理过了',
  PRIMARY KEY (`id`),
  KEY `key3` (`bookuser_name`),
  KEY `bookcode` (`bookcode`),
  CONSTRAINT `name` FOREIGN KEY (`bookuser_name`) REFERENCES `sexry_user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sexry_bookhistory
-- ----------------------------

-- ----------------------------
-- Table structure for `sexry_multiple`
-- ----------------------------
DROP TABLE IF EXISTS `sexry_multiple`;
CREATE TABLE `sexry_multiple` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL,
  `multiple` float(11,1) NOT NULL DEFAULT '0.0' COMMENT '赔率倍数',
  `description` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `multiple` (`multiple`),
  KEY `multiple_2` (`multiple`,`description`,`id`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sexry_multiple
-- ----------------------------
INSERT INTO `sexry_multiple` VALUES ('8', '8', '1.8', '顺子');
INSERT INTO `sexry_multiple` VALUES ('1', '1', '1.9', '单球买号赔率');
INSERT INTO `sexry_multiple` VALUES ('3', '3', '2.8', '总和大小单双赔率');
INSERT INTO `sexry_multiple` VALUES ('11', '11', '2.9', '杂六');
INSERT INTO `sexry_multiple` VALUES ('7', '7', '3.8', '豹子');
INSERT INTO `sexry_multiple` VALUES ('4', '4', '3.9', '龙');
INSERT INTO `sexry_multiple` VALUES ('2', '2', '4.8', '单球大小单双赔率');
INSERT INTO `sexry_multiple` VALUES ('5', '5', '4.9', '虎');
INSERT INTO `sexry_multiple` VALUES ('9', '9', '5.9', '对子');
INSERT INTO `sexry_multiple` VALUES ('6', '6', '6.9', '和');
INSERT INTO `sexry_multiple` VALUES ('10', '10', '7.9', '半顺');

-- ----------------------------
-- Table structure for `sexry_result`
-- ----------------------------
DROP TABLE IF EXISTS `sexry_result`;
CREATE TABLE `sexry_result` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bookcode` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `period` varchar(255) NOT NULL,
  `type` varchar(255) DEFAULT NULL COMMENT '下注类型',
  `money` float DEFAULT '0',
  `result` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sexry_result
-- ----------------------------

-- ----------------------------
-- Table structure for `sexry_user`
-- ----------------------------
DROP TABLE IF EXISTS `sexry_user`;
CREATE TABLE `sexry_user` (
  `id` int(11) NOT NULL DEFAULT '1',
  `username` varchar(16) NOT NULL,
  `password` varchar(32) NOT NULL,
  `curentcredit` float NOT NULL DEFAULT '0',
  `maxcredit` float NOT NULL DEFAULT '0',
  `isbind` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`,`username`,`password`,`curentcredit`,`maxcredit`,`isbind`),
  KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息';

-- ----------------------------
-- Records of sexry_user
-- ----------------------------
INSERT INTO `sexry_user` VALUES ('1', 'wangweiguang', '1234', '3000', '3444', '0');
