/*
Navicat MySQL Data Transfer

Source Server         : 123
Source Server Version : 50549
Source Host           : localhost:3306
Source Database       : cloudmusics

Target Server Type    : MYSQL
Target Server Version : 50549
File Encoding         : 65001

Date: 2018-01-24 17:16:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_category` varchar(255) COLLATE utf8_bin NOT NULL,
  `c_describe` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `c_hide` int(1) DEFAULT '0',
  PRIMARY KEY (`c_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('0', '全部', null, '0');

-- ----------------------------
-- Table structure for musics
-- ----------------------------
DROP TABLE IF EXISTS `musics`;
CREATE TABLE `musics` (
  `m_id` int(11) NOT NULL AUTO_INCREMENT,
  `m_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `m_singer` varchar(255) COLLATE utf8_bin DEFAULT '群星',
  `m_album` varchar(255) COLLATE utf8_bin DEFAULT '群星',
  `m_category` int(11) DEFAULT NULL,
  `m_describe` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `m_ishide` int(1) DEFAULT '0',
  `m_net_Address` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `m_local_Address` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`m_id`) USING BTREE,
  KEY `cfk` (`m_category`) USING BTREE,
  CONSTRAINT `cfk` FOREIGN KEY (`m_category`) REFERENCES `category` (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of musics
-- ----------------------------
INSERT INTO `musics` VALUES ('15', '其实，我就在你方圆几里(cover 薛之谦)', 'Amy Chanrich', 'Amy Chanrich', '0', null, '0', null, '485381eb-9b48-4983-82ec-e1f3631045e1.mp3');
INSERT INTO `musics` VALUES ('16', '不再联系', '夏天Alex', '夏天Alex', '0', null, '0', null, 'd600fc0e-1d94-4a4e-a5a2-1c164de93a83.mp3');
INSERT INTO `musics` VALUES ('17', '带你去旅行', '校长', '校长', '0', null, '0', null, '8c98c97a-cbb8-4c0c-b228-f829f67e290f.mp3');
INSERT INTO `musics` VALUES ('18', '安和桥', '宋冬野', '宋冬野', '0', null, '0', null, '080bf092-4c15-48b3-b4c8-4d20fd66990c.mp3');
INSERT INTO `musics` VALUES ('19', '童话镇', '陈一发儿', '陈一发儿', '0', null, '0', null, '03e4f2fd-3e1f-4c8b-af29-638282389d8e.mp3');

-- ----------------------------
-- Table structure for mymusics
-- ----------------------------
DROP TABLE IF EXISTS `mymusics`;
CREATE TABLE `mymusics` (
  `mm_id` int(11) NOT NULL AUTO_INCREMENT,
  `mm_uid` int(11) NOT NULL,
  `mm_mid` int(11) NOT NULL,
  `mm_ishide` int(1) DEFAULT '0',
  PRIMARY KEY (`mm_id`) USING BTREE,
  KEY `ufk` (`mm_uid`) USING BTREE,
  KEY `mfk` (`mm_mid`) USING BTREE,
  CONSTRAINT `mfk` FOREIGN KEY (`mm_mid`) REFERENCES `musics` (`m_id`),
  CONSTRAINT `ufk` FOREIGN KEY (`mm_uid`) REFERENCES `user` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of mymusics
-- ----------------------------
INSERT INTO `mymusics` VALUES ('15', '15', '15', '0');
INSERT INTO `mymusics` VALUES ('16', '15', '16', '0');
INSERT INTO `mymusics` VALUES ('17', '15', '17', '0');
INSERT INTO `mymusics` VALUES ('18', '15', '18', '0');
INSERT INTO `mymusics` VALUES ('19', '15', '19', '0');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `u_id` int(255) NOT NULL AUTO_INCREMENT,
  `u_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `u_pass` varchar(255) COLLATE utf8_bin NOT NULL,
  `u_ishide` int(1) DEFAULT '0',
  `u_isvip` int(1) DEFAULT '0',
  `u_icon` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `u_age` int(1) DEFAULT NULL,
  `u_sex` int(1) DEFAULT NULL,
  `u_birth` datetime DEFAULT NULL,
  PRIMARY KEY (`u_id`) USING BTREE,
  UNIQUE KEY `u_name` (`u_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('15', 'qwer', 'ed1606ea4f23750e569d05826e48536e', '0', '0', null, '0', '0', '2018-01-24 16:26:47');
