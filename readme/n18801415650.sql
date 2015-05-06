/*
Navicat MySQL Data Transfer

Source Server         : tsdatabase
Source Server Version : 50616
Source Host           : localhost:3306
Source Database       : argrms

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-04-20 02:03:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `n18801415650`
-- ----------------------------
DROP TABLE IF EXISTS `n18801415650`;
CREATE TABLE `n18801415650` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `UploadTime` datetime NOT NULL,
  `airtemp` varchar(50) DEFAULT NULL,
  `airhumidity` varchar(50) DEFAULT NULL,
  `atmosphericpressure` varchar(50) DEFAULT NULL,
  `illumination` varchar(50) DEFAULT NULL,
  `soiltemp` varchar(50) DEFAULT NULL,
  `soilhumidity` varchar(50) DEFAULT NULL,
  `windspeed` varchar(50) DEFAULT NULL,
  `winddirection1` varchar(50) DEFAULT NULL,
  `evaporation` varchar(50) DEFAULT NULL,
  `rainfall` varchar(50) DEFAULT NULL,
  `solarradiation` varchar(50) DEFAULT NULL,
  `CO2` varchar(50) DEFAULT NULL,
  `ultraviolet` varchar(50) DEFAULT NULL,
  `bak_attr1` varchar(50) DEFAULT NULL,
  `bak_attr2` varchar(50) DEFAULT NULL,
  `bak_attr3` varchar(50) DEFAULT NULL,
  `bak_attr4` varchar(50) DEFAULT NULL,
  `bak_attr5` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of n18801415650
-- ----------------------------
INSERT INTO `n18801415650` VALUES ('1', '2015-04-16 14:37:43', '19.8', '23.5', '101.4', null, '11.6', '34.5', '3.9', '西北偏北', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('2', '2015-04-16 15:00:19', '19.8', '23.5', '101.4', null, '11.6', '34.5', '3.9', '西北偏北', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('3', '2015-04-16 16:00:03', '20.2', '15.1', '101.4', null, '11.6', '34.5', '3.3', '西', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('4', '2015-04-16 17:00:02', '19.4', '17.5', '101.3', null, '11.7', '34.5', '1.9', '西北偏西', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('5', '2015-04-16 17:11:24', '19.4', '17.5', '101.3', null, '11.7', '34.5', '1.9', '西北偏西', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('6', '2015-04-16 18:09:15', '18.6', '19.8', '101.3', null, '11.7', '34.5', '2.1', '西南偏西', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('7', '2015-04-16 19:07:17', '17.2', '21.2', '101.3', null, '11.7', '34.5', '1.4', '西南', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('8', '2015-04-16 20:00:55', '15.7', '27.8', '101.3', null, '11.7', '34.5', '1.6', '西南', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('9', '2015-04-16 21:00:05', '14.5', '31.2', '101.3', null, '11.8', '34.6', '1.3', '西南偏南', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('10', '2015-04-16 22:00:06', '13.6', '34.8', '101.4', null, '11.9', '34.6', '0.2', '西南偏南', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('11', '2015-04-16 23:00:05', '10.9', '50.1', '101.5', null, '12.0', '34.6', '0.0', '东南', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('12', '2015-04-17 00:00:06', '10.2', '54.4', '101.5', null, '12.0', '34.6', '0.0', '东北偏东', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('13', '2015-04-17 01:00:05', '11.4', '47.0', '101.5', null, '12.0', '34.6', '0.3', '东北', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('14', '2015-04-17 02:00:07', '11.4', '45.3', '101.4', null, '12.1', '34.6', '0.5', '西南', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('15', '2015-04-17 03:00:08', '9.2', '57.7', '101.4', null, '12.1', '34.6', '0.7', '南', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('16', '2015-04-17 04:00:04', '9.3', '58.5', '101.4', null, '12.1', '34.6', '0.0', '东', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('17', '2015-04-17 05:00:05', '7.1', '76.8', '101.4', null, '12.1', '34.6', '0.2', '西南偏南', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('18', '2015-04-17 06:00:05', '5.9', '83.8', '101.4', null, '11.9', '34.5', '0.1', '西南偏南', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('19', '2015-04-17 07:00:05', '6.5', '86.1', '101.4', null, '12.0', '34.5', '0.3', '西南', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('20', '2015-04-17 08:00:05', '11.0', '62.2', '101.3', null, '12.0', '34.5', '0.2', '东南偏南', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('21', '2015-04-17 09:00:04', '13.7', '49.2', '101.3', null, '11.9', '34.5', '1.2', '西南', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('22', '2015-04-17 10:00:47', '15.9', '44.9', '101.4', null, '11.8', '34.5', '1.0', '西', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('23', '2015-04-17 11:00:05', '17.7', '43.3', '101.4', null, '11.8', '34.5', '1.3', '西', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('24', '2015-04-17 12:00:04', '18.8', '41.7', '101.3', null, '11.7', '34.4', '2.2', '西南偏西', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('25', '2015-04-17 13:00:06', '20.6', '39.1', '101.2', null, '11.7', '34.4', '2.8', '西南偏西', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('26', '2015-04-17 14:00:04', '22.9', '33.4', '101.2', null, '11.6', '34.4', '1.2', '西南', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('27', '2015-04-17 15:00:05', '24.6', '31.3', '101.1', null, '11.6', '34.4', '0.8', '西南偏南', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('28', '2015-04-17 16:00:04', '24.6', '28.8', '101.0', null, '11.6', '34.4', '1.0', '西', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('29', '2015-04-17 17:00:05', '25.3', '28.0', '101.0', null, '11.6', '34.4', '1.5', '西南偏南', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('30', '2015-04-17 18:00:04', '23.6', '31.7', '101.0', null, '11.6', '34.4', '1.0', '西南', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('31', '2015-04-17 19:00:05', '20.8', '44.9', '101.1', null, '11.7', '34.4', '0.4', '东北偏东', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('32', '2015-04-17 20:00:05', '17.4', '57.6', '101.2', null, '11.7', '34.5', '0.0', '西北偏北', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('33', '2015-04-17 21:00:05', '16.0', '61.0', '101.3', null, '11.8', '34.5', '0.4', '东南', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('34', '2015-04-17 22:00:05', '15.9', '64.5', '101.3', null, '11.8', '34.5', '0.0', '南', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('35', '2015-04-17 23:00:05', '13.9', '74.8', '101.3', null, '11.9', '34.5', '0.0', '东南', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('36', '2015-04-18 00:00:05', '13.8', '81.2', '101.4', null, '12.0', '34.5', '0.2', '东', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('37', '2015-04-18 01:00:05', '12.9', '80.6', '101.4', null, '12.1', '34.5', '0.0', '南', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('38', '2015-04-18 02:00:05', '12.5', '86.2', '101.4', null, '12.1', '34.6', '0.0', '东南偏东', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('39', '2015-04-18 03:00:05', '12.8', '87.2', '101.4', null, '12.2', '34.5', '0.1', '东', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('40', '2015-04-18 04:00:05', '12.8', '89.1', '101.4', null, '12.2', '34.5', '0.5', '东', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('41', '2015-04-18 05:00:05', '13.2', '84.9', '101.4', null, '12.3', '34.5', '0.5', '东', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('42', '2015-04-18 06:00:05', '13.0', '88.0', '101.4', null, '12.3', '34.5', '0.8', '东', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('43', '2015-04-18 07:00:06', '13.2', '89.0', '101.5', null, '12.3', '34.5', '1.0', '东', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('44', '2015-04-18 08:00:05', '14.0', '88.3', '101.4', null, '12.2', '34.4', '1.1', '东南偏东', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('45', '2015-04-18 09:00:04', '15.0', '83.6', '101.5', null, '12.2', '34.4', '1.0', '东北偏东', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('46', '2015-04-18 10:00:04', '17.4', '75.6', '101.5', null, '12.3', '34.4', '1.6', '东南偏东', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('47', '2015-04-18 11:00:05', '20.2', '64.5', '101.5', null, '12.3', '34.4', '0.7', '东南', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('48', '2015-04-18 12:00:04', '22.3', '58.0', '101.5', null, '12.3', '34.4', '0.8', '东北偏北', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('49', '2015-04-18 13:00:06', '23.1', '53.3', '101.4', null, '12.2', '34.4', '1.1', '东北偏东', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('50', '2015-04-18 14:00:04', '22.2', '55.5', '101.4', null, '12.3', '34.4', '0.6', '东', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('51', '2015-04-18 15:00:05', '21.5', '60.1', '101.4', null, '12.2', '34.4', '1.0', '东南偏东', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('52', '2015-04-18 16:00:06', '20.7', '47.3', '101.3', null, '12.2', '34.3', '1.3', '东南偏南', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('53', '2015-04-18 17:00:05', '19.6', '55.4', '101.3', null, '12.2', '34.4', '1.0', '东南', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('54', '2015-04-18 18:00:04', '18.4', '58.3', '101.4', null, '12.3', '34.4', '1.6', '南', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('55', '2015-04-18 19:00:05', '17.1', '65.7', '101.5', null, '12.3', '34.4', '0.8', '南', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('56', '2015-04-18 20:00:06', '16.4', '69.2', '101.5', null, '12.4', '34.4', '0.3', '西', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('57', '2015-04-18 21:00:05', '15.7', '72.6', '101.6', null, '12.4', '34.4', '1.0', '南', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('58', '2015-04-18 22:00:04', '15.7', '69.1', '101.6', null, '12.5', '34.4', '0.9', '东南偏东', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('59', '2015-04-18 23:00:05', '14.6', '75.2', '101.6', null, '12.5', '34.4', '0.5', '东北偏北', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('60', '2015-04-19 00:00:06', '14.7', '69.8', '101.6', null, '12.6', '34.4', '0.4', '东北偏东', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('61', '2015-04-19 01:00:05', '14.3', '63.4', '101.6', null, '12.7', '34.4', '0.4', '东南', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('62', '2015-04-19 02:00:05', '13.8', '61.9', '101.6', null, '12.7', '34.4', '0.4', '东南偏南', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('63', '2015-04-19 03:00:04', '12.9', '70.4', '101.7', null, '12.7', '34.4', '0.1', '西南偏南', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('64', '2015-04-19 04:00:05', '12.7', '74.0', '101.6', null, '12.8', '34.4', '0.0', '西南偏南', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('65', '2015-04-19 05:00:05', '11.5', '84.2', '101.6', null, '12.8', '34.4', '0.0', '东南偏东', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('66', '2015-04-19 06:00:05', '11.5', '86.1', '101.7', null, '12.8', '34.4', '0.0', '东南偏南', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('67', '2015-04-19 07:00:05', '12.1', '81.1', '101.7', null, '12.8', '34.4', '0.5', '东北偏东', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('68', '2015-04-19 08:00:09', '13.6', '74.9', '101.8', null, '12.8', '34.3', '0.2', '东南偏东', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('69', '2015-04-19 09:00:05', '14.5', '67.4', '101.8', null, '12.7', '34.3', '0.4', '东北偏东', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('70', '2015-04-19 10:00:06', '15.2', '70.1', '101.9', null, '12.7', '34.3', '1.0', '西北偏西', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('71', '2015-04-19 11:00:04', '16.7', '61.7', '101.9', null, '12.7', '34.3', '0.2', '西南偏西', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('72', '2015-04-19 12:00:05', '18.7', '61.8', '101.9', null, '12.7', '34.3', '2.3', '西南偏南', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('73', '2015-04-19 13:00:05', '18.0', '54.9', '101.8', null, '12.7', '34.3', '2.5', '西南偏南', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('74', '2015-04-19 14:00:46', '17.8', '56.0', '101.8', null, '12.6', '34.3', '2.5', '西南', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('75', '2015-04-19 15:00:10', '18.5', '52.9', '101.8', null, '12.6', '34.3', '2.0', '西南偏南', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('76', '2015-04-19 16:00:05', '18.1', '54.5', '101.8', null, '12.6', '34.3', '2.0', '西南', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('77', '2015-04-19 17:00:05', '17.6', '54.6', '101.7', null, '12.6', '34.3', '1.1', '西南偏南', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('78', '2015-04-19 18:00:05', '16.9', '55.1', '101.7', null, '12.6', '34.3', '1.4', '西南偏南', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('79', '2015-04-19 19:00:05', '15.8', '63.2', '101.8', null, '12.6', '34.3', '1.2', '西南', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('80', '2015-04-19 20:00:05', '14.5', '66.4', '101.8', null, '12.6', '34.3', '1.0', '西南偏西', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('81', '2015-04-19 21:00:04', '13.4', '67.0', '102.0', null, '12.7', '34.3', '1.0', '西南', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('82', '2015-04-19 22:00:05', '12.5', '68.2', '102.0', null, '12.7', '34.3', '1.6', '西南', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('83', '2015-04-19 23:00:05', '10.5', '74.1', '102.0', null, '12.7', '34.3', '0.4', '南', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('84', '2015-04-20 00:00:04', '9.3', '82.6', '102.1', null, '12.8', '34.3', '0.0', '南', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('85', '2015-04-20 01:00:04', '8.5', '91.5', '102.1', null, '12.8', '34.3', '0.0', '西', null, '0.0', null, null, null, null, null, null, null, null);
INSERT INTO `n18801415650` VALUES ('86', '2015-04-20 02:00:04', '7.0', '97.6', '102.1', null, '12.8', '34.3', '0.0', '西南', null, '0.0', null, null, null, null, null, null, null, null);
