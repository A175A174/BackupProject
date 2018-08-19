/*
 Navicat Premium Data Transfer

 Source Server         : rhel6
 Source Server Type    : MySQL
 Source Server Version : 50171
 Source Host           : 192.168.8.8:3306
 Source Schema         : shiyu

 Target Server Type    : MySQL
 Target Server Version : 50171
 File Encoding         : 65001

 Date: 24/02/2018 21:11:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sellerid` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `price` double(10, 2) NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ishide` int(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (6, 15, '幸胡堡', 23.00, '7f82aab9-ad92-4127-9e7b-4aa64fe7f749.jpeg', 0);
INSERT INTO `goods` VALUES (7, 15, '鲜煮咖啡（大杯）', 12.00, '933f9413-c572-4ceb-ab60-c920c2783368.jpeg', 0);
INSERT INTO `goods` VALUES (8, 15, '麦趣鸡盒（含那么大鸡排）', 99.00, '442c07fe-c18b-4742-8e30-559b80540951.jpeg', 0);
INSERT INTO `goods` VALUES (9, 15, '双层吉士汉堡中薯套餐', 35.00, 'e49e25bf-0ea1-41c6-a5ed-eb1cb1f25a89.jpeg', 0);
INSERT INTO `goods` VALUES (10, 16, '勇闯天涯', 7.00, '8f3712e3-92dc-4ff9-9576-e582e8bbfec4.jpeg', 0);
INSERT INTO `goods` VALUES (11, 16, '猪脆骨（10串）', 25.00, '65a8f53e-19f0-4b0c-bd06-165c9f8b07c1.jpeg', 0);
INSERT INTO `goods` VALUES (12, 16, '韭菜', 6.00, '962a77a6-9aee-4655-8054-db788f64b7fe.jpeg', 0);
INSERT INTO `goods` VALUES (13, 16, '生蚝（5只）', 30.00, '9ec838f8-6465-4a5c-8289-942b484cc3ed.jpeg', 0);
INSERT INTO `goods` VALUES (14, 17, '麻辣虾', 78.00, '438bb4ea-451d-486f-8ca2-2644cc5ccfaf.jpeg', 0);
INSERT INTO `goods` VALUES (15, 17, '至尊油焖大虾', 268.00, '975f2cd7-f158-4d97-8d40-f1cf1f5465cb.jpeg', 0);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `sellerid` int(11) NOT NULL,
  `price` double(10, 2) NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `state` int(1) NULL DEFAULT 0,
  `ishide` int(1) NULL DEFAULT 0,
  `currentime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for order_list
-- ----------------------------
DROP TABLE IF EXISTS `order_list`;
CREATE TABLE `order_list`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` int(11) NOT NULL,
  `goodsid` int(11) NOT NULL,
  `sum` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for seller
-- ----------------------------
DROP TABLE IF EXISTS `seller`;
CREATE TABLE `seller`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `shopname` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `balance` double(10, 2) NULL DEFAULT 0.00,
  `regtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `verify` int(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  UNIQUE INDEX `username_2`(`username`) USING BTREE,
  UNIQUE INDEX `username_3`(`username`) USING BTREE,
  UNIQUE INDEX `username_4`(`username`) USING BTREE,
  UNIQUE INDEX `username_5`(`username`) USING BTREE,
  UNIQUE INDEX `username_6`(`username`) USING BTREE,
  UNIQUE INDEX `username_7`(`username`) USING BTREE,
  UNIQUE INDEX `username_8`(`username`) USING BTREE,
  UNIQUE INDEX `username_9`(`username`) USING BTREE,
  UNIQUE INDEX `username_10`(`username`) USING BTREE,
  UNIQUE INDEX `username_11`(`username`) USING BTREE,
  UNIQUE INDEX `username_12`(`username`) USING BTREE,
  UNIQUE INDEX `username_13`(`username`) USING BTREE,
  UNIQUE INDEX `username_14`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of seller
-- ----------------------------
INSERT INTO `seller` VALUES (15, 'a', 'c139e8ec64be76247e41998856b56289', '武汉麦当劳万金广场餐厅', 'f21dd9a8-bbee-424b-8977-b56a861a74b3.jpeg', NULL, 0.00, '2018-02-24 20:51:57', 1);
INSERT INTO `seller` VALUES (16, 'b', '9d18d43f23e80b4b4f822fe1b322662f', '徐记烧烤(粮道街)', 'ca638b18-59f7-4a54-969d-72fb468b7a54.jpeg', NULL, 0.00, '2018-02-24 20:59:24', 1);
INSERT INTO `seller` VALUES (17, 'c', '2eaf4bba194b9314232d7e22c9c4db35', '麻辣香锅（街道口店）', '43a52533-4ba6-40b6-8a90-a6685cc8f05d.jpeg', NULL, 0.00, '2018-02-24 21:04:47', 1);

-- ----------------------------
-- Table structure for seller_bill
-- ----------------------------
DROP TABLE IF EXISTS `seller_bill`;
CREATE TABLE `seller_bill`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `money` double(10, 2) NOT NULL,
  `withdrawalstime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `balance` double(10, 2) NULL DEFAULT 0.00,
  `regtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (15, 'u', '87c5ab224ffb589e4ea64010cb730aa9', 500.00, '2018-02-24 21:07:19');

-- ----------------------------
-- Table structure for user_bill
-- ----------------------------
DROP TABLE IF EXISTS `user_bill`;
CREATE TABLE `user_bill`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `money` double(10, 2) NOT NULL,
  `rechargetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
