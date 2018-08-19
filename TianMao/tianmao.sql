/*
Navicat MySQL Data Transfer

Source Server         : 123
Source Server Version : 50549
Source Host           : localhost:3306
Source Database       : tianmao

Target Server Type    : MYSQL
Target Server Version : 50549
File Encoding         : 65001

Date: 2018-03-14 15:40:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '分类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='分类表';

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '潮电酷玩');
INSERT INTO `category` VALUES ('2', '美丽人生');
INSERT INTO `category` VALUES ('3', '居家生活');
INSERT INTO `category` VALUES ('4', '打造爱巢');
INSERT INTO `category` VALUES ('5', '户外出行');

-- ----------------------------
-- Table structure for categoryvalue
-- ----------------------------
DROP TABLE IF EXISTS `categoryvalue`;
CREATE TABLE `categoryvalue` (
  `categoryValueId` int(255) NOT NULL AUTO_INCREMENT,
  `productId` int(11) NOT NULL COMMENT '商品ID',
  `categoryId` int(11) NOT NULL COMMENT '分类ID',
  PRIMARY KEY (`categoryValueId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='分类值表';

-- ----------------------------
-- Records of categoryvalue
-- ----------------------------
INSERT INTO `categoryvalue` VALUES ('4', '10', '1');
INSERT INTO `categoryvalue` VALUES ('5', '11', '1');
INSERT INTO `categoryvalue` VALUES ('6', '12', '5');
INSERT INTO `categoryvalue` VALUES ('7', '13', '4');
INSERT INTO `categoryvalue` VALUES ('8', '14', '3');
INSERT INTO `categoryvalue` VALUES ('9', '15', '2');
INSERT INTO `categoryvalue` VALUES ('10', '16', '1');
INSERT INTO `categoryvalue` VALUES ('11', '17', '4');
INSERT INTO `categoryvalue` VALUES ('12', '18', '4');
INSERT INTO `categoryvalue` VALUES ('13', '19', '2');
INSERT INTO `categoryvalue` VALUES ('14', '20', '4');
INSERT INTO `categoryvalue` VALUES ('15', '21', '5');
INSERT INTO `categoryvalue` VALUES ('16', '22', '3');
INSERT INTO `categoryvalue` VALUES ('17', '23', '5');
INSERT INTO `categoryvalue` VALUES ('18', '24', '1');
INSERT INTO `categoryvalue` VALUES ('19', '25', '2');
INSERT INTO `categoryvalue` VALUES ('20', '26', '5');
INSERT INTO `categoryvalue` VALUES ('21', '27', '2');
INSERT INTO `categoryvalue` VALUES ('22', '28', '5');
INSERT INTO `categoryvalue` VALUES ('23', '29', '4');
INSERT INTO `categoryvalue` VALUES ('24', '30', '1');
INSERT INTO `categoryvalue` VALUES ('25', '31', '3');
INSERT INTO `categoryvalue` VALUES ('26', '32', '1');
INSERT INTO `categoryvalue` VALUES ('27', '33', '4');
INSERT INTO `categoryvalue` VALUES ('28', '34', '5');
INSERT INTO `categoryvalue` VALUES ('29', '35', '2');
INSERT INTO `categoryvalue` VALUES ('30', '36', '2');
INSERT INTO `categoryvalue` VALUES ('31', '37', '5');
INSERT INTO `categoryvalue` VALUES ('32', '38', '3');
INSERT INTO `categoryvalue` VALUES ('33', '39', '4');
INSERT INTO `categoryvalue` VALUES ('34', '40', '4');
INSERT INTO `categoryvalue` VALUES ('35', '41', '4');
INSERT INTO `categoryvalue` VALUES ('36', '42', '4');
INSERT INTO `categoryvalue` VALUES ('37', '43', '4');
INSERT INTO `categoryvalue` VALUES ('38', '44', '1');
INSERT INTO `categoryvalue` VALUES ('39', '45', '4');
INSERT INTO `categoryvalue` VALUES ('40', '46', '5');
INSERT INTO `categoryvalue` VALUES ('41', '47', '3');
INSERT INTO `categoryvalue` VALUES ('42', '48', '5');
INSERT INTO `categoryvalue` VALUES ('43', '49', '1');
INSERT INTO `categoryvalue` VALUES ('44', '50', '3');
INSERT INTO `categoryvalue` VALUES ('45', '51', '4');
INSERT INTO `categoryvalue` VALUES ('46', '52', '1');
INSERT INTO `categoryvalue` VALUES ('47', '53', '1');
INSERT INTO `categoryvalue` VALUES ('48', '54', '2');
INSERT INTO `categoryvalue` VALUES ('49', '55', '4');
INSERT INTO `categoryvalue` VALUES ('50', '56', '3');
INSERT INTO `categoryvalue` VALUES ('51', '57', '3');
INSERT INTO `categoryvalue` VALUES ('52', '58', '2');

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection` (
  `collectionId` int(11) NOT NULL AUTO_INCREMENT,
  `CollectionER` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '收藏者UUID',
  `type` varchar(5) COLLATE utf8_bin NOT NULL COMMENT '(0-商品,1-商家)',
  `value` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '商品或商家ID',
  PRIMARY KEY (`collectionId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='收藏表';

-- ----------------------------
-- Records of collection
-- ----------------------------

-- ----------------------------
-- Table structure for evaluate
-- ----------------------------
DROP TABLE IF EXISTS `evaluate`;
CREATE TABLE `evaluate` (
  `evaluateId` int(11) NOT NULL AUTO_INCREMENT COMMENT '评价id',
  `productId` int(255) NOT NULL COMMENT '要评价的商品ID',
  `userId` varchar(36) COLLATE utf8_bin NOT NULL COMMENT '评价人ID',
  `contention` varchar(400) COLLATE utf8_bin NOT NULL COMMENT '评价类容',
  `createDate` datetime NOT NULL COMMENT '评价时间',
  PRIMARY KEY (`evaluateId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='评价表';

-- ----------------------------
-- Records of evaluate
-- ----------------------------
INSERT INTO `evaluate` VALUES ('1', '36', '7d94942e-f4d9-4237-b94e-9444a882780f', 'sfgertdfgdxfgdfgdf', '2018-03-14 13:36:35');

-- ----------------------------
-- Table structure for freight
-- ----------------------------
DROP TABLE IF EXISTS `freight`;
CREATE TABLE `freight` (
  `freightId` int(11) NOT NULL AUTO_INCREMENT,
  `sellerId` varchar(36) COLLATE utf8_bin NOT NULL COMMENT '商家ID',
  `address` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '地址(*表示所有地址,有指定地址就获取指定地址价格)',
  `cost` decimal(10,2) DEFAULT NULL COMMENT '费用',
  PRIMARY KEY (`freightId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='运费表';

-- ----------------------------
-- Records of freight
-- ----------------------------
INSERT INTO `freight` VALUES ('2', 'b5c9e5f1-c431-4766-9dff-58edb9fe3aab', '*', '20.10');
INSERT INTO `freight` VALUES ('3', 'e8ca238d-b6bd-4d77-b207-6b546995ff4d', '*', '36.95');
INSERT INTO `freight` VALUES ('4', '186f02a4-6080-43a6-8754-e829df2b318f', '*', '25.36');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `orderCode` varchar(36) COLLATE utf8_bin NOT NULL COMMENT '订单号(UUID)',
  `sellerId` varchar(36) COLLATE utf8_bin NOT NULL COMMENT '商家ID',
  `userId` varchar(36) COLLATE utf8_bin NOT NULL COMMENT '用户ID',
  `userRemark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '订单备注信息',
  `createDate` datetime NOT NULL COMMENT '订单创建日期',
  `payDate` datetime DEFAULT NULL COMMENT '支付日期',
  `confirmDate` datetime DEFAULT NULL COMMENT '确认收货日期',
  `status` varchar(5) COLLATE utf8_bin NOT NULL COMMENT '订单状态(0-待支付,1-待发货,2-待收货,3-退货中,4-已完成,5-待评价)',
  `tradePrice` decimal(10,2) NOT NULL COMMENT '订单总交易价格',
  `isDel` varchar(1) COLLATE utf8_bin DEFAULT '0' COMMENT '订单标记(0-显示,1-回收站,2-彻底删除用户不可见)',
  `addressId` int(255) NOT NULL COMMENT '收货地址ID',
  PRIMARY KEY (`orderId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='订单表';

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('1', 'd8a53f33-c470-4f8d-b566-499262729759', 'b5c9e5f1-c431-4766-9dff-58edb9fe3aab', '7d94942e-f4d9-4237-b94e-9444a882780f', 'asfsgdsrtsdfsdfgds', '2018-03-14 13:33:36', '2018-03-14 13:35:54', '2018-03-14 13:36:14', '4', '16974.10', '0', '1');
INSERT INTO `order` VALUES ('2', 'a3f9d18f-e8a7-4ca8-ae36-819922372093', '186f02a4-6080-43a6-8754-e829df2b318f', '7d94942e-f4d9-4237-b94e-9444a882780f', 'asdfewrwrwetrfrsdfsdf', '2018-03-14 13:33:55', null, null, '0', '14515.36', '0', '1');
INSERT INTO `order` VALUES ('3', '4d1aafdd-e05b-406b-a69a-ad4310f9d64e', 'e8ca238d-b6bd-4d77-b207-6b546995ff4d', '7d94942e-f4d9-4237-b94e-9444a882780f', 'wfsdfgdgdft', '2018-03-14 13:34:19', null, null, '0', '190.95', '0', '1');
INSERT INTO `order` VALUES ('4', '04d674b1cd7e48b0bbd9b8f09997ad99', 'b5c9e5f1-c431-4766-9dff-58edb9fe3aab', '7d94942e-f4d9-4237-b94e-9444a882780f', 'sdfsdfsdfxcvsrdfg', '2018-03-14 13:37:27', '2018-03-14 13:37:35', null, '4', '2442.10', '0', '1');
INSERT INTO `order` VALUES ('5', '5f0e25ba-fcb9-4e16-8860-19c2fa7a219c', '186f02a4-6080-43a6-8754-e829df2b318f', '7d94942e-f4d9-4237-b94e-9444a882780f', '', '2018-03-14 15:21:01', '2018-03-14 15:21:51', null, '1', '5211.36', '0', '1');

-- ----------------------------
-- Table structure for orderexpress
-- ----------------------------
DROP TABLE IF EXISTS `orderexpress`;
CREATE TABLE `orderexpress` (
  `expressId` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单快递单号ID',
  `orderCode` varchar(36) COLLATE utf8_bin NOT NULL COMMENT '订单号(UUID)',
  `shipmentsName` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '发货物流公司名称',
  `shipmentsCode` varchar(18) COLLATE utf8_bin NOT NULL COMMENT '发货物流单号',
  `returnName` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '退货物流公司名称',
  `returnCode` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT '退货物流单号',
  PRIMARY KEY (`expressId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='订单物流';

-- ----------------------------
-- Records of orderexpress
-- ----------------------------
INSERT INTO `orderexpress` VALUES ('1', 'd8a53f33-c470-4f8d-b566-499262729759', 'eart', 'adfg', null, null);
INSERT INTO `orderexpress` VALUES ('2', '04d674b1cd7e48b0bbd9b8f09997ad99', 'srefg', 'asdfg', null, null);

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `orderItemId` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` varchar(36) COLLATE utf8_bin NOT NULL COMMENT '订单ID',
  `productId` int(255) NOT NULL COMMENT '商品ID',
  `number` int(11) NOT NULL DEFAULT '1' COMMENT '商品数量',
  PRIMARY KEY (`orderItemId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='订单对应商品表';

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('1', 'd8a53f33-c470-4f8d-b566-499262729759', '36', '14');
INSERT INTO `orderitem` VALUES ('2', 'a3f9d18f-e8a7-4ca8-ae36-819922372093', '15', '45');
INSERT INTO `orderitem` VALUES ('3', '4d1aafdd-e05b-406b-a69a-ad4310f9d64e', '49', '4');
INSERT INTO `orderitem` VALUES ('4', '4d1aafdd-e05b-406b-a69a-ad4310f9d64e', '42', '3');
INSERT INTO `orderitem` VALUES ('5', '04d674b1cd7e48b0bbd9b8f09997ad99', '36', '2');
INSERT INTO `orderitem` VALUES ('6', '5f0e25ba-fcb9-4e16-8860-19c2fa7a219c', '16', '2');
INSERT INTO `orderitem` VALUES ('7', '5f0e25ba-fcb9-4e16-8860-19c2fa7a219c', '15', '1');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `productId` int(255) NOT NULL AUTO_INCREMENT COMMENT '产品ID',
  `sellerId` varchar(36) COLLATE utf8_bin NOT NULL,
  `name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '产品名称',
  `title` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '产品小标题',
  `originalPrice` decimal(10,2) NOT NULL COMMENT '原始价格',
  `discountPrice` decimal(10,2) NOT NULL COMMENT '优惠价格',
  `stock` int(100) NOT NULL COMMENT '库存数量',
  `introduce` varchar(400) COLLATE utf8_bin DEFAULT NULL COMMENT '商品文字介绍',
  `createDate` datetime NOT NULL COMMENT '上架时间',
  `isDel` varchar(1) COLLATE utf8_bin DEFAULT '0' COMMENT '产品状态(0-上架,1-下架,2-删除,3-管理员下架)',
  PRIMARY KEY (`productId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='商品表';

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('10', 'b5c9e5f1-c431-4766-9dff-58edb9fe3aab', '骷髅精灵', '骷髅', '100.00', '99.00', '1000', '相爱', '2018-03-14 11:14:10', '2');
INSERT INTO `product` VALUES ('11', 'b5c9e5f1-c431-4766-9dff-58edb9fe3aab', '骷髅精灵', '骷髅', '100.00', '99.00', '1000', '相爱', '2018-03-14 11:14:38', '0');
INSERT INTO `product` VALUES ('12', '186f02a4-6080-43a6-8754-e829df2b318f', '暗示法士大夫', '阿萨德瓦尔', '21341.00', '222.00', '123', '士大夫隔热条纹山地车v师傅深V发生的', '2018-03-14 11:19:15', '0');
INSERT INTO `product` VALUES ('13', '186f02a4-6080-43a6-8754-e829df2b318f', '受点委屈', '阿身份为', '1234.00', '322.00', '1234', '的想法V大身份让他玩儿法师法师的是在擦拭', '2018-03-14 11:19:49', '0');
INSERT INTO `product` VALUES ('14', 'b5c9e5f1-c431-4766-9dff-58edb9fe3aab', '小苹果', '最炫', '1000.00', '990.00', '1000', '超级好玩', '2018-03-14 11:19:51', '0');
INSERT INTO `product` VALUES ('15', '186f02a4-6080-43a6-8754-e829df2b318f', '我是法师打发', '士大夫似的从', '2342.00', '322.00', '8', '是无法为儿童是大城市的服拭擦士大夫务我是重复下载的', '2018-03-14 11:20:33', '0');
INSERT INTO `product` VALUES ('16', '186f02a4-6080-43a6-8754-e829df2b318f', '聚义', '教育法规和地方', '34532.00', '2432.00', '1221', '法规和对方公司的士大夫士大夫中心CRH姐夫哥横幅的', '2018-03-14 11:21:03', '0');
INSERT INTO `product` VALUES ('17', '186f02a4-6080-43a6-8754-e829df2b318f', 'v你突然变成v', '斯蒂芬我认为发的', '5345634.00', '4322.00', '4745', '新的v是人士分析称V大示范性 是形成V大发是在擦拭 是的方程式', '2018-03-14 11:21:38', '0');
INSERT INTO `product` VALUES ('18', '186f02a4-6080-43a6-8754-e829df2b318f', '的发生', '按市场秩序城市的', '2324.00', '43.00', '435435', '阿萨德飞娃儿色法所指的自行车撒打发我', '2018-03-14 11:22:07', '0');
INSERT INTO `product` VALUES ('19', '186f02a4-6080-43a6-8754-e829df2b318f', '是的方程式的v', '是大城市的方式的', '334.00', '21.00', '3463', '是的v瑞特人法师打发v士大夫个人V型地方v是的', '2018-03-14 11:22:42', '0');
INSERT INTO `product` VALUES ('20', 'b5c9e5f1-c431-4766-9dff-58edb9fe3aab', '沙发', '爱巢必备', '200.00', '189.00', '900', '超软超级舒服', '2018-03-14 11:22:45', '0');
INSERT INTO `product` VALUES ('21', '186f02a4-6080-43a6-8754-e829df2b318f', '法师法师', '士大夫维特人格', '3452.00', '232.00', '546456', '士大夫似的V型重复认为他', '2018-03-14 11:23:12', '0');
INSERT INTO `product` VALUES ('22', '186f02a4-6080-43a6-8754-e829df2b318f', '打过恢复萨', '是的风格的双方各', '456.00', '2342.00', '64564', '奋斗过的人通过发送的功夫士大夫网格顺丰色粉色粉是我师父我师父', '2018-03-14 11:23:51', '0');
INSERT INTO `product` VALUES ('23', 'b5c9e5f1-c431-4766-9dff-58edb9fe3aab', '阿福的后果', '爱巢必备', '120.00', '100.00', '900', '超软超级舒服阿的合法的覆盖法师的', '2018-03-14 11:24:07', '0');
INSERT INTO `product` VALUES ('24', '186f02a4-6080-43a6-8754-e829df2b318f', '缪评价', '电饭锅v士大夫', '56457.00', '2342.00', '7568', '士大夫似的柜台服务而发生地方的V刹士大夫', '2018-03-14 11:24:40', '0');
INSERT INTO `product` VALUES ('25', 'b5c9e5f1-c431-4766-9dff-58edb9fe3aab', '阿福阿身份的后果', '爱巢必备', '145.00', '110.00', '900', '爱人发的覆盖啊让的风格和方嘎达', '2018-03-14 11:24:48', '0');
INSERT INTO `product` VALUES ('26', '186f02a4-6080-43a6-8754-e829df2b318f', '沃尔夫天士大夫似的', '是的范德萨V刹执行董事', '456.00', '22.00', '2345', '任务而额外法师打发士大夫事发时', '2018-03-14 11:25:07', '0');
INSERT INTO `product` VALUES ('27', 'b5c9e5f1-c431-4766-9dff-58edb9fe3aab', '阿富汗hi哭衣服', '爱的施工', '2656.00', '2000.00', '900', '爱阿福的后果 有 邮件哈师傅工号达', '2018-03-14 11:25:41', '0');
INSERT INTO `product` VALUES ('28', '186f02a4-6080-43a6-8754-e829df2b318f', '发生的高度符合人防', '士大夫似的他温热污染', '3423.00', '346.00', '234', '士大夫似的沟通氛围十分 阿士大夫撒旦法啊撒范德萨的发生是飞洒', '2018-03-14 11:26:32', '0');
INSERT INTO `product` VALUES ('29', 'b5c9e5f1-c431-4766-9dff-58edb9fe3aab', '返回库阿福哥', 'a计划抑郁看得见多个', '4678.00', '4123.00', '435', '等级与石头人身体乳视图听说有人身体视图', '2018-03-14 11:26:40', '0');
INSERT INTO `product` VALUES ('30', '186f02a4-6080-43a6-8754-e829df2b318f', '是的法国德国vbd', '发生的士大夫', '342.00', '22.00', '23423', '山东分公司的方式大是的范围为', '2018-03-14 11:29:10', '0');
INSERT INTO `product` VALUES ('31', 'b5c9e5f1-c431-4766-9dff-58edb9fe3aab', '发的规划阿飞德国啊', '阿福个', '12347.00', '12121.00', '435', 'ads个啊阿三大哥啊阿三大哥啊图', '2018-03-14 11:29:34', '0');
INSERT INTO `product` VALUES ('32', '186f02a4-6080-43a6-8754-e829df2b318f', '儿童团任何', '士大夫士大夫撒', '234234.00', '2223.00', '34545', 'v发出新版V大师傅公司的分公司的', '2018-03-14 11:30:05', '0');
INSERT INTO `product` VALUES ('33', 'b5c9e5f1-c431-4766-9dff-58edb9fe3aab', '阿大富豪 后', '改好邮费给 是个好是', '321.00', '298.00', '456', '的一天就好是身体好人 申通还是送人头 是个童话风格和', '2018-03-14 11:30:25', '0');
INSERT INTO `product` VALUES ('34', 'b5c9e5f1-c431-4766-9dff-58edb9fe3aab', '阿福哥', '阿德个', '234.00', '211.00', '456', '爱的色放个和', '2018-03-14 11:30:53', '0');
INSERT INTO `product` VALUES ('35', '186f02a4-6080-43a6-8754-e829df2b318f', '发的规范的艺人', '发单号给他人还不错v', '567.00', '234.00', '445', '地方个人头一热提供的', '2018-03-14 11:32:05', '0');
INSERT INTO `product` VALUES ('36', 'b5c9e5f1-c431-4766-9dff-58edb9fe3aab', '替换 的一体机', '他的风格和', '1234.00', '1211.00', '2108', '是的风格和师傅吧 石头人还是认同', '2018-03-14 11:32:12', '0');
INSERT INTO `product` VALUES ('37', 'b5c9e5f1-c431-4766-9dff-58edb9fe3aab', '付好款 荣誉', '的规范化但是它符合', '2365.00', '2213.00', '2124', '地方工会是个好是身体如何', '2018-03-14 11:32:48', '0');
INSERT INTO `product` VALUES ('38', 'b5c9e5f1-c431-4766-9dff-58edb9fe3aab', '分公司付师傅工会是是的风格', '是梵蒂冈和生日蛋糕', '987.00', '899.00', '2124', '的风格就好 输入法通过是', '2018-03-14 11:33:31', '0');
INSERT INTO `product` VALUES ('39', 'b5c9e5f1-c431-4766-9dff-58edb9fe3aab', '覆盖和的规范化突然v刹不', '实得分个是梵蒂冈的是的风格是覆盖', '500.00', '457.00', '2124', '实得分该死的风过生日蛋糕发的地方', '2018-03-14 11:34:16', '0');
INSERT INTO `product` VALUES ('40', 'b5c9e5f1-c431-4766-9dff-58edb9fe3aab', '预覆盖vb', '说的也是人福德宫v', '3456.00', '3231.00', '2124', '偶一额头有饱腹感vb', '2018-03-14 11:35:09', '0');
INSERT INTO `product` VALUES ('41', 'e8ca238d-b6bd-4d77-b207-6b546995ff4d', '人提供的法国', '符合他人', '4564.00', '456.00', '45', '答复过热团工委方式的分公司的', '2018-03-14 11:35:41', '0');
INSERT INTO `product` VALUES ('42', 'e8ca238d-b6bd-4d77-b207-6b546995ff4d', '也认同和法国', '过电饭锅电饭锅等分', '34.00', '22.00', '453', '斯蒂芬为人父士大夫士大夫似的', '2018-03-14 11:36:04', '0');
INSERT INTO `product` VALUES ('43', 'e8ca238d-b6bd-4d77-b207-6b546995ff4d', '的方式过分的', '史蒂夫', '5555.00', '656.00', '456345', '是东方威尔额外认为', '2018-03-14 11:37:09', '0');
INSERT INTO `product` VALUES ('44', 'b5c9e5f1-c431-4766-9dff-58edb9fe3aab', '艾弗森的个福德宫成v', '太容易坏个', '1234.00', '998.00', '123', '风格和vbs覆盖后台', '2018-03-14 11:38:00', '0');
INSERT INTO `product` VALUES ('45', 'b5c9e5f1-c431-4766-9dff-58edb9fe3aab', '与性格好方便v刹行', '实得分放大个', '1213.00', '1210.00', '123', '实得分are的风格的发送给', '2018-03-14 11:38:44', '0');
INSERT INTO `product` VALUES ('46', 'e8ca238d-b6bd-4d77-b207-6b546995ff4d', '士大夫士大夫似的', '发短信额外认为', '32452.00', '767.00', '1231', '阿福玩儿玩儿法士大夫士大夫似的', '2018-03-14 11:39:00', '0');
INSERT INTO `product` VALUES ('47', 'b5c9e5f1-c431-4766-9dff-58edb9fe3aab', '啊如果他爱的色放个', '与经过分析表是否关闭', '10000.00', '9099.00', '123', '体验服v型不好修改是否和', '2018-03-14 11:39:23', '0');
INSERT INTO `product` VALUES ('48', 'e8ca238d-b6bd-4d77-b207-6b546995ff4d', '撒旦法师法师打发公司的', '是大法官认为天热', '222.00', '33.00', '234', '阿身份为儿童玩儿法撒的发生的', '2018-03-14 11:39:46', '0');
INSERT INTO `product` VALUES ('49', 'e8ca238d-b6bd-4d77-b207-6b546995ff4d', '阿达撒发生的发生', '阿斯达我去rear发', '56677.00', '22.00', '230', '发生的发生的认同服务而无法为', '2018-03-14 11:40:10', '0');
INSERT INTO `product` VALUES ('50', 'b5c9e5f1-c431-4766-9dff-58edb9fe3aab', '规划局规划将', '当天和 汕头市人方', '30.00', '28.00', '123', '天的hbv好的师傅工会', '2018-03-14 11:40:19', '0');
INSERT INTO `product` VALUES ('51', 'e8ca238d-b6bd-4d77-b207-6b546995ff4d', '暗示法士大夫公司的', '阿斯达我问的期望', '3345.00', '3654645.00', '222', '啊斯蒂芬我认为发的是啊实打实的', '2018-03-14 11:40:33', '0');
INSERT INTO `product` VALUES ('52', 'b5c9e5f1-c431-4766-9dff-58edb9fe3aab', '城管局是符合噶', '的通用', '456.00', '423.00', '123', '天的hbv是否合适', '2018-03-14 11:41:04', '0');
INSERT INTO `product` VALUES ('53', 'b5c9e5f1-c431-4766-9dff-58edb9fe3aab', '若返回风格不和谐vb', '的投入人副本是', '123.00', '99.00', '564', '是梵蒂冈风格的符号srtvb', '2018-03-14 11:41:36', '0');
INSERT INTO `product` VALUES ('54', 'e8ca238d-b6bd-4d77-b207-6b546995ff4d', 'SD敢达返回福建通过', '阿萨德法师法师打发是的', '234234.00', '222.00', '2345', '啊师父是个人提问方式的', '2018-03-14 11:41:59', '0');
INSERT INTO `product` VALUES ('55', 'b5c9e5f1-c431-4766-9dff-58edb9fe3aab', '规范性不实得分个哈他方便表', '师傅的个', '45287.00', '47578.00', '3240452', '是动态规划v刹', '2018-03-14 11:42:21', '0');
INSERT INTO `product` VALUES ('56', 'e8ca238d-b6bd-4d77-b207-6b546995ff4d', '是否规划是', '是天后宫副本v', '156.00', '100.00', '546', '是有途径的vnbv丝塔芙视图下', '2018-03-14 11:46:11', '0');
INSERT INTO `product` VALUES ('57', 'e8ca238d-b6bd-4d77-b207-6b546995ff4d', '阿大富豪个', '方大国', '11234.00', '10000.00', '546', '方大国矮人国', '2018-03-14 11:46:39', '0');
INSERT INTO `product` VALUES ('58', 'e8ca238d-b6bd-4d77-b207-6b546995ff4d', '爱人德国方', '方大国', '11234.00', '10000.00', '546', '爱人个', '2018-03-14 11:47:00', '0');

-- ----------------------------
-- Table structure for productdetails
-- ----------------------------
DROP TABLE IF EXISTS `productdetails`;
CREATE TABLE `productdetails` (
  `productDetailsId` int(225) NOT NULL AUTO_INCREMENT,
  `productId` int(225) NOT NULL COMMENT '商品ID',
  `type` varchar(5) COLLATE utf8_bin NOT NULL COMMENT '图片类型(0-商品图,1-介绍图)',
  `image` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '商品图片',
  PRIMARY KEY (`productDetailsId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='商品介绍详情';

-- ----------------------------
-- Records of productdetails
-- ----------------------------
INSERT INTO `productdetails` VALUES ('23', '10', '0', '94149f239caa4e1b94b76eec072a44cc.png');
INSERT INTO `productdetails` VALUES ('24', '10', '1', '1de070bc78034e0f9f740e345b39afd2.gif');
INSERT INTO `productdetails` VALUES ('25', '10', '1', '18e85c950e4543999ed191a0644e31fb.jpg');
INSERT INTO `productdetails` VALUES ('29', '11', '0', '93204166e7f7476b8f0b991a3492070a.jpg');
INSERT INTO `productdetails` VALUES ('30', '11', '1', '345b7f884fb74993b7fad58fa59ebb93.jpg');
INSERT INTO `productdetails` VALUES ('31', '11', '1', 'aa1c1faba5d44e718d99a96b748fc438.png');
INSERT INTO `productdetails` VALUES ('32', '12', '0', 'e33aba0e57b34830b0c4531863cf3a7f.jpg');
INSERT INTO `productdetails` VALUES ('33', '12', '1', '0522060e28c74c40a67fef460fc53f13.jpg');
INSERT INTO `productdetails` VALUES ('34', '13', '0', '52464fbb5b48425d9ab48055094f290c.jpg');
INSERT INTO `productdetails` VALUES ('35', '13', '1', '446bd99ef5b44e56b532ad4176d9bc37.jpg');
INSERT INTO `productdetails` VALUES ('36', '13', '1', 'f301d6895f6247ee81a6a3f5ace2a7f1.jpg');
INSERT INTO `productdetails` VALUES ('37', '14', '0', 'f3a68de378a84f6d8ee44889ab6aca41.png');
INSERT INTO `productdetails` VALUES ('38', '14', '1', '820c9319278d43348f78fe6d61862cc0.jpeg');
INSERT INTO `productdetails` VALUES ('39', '15', '0', '9b1837fe1fc143a18b964d986bff34a3.jpg');
INSERT INTO `productdetails` VALUES ('40', '15', '1', '26ba2882036e4a9a87ef1cc0a4e317d8.jpg');
INSERT INTO `productdetails` VALUES ('41', '15', '1', '4389177187d44cd596b137eaee09f155.jpg');
INSERT INTO `productdetails` VALUES ('42', '16', '0', '99d29d5a081047a7a30f1485b8b06c3c.jpg');
INSERT INTO `productdetails` VALUES ('43', '16', '1', '7d407925830a4cc7aa91a6995de47ae2.jpg');
INSERT INTO `productdetails` VALUES ('44', '16', '1', 'ebbd51d263dc4e599c7ef21dfe4b4b69.jpg');
INSERT INTO `productdetails` VALUES ('45', '17', '0', 'b7d2dfab07ce4a1a83b07da45fdd9f1c.jpg');
INSERT INTO `productdetails` VALUES ('46', '17', '1', '926ca41c8d8349a4a13c6bc6ce25c435.jpg');
INSERT INTO `productdetails` VALUES ('47', '18', '0', '83ccfd839c8f44df82cdba1e8af05b99.jpg');
INSERT INTO `productdetails` VALUES ('48', '18', '1', '335f7333cedc4b009a1c6945fc35cb47.jpg');
INSERT INTO `productdetails` VALUES ('49', '18', '1', 'bde94f52566444a3a4031ec7b7441a7c.jpg');
INSERT INTO `productdetails` VALUES ('50', '19', '0', '5bdaf35d4f804679b1a678041084e5b4.jpg');
INSERT INTO `productdetails` VALUES ('51', '19', '1', 'f5411aaf5435439285cb63ada95f9b4d.jpg');
INSERT INTO `productdetails` VALUES ('52', '19', '1', '31ec70c112a6474fab6640be231a6520.jpg');
INSERT INTO `productdetails` VALUES ('53', '20', '0', '97aa34137eee4681b8e86da2fb60903d.gif');
INSERT INTO `productdetails` VALUES ('54', '20', '1', '6484e7cd1edb4833b9eb261940ee4cbe.jpg');
INSERT INTO `productdetails` VALUES ('55', '21', '0', 'f0b6ee80f6a749dbb3bbd6507ad4763f.jpg');
INSERT INTO `productdetails` VALUES ('56', '21', '1', '7a6c852f9da547e39a48efae412efdc7.jpg');
INSERT INTO `productdetails` VALUES ('57', '21', '1', '23d5ddddcef74738bc91047b678774bb.jpg');
INSERT INTO `productdetails` VALUES ('58', '22', '0', 'a07d0992b18a454395a58995c3f87a46.jpg');
INSERT INTO `productdetails` VALUES ('59', '22', '1', '34cdb974d75745109d8ee51459e0f736.jpg');
INSERT INTO `productdetails` VALUES ('60', '23', '0', '80665bee83dc4efb98ccad1448c12ad1.gif');
INSERT INTO `productdetails` VALUES ('61', '23', '1', '475615f539434610945ed77a5e88909b.gif');
INSERT INTO `productdetails` VALUES ('62', '24', '0', 'd81a08e27f6a43b99eaeb4d4149b597b.jpg');
INSERT INTO `productdetails` VALUES ('63', '24', '1', 'e9bc3e70abde46fc8ff01d45132a90d6.jpg');
INSERT INTO `productdetails` VALUES ('64', '24', '1', '58f3867e987744efa90462d1af1edb47.jpg');
INSERT INTO `productdetails` VALUES ('65', '25', '0', '1c6e52a952fd461aace74a21f0fdde85.gif');
INSERT INTO `productdetails` VALUES ('66', '25', '1', 'f338209a7a464d04a6fb6666bd144502.png');
INSERT INTO `productdetails` VALUES ('67', '26', '0', 'c48fc2fc18044cf98bc08fae04e32c09.jpg');
INSERT INTO `productdetails` VALUES ('68', '26', '1', '26ba74e3074043428e4c684a2737043c.jpg');
INSERT INTO `productdetails` VALUES ('69', '26', '1', '8ed4c8cb43c844949cc9ff203d75e57f.jpg');
INSERT INTO `productdetails` VALUES ('70', '27', '0', '2c488d2f24dc4bad866ae4a02bc6d062.jpg');
INSERT INTO `productdetails` VALUES ('71', '27', '1', 'c2013ae53c664d61b2a92b0cc4ae3ad1.jpg');
INSERT INTO `productdetails` VALUES ('72', '28', '0', '5bfb10b0b9df41b792553c4477cd27fc.jpg');
INSERT INTO `productdetails` VALUES ('73', '28', '1', 'a1e01c3a91ad49cdb8fa6a4def3b46ab.jpg');
INSERT INTO `productdetails` VALUES ('74', '28', '1', '4b259b54160e4ae1a33224512b5d77db.jpg');
INSERT INTO `productdetails` VALUES ('75', '29', '0', '4b3d535c8fd1416d917e6259665356cd.jpg');
INSERT INTO `productdetails` VALUES ('76', '29', '1', 'a2d053de1a714f1891f4d6f92f8988d1.jpg');
INSERT INTO `productdetails` VALUES ('77', '30', '0', '0fa2da7c268b4ba6aa801cd091642003.jpg');
INSERT INTO `productdetails` VALUES ('78', '30', '1', '5bef7f2077a94e70b8b3bc523e6c4785.jpg');
INSERT INTO `productdetails` VALUES ('79', '31', '0', '63abd40cce9f4abfad58d055dd74611c.gif');
INSERT INTO `productdetails` VALUES ('80', '31', '1', '0b8d2896b9d247ecb21f1e42e9d8e0ce.jpg');
INSERT INTO `productdetails` VALUES ('81', '32', '0', 'ff6dda6dc1414239aa10d926d611db14.jpg');
INSERT INTO `productdetails` VALUES ('82', '32', '1', '89050a8afe434b558a933110f7c04c20.jpg');
INSERT INTO `productdetails` VALUES ('83', '32', '1', '3c3c801725554ba1982fce0d0dc41988.jpg');
INSERT INTO `productdetails` VALUES ('84', '33', '0', '80b620d67fb8452ca26b1f8954d29fcc.gif');
INSERT INTO `productdetails` VALUES ('85', '33', '1', '6fb81c4ebc514a67911de5a8133c0e3d.jpg');
INSERT INTO `productdetails` VALUES ('86', '34', '0', '6ff4d5c1f7f843c6abb390349e83270d.jpg');
INSERT INTO `productdetails` VALUES ('87', '34', '1', 'ee0c692d14fd4ba4abf95e464d743f66.jpg');
INSERT INTO `productdetails` VALUES ('88', '35', '0', '86a73226c298440ba416df4ea55cfe15.jpg');
INSERT INTO `productdetails` VALUES ('89', '35', '1', 'ddc823d23cb6478a8389e1671091c2be.jpg');
INSERT INTO `productdetails` VALUES ('90', '35', '1', '054ce3806e2d4f56aceed0742c7c3ddc.jpg');
INSERT INTO `productdetails` VALUES ('91', '36', '0', '5205640aa99d441d838f438a0f490e49.png');
INSERT INTO `productdetails` VALUES ('92', '36', '1', 'da4307e3c14f479d9744bac3f6a2a8f8.jpeg');
INSERT INTO `productdetails` VALUES ('93', '37', '0', '93de87ab41d445ef9aff2918ea3e41ce.gif');
INSERT INTO `productdetails` VALUES ('94', '37', '1', '8e9087f566cb4615a7a1ce985bcacf2e.jpg');
INSERT INTO `productdetails` VALUES ('95', '38', '0', '1cccf1ef035145e8b6c8514441b5d9b0.ico');
INSERT INTO `productdetails` VALUES ('96', '38', '1', '5e289256d0a64a8db758c8b29769e300.png');
INSERT INTO `productdetails` VALUES ('97', '39', '0', 'ab311cd9014f448185d3add3e1cc736e.jpg');
INSERT INTO `productdetails` VALUES ('98', '39', '1', '65a5ab8fec8642b6878b0057bb9e569d.jpg');
INSERT INTO `productdetails` VALUES ('99', '40', '0', '82e4f9ee510e4b7aa99dd8d3a1e5ae0a.jpg');
INSERT INTO `productdetails` VALUES ('100', '40', '1', 'c2eda5c9ed3843f295e58876b7065f07.gif');
INSERT INTO `productdetails` VALUES ('101', '41', '0', '0f6c4314f7eb4400aefaf09b82166d45.jpg');
INSERT INTO `productdetails` VALUES ('102', '41', '1', 'ebc7aee14dd54cdc9f268e4ae776e377.jpg');
INSERT INTO `productdetails` VALUES ('103', '41', '1', '00afad16318546ada2e0f1f8871843b8.jpg');
INSERT INTO `productdetails` VALUES ('104', '42', '0', '6bbe15796d564be99f2c2f1329c2a6cb.jpg');
INSERT INTO `productdetails` VALUES ('105', '42', '1', '3dd771a9771a4d889a96af2ba11ff28b.jpg');
INSERT INTO `productdetails` VALUES ('106', '42', '1', 'fd70b23ffd66400d97fcf0d6ae1a1ed6.jpg');
INSERT INTO `productdetails` VALUES ('107', '43', '0', 'eb68e33fb6e14706a9aecde1def4275a.jpg');
INSERT INTO `productdetails` VALUES ('108', '43', '1', '4e969951fe264168890b4a52e68f9719.jpg');
INSERT INTO `productdetails` VALUES ('109', '44', '0', '6bafd86fc01a4968963d7e1bc7c42ebb.jpg');
INSERT INTO `productdetails` VALUES ('110', '44', '1', 'cbc771167c4348b3bd6bcc19fc532a39.jpg');
INSERT INTO `productdetails` VALUES ('111', '45', '0', '231f3c69439441258e4e1572cb535940.gif');
INSERT INTO `productdetails` VALUES ('112', '45', '1', '6d62311998404e7b80136bf87a76c529.gif');
INSERT INTO `productdetails` VALUES ('113', '46', '0', 'd1f2fa92ebb7490bab5e9c0a77d43892.jpg');
INSERT INTO `productdetails` VALUES ('114', '46', '1', 'b7c6177fa3a3486caf7279caae5ac62c.jpg');
INSERT INTO `productdetails` VALUES ('115', '46', '1', '18180d47b9ca47bdae0c9480802ef416.jpg');
INSERT INTO `productdetails` VALUES ('116', '47', '0', '14108cc3624049ffaf069f46f36000f3.png');
INSERT INTO `productdetails` VALUES ('117', '47', '1', '184309c123924fcf95ae9237415c1f24.png');
INSERT INTO `productdetails` VALUES ('118', '48', '0', 'd74548a7fa184ffa95ab4ccca22f4c24.jpg');
INSERT INTO `productdetails` VALUES ('119', '48', '1', '26a182dd62d745ec83d5826624e43898.jpg');
INSERT INTO `productdetails` VALUES ('120', '48', '1', 'f5e477ac2fa34b7e959055edaa5cc8f0.jpg');
INSERT INTO `productdetails` VALUES ('121', '49', '0', '47dd5feea2254beea258cffb27a5d555.jpg');
INSERT INTO `productdetails` VALUES ('122', '49', '1', '3ea3f1bc25984048a6f06ad9b0806e41.jpg');
INSERT INTO `productdetails` VALUES ('123', '49', '1', '06ed1dcb80554e97945ab54566383f69.jpg');
INSERT INTO `productdetails` VALUES ('124', '50', '0', '8640eda1e4844606a99c34a3b45844d5.jpg');
INSERT INTO `productdetails` VALUES ('125', '50', '1', '92692bb6dae34fcfb093c361881151f2.jpg');
INSERT INTO `productdetails` VALUES ('126', '51', '0', '367107d12b754527b51768311df272b7.jpg');
INSERT INTO `productdetails` VALUES ('127', '51', '1', 'd7c9ceec6e07416dba0523da54d82232.jpg');
INSERT INTO `productdetails` VALUES ('128', '52', '0', 'd453216b774544269dd371e667e3ba98.jpg');
INSERT INTO `productdetails` VALUES ('129', '52', '1', 'bb49a715afb94ea195058e3531a8f04f.jpg');
INSERT INTO `productdetails` VALUES ('130', '53', '0', '97ee61e69b0645af984122f9a8c8d554.jpg');
INSERT INTO `productdetails` VALUES ('131', '53', '1', '8cfccaf415754b3a9ca25a1a6214ebf7.jpg');
INSERT INTO `productdetails` VALUES ('132', '54', '0', '9ae30ee195d248e6b454ffbc6ac995e7.jpg');
INSERT INTO `productdetails` VALUES ('133', '54', '1', '8db40bfda57f4d619ed3a4de2baad200.jpg');
INSERT INTO `productdetails` VALUES ('136', '56', '0', '1a0f9f7155614893a8c38fd1067a79ee.jpg');
INSERT INTO `productdetails` VALUES ('137', '56', '1', 'ea99c5af1a9740b789bfa6d60c1eb20f.jpg');
INSERT INTO `productdetails` VALUES ('138', '57', '0', '7b48a37911a14c17a0c32de9d62e38ef.jpg');
INSERT INTO `productdetails` VALUES ('139', '57', '1', '7da67529eda34243b524e17e38ef6a0f.jpg');
INSERT INTO `productdetails` VALUES ('140', '58', '0', 'e438209ccbee42fc89ad1a907e9dba4b.jpg');
INSERT INTO `productdetails` VALUES ('141', '58', '1', '5630a719f59349e69cf7acb69971057f.jpg');
INSERT INTO `productdetails` VALUES ('142', '55', '0', '76c74a7e8efb49eab0048f6473a5cc61.jpg');
INSERT INTO `productdetails` VALUES ('143', '55', '1', 'b7e5832e364b4e6eb316e47203f5cc78.jpg');

-- ----------------------------
-- Table structure for productproperty
-- ----------------------------
DROP TABLE IF EXISTS `productproperty`;
CREATE TABLE `productproperty` (
  `productPropertyId` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(255) NOT NULL COMMENT '商品ID',
  `name` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '属性名称',
  `value` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '属性值',
  PRIMARY KEY (`productPropertyId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='商品属性详情';

-- ----------------------------
-- Records of productproperty
-- ----------------------------

-- ----------------------------
-- Table structure for seller
-- ----------------------------
DROP TABLE IF EXISTS `seller`;
CREATE TABLE `seller` (
  `sellerId` int(11) NOT NULL AUTO_INCREMENT,
  `sellerCode` varchar(36) COLLATE utf8_bin NOT NULL COMMENT '商户UUID(自动生成)',
  `name` varchar(8) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(36) COLLATE utf8_bin NOT NULL COMMENT '密码',
  `address` varchar(18) COLLATE utf8_bin NOT NULL COMMENT '商户所在地',
  `balance` decimal(10,2) DEFAULT '0.00' COMMENT '余额',
  `isDel` varchar(1) COLLATE utf8_bin DEFAULT '1' COMMENT '商家标记(0-正常商家,1-禁止登陆)',
  `banner` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺横幅',
  `notice` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '商家公告',
  PRIMARY KEY (`sellerId`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='商家表';

-- ----------------------------
-- Records of seller
-- ----------------------------
INSERT INTO `seller` VALUES ('2', 'b5c9e5f1-c431-4766-9dff-58edb9fe3aab', 'a', '4f5b7f1497b6fd29313cb694b02eafd1', '东城区', '16974.10', '0', '948c704525de433f9237df86bd636a5e.png', '阿德符合噶 阿哥');
INSERT INTO `seller` VALUES ('3', 'e8ca238d-b6bd-4d77-b207-6b546995ff4d', 'b', 'b3496117aac30efd586dc52287da973c', '东城区', '0.00', '0', '578241470bfe4ca9a93a227b6ebdb904.jpg', '阿萨德法师法师打发');
INSERT INTO `seller` VALUES ('4', '186f02a4-6080-43a6-8754-e829df2b318f', 'c', '1f7225d8204145f31dec6375a13ef691', '东城区', '0.00', '0', '6fd6c5ddf749479daafb9431be7351dd.jpg', '是的规范的规范大哥大法官物是人非无人');

-- ----------------------------
-- Table structure for sellercategory
-- ----------------------------
DROP TABLE IF EXISTS `sellercategory`;
CREATE TABLE `sellercategory` (
  `sellerCategoryId` int(255) NOT NULL AUTO_INCREMENT,
  `seller` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '商家ID',
  `name` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '分类名称',
  `isDel` varchar(5) COLLATE utf8_bin DEFAULT '0' COMMENT '0-显示,1-不显示(删除)',
  PRIMARY KEY (`sellerCategoryId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='商家分类表';

-- ----------------------------
-- Records of sellercategory
-- ----------------------------

-- ----------------------------
-- Table structure for sellercategoryvalue
-- ----------------------------
DROP TABLE IF EXISTS `sellercategoryvalue`;
CREATE TABLE `sellercategoryvalue` (
  `sellerCategoryValueId` int(255) NOT NULL AUTO_INCREMENT,
  `sellerCategoryId` int(255) NOT NULL COMMENT '商家分类ID',
  `product` int(255) NOT NULL COMMENT '商品',
  PRIMARY KEY (`sellerCategoryValueId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='商家分类值表';

-- ----------------------------
-- Records of sellercategoryvalue
-- ----------------------------

-- ----------------------------
-- Table structure for shippingaddress
-- ----------------------------
DROP TABLE IF EXISTS `shippingaddress`;
CREATE TABLE `shippingaddress` (
  `addressId` int(255) NOT NULL AUTO_INCREMENT,
  `userID` varchar(36) COLLATE utf8_bin NOT NULL COMMENT '用户ID',
  `address` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '收货地址',
  `postCode` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '邮编',
  `consignee` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人姓名',
  `phoneCode` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '电话号码',
  `isDel` varchar(5) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '0-用户可见,1-用户不可见(删除)',
  PRIMARY KEY (`addressId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='收货地址表';

-- ----------------------------
-- Records of shippingaddress
-- ----------------------------
INSERT INTO `shippingaddress` VALUES ('1', '7d94942e-f4d9-4237-b94e-9444a882780f', '吉林省白山市靖宇县asdaw', '234234234', 'fsdfgsfsdf', '2342342342342342', '1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userCode` varchar(36) COLLATE utf8_bin NOT NULL COMMENT '用户UUID(自动生成)',
  `name` varchar(8) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(36) COLLATE utf8_bin NOT NULL COMMENT '密码',
  `payPass` int(6) DEFAULT '0' COMMENT '支付密码',
  `balance` decimal(10,2) DEFAULT '0.00' COMMENT '余额',
  `isDel` varchar(1) COLLATE utf8_bin DEFAULT '0' COMMENT '用户标记(0-正常用户,1-禁止登陆)',
  PRIMARY KEY (`userId`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('2', '7d94942e-f4d9-4237-b94e-9444a882780f', 'u', '5e1eb85d5e6487dd7b16d023847f0bbd', '0', '865935.54', '0');
