/*
Navicat MySQL Data Transfer

Source Server         : 192.168.5.32
Source Server Version : 50173
Source Host           : 192.168.5.32:3306
Source Database       : booksys

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2015-03-31 16:02:46
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
) ENGINE=InnoDB AUTO_INCREMENT=404 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sexry_awardhistory
-- ----------------------------
INSERT INTO `sexry_awardhistory` VALUES ('239', '150106116', '1420558854437', '08400', '12', '和', '杂六', '杂六', '对子', '总和双', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('240', '150106117', '1420559152744', '53013', '12', '龙', '杂六', '半顺', '半顺', '总和双', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('241', '150106118', '1420559452327', '66978', '36', '虎', '对子', '半顺', '顺子', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('242', '150106119', '1420559752043', '75867', '33', '和', '半顺', '半顺', '顺子', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('243', '150106120', '1420560049485', '13708', '19', '虎', '杂六', '杂六', '半顺', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('244', '150107001', '1420560353611', '05033', '11', '虎', '对子', '杂六', '对子', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('245', '150107002', '1420560653883', '94957', '34', '龙', '对子', '半顺', '杂六', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('246', '150107003', '1420560953627', '27903', '21', '虎', '杂六', '半顺', '半顺', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('247', '150107004', '1420561253669', '87639', '33', '虎', '顺子', '半顺', '杂六', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('248', '150107005', '1420561554811', '84007', '19', '龙', '杂六', '对子', '对子', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('249', '150107006', '1420561856356', '21389', '23', '虎', '顺子', '杂六', '半顺', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('250', '150107007', '1420562150222', '06821', '17', '虎', '杂六', '杂六', '半顺', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('251', '150107008', '1420562452386', '38083', '22', '和', '杂六', '对子', '杂六', '总和双', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('252', '150107009', '1420562753434', '85735', '28', '龙', '半顺', '杂六', '杂六', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('253', '150107010', '1420563052178', '40742', '17', '龙', '杂六', '杂六', '杂六', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('254', '150107011', '1420563356347', '23438', '20', '虎', '顺子', '对子', '半顺', '总和双', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('255', '150107012', '1420563654257', '57628', '28', '虎', '顺子', '半顺', '杂六', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('256', '150107013', '1420563951866', '58057', '25', '虎', '杂六', '杂六', '杂六', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('257', '150107014', '1420564252091', '00401', '5', '虎', '对子', '对子', '半顺', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('258', '150107015', '1420564554285', '09209', '20', '虎', '半顺', '半顺', '半顺', '总和双', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('259', '150107016', '1420564849437', '71645', '23', '龙', '半顺', '杂六', '顺子', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('260', '150107017', '1420565152020', '71822', '20', '龙', '半顺', '半顺', '对子', '总和双', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('261', '150107018', '1420565454020', '91482', '24', '龙', '杂六', '杂六', '杂六', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('262', '150107019', '1420565754256', '92676', '30', '龙', '杂六', '半顺', '对子', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('263', '150107020', '1420566052286', '36576', '27', '虎', '半顺', '顺子', '顺子', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('264', '150107021', '1420566354046', '65862', '27', '龙', '半顺', '半顺', '杂六', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('265', '150107022', '1420566655564', '80090', '17', '龙', '对子', '对子', '对子', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('266', '150107023', '1420566951480', '22309', '16', '虎', '对子', '半顺', '半顺', '总和双', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('267', '150111069', '1420968635698', '18929', '29', '虎', '半顺', '半顺', '对子', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('268', '150111070', '1420969236305', '97696', '37', '龙', '半顺', '半顺', '对子', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('269', '150111071', '1420969835900', '06579', '27', '虎', '半顺', '顺子', '杂六', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('270', '150111072', '1420970433310', '91320', '15', '龙', '杂六', '顺子', '半顺', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('271', '150111088', '1420980033763', '81778', '31', '和', '半顺', '对子', '对子', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('272', '150111089', '1420980634485', '70201', '10', '龙', '杂六', '对子', '顺子', '总和双', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('273', '150111090', '1420981236547', '22274', '17', '虎', '豹子', '对子', '杂六', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('274', '150111091', '1420981842019', '83104', '16', '龙', '杂六', '半顺', '半顺', '总和双', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('275', '150111092', '1420982433916', '19413', '18', '虎', '杂六', '杂六', '半顺', '总和双', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('276', '150111093', '1420983040810', '96912', '27', '龙', '对子', '杂六', '半顺', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('277', '150111110', '1420989038560', '03933', '18', '虎', '半顺', '对子', '对子', '总和双', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('278', '150113089', '1421153440116', '00277', '16', '虎', '对子', '杂六', '对子', '总和双', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('279', '150113107', '1421160944933', '39465', '27', '虎', '半顺', '杂六', '顺子', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('280', '150113108', '1421161241498', '53234', '17', '龙', '半顺', '对子', '顺子', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('281', '150113109', '1421161546524', '38565', '27', '虎', '杂六', '半顺', '对子', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('282', '150113117', '1421163943538', '51599', '29', '虎', '对子', '杂六', '对子', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('283', '150114001', '1421165139923', '93309', '24', '和', '对子', '对子', '半顺', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('284', '150114002', '1421165444295', '66837', '30', '虎', '对子', '杂六', '半顺', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('285', '150117061', '1421482247550', '64074', '21', '龙', '杂六', '杂六', '杂六', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('286', '150117062', '1421482849667', '03543', '15', '虎', '杂六', '顺子', '顺子', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('287', '150117063', '1421483451807', '32636', '20', '虎', '半顺', '半顺', '对子', '总和双', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('288', '150117064', '1421484045850', '45828', '27', '虎', '半顺', '杂六', '对子', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('289', '150117065', '1421484654439', '24963', '24', '虎', '杂六', '杂六', '杂六', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('290', '150117066', '1421485247917', '04860', '18', '和', '杂六', '杂六', '杂六', '总和双', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('291', '150117067', '1421485850153', '96989', '41', '和', '对子', '半顺', '对子', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('292', '150117068', '1421486449729', '85107', '21', '龙', '杂六', '半顺', '半顺', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('293', '150117069', '1421487052325', '28070', '17', '龙', '杂六', '半顺', '对子', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('294', '150117070', '1421487649617', '24672', '21', '和', '杂六', '半顺', '半顺', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('295', '150118035', '1421553053633', '73052', '17', '龙', '杂六', '杂六', '杂六', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('296', '150118036', '1421553651772', '99766', '37', '龙', '对子', '半顺', '对子', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('297', '150118037', '1421554252124', '63886', '31', '和', '杂六', '对子', '对子', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('298', '150118038', '1421554854510', '57380', '23', '龙', '杂六', '半顺', '杂六', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('299', '150118039', '1421555449973', '88474', '31', '龙', '对子', '半顺', '对子', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('300', '150118040', '1421556054074', '67515', '24', '龙', '顺子', '杂六', '对子', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('301', '150118041', '1421556654142', '88892', '35', '龙', '豹子', '对子', '半顺', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('302', '150118058', '1421566852205', '19877', '32', '虎', '半顺', '顺子', '对子', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('303', '150118059', '1421567455977', '49734', '27', '和', '杂六', '杂六', '半顺', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('304', '150118060', '1421568054675', '15786', '27', '虎', '杂六', '半顺', '顺子', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('305', '150118061', '1421568654296', '78605', '26', '龙', '顺子', '杂六', '半顺', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('306', '150118063', '1421569853853', '94597', '34', '龙', '半顺', '半顺', '杂六', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('307', '150118064', '1421570454123', '90384', '24', '龙', '半顺', '杂六', '半顺', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('308', '150118065', '1421571057775', '79951', '31', '龙', '对子', '对子', '杂六', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('309', '150118066', '1421571653578', '51839', '26', '虎', '杂六', '杂六', '半顺', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('310', '150118067', '1421572249493', '01667', '20', '虎', '半顺', '对子', '对子', '总和双', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('311', '150118068', '1421572849986', '44330', '14', '龙', '对子', '对子', '对子', '总和双', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('312', '150118069', '1421573448073', '97053', '24', '龙', '半顺', '杂六', '杂六', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('313', '150120004', '1421684453607', '23482', '19', '和', '顺子', '半顺', '杂六', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('314', '150120009', '1421685958247', '61298', '26', '虎', '半顺', '半顺', '半顺', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('315', '150120010', '1421686247725', '21186', '18', '虎', '对子', '对子', '杂六', '总和双', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('316', '150120012', '1421686847720', '75023', '17', '龙', '杂六', '杂六', '半顺', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('317', '150120013', '1421687145451', '60681', '21', '龙', '对子', '杂六', '杂六', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('318', '150120014', '1421687458418', '17686', '28', '虎', '半顺', '顺子', '对子', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('319', '150120015', '1421687756179', '38343', '21', '和', '对子', '半顺', '对子', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('320', '150120016', '1421688057826', '01902', '12', '虎', '顺子', '顺子', '半顺', '总和双', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('321', '150120018', '1421688645793', '87227', '26', '龙', '半顺', '对子', '对子', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('322', '150120022', '1421689847595', '47556', '27', '虎', '半顺', '对子', '对子', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('323', '150121106', '1421851852059', '90926', '26', '龙', '对子', '半顺', '杂六', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('324', '150121108', '1421852451520', '11268', '18', '虎', '对子', '半顺', '杂六', '总和双', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('325', '150121109', '1421852749664', '92047', '22', '龙', '半顺', '杂六', '杂六', '总和双', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('326', '150121110', '1421853049551', '31712', '14', '龙', '杂六', '对子', '半顺', '总和双', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('327', '150121111', '1421853356140', '84698', '35', '和', '杂六', '杂六', '半顺', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('328', '150121112', '1421853649949', '09811', '19', '虎', '顺子', '半顺', '对子', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('329', '150121113', '1421853951646', '02552', '14', '虎', '杂六', '对子', '对子', '总和双', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('330', '150121116', '1421854849482', '56517', '24', '虎', '对子', '半顺', '杂六', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('331', '150121118', '1421855451565', '00899', '26', '虎', '对子', '顺子', '对子', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('332', '150121119', '1421855749912', '22952', '20', '和', '对子', '杂六', '杂六', '总和双', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('333', '150121120', '1421856053853', '99205', '25', '龙', '对子', '半顺', '杂六', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('334', '150122001', '1421856351169', '45760', '22', '龙', '半顺', '顺子', '半顺', '总和双', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('335', '150122002', '1421856651865', '24496', '25', '虎', '对子', '对子', '杂六', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('336', '150122003', '1421856951647', '91013', '14', '龙', '顺子', '对子', '半顺', '总和双', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('337', '150122004', '1421857252226', '10184', '14', '虎', '对子', '半顺', '杂六', '总和双', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('338', '150122005', '1421857551485', '17177', '23', '虎', '对子', '对子', '对子', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('339', '150122006', '1421857853688', '13015', '10', '虎', '半顺', '半顺', '半顺', '总和双', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('340', '150122007', '1421858153694', '46702', '19', '龙', '半顺', '半顺', '杂六', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('341', '150122008', '1421858449991', '37859', '32', '虎', '半顺', '半顺', '半顺', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('342', '150122009', '1421858750066', '13503', '12', '虎', '杂六', '杂六', '杂六', '总和双', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('343', '150122010', '1421859051897', '26146', '19', '虎', '半顺', '杂六', '杂六', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('344', '150122011', '1421859352090', '20663', '17', '虎', '杂六', '对子', '对子', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('345', '150122012', '1421859652009', '17602', '16', '虎', '半顺', '半顺', '杂六', '总和双', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('346', '150122013', '1421859954081', '27158', '23', '虎', '半顺', '杂六', '杂六', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('347', '150122014', '1421860249936', '18407', '20', '虎', '杂六', '杂六', '杂六', '总和双', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('348', '150122015', '1421860551502', '74781', '27', '龙', '对子', '半顺', '半顺', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('349', '150122017', '1421861151904', '29017', '19', '虎', '半顺', '顺子', '半顺', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('350', '150122018', '1421861451887', '23905', '19', '虎', '半顺', '半顺', '半顺', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('351', '150122019', '1421861751053', '79897', '40', '和', '顺子', '对子', '顺子', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('352', '150122020', '1421862049981', '64194', '24', '龙', '杂六', '杂六', '杂六', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('353', '150122021', '1421862351528', '93929', '32', '和', '对子', '半顺', '对子', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('354', '150122022', '1421862650025', '32644', '19', '虎', '半顺', '杂六', '对子', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('355', '150122023', '1421862952187', '29488', '31', '虎', '杂六', '半顺', '对子', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('356', '150330031', '1427685049576', '78194', '29', '龙', '半顺', '半顺', '杂六', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('357', '150330032', '1427685647568', '16184', '20', '虎', '对子', '杂六', '杂六', '总和双', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('358', '150330033', '1427686249561', '50782', '22', '龙', '杂六', '半顺', '半顺', '总和双', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('359', '150330034', '1427686851596', '36803', '20', '和', '杂六', '杂六', '杂六', '总和双', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('360', '150330035', '1427687447501', '56323', '19', '龙', '半顺', '半顺', '对子', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('361', '150330036', '1427688047499', '12316', '13', '虎', '顺子', '顺子', '杂六', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('362', '150330037', '1427688653718', '13584', '21', '虎', '杂六', '杂六', '半顺', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('363', '150330038', '1427689249602', '02258', '17', '虎', '对子', '对子', '杂六', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('364', '150330039', '1427689849629', '11713', '13', '虎', '对子', '对子', '杂六', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('365', '150330040', '1427690447600', '06823', '19', '虎', '杂六', '杂六', '半顺', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('366', '150330041', '1427691053737', '66932', '26', '龙', '对子', '杂六', '半顺', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('367', '150330043', '1427692249435', '40665', '21', '虎', '杂六', '对子', '对子', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('368', '150330044', '1427692849435', '25041', '12', '龙', '杂六', '半顺', '半顺', '总和双', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('369', '150330045', '1427693447385', '16992', '27', '虎', '杂六', '对子', '对子', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('370', '150330046', '1427694047394', '95408', '26', '龙', '半顺', '半顺', '杂六', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('371', '150330047', '1427694649449', '44451', '18', '龙', '豹子', '对子', '半顺', '总和双', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('372', '150330048', '1427695247446', '77527', '28', '和', '对子', '杂六', '杂六', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('373', '150330049', '1427695851506', '45964', '28', '和', '半顺', '半顺', '杂六', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('374', '150330050', '1427696449517', '26548', '25', '虎', '半顺', '顺子', '半顺', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('375', '150330051', '1427697047455', '27785', '29', '虎', '对子', '对子', '半顺', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('376', '150330060', '1427702451613', '39195', '27', '虎', '杂六', '对子', '杂六', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('377', '150330061', '1427703049469', '45266', '23', '虎', '半顺', '半顺', '对子', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('378', '150330062', '1427703648576', '83186', '26', '龙', '杂六', '杂六', '杂六', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('379', '150330063', '1427704247479', '16743', '21', '虎', '半顺', '半顺', '半顺', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('380', '150330064', '1427704849627', '98044', '25', '龙', '顺子', '杂六', '对子', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('381', '150330065', '1427705451611', '09499', '31', '虎', '半顺', '对子', '对子', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('382', '150330066', '1427706047565', '56617', '25', '虎', '对子', '对子', '半顺', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('383', '150330068', '1427707247616', '41003', '8', '龙', '半顺', '对子', '对子', '总和双', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('384', '150330069', '1427707847574', '19023', '15', '虎', '顺子', '半顺', '半顺', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('385', '150330070', '1427708447548', '01342', '10', '虎', '半顺', '半顺', '顺子', '总和双', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('386', '150330071', '1427709055822', '97450', '25', '龙', '杂六', '半顺', '半顺', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('387', '150330072', '1427709651969', '12105', '9', '虎', '对子', '顺子', '半顺', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('388', '150330073', '1427710247749', '76999', '40', '虎', '半顺', '对子', '豹子', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('389', '150331025', '1427767851520', '19216', '19', '虎', '半顺', '半顺', '半顺', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('390', '150331026', '1427768443260', '67513', '22', '龙', '顺子', '杂六', '杂六', '总和双', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('391', '150331027', '1427769053503', '51632', '17', '龙', '半顺', '杂六', '半顺', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('392', '150331028', '1427769649447', '89015', '23', '龙', '顺子', '顺子', '半顺', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('393', '150331029', '1427770247451', '12885', '24', '虎', '半顺', '对子', '对子', '总和双', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('394', '150331030', '1427770853752', '63239', '23', '虎', '半顺', '对子', '半顺', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('395', '150331033', '1427772653544', '78376', '31', '龙', '半顺', '半顺', '半顺', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('396', '150331034', '1427773253572', '63765', '27', '龙', '半顺', '半顺', '顺子', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('397', '150331035', '1427773849491', '59591', '29', '龙', '对子', '对子', '杂六', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('398', '150331054', '1427785251685', '92000', '11', '龙', '半顺', '对子', '豹子', '总和单', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('399', '150331055', '1427785849584', '54736', '25', '虎', '半顺', '半顺', '半顺', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('400', '150331056', '1427786453726', '36976', '31', '虎', '杂六', '半顺', '半顺', '总和单', '总和大');
INSERT INTO `sexry_awardhistory` VALUES ('401', '150331057', '1427787049642', '05012', '8', '虎', '对子', '半顺', '顺子', '总和双', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('402', '150331058', '1427787653745', '00633', '12', '虎', '对子', '杂六', '对子', '总和双', '总和小');
INSERT INTO `sexry_awardhistory` VALUES ('403', '150331059', '1427788251724', '22652', '17', '和', '对子', '半顺', '半顺', '总和单', '总和小');

-- ----------------------------
-- Table structure for `sexry_bookcontrol`
-- ----------------------------
DROP TABLE IF EXISTS `sexry_bookcontrol`;
CREATE TABLE `sexry_bookcontrol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booktype` varchar(20) DEFAULT NULL,
  `min` float DEFAULT NULL,
  `max` float DEFAULT NULL,
  `total` float DEFAULT NULL,
  `description` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sexry_bookcontrol
-- ----------------------------
INSERT INTO `sexry_bookcontrol` VALUES ('1', '1', '10', '100', '300', '大');
INSERT INTO `sexry_bookcontrol` VALUES ('2', '2', '10', '100', '5000', '小');
INSERT INTO `sexry_bookcontrol` VALUES ('3', '3', '10', '100', '5000', '单');
INSERT INTO `sexry_bookcontrol` VALUES ('4', '4', '10', '100', '5000', '双');
INSERT INTO `sexry_bookcontrol` VALUES ('5', '5', '10', '100', '5000', '总和大');
INSERT INTO `sexry_bookcontrol` VALUES ('6', '6', '10', '100', '5000', '总和小');
INSERT INTO `sexry_bookcontrol` VALUES ('7', '7', '10', '100', '5000', '总和单');
INSERT INTO `sexry_bookcontrol` VALUES ('8', '8', '10', '100', '5000', '总和双');
INSERT INTO `sexry_bookcontrol` VALUES ('9', '9', '10', '100', '5000', '龙');
INSERT INTO `sexry_bookcontrol` VALUES ('10', '10', '10', '100', '5000', '虎');
INSERT INTO `sexry_bookcontrol` VALUES ('11', '11', '100', '200', '5000', '和');
INSERT INTO `sexry_bookcontrol` VALUES ('12', '12', '100', '200', '500', '豹子');
INSERT INTO `sexry_bookcontrol` VALUES ('13', '13', '100', '200', '5000', '顺子');
INSERT INTO `sexry_bookcontrol` VALUES ('14', '14', '100', '200', '300', '对子');
INSERT INTO `sexry_bookcontrol` VALUES ('15', '15', '200', '300', '4000', '半顺');
INSERT INTO `sexry_bookcontrol` VALUES ('16', '16', '300', '500', '6000', '杂六');
INSERT INTO `sexry_bookcontrol` VALUES ('17', '17', '100', '200', '4600', '1-5号数');

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
INSERT INTO `sexry_bookdefine` VALUES ('1', '1', '1.9', '大');
INSERT INTO `sexry_bookdefine` VALUES ('2', '2', '1.9', '小');
INSERT INTO `sexry_bookdefine` VALUES ('3', '3', '1.9', '单');
INSERT INTO `sexry_bookdefine` VALUES ('4', '4', '1.9', '双');
INSERT INTO `sexry_bookdefine` VALUES ('5', '5', '1.9', '总和大');
INSERT INTO `sexry_bookdefine` VALUES ('6', '6', '1.9', '总和小');
INSERT INTO `sexry_bookdefine` VALUES ('7', '7', '1.9', '总和单');
INSERT INTO `sexry_bookdefine` VALUES ('8', '8', '1.9', '总和双');
INSERT INTO `sexry_bookdefine` VALUES ('9', '9', '1.9', '龙');
INSERT INTO `sexry_bookdefine` VALUES ('10', '10', '1.9', '虎');
INSERT INTO `sexry_bookdefine` VALUES ('11', '11', '9.0', '和');
INSERT INTO `sexry_bookdefine` VALUES ('12', '12', '70.0', '豹子');
INSERT INTO `sexry_bookdefine` VALUES ('13', '13', '14.0', '顺子');
INSERT INTO `sexry_bookdefine` VALUES ('14', '14', '3.0', '对子');
INSERT INTO `sexry_bookdefine` VALUES ('15', '15', '3.0', '半顺');
INSERT INTO `sexry_bookdefine` VALUES ('16', '16', '3.0', '杂六');
INSERT INTO `sexry_bookdefine` VALUES ('17', '17', '9.0', '');

-- ----------------------------
-- Table structure for `sexry_bookdetail`
-- ----------------------------
DROP TABLE IF EXISTS `sexry_bookdetail`;
CREATE TABLE `sexry_bookdetail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bookcode` varchar(255) NOT NULL,
  `ballnumber` int(11) NOT NULL,
  `number` int(11) DEFAULT '-1',
  `booktype` int(11) DEFAULT NULL,
  `money` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `code` (`bookcode`),
  KEY `type` (`booktype`),
  CONSTRAINT `code` FOREIGN KEY (`bookcode`) REFERENCES `sexry_bookhistory` (`bookcode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `type` FOREIGN KEY (`booktype`) REFERENCES `sexry_bookdefine` (`booktype`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=329 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sexry_bookdetail
-- ----------------------------
INSERT INTO `sexry_bookdetail` VALUES ('245', '1000142', '1', '0', '17', '100');
INSERT INTO `sexry_bookdetail` VALUES ('246', '1000143', '1', '-1', '1', '100');
INSERT INTO `sexry_bookdetail` VALUES ('247', '1000144', '9', '-1', '13', '100');
INSERT INTO `sexry_bookdetail` VALUES ('248', '1000145', '8', '-1', '13', '200');
INSERT INTO `sexry_bookdetail` VALUES ('249', '1000146', '6', '-1', '6', '100');
INSERT INTO `sexry_bookdetail` VALUES ('250', '1000147', '3', '8', '17', '100');
INSERT INTO `sexry_bookdetail` VALUES ('251', '1000148', '1', '-1', '1', '100');
INSERT INTO `sexry_bookdetail` VALUES ('252', '1000148', '1', '-1', '2', '100');
INSERT INTO `sexry_bookdetail` VALUES ('253', '1000149', '1', '1', '17', '10');
INSERT INTO `sexry_bookdetail` VALUES ('254', '1000149', '2', '1', '17', '10');
INSERT INTO `sexry_bookdetail` VALUES ('255', '1000149', '3', '1', '17', '10');
INSERT INTO `sexry_bookdetail` VALUES ('256', '1000149', '4', '1', '17', '10');
INSERT INTO `sexry_bookdetail` VALUES ('257', '1000149', '5', '1', '17', '10');
INSERT INTO `sexry_bookdetail` VALUES ('258', '1000150', '1', '-1', '2', '100');
INSERT INTO `sexry_bookdetail` VALUES ('259', '1000150', '2', '-1', '2', '1000');
INSERT INTO `sexry_bookdetail` VALUES ('260', '1000150', '3', '-1', '2', '100');
INSERT INTO `sexry_bookdetail` VALUES ('261', '1000150', '4', '-1', '2', '100');
INSERT INTO `sexry_bookdetail` VALUES ('262', '1000150', '6', '-1', '7', '100');
INSERT INTO `sexry_bookdetail` VALUES ('263', '1000151', '1', '-1', '1', '100');
INSERT INTO `sexry_bookdetail` VALUES ('264', '1000151', '1', '-1', '2', '100');
INSERT INTO `sexry_bookdetail` VALUES ('265', '1000151', '1', '-1', '3', '100');
INSERT INTO `sexry_bookdetail` VALUES ('266', '1000152', '1', '0', '17', '10');
INSERT INTO `sexry_bookdetail` VALUES ('267', '1000152', '2', '0', '17', '10');
INSERT INTO `sexry_bookdetail` VALUES ('268', '1000152', '3', '0', '17', '10');
INSERT INTO `sexry_bookdetail` VALUES ('269', '1000152', '4', '0', '17', '10');
INSERT INTO `sexry_bookdetail` VALUES ('270', '1000152', '5', '0', '17', '10');
INSERT INTO `sexry_bookdetail` VALUES ('271', '1000153', '1', '-1', '1', '100');
INSERT INTO `sexry_bookdetail` VALUES ('272', '1000154', '1', '-1', '2', '100');
INSERT INTO `sexry_bookdetail` VALUES ('273', '1000155', '9', '-1', '14', '100');
INSERT INTO `sexry_bookdetail` VALUES ('274', '1000156', '6', '-1', '5', '500');
INSERT INTO `sexry_bookdetail` VALUES ('275', '1000157', '1', '0', '17', '100');
INSERT INTO `sexry_bookdetail` VALUES ('276', '1000158', '1', '-1', '1', '100');
INSERT INTO `sexry_bookdetail` VALUES ('277', '1000159', '1', '-1', '1', '100');
INSERT INTO `sexry_bookdetail` VALUES ('278', '1000160', '1', '-1', '1', '100');
INSERT INTO `sexry_bookdetail` VALUES ('279', '1000161', '1', '-1', '1', '300');
INSERT INTO `sexry_bookdetail` VALUES ('280', '1000162', '2', '-1', '1', '100');
INSERT INTO `sexry_bookdetail` VALUES ('281', '1000163', '1', '-1', '1', '100');
INSERT INTO `sexry_bookdetail` VALUES ('282', '1000164', '1', '-1', '1', '100');
INSERT INTO `sexry_bookdetail` VALUES ('283', '1000165', '1', '-1', '1', '100');
INSERT INTO `sexry_bookdetail` VALUES ('284', '1000166', '1', '-1', '1', '100');
INSERT INTO `sexry_bookdetail` VALUES ('285', '1000166', '4', '-1', '1', '100');
INSERT INTO `sexry_bookdetail` VALUES ('286', '1000167', '1', '-1', '1', '100');
INSERT INTO `sexry_bookdetail` VALUES ('287', '1000167', '4', '-1', '1', '100');
INSERT INTO `sexry_bookdetail` VALUES ('288', '1000168', '1', '-1', '1', '100');
INSERT INTO `sexry_bookdetail` VALUES ('289', '1000168', '4', '-1', '1', '100');
INSERT INTO `sexry_bookdetail` VALUES ('290', '1000169', '5', '-1', '1', '100');
INSERT INTO `sexry_bookdetail` VALUES ('292', '1000171', '1', '-1', '1', '100');
INSERT INTO `sexry_bookdetail` VALUES ('301', '1000180', '1', '-1', '1', '100');
INSERT INTO `sexry_bookdetail` VALUES ('302', '1000181', '1', '-1', '1', '100');
INSERT INTO `sexry_bookdetail` VALUES ('303', '1000182', '1', '-1', '1', '100');
INSERT INTO `sexry_bookdetail` VALUES ('306', '1000191', '1', '-1', '1', '100');
INSERT INTO `sexry_bookdetail` VALUES ('307', '1000192', '1', '-1', '1', '100');
INSERT INTO `sexry_bookdetail` VALUES ('318', '1000006', '4', '-1', '2', '100');
INSERT INTO `sexry_bookdetail` VALUES ('319', '1000006', '5', '-1', '3', '100');
INSERT INTO `sexry_bookdetail` VALUES ('320', '1000006', '6', '-1', '10', '100');
INSERT INTO `sexry_bookdetail` VALUES ('321', '1000007', '1', '-1', '2', '100');
INSERT INTO `sexry_bookdetail` VALUES ('322', '1000008', '9', '-1', '12', '100');
INSERT INTO `sexry_bookdetail` VALUES ('323', '1000009', '1', '-1', '1', '100');
INSERT INTO `sexry_bookdetail` VALUES ('324', '1000010', '9', '-1', '12', '100');
INSERT INTO `sexry_bookdetail` VALUES ('325', '1000011', '1', '-1', '2', '100');
INSERT INTO `sexry_bookdetail` VALUES ('326', '1000011', '6', '-1', '7', '100');
INSERT INTO `sexry_bookdetail` VALUES ('327', '1000012', '4', '-1', '1', '100');
INSERT INTO `sexry_bookdetail` VALUES ('328', '1000012', '9', '-1', '12', '100');

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
  `user_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `key3` (`bookuser_name`),
  KEY `bookcode` (`bookcode`),
  KEY `userid` (`user_id`),
  CONSTRAINT `userid` FOREIGN KEY (`user_id`) REFERENCES `sexry_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `name` FOREIGN KEY (`bookuser_name`) REFERENCES `sexry_user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sexry_bookhistory
-- ----------------------------
INSERT INTO `sexry_bookhistory` VALUES ('161', '1000142', 'wangweiguang', '150106113', '1420557751103', '1', '1');
INSERT INTO `sexry_bookhistory` VALUES ('162', '1000143', 'wangweiguang', '150106113', '1420557761154', '1', '1');
INSERT INTO `sexry_bookhistory` VALUES ('163', '1000144', 'wangweiguang', '150106113', '1420557766147', '1', '1');
INSERT INTO `sexry_bookhistory` VALUES ('164', '1000145', 'wangweiguang', '150106113', '1420557769104', '1', '1');
INSERT INTO `sexry_bookhistory` VALUES ('165', '1000146', 'wangweiguang', '150106113', '1420557777692', '1', '1');
INSERT INTO `sexry_bookhistory` VALUES ('166', '1000147', 'wangweiguang', '150106113', '1420557819317', '1', '1');
INSERT INTO `sexry_bookhistory` VALUES ('167', '1000148', 'wangweiguang', '150106114', '1420557995794', '1', '1');
INSERT INTO `sexry_bookhistory` VALUES ('168', '1000149', 'wangweiguang', '150106114', '1420558052912', '1', '1');
INSERT INTO `sexry_bookhistory` VALUES ('169', '1000150', 'wangweiguang', '150106114', '1420558104284', '1', '1');
INSERT INTO `sexry_bookhistory` VALUES ('170', '1000151', 'wangweiguang', '150106115', '1420558360696', '1', '1');
INSERT INTO `sexry_bookhistory` VALUES ('171', '1000152', 'wangweiguang', '150106115', '1420558390097', '1', '1');
INSERT INTO `sexry_bookhistory` VALUES ('172', '1000153', 'wangweiguang', '150106118', '1420559147834', '1', '1');
INSERT INTO `sexry_bookhistory` VALUES ('173', '1000154', 'wangweiguang', '150107003', '1420560739311', '1', '1');
INSERT INTO `sexry_bookhistory` VALUES ('174', '1000155', 'wangweiguang', '150107003', '1420560746796', '1', '1');
INSERT INTO `sexry_bookhistory` VALUES ('175', '1000156', 'wangweiguang', '150107004', '1420561054256', '1', '1');
INSERT INTO `sexry_bookhistory` VALUES ('176', '1000157', 'wangweiguang', '150107009', '1420562546269', '1', '1');
INSERT INTO `sexry_bookhistory` VALUES ('177', '1000158', 'wangweiguang', '150107010', '1420562842097', '1', '1');
INSERT INTO `sexry_bookhistory` VALUES ('178', '1000159', 'wangweiguang', '150118036', '1421553053336', '1', '1');
INSERT INTO `sexry_bookhistory` VALUES ('179', '1000160', 'wangweiguang', '150118036', '1421553177303', '1', '1');
INSERT INTO `sexry_bookhistory` VALUES ('180', '1000161', 'wangweiguang', '150118036', '1421553188925', '1', '1');
INSERT INTO `sexry_bookhistory` VALUES ('181', '1000162', 'wangweiguang', '150118036', '1421553326376', '1', '1');
INSERT INTO `sexry_bookhistory` VALUES ('182', '1000163', 'wangweiguang', '150118036', '1421553447755', '1', '1');
INSERT INTO `sexry_bookhistory` VALUES ('183', '1000164', 'wangweiguang', '150118037', '1421553656192', '1', '1');
INSERT INTO `sexry_bookhistory` VALUES ('184', '1000165', 'wangweiguang', '150118037', '1421553713986', '1', '1');
INSERT INTO `sexry_bookhistory` VALUES ('185', '1000166', 'wangweiguang', '150118037', '1421553808549', '1', '1');
INSERT INTO `sexry_bookhistory` VALUES ('186', '1000167', 'wangweiguang', '150118037', '1421553909375', '1', '1');
INSERT INTO `sexry_bookhistory` VALUES ('187', '1000168', 'wangweiguang', '150118037', '1421554008310', '1', '1');
INSERT INTO `sexry_bookhistory` VALUES ('188', '1000169', 'wangweiguang', '150118038', '1421554396688', '1', '1');
INSERT INTO `sexry_bookhistory` VALUES ('190', '1000171', 'wangweiguang', '150118038', '1421554633842', '1', '1');
INSERT INTO `sexry_bookhistory` VALUES ('199', '1000180', 'wangweiguang', '150118040', '1421555440929', '1', '1');
INSERT INTO `sexry_bookhistory` VALUES ('200', '1000181', 'wangweiguang', '150118040', '1421555450951', '1', '1');
INSERT INTO `sexry_bookhistory` VALUES ('201', '1000182', 'wangweiguang', '150118040', '1421555457694', '1', '1');
INSERT INTO `sexry_bookhistory` VALUES ('203', '1000184', 'wangweiguang', '150118040', '1421555658871', '1', '1');
INSERT INTO `sexry_bookhistory` VALUES ('210', '1000191', 'wangweiguang', '150118060', '1421567805027', '1', '1');
INSERT INTO `sexry_bookhistory` VALUES ('211', '1000192', 'wangweiguang', '150118064', '1421570284327', '1', '1');
INSERT INTO `sexry_bookhistory` VALUES ('217', '1000006', 'wangweiguang', '150330045', '1427693050978', '1', '1');
INSERT INTO `sexry_bookhistory` VALUES ('218', '1000007', 'sp002', '150331028', '1427769319760', '1', '3');
INSERT INTO `sexry_bookhistory` VALUES ('219', '1000008', 'sp002', '150331028', '1427769327291', '1', '3');
INSERT INTO `sexry_bookhistory` VALUES ('220', '1000009', 'sp003', '150331028', '1427769363605', '1', '4');
INSERT INTO `sexry_bookhistory` VALUES ('221', '1000010', 'sp003', '150331028', '1427769369267', '1', '4');
INSERT INTO `sexry_bookhistory` VALUES ('222', '1000011', 'wangweiguang', '150331055', '1427785415347', '1', '1');
INSERT INTO `sexry_bookhistory` VALUES ('223', '1000012', 'wangweiguang', '150331055', '1427785423805', '1', '1');

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
INSERT INTO `sexry_multiple` VALUES ('2', '2', '1.9', '单球大小单双赔率');
INSERT INTO `sexry_multiple` VALUES ('3', '3', '1.9', '总和大小单双赔率');
INSERT INTO `sexry_multiple` VALUES ('5', '5', '1.9', '虎');
INSERT INTO `sexry_multiple` VALUES ('4', '4', '1.9', '龙');
INSERT INTO `sexry_multiple` VALUES ('10', '10', '3.0', '半顺');
INSERT INTO `sexry_multiple` VALUES ('9', '9', '3.0', '对子');
INSERT INTO `sexry_multiple` VALUES ('11', '11', '3.0', '杂六');
INSERT INTO `sexry_multiple` VALUES ('1', '1', '9.0', '单球买号赔率');
INSERT INTO `sexry_multiple` VALUES ('6', '6', '9.0', '和');
INSERT INTO `sexry_multiple` VALUES ('8', '8', '14.0', '顺子');
INSERT INTO `sexry_multiple` VALUES ('7', '7', '70.0', '豹子');

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
  `result` float(11,0) NOT NULL DEFAULT '0',
  `booktime` bigint(32) DEFAULT NULL,
  `back` float DEFAULT '0' COMMENT '退水',
  `backresult` float DEFAULT '0' COMMENT '退水后的结果',
  `user_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `userids` (`user_id`),
  CONSTRAINT `userids` FOREIGN KEY (`user_id`) REFERENCES `sexry_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sexry_result
-- ----------------------------
INSERT INTO `sexry_result` VALUES ('146', '1000142', 'wangweiguang', '150106113', '第1球-0', '100', '-100', '1420557751103', '0', '-100', '1');
INSERT INTO `sexry_result` VALUES ('147', '1000143', 'wangweiguang', '150106113', '1号球大', '100', '-100', '1420557761154', '0', '-100', '1');
INSERT INTO `sexry_result` VALUES ('148', '1000144', 'wangweiguang', '150106113', '后顺', '100', '-100', '1420557766147', '0', '-100', '1');
INSERT INTO `sexry_result` VALUES ('149', '1000145', 'wangweiguang', '150106113', '中顺', '200', '-200', '1420557769104', '0', '-200', '1');
INSERT INTO `sexry_result` VALUES ('150', '1000146', 'wangweiguang', '150106113', '总和小', '100', '-100', '1420557777692', '0', '-100', '1');
INSERT INTO `sexry_result` VALUES ('151', '1000147', 'wangweiguang', '150106113', '第3球-8', '100', '-100', '1420557819317', '0', '-100', '1');
INSERT INTO `sexry_result` VALUES ('152', '1000148', 'wangweiguang', '150106114', '1号球大', '100', '-100', '1420557995794', '0', '-100', '1');
INSERT INTO `sexry_result` VALUES ('153', '1000148', 'wangweiguang', '150106114', '1号球小', '100', '90', '1420557995794', '0', '90', '1');
INSERT INTO `sexry_result` VALUES ('154', '1000149', 'wangweiguang', '150106114', '第1球-1', '10', '-10', '1420558052912', '0', '-10', '1');
INSERT INTO `sexry_result` VALUES ('155', '1000149', 'wangweiguang', '150106114', '第2球-1', '10', '-10', '1420558052912', '0', '-10', '1');
INSERT INTO `sexry_result` VALUES ('156', '1000149', 'wangweiguang', '150106114', '第3球-1', '10', '-10', '1420558052912', '0', '-10', '1');
INSERT INTO `sexry_result` VALUES ('157', '1000149', 'wangweiguang', '150106114', '第4球-1', '10', '-10', '1420558052912', '0', '-10', '1');
INSERT INTO `sexry_result` VALUES ('158', '1000149', 'wangweiguang', '150106114', '第5球-1', '10', '-10', '1420558052912', '0', '-10', '1');
INSERT INTO `sexry_result` VALUES ('159', '1000150', 'wangweiguang', '150106114', '1号球小', '100', '90', '1420558104284', '0', '90', '1');
INSERT INTO `sexry_result` VALUES ('160', '1000150', 'wangweiguang', '150106114', '2号球小', '1000', '-1000', '1420558104284', '0', '-1000', '1');
INSERT INTO `sexry_result` VALUES ('161', '1000150', 'wangweiguang', '150106114', '3号球小', '100', '-100', '1420558104284', '0', '-100', '1');
INSERT INTO `sexry_result` VALUES ('162', '1000150', 'wangweiguang', '150106114', '4号球小', '100', '90', '1420558104284', '0', '90', '1');
INSERT INTO `sexry_result` VALUES ('163', '1000150', 'wangweiguang', '150106114', '总和单', '100', '90', '1420558104284', '0', '90', '1');
INSERT INTO `sexry_result` VALUES ('164', '1000151', 'wangweiguang', '150106115', '第1球-大', '100', '90', '1420558360696', '0', '90', '1');
INSERT INTO `sexry_result` VALUES ('165', '1000151', 'wangweiguang', '150106115', '第1球-小', '100', '-100', '1420558360696', '0', '-100', '1');
INSERT INTO `sexry_result` VALUES ('166', '1000151', 'wangweiguang', '150106115', '第1球-单', '100', '-100', '1420558360696', '0', '-100', '1');
INSERT INTO `sexry_result` VALUES ('167', '1000152', 'wangweiguang', '150106115', '第1球-0', '10', '-10', '1420558390097', '0', '-10', '1');
INSERT INTO `sexry_result` VALUES ('168', '1000152', 'wangweiguang', '150106115', '第2球-0', '10', '-10', '1420558390097', '0', '-10', '1');
INSERT INTO `sexry_result` VALUES ('169', '1000152', 'wangweiguang', '150106115', '第3球-0', '10', '-10', '1420558390097', '0', '-10', '1');
INSERT INTO `sexry_result` VALUES ('170', '1000152', 'wangweiguang', '150106115', '第4球-0', '10', '80', '1420558390097', '0', '80', '1');
INSERT INTO `sexry_result` VALUES ('171', '1000152', 'wangweiguang', '150106115', '第5球-0', '10', '-10', '1420558390097', '0', '-10', '1');
INSERT INTO `sexry_result` VALUES ('172', '1000153', 'wangweiguang', '150106118', '第1球-大', '100', '90', '1420559147834', '0', '90', '1');
INSERT INTO `sexry_result` VALUES ('173', '1000154', 'wangweiguang', '150107003', '第1球-小', '100', '90', '1420560739311', '0', '90', '1');
INSERT INTO `sexry_result` VALUES ('174', '1000155', 'wangweiguang', '150107003', '后对', '100', '-100', '1420560746796', '0', '-100', '1');
INSERT INTO `sexry_result` VALUES ('175', '1000156', 'wangweiguang', '150107004', '总和大', '500', '450', '1420561054256', '0', '450', '1');
INSERT INTO `sexry_result` VALUES ('176', '1000157', 'wangweiguang', '150107009', '第1球-0', '100', '-100', '1420562546269', '0', '-100', '1');
INSERT INTO `sexry_result` VALUES ('177', '1000158', 'wangweiguang', '150107010', '第1球-大', '100', '-100', '1420562842097', '0', '-100', '1');
INSERT INTO `sexry_result` VALUES ('178', '1000159', 'wangweiguang', '150118036', '第1球-大', '100', '90', '1421553053336', '0', '90', '1');
INSERT INTO `sexry_result` VALUES ('179', '1000160', 'wangweiguang', '150118036', '第1球-大', '100', '90', '1421553177303', '0', '90', '1');
INSERT INTO `sexry_result` VALUES ('180', '1000161', 'wangweiguang', '150118036', '第1球-大', '300', '270', '1421553188925', '0', '270', '1');
INSERT INTO `sexry_result` VALUES ('181', '1000162', 'wangweiguang', '150118036', '第2球-大', '100', '90', '1421553326376', '0', '90', '1');
INSERT INTO `sexry_result` VALUES ('182', '1000163', 'wangweiguang', '150118036', '第1球-大', '100', '90', '1421553447755', '0', '90', '1');
INSERT INTO `sexry_result` VALUES ('183', '1000164', 'wangweiguang', '150118037', '第1球-大', '100', '90', '1421553656192', '0', '90', '1');
INSERT INTO `sexry_result` VALUES ('184', '1000165', 'wangweiguang', '150118037', '第1球-大', '100', '90', '1421553713986', '0', '90', '1');
INSERT INTO `sexry_result` VALUES ('185', '1000166', 'wangweiguang', '150118037', '第1球-大', '100', '90', '1421553808549', '0', '90', '1');
INSERT INTO `sexry_result` VALUES ('186', '1000166', 'wangweiguang', '150118037', '第4球-大', '100', '90', '1421553808549', '0', '90', '1');
INSERT INTO `sexry_result` VALUES ('187', '1000167', 'wangweiguang', '150118037', '第1球-大', '100', '90', '1421553909375', '0', '90', '1');
INSERT INTO `sexry_result` VALUES ('188', '1000167', 'wangweiguang', '150118037', '第4球-大', '100', '90', '1421553909375', '0', '90', '1');
INSERT INTO `sexry_result` VALUES ('189', '1000168', 'wangweiguang', '150118037', '第1球-大', '100', '90', '1421554008310', '0', '90', '1');
INSERT INTO `sexry_result` VALUES ('190', '1000168', 'wangweiguang', '150118037', '第4球-大', '100', '90', '1421554008310', '0', '90', '1');
INSERT INTO `sexry_result` VALUES ('191', '1000169', 'wangweiguang', '150118038', '第5球-大', '100', '-100', '1421554396688', '0', '-100', '1');
INSERT INTO `sexry_result` VALUES ('192', '1000171', 'wangweiguang', '150118038', '第1球-大', '100', '90', '1421554633842', '0', '90', '1');
INSERT INTO `sexry_result` VALUES ('193', '1000180', 'wangweiguang', '150118040', '第1球-大', '100', '90', '1421555440929', '0', '90', '1');
INSERT INTO `sexry_result` VALUES ('194', '1000181', 'wangweiguang', '150118040', '第1球-大', '100', '90', '1421555450951', '0', '90', '1');
INSERT INTO `sexry_result` VALUES ('195', '1000182', 'wangweiguang', '150118040', '第1球-大', '100', '90', '1421555457694', '0', '90', '1');
INSERT INTO `sexry_result` VALUES ('196', '1000191', 'wangweiguang', '150118060', '第1球-大', '100', '-100', '1421567805027', '0', '-100', '1');
INSERT INTO `sexry_result` VALUES ('197', '1000192', 'wangweiguang', '150118064', '第1球-大', '100', '90', '1421570284327', '0', '90', '1');
INSERT INTO `sexry_result` VALUES ('198', '1000006', 'wangweiguang', '150330045', '第4球-小', '100', '-100', '1427693050978', '0', '-100', '1');
INSERT INTO `sexry_result` VALUES ('199', '1000006', 'wangweiguang', '150330045', '第5球-单', '100', '90', '1427693050978', '0', '90', '1');
INSERT INTO `sexry_result` VALUES ('200', '1000006', 'wangweiguang', '150330045', '虎', '100', '90', '1427693050978', '0', '90', '1');
INSERT INTO `sexry_result` VALUES ('201', '1000007', 'sp002', '150331028', '第1球-小', '100', '-100', '1427769319760', '0', '-100', '3');
INSERT INTO `sexry_result` VALUES ('202', '1000008', 'sp002', '150331028', '后豹', '100', '-100', '1427769327291', '0', '-100', '3');
INSERT INTO `sexry_result` VALUES ('203', '1000009', 'sp003', '150331028', '第1球-大', '100', '90', '1427769363605', '0', '90', '4');
INSERT INTO `sexry_result` VALUES ('204', '1000010', 'sp003', '150331028', '后豹', '100', '-100', '1427769369267', '0', '-100', '4');
INSERT INTO `sexry_result` VALUES ('205', '1000011', 'wangweiguang', '150331055', '第1球-小', '100', '-100', '1427785415347', '0', '-100', '1');
INSERT INTO `sexry_result` VALUES ('206', '1000011', 'wangweiguang', '150331055', '总和单', '100', '90', '1427785415347', '0', '90', '1');
INSERT INTO `sexry_result` VALUES ('207', '1000012', 'wangweiguang', '150331055', '第4球-大', '100', '-100', '1427785423805', '0', '-100', '1');
INSERT INTO `sexry_result` VALUES ('208', '1000012', 'wangweiguang', '150331055', '后豹', '100', '-100', '1427785423805', '0', '-100', '1');

-- ----------------------------
-- Table structure for `sexry_user`
-- ----------------------------
DROP TABLE IF EXISTS `sexry_user`;
CREATE TABLE `sexry_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL,
  `password` varchar(32) NOT NULL,
  `curentcredit` float NOT NULL DEFAULT '0',
  `maxcredit` float NOT NULL DEFAULT '0',
  `isbind` int(1) NOT NULL,
  `pid` int(11) DEFAULT '1' COMMENT '所属的父user',
  `hasprivileges` int(11) DEFAULT '1' COMMENT '是否有下发帐号的权利，1表示具有，0表示不具有',
  PRIMARY KEY (`id`),
  KEY `id` (`id`,`username`,`password`,`curentcredit`,`maxcredit`,`isbind`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='用户信息';

-- ----------------------------
-- Records of sexry_user
-- ----------------------------
INSERT INTO `sexry_user` VALUES ('1', 'wangweiguang', '1111', '4540', '50000', '0', '0', '1');
INSERT INTO `sexry_user` VALUES ('2', 'sp001', '1234', '50020', '5000', '0', '1', '1');
INSERT INTO `sexry_user` VALUES ('3', 'sp002', '1234', '49900', '50000', '0', '1', '1');
INSERT INTO `sexry_user` VALUES ('4', 'sp003', '1234', '49900', '50000', '0', '2', '1');
INSERT INTO `sexry_user` VALUES ('5', 'sp004', '1234', '50000', '50000', '0', '2', '1');
INSERT INTO `sexry_user` VALUES ('6', 'sp005', '1234', '50000', '50000', '0', '3', '1');
INSERT INTO `sexry_user` VALUES ('7', 'sp006', '1234', '50000', '50000', '0', '4', '1');
INSERT INTO `sexry_user` VALUES ('8', 'sp007', '1234', '50000', '50000', '0', '5', '1');
INSERT INTO `sexry_user` VALUES ('9', 'sp008', '1234', '50000', '50000', '0', '3', '1');
INSERT INTO `sexry_user` VALUES ('10', '123', '123', '50000', '50000', '0', '1', '1');
INSERT INTO `sexry_user` VALUES ('11', 'sp009', '123', '50000', '50000', '0', '1', '1');
INSERT INTO `sexry_user` VALUES ('12', 'wwg8960', '1234', '50000', '50000', '0', '1', '1');
INSERT INTO `sexry_user` VALUES ('13', 'sp0010', '123', '50000', '50000', '0', '1', '1');
INSERT INTO `sexry_user` VALUES ('14', 'dddd', 'dddd', '50000', '50000', '0', '1', '1');
INSERT INTO `sexry_user` VALUES ('15', 'weiguang', '1234', '50000', '50000', '0', '1', '1');
INSERT INTO `sexry_user` VALUES ('16', '11111', '11111', '50000', '50000', '0', '1', '1');
INSERT INTO `sexry_user` VALUES ('17', 'ddddddd', '1111', '50000', '50000', '0', '1', '1');
