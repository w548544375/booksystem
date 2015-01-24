/*
Navicat MySQL Data Transfer

Source Server         : ads
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : booksys

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2015-01-01 15:08:41
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sexry_awardhistory
-- ----------------------------
INSERT INTO `sexry_awardhistory` VALUES ('1', '141231004', '14-12 星期三 00:20:53', '98330', '23', '龙', '半顺', '对子', '对子', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('2', '141231005', '14-12 星期三 00:25:51', '25082', '17', '虎', '杂六', '杂六', '杂六', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('3', '141231006', '14-12 星期三 00:30:46', '14383', '19', '和', '半顺', '半顺', '对子', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('4', '141231007', '14-12 星期三 00:35:46', '34831', '19', '龙', '半顺', '半顺', '杂六', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('5', '141231008', '14-12 星期三 00:40:47', '92621', '20', '龙', '杂六', '对子', '半顺', '总和双', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('6', '141231009', '14-12 星期三 00:45:46', '58916', '29', '和', '半顺', '半顺', '杂六', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('7', '141231010', '14-12 星期三 00:50:49', '31594', '22', '和', '杂六', '杂六', '半顺', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('8', '141231011', '14-12 星期三 00:55:48', '70785', '27', '龙', '对子', '半顺', '半顺', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('9', '141231012', '14-12 星期三 01:00:50', '31643', '17', '虎', '杂六', '杂六', '半顺', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('10', '141231013', '14-12 星期三 01:05:47', '36940', '22', '龙', '杂六', '杂六', '半顺', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('11', '141231014', '14-12 星期三 01:10:51', '76810', '22', '龙', '顺子', '杂六', '半顺', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('12', '141231015', '14-12 星期三 01:15:50', '58039', '25', '和', '杂六', '杂六', '半顺', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('13', '141231016', '14-12 星期三 01:20:48', '10899', '27', '和', '半顺', '顺子', '对子', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('14', '141231017', '14-12 星期三 01:25:49', '75709', '28', '和', '对子', '杂六', '半顺', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('15', '141231018', '14-12 星期三 01:30:50', '85231', '19', '龙', '杂六', '半顺', '顺子', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('16', '141231019', '14-12 星期三 01:35:46', '98466', '33', '龙', '半顺', '杂六', '对子', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('17', '141231020', '14-12 星期三 01:40:48', '18949', '31', '和', '半顺', '半顺', '对子', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('18', '141231021', '14-12 星期三 01:45:50', '62130', '12', '龙', '半顺', '顺子', '半顺', '总和双', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('19', '141231022', '14-12 星期三 01:50:52', '53734', '22', '龙', '杂六', '对子', '半顺', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('20', '141231023', '14-12 星期三 01:55:46', '09099', '27', '和', '对子', '对子', '对子', '总和单', '总和大');
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
  CONSTRAINT `key1` FOREIGN KEY (`multiple_number`) REFERENCES `sexry_multiple` (`multiple`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sexry_bookdefine
-- ----------------------------
INSERT INTO `sexry_bookdefine` VALUES ('1', '1', '100.0', '大');
INSERT INTO `sexry_bookdefine` VALUES ('2', '2', '100.0', '小');
INSERT INTO `sexry_bookdefine` VALUES ('3', '3', '100.0', '单');
INSERT INTO `sexry_bookdefine` VALUES ('4', '4', '100.0', '双');
INSERT INTO `sexry_bookdefine` VALUES ('5', '5', '77.0', '总和大');
INSERT INTO `sexry_bookdefine` VALUES ('6', '6', '77.0', '总和小');
INSERT INTO `sexry_bookdefine` VALUES ('7', '7', '77.0', '总和单');
INSERT INTO `sexry_bookdefine` VALUES ('8', '8', '77.0', '总和双');
INSERT INTO `sexry_bookdefine` VALUES ('9', '9', '23.7', '龙');
INSERT INTO `sexry_bookdefine` VALUES ('10', '10', '35.0', '虎');
INSERT INTO `sexry_bookdefine` VALUES ('11', '11', '40.4', '和');
INSERT INTO `sexry_bookdefine` VALUES ('12', '12', '80.0', '豹子');
INSERT INTO `sexry_bookdefine` VALUES ('13', '13', '45.0', '顺子');
INSERT INTO `sexry_bookdefine` VALUES ('14', '14', '35.5', '对子');
INSERT INTO `sexry_bookdefine` VALUES ('15', '15', '40.5', '半顺');
INSERT INTO `sexry_bookdefine` VALUES ('16', '16', '20.5', '杂六');
INSERT INTO `sexry_bookdefine` VALUES ('17', '17', '9.0', '单球1-5号数字');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

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
  KEY `bookcode` (`bookcode`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sexry_bookhistory
-- ----------------------------

-- ----------------------------
-- Table structure for `sexry_liangmianpan`
-- ----------------------------
DROP TABLE IF EXISTS `sexry_liangmianpan`;
CREATE TABLE `sexry_liangmianpan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `da` float DEFAULT '0',
  `xiao` float DEFAULT '0',
  `dan` float DEFAULT '0',
  `shuang` float DEFAULT '0',
  `zhda` float DEFAULT '0',
  `zhxiao` float DEFAULT NULL,
  `zhdan` float DEFAULT NULL,
  `zhshuang` float DEFAULT NULL,
  `long` float DEFAULT NULL,
  `hu` float DEFAULT NULL,
  `he` float DEFAULT NULL,
  `description` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sexry_liangmianpan
-- ----------------------------
INSERT INTO `sexry_liangmianpan` VALUES ('1', '21', '12', '11', '13', '111', '112', '16', '17', '18', '19', '33', '两面盘赔率');

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
INSERT INTO `sexry_multiple` VALUES ('1', '1', '9.0', '单球买号赔率');
INSERT INTO `sexry_multiple` VALUES ('11', '11', '20.5', '杂六');
INSERT INTO `sexry_multiple` VALUES ('4', '4', '23.7', '龙');
INSERT INTO `sexry_multiple` VALUES ('5', '5', '35.0', '虎');
INSERT INTO `sexry_multiple` VALUES ('9', '9', '35.5', '对子');
INSERT INTO `sexry_multiple` VALUES ('6', '6', '40.4', '和');
INSERT INTO `sexry_multiple` VALUES ('10', '10', '40.5', '半顺');
INSERT INTO `sexry_multiple` VALUES ('8', '8', '45.0', '顺子');
INSERT INTO `sexry_multiple` VALUES ('3', '3', '77.0', '总和大小单双赔率');
INSERT INTO `sexry_multiple` VALUES ('7', '7', '80.0', '豹子');
INSERT INTO `sexry_multiple` VALUES ('2', '2', '100.0', '单球大小单双赔率');

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
