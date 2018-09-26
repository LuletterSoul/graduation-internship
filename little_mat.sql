/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50525
Source Host           : localhost:3306
Source Database       : little_mat

Target Server Type    : MYSQL
Target Server Version : 50525
File Encoding         : 65001

Date: 2018-09-14 20:25:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `accountId` int(11) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`accountId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('1', 'root', 'root');
INSERT INTO `account` VALUES ('2', '123', 'xiaoliu');
INSERT INTO `account` VALUES ('3', '123', 'xiaoxiang');
INSERT INTO `account` VALUES ('4', '123', 'xiaode');

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adminId` int(11) NOT NULL,
  `accountId` int(11) DEFAULT NULL,
  PRIMARY KEY (`adminId`),
  KEY `FK1idvmf9n9dcqe4b523rpmtbsb` (`accountId`),
  CONSTRAINT `FK1idvmf9n9dcqe4b523rpmtbsb` FOREIGN KEY (`accountId`) REFERENCES `account` (`accountId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '1');

-- ----------------------------
-- Table structure for auction_msg
-- ----------------------------
DROP TABLE IF EXISTS `auction_msg`;
CREATE TABLE `auction_msg` (
  `amsgId` int(11) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `publicDate` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `publisherId` int(11) DEFAULT NULL,
  PRIMARY KEY (`amsgId`),
  KEY `FKpgjn6lojwqs5tclh2uq2a4p4r` (`publisherId`),
  CONSTRAINT `FKpgjn6lojwqs5tclh2uq2a4p4r` FOREIGN KEY (`publisherId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auction_msg
-- ----------------------------

-- ----------------------------
-- Table structure for competition
-- ----------------------------
DROP TABLE IF EXISTS `competition`;
CREATE TABLE `competition` (
  `comId` int(11) NOT NULL,
  `comName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`comId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of competition
-- ----------------------------
INSERT INTO `competition` VALUES ('1', '程序设计竞赛');
INSERT INTO `competition` VALUES ('2', '算法竞赛');
INSERT INTO `competition` VALUES ('3', '高等数学竞赛');
INSERT INTO `competition` VALUES ('4', '物理竞赛');
INSERT INTO `competition` VALUES ('5', '数模竞赛');
INSERT INTO `competition` VALUES ('6', '芯片设计竞赛');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `courseId` int(11) NOT NULL,
  `courseName` varchar(255) DEFAULT NULL,
  `credit` float DEFAULT NULL,
  PRIMARY KEY (`courseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', '程序设计基础', '4');
INSERT INTO `course` VALUES ('2', '高等数学', '3');
INSERT INTO `course` VALUES ('3', '汇编语言', '2');
INSERT INTO `course` VALUES ('4', '面向对象设计', '2');
INSERT INTO `course` VALUES ('5', '软件设计模式', '3');
INSERT INTO `course` VALUES ('6', '课程设计', '2');
INSERT INTO `course` VALUES ('7', '计算机组成原理', '4.5');
INSERT INTO `course` VALUES ('8', '操作系统', '2');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `depId` int(11) NOT NULL,
  `depName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`depId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', '计算机科学与技术学院');
INSERT INTO `department` VALUES ('2', '机械工程');

-- ----------------------------
-- Table structure for department_course
-- ----------------------------
DROP TABLE IF EXISTS `department_course`;
CREATE TABLE `department_course` (
  `depId` int(11) NOT NULL,
  `courseId` int(11) NOT NULL,
  PRIMARY KEY (`depId`,`courseId`),
  KEY `FK6i29ukp0ubvgcjm2e3506n2m5` (`courseId`),
  CONSTRAINT `FK6i29ukp0ubvgcjm2e3506n2m5` FOREIGN KEY (`courseId`) REFERENCES `course` (`courseId`),
  CONSTRAINT `FKhsy0ay0p07cjal8fjl4hfbc3l` FOREIGN KEY (`depId`) REFERENCES `department` (`depId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department_course
-- ----------------------------
INSERT INTO `department_course` VALUES ('1', '2');
INSERT INTO `department_course` VALUES ('2', '2');
INSERT INTO `department_course` VALUES ('1', '3');
INSERT INTO `department_course` VALUES ('2', '3');
INSERT INTO `department_course` VALUES ('1', '4');
INSERT INTO `department_course` VALUES ('1', '5');
INSERT INTO `department_course` VALUES ('1', '6');
INSERT INTO `department_course` VALUES ('1', '7');
INSERT INTO `department_course` VALUES ('1', '8');

-- ----------------------------
-- Table structure for download_record
-- ----------------------------
DROP TABLE IF EXISTS `download_record`;
CREATE TABLE `download_record` (
  `recordId` int(11) NOT NULL,
  `downloadDate` datetime DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `resId` int(11) DEFAULT NULL,
  PRIMARY KEY (`recordId`),
  KEY `FKd8bsihxc4b6yxytj3rm3ww415` (`userId`),
  KEY `FKeh0jg78t9mh4io1wyovn1eo8b` (`resId`),
  CONSTRAINT `FKd8bsihxc4b6yxytj3rm3ww415` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`),
  CONSTRAINT `FKeh0jg78t9mh4io1wyovn1eo8b` FOREIGN KEY (`resId`) REFERENCES `resource` (`resId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of download_record
-- ----------------------------

-- ----------------------------
-- Table structure for photo
-- ----------------------------
DROP TABLE IF EXISTS `photo`;
CREATE TABLE `photo` (
  `photoId` int(11) NOT NULL,
  `photoPath` varchar(255) DEFAULT NULL,
  `amsgId` int(11) DEFAULT NULL,
  PRIMARY KEY (`photoId`),
  KEY `FKl7clralgveyodn88jkba1xqsf` (`amsgId`),
  CONSTRAINT `FKl7clralgveyodn88jkba1xqsf` FOREIGN KEY (`amsgId`) REFERENCES `auction_msg` (`amsgId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of photo
-- ----------------------------

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `resId` int(11) NOT NULL,
  `format` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `size` bigint(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `checkerId` int(11) DEFAULT NULL,
  `comId` int(11) DEFAULT NULL,
  `courseId` int(11) DEFAULT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  PRIMARY KEY (`resId`),
  KEY `FKi83a5n55new20laa93fn0v9y0` (`checkerId`),
  KEY `FKkqm9ggv2dsuxp2osisylv9ju3` (`comId`),
  KEY `FKshlvn7svq2oi2kxv8c31qghu5` (`courseId`),
  KEY `FKtqwlw7gv9avk6wdkgvqch4jjh` (`uploaderId`),
  CONSTRAINT `FKi83a5n55new20laa93fn0v9y0` FOREIGN KEY (`checkerId`) REFERENCES `admin` (`adminId`),
  CONSTRAINT `FKkqm9ggv2dsuxp2osisylv9ju3` FOREIGN KEY (`comId`) REFERENCES `competition` (`comId`),
  CONSTRAINT `FKshlvn7svq2oi2kxv8c31qghu5` FOREIGN KEY (`courseId`) REFERENCES `course` (`courseId`),
  CONSTRAINT `FKtqwlw7gv9avk6wdkgvqch4jjh` FOREIGN KEY (`uploaderId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resource
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL,
  `major` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `accountId` int(11) DEFAULT NULL,
  `depId` int(11) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  KEY `FKknvuktmy5peupqjmbqrkw5lvs` (`accountId`),
  KEY `FK740kgr69n4541atao2lwbah4g` (`depId`),
  CONSTRAINT `FK740kgr69n4541atao2lwbah4g` FOREIGN KEY (`depId`) REFERENCES `department` (`depId`),
  CONSTRAINT `FKknvuktmy5peupqjmbqrkw5lvs` FOREIGN KEY (`accountId`) REFERENCES `account` (`accountId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'xiaoliu@qq.com', '男', '大四', '软件工程', '小刘', '123', '2', '1');
INSERT INTO `user` VALUES ('2', 'xiaoxiang@qq.com', '男', '大四', '软件工程', '小祥', '123', '3', '1');
INSERT INTO `user` VALUES ('3', 'xiaode@qq.com', '男', '大四', '软件工程', '小德', '123', '4', '2');
