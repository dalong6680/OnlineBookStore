/*
 Navicat Premium Data Transfer

 Source Server         : LocalMySQLDB
 Source Server Type    : MySQL
 Source Server Version : 50731
 Source Host           : localhost:3306
 Source Schema         : booksystem

 Target Server Type    : MySQL
 Target Server Version : 50731
 File Encoding         : 65001

 Date: 21/12/2022 14:05:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `book_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `writer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` double NOT NULL,
  `stock` int(11) NOT NULL,
  PRIMARY KEY (`book_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (1, '呐喊', '鲁迅', 12.5, 86);
INSERT INTO `book` VALUES (2, '彷徨', '鲁迅', 12.6, 992);
INSERT INTO `book` VALUES (3, '1984', '乔治·奥威尔', 20, 20);
INSERT INTO `book` VALUES (4, '挪威的森林', '村上春树', 15, 95);
INSERT INTO `book` VALUES (5, '童年·在人间·我的大学', '高尔基', 17.5, 35);

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `serial_no` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`cart_id`) USING BTREE,
  INDEX `user_cart`(`user_id`) USING BTREE,
  INDEX `book_cart`(`book_id`) USING BTREE,
  CONSTRAINT `book_cart` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `user_cart` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (36, 2, 1, 2, 1);
INSERT INTO `cart` VALUES (38, 4, 1, 4, 1);
INSERT INTO `cart` VALUES (39, 5, 1, 5, 1);
INSERT INTO `cart` VALUES (40, 6, 1, 1, 1);

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `reply` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `message_date` datetime NOT NULL,
  PRIMARY KEY (`message_id`) USING BTREE,
  INDEX `user_message`(`user_id`) USING BTREE,
  CONSTRAINT `user_message` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES (2, 7, '测试信息', '测试回复', '2022-12-18 19:06:59');
INSERT INTO `message` VALUES (3, 7, '测试信息0', '测试回复', '2022-12-18 19:07:34');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `order_date` datetime NOT NULL,
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `user_order`(`user_id`) USING BTREE,
  INDEX `book_order`(`book_id`) USING BTREE,
  CONSTRAINT `book_order` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `user_order` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (7, 1, 1, 1, '2022-12-18 09:16:26');
INSERT INTO `order` VALUES (8, 1, 3, 2, '2022-12-18 09:16:26');
INSERT INTO `order` VALUES (9, 1, 2, 1, '2022-12-18 09:16:26');
INSERT INTO `order` VALUES (10, 1, 1, 1, '2022-12-18 09:16:26');
INSERT INTO `order` VALUES (11, 1, 3, 2, '2022-12-18 09:18:13');
INSERT INTO `order` VALUES (12, 1, 2, 1, '2022-12-18 09:18:13');
INSERT INTO `order` VALUES (13, 1, 1, 1, '2022-12-18 09:18:13');
INSERT INTO `order` VALUES (14, 1, 3, 2, '2022-12-18 09:18:13');
INSERT INTO `order` VALUES (15, 1, 2, 1, '2022-12-18 09:18:13');
INSERT INTO `order` VALUES (16, 1, 1, 2, '2022-12-20 11:40:16');
INSERT INTO `order` VALUES (17, 1, 2, 3, '2022-12-20 11:40:16');
INSERT INTO `order` VALUES (18, 1, 3, 4, '2022-12-20 11:40:16');
INSERT INTO `order` VALUES (19, 1, 4, 5, '2022-12-20 11:40:16');
INSERT INTO `order` VALUES (20, 1, 5, 6, '2022-12-20 11:40:16');
INSERT INTO `order` VALUES (21, 1, 2, 2, '2022-12-20 11:41:41');
INSERT INTO `order` VALUES (22, 1, 1, 3, '2022-12-20 11:41:41');
INSERT INTO `order` VALUES (23, 1, 5, 4, '2022-12-20 11:41:41');
INSERT INTO `order` VALUES (24, 1, 3, 20, '2022-12-20 11:57:39');
INSERT INTO `order` VALUES (25, 1, 1, 1, '2022-12-20 12:01:35');
INSERT INTO `order` VALUES (26, 1, 1, 1, '2022-12-20 12:01:35');
INSERT INTO `order` VALUES (27, 1, 1, 1, '2022-12-20 12:01:35');
INSERT INTO `order` VALUES (28, 1, 1, 1, '2022-12-20 12:01:35');
INSERT INTO `order` VALUES (29, 1, 1, 1, '2022-12-20 12:01:35');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_admin` int(11) NOT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'admin', 1);
INSERT INTO `user` VALUES (4, 'abc', '123', 0);
INSERT INTO `user` VALUES (7, '123', '123', 0);
INSERT INTO `user` VALUES (13, '123456', '123456', 0);
INSERT INTO `user` VALUES (15, 'dalong6680', '123123', 0);

SET FOREIGN_KEY_CHECKS = 1;
