/*
Navicat MySQL Data Transfer

Source Server         : afengcao.club
Source Server Version : 50720
Source Host           : 123.206.229.133:3306
Source Database       : db_onlinestore

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2017-12-04 17:17:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `username` varchar(255) NOT NULL COMMENT '用户名',
  `password` varchar(255) NOT NULL COMMENT '管理员密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_express
-- ----------------------------
DROP TABLE IF EXISTS `t_express`;
CREATE TABLE `t_express` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '快递单id',
  `userId` int(11) NOT NULL COMMENT '用户id',
  `message` varchar(255) NOT NULL COMMENT '快递单信息',
  `verify` tinyint(1) NOT NULL DEFAULT '0' COMMENT '审核（0：待审核 1：审核未通过 2：已审核 3：已被接单）',
  `senderId` int(11) DEFAULT NULL COMMENT '配送用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_message
-- ----------------------------
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '留言id',
  `userId` int(11) NOT NULL COMMENT '用户id',
  `productId` int(11) NOT NULL COMMENT '商品id',
  `message` varchar(255) NOT NULL COMMENT '留言信息',
  `verify` tinyint(1) NOT NULL DEFAULT '0' COMMENT '审核（0：待审核 1：未通过 2：已通过)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_product
-- ----------------------------
DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `name` varchar(50) NOT NULL COMMENT '商品名称',
  `avater` varchar(255) DEFAULT NULL COMMENT '商品头像地址',
  `price` int(11) NOT NULL COMMENT '商品价格',
  `introduction` text COMMENT '商品介绍',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `userName` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '用户密码',
  `name` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号',
  `email` varchar(50) DEFAULT NULL COMMENT '用户邮箱',
  `college` varchar(50) DEFAULT NULL COMMENT '学院专业班级',
  `verify` tinyint(1) NOT NULL DEFAULT '0' COMMENT '小蜜蜂认证(未认证：0  待审核：1 未通过：2 ：已认证:3)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
