/*
Navicat MySQL Data Transfer

Source Server         : 阿里MySQL5.6
Source Server Version : 50642
Source Host           : 47.95.196.58:3306
Source Database       : asp

Target Server Type    : MYSQL
Target Server Version : 50642
File Encoding         : 65001

Date: 2018-12-18 16:06:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` varchar(36) NOT NULL,
  `admin_pass` varchar(36) DEFAULT NULL,
  `admin_name` varchar(10) DEFAULT NULL,
  `admin_phone` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------

-- ----------------------------
-- Table structure for class_test
-- ----------------------------
DROP TABLE IF EXISTS `class_test`;
CREATE TABLE `class_test` (
  `class_test_id` varchar(36) NOT NULL,
  `class_id` varchar(36) DEFAULT NULL,
  `test_id` varchar(36) DEFAULT NULL,
  `class_test_state` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`class_test_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class_test
-- ----------------------------
INSERT INTO `class_test` VALUES ('A31E83B701664C02BFBC39BFCA77120C', '3', '9E9BA7A1E32D4FAEB90FE421D433C206', '完成');
INSERT INTO `class_test` VALUES ('CFA0B8F4FF464729BBFBEE80774956B4', '1', '9E9BA7A1E32D4FAEB90FE421D433C206', '未完成');
INSERT INTO `class_test` VALUES ('EB24EE58418940F88F32E71EBCA9C9DD', '3', 'B30350DE867441C980FED24DDB179158', '未完成');

-- ----------------------------
-- Table structure for classes
-- ----------------------------
DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes` (
  `class_id` varchar(36) NOT NULL,
  `class_name` varchar(10) DEFAULT NULL,
  `class_yuanxi` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classes
-- ----------------------------
INSERT INTO `classes` VALUES ('1', '软件工程二班', '计算机学院');
INSERT INTO `classes` VALUES ('2', '小学生一班', '小学生');
INSERT INTO `classes` VALUES ('3', '小学生二班', '小学生');

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade` (
  `grade_id` varchar(36) NOT NULL,
  `stu_id` varchar(36) DEFAULT NULL,
  `stu_score` int(11) DEFAULT NULL,
  `test_id` varchar(36) DEFAULT NULL,
  `test_state` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`grade_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES ('115F64853976486080100C8F13F0B7BF', '333', '0', 'B30350DE867441C980FED24DDB179158', '完成');
INSERT INTO `grade` VALUES ('177FF082FE4348CBB1AC4B99988CD243', '999', '56', '9E9BA7A1E32D4FAEB90FE421D433C206', '完成');
INSERT INTO `grade` VALUES ('9E693011DA394A418826B4E7EA4C8A08', '666', '22', '9E9BA7A1E32D4FAEB90FE421D433C206', '完成');
INSERT INTO `grade` VALUES ('9F3FE7A3AF9A451B8E4A934C170305AD', '333', '22', '9E9BA7A1E32D4FAEB90FE421D433C206', '完成');

-- ----------------------------
-- Table structure for grade_detail
-- ----------------------------
DROP TABLE IF EXISTS `grade_detail`;
CREATE TABLE `grade_detail` (
  `grade_detail_id` varchar(36) NOT NULL,
  `grade_id` varchar(36) DEFAULT NULL,
  `top_id` varchar(36) DEFAULT NULL,
  `stu_score` int(11) DEFAULT NULL,
  `top_daan` varchar(50) DEFAULT NULL,
  `top_daan_a` varchar(50) DEFAULT NULL,
  `top_daan_b` varchar(50) DEFAULT NULL,
  `top_daan_c` varchar(50) DEFAULT NULL,
  `top_daan_d` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`grade_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grade_detail
-- ----------------------------
INSERT INTO `grade_detail` VALUES ('127C7D78064842FCAA30EAEE2847C128', '177FF082FE4348CBB1AC4B99988CD243', '43861F42CB864002BBA134CC4437581E', '11', '6', null, null, null, null);
INSERT INTO `grade_detail` VALUES ('1646B78298C5419FB82F8BEFE8D40FEB', '9F3FE7A3AF9A451B8E4A934C170305AD', 'B1B647DF9BC24B80A9CD44752DA82446', '11', '4', null, null, null, null);
INSERT INTO `grade_detail` VALUES ('2A623B02798249ABAE3B683756FC6942', '177FF082FE4348CBB1AC4B99988CD243', '6DB0BF738A554805B4E44CEDDC4381E9', '11', '4', null, null, null, null);
INSERT INTO `grade_detail` VALUES ('31DF0122459B4707BDF557CB756DAC3D', '9E693011DA394A418826B4E7EA4C8A08', '066FCE4037A840BF9B163FEDD483DD98', '0', '3', null, null, null, null);
INSERT INTO `grade_detail` VALUES ('340B365F5CB84218AE0DD51A79850E77', '9E693011DA394A418826B4E7EA4C8A08', '201C738766D7404E8AE2F623D74E1EA3', '0', '7', null, null, null, null);
INSERT INTO `grade_detail` VALUES ('3795E3BB4F21498391C8356DF493D89F', '9F3FE7A3AF9A451B8E4A934C170305AD', 'C2E9118215C1490D901E26F4CA2ABAA4', '0', '6', null, null, null, null);
INSERT INTO `grade_detail` VALUES ('5E8E4B1EB05F42888F13211F2FBACCB5', '9F3FE7A3AF9A451B8E4A934C170305AD', '43861F42CB864002BBA134CC4437581E', '0', '1', null, null, null, null);
INSERT INTO `grade_detail` VALUES ('609A20D9732F433181E3C8BE025C9CD5', '177FF082FE4348CBB1AC4B99988CD243', 'B1B647DF9BC24B80A9CD44752DA82446', '11', '4', null, null, null, null);
INSERT INTO `grade_detail` VALUES ('674D789795994E439EC77B0749A173D0', '9E693011DA394A418826B4E7EA4C8A08', 'C2E9118215C1490D901E26F4CA2ABAA4', '0', '6', null, null, null, null);
INSERT INTO `grade_detail` VALUES ('70EBE01B49914C8F8F329D9BE683EC43', '9F3FE7A3AF9A451B8E4A934C170305AD', 'A8681A2AEBBD431AA44AE4F30BBBCFDB', '0', '2', null, null, null, null);
INSERT INTO `grade_detail` VALUES ('75A98DCF984D4724A779D7B3AB502FF7', '177FF082FE4348CBB1AC4B99988CD243', 'C2E9118215C1490D901E26F4CA2ABAA4', '0', '3', null, null, null, null);
INSERT INTO `grade_detail` VALUES ('78B37331FCA2413E9142564020477DBB', '177FF082FE4348CBB1AC4B99988CD243', '201C738766D7404E8AE2F623D74E1EA3', '12', '2', null, null, null, null);
INSERT INTO `grade_detail` VALUES ('7A1AABDDB4A545089E032DD6C31A222C', '115F64853976486080100C8F13F0B7BF', '066FCE4037A840BF9B163FEDD483DD98', '0', '0', null, null, null, null);
INSERT INTO `grade_detail` VALUES ('81ABF681255E49F08AFE1917A585A5E6', '9F3FE7A3AF9A451B8E4A934C170305AD', 'B3851AC7B2C74962B3A5F8A0139E0B38', '0', '9', null, null, null, null);
INSERT INTO `grade_detail` VALUES ('8CA3B65C62D24E2BB9A78F0067D7F49F', '9E693011DA394A418826B4E7EA4C8A08', 'B1B647DF9BC24B80A9CD44752DA82446', '11', '4', null, null, null, null);
INSERT INTO `grade_detail` VALUES ('8F43F533CA114D808C6B5666450D8296', '9E693011DA394A418826B4E7EA4C8A08', 'A8681A2AEBBD431AA44AE4F30BBBCFDB', '0', '4', null, null, null, null);
INSERT INTO `grade_detail` VALUES ('94EBF4A520224426B235F493845A76A7', '177FF082FE4348CBB1AC4B99988CD243', 'A8681A2AEBBD431AA44AE4F30BBBCFDB', '0', '2', null, null, null, null);
INSERT INTO `grade_detail` VALUES ('A2378C4AC13649F5948B15C7D9BC0E68', '9F3FE7A3AF9A451B8E4A934C170305AD', '201C738766D7404E8AE2F623D74E1EA3', '0', '7', null, null, null, null);
INSERT INTO `grade_detail` VALUES ('A965CF4FD38E4051B9AEC3485062F890', '9E693011DA394A418826B4E7EA4C8A08', '43861F42CB864002BBA134CC4437581E', '0', '1', null, null, null, null);
INSERT INTO `grade_detail` VALUES ('AE765F14247442A3B3B98B48A1C1C76C', '9E693011DA394A418826B4E7EA4C8A08', '050B0CE3006C44578D975B1ADA481A10', '11', '2', null, null, null, null);
INSERT INTO `grade_detail` VALUES ('AF81AB1B041E4C2AA2D7CD3007624FFF', '9F3FE7A3AF9A451B8E4A934C170305AD', '066FCE4037A840BF9B163FEDD483DD98', '0', '3', null, null, null, null);
INSERT INTO `grade_detail` VALUES ('BF7A22D5B72A47B08B625421E01FBC5F', '9E693011DA394A418826B4E7EA4C8A08', 'B3851AC7B2C74962B3A5F8A0139E0B38', '0', '6', null, null, null, null);
INSERT INTO `grade_detail` VALUES ('CDDF3FCD6B0B41299EB1D2700B8006B9', '115F64853976486080100C8F13F0B7BF', '050B0CE3006C44578D975B1ADA481A10', '0', '2', null, null, null, null);
INSERT INTO `grade_detail` VALUES ('CFCF6C81EC7E4103882F5353DBE75F9F', '9F3FE7A3AF9A451B8E4A934C170305AD', '050B0CE3006C44578D975B1ADA481A10', '11', '2', null, null, null, null);
INSERT INTO `grade_detail` VALUES ('E63F26350613469F954E2887213AE3AB', '177FF082FE4348CBB1AC4B99988CD243', '050B0CE3006C44578D975B1ADA481A10', '11', '2', null, null, null, null);
INSERT INTO `grade_detail` VALUES ('EE0D5D502E3E4A3FAF0D82FABFBF255E', '177FF082FE4348CBB1AC4B99988CD243', '066FCE4037A840BF9B163FEDD483DD98', '0', '0', null, null, null, null);
INSERT INTO `grade_detail` VALUES ('F89506C9AC9D4F0DB1C6143FF438F5D1', '9F3FE7A3AF9A451B8E4A934C170305AD', '6DB0BF738A554805B4E44CEDDC4381E9', '0', '5', null, null, null, null);
INSERT INTO `grade_detail` VALUES ('F8A6391B90D44973B6E729077805E6A7', '9E693011DA394A418826B4E7EA4C8A08', '6DB0BF738A554805B4E44CEDDC4381E9', '0', '5', null, null, null, null);
INSERT INTO `grade_detail` VALUES ('FA760874CA234130A4CE17778CB0CCAA', '177FF082FE4348CBB1AC4B99988CD243', 'B3851AC7B2C74962B3A5F8A0139E0B38', '0', '6', null, null, null, null);

-- ----------------------------
-- Table structure for students
-- ----------------------------
DROP TABLE IF EXISTS `students`;
CREATE TABLE `students` (
  `stu_id` varchar(36) NOT NULL,
  `stu_pass` varchar(36) DEFAULT NULL,
  `stu_name` varchar(10) DEFAULT NULL,
  `stu_sex` varchar(30) DEFAULT NULL,
  `stu_phone` varchar(30) DEFAULT NULL,
  `stu_comedata` varchar(30) DEFAULT NULL,
  `class_id` varchar(36) DEFAULT NULL,
  `stu_favorable` varchar(100) DEFAULT NULL,
  `stu_words` varchar(100) DEFAULT NULL,
  `stu_remark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`stu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of students
-- ----------------------------
INSERT INTO `students` VALUES ('111', '111', '陈宁', '男', '111', '111', '1', '111', '111', '111');
INSERT INTO `students` VALUES ('222', '222', '张权', '男', '222', '222', '2', '222', '222', '222');
INSERT INTO `students` VALUES ('333', '333', '张容祯', '男', '333', '333', '3', '333', '333', '333');
INSERT INTO `students` VALUES ('444', '444', '张凯', '男', '444', '444', '1', '444', '444', '444');
INSERT INTO `students` VALUES ('555', '555', '司幸堯', '女', '555', '555', '2', '555', '555', '555');
INSERT INTO `students` VALUES ('666', '666', '王涛', '男', '666', '666', '3', '666', '666', '666');
INSERT INTO `students` VALUES ('777', '777', '赵永奇', '男', '777', '777', '1', '777', '777', '777');
INSERT INTO `students` VALUES ('888', '888', '姬广锐', '男', '888', '888', '2', '888', '888', '888');
INSERT INTO `students` VALUES ('999', '999', '胡锦涛', '男', '999', '999', '3', '999', '999', '999');

-- ----------------------------
-- Table structure for sys_param
-- ----------------------------
DROP TABLE IF EXISTS `sys_param`;
CREATE TABLE `sys_param` (
  `sys_param_id` varchar(36) NOT NULL,
  `sys_param_key` varchar(50) DEFAULT NULL,
  `sys_param_value` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`sys_param_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_param
-- ----------------------------

-- ----------------------------
-- Table structure for tab
-- ----------------------------
DROP TABLE IF EXISTS `tab`;
CREATE TABLE `tab` (
  `tab_id` varchar(36) NOT NULL,
  `tea_id` varchar(36) DEFAULT NULL,
  `class_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`tab_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab
-- ----------------------------
INSERT INTO `tab` VALUES ('1', '111', '1');
INSERT INTO `tab` VALUES ('2', '111', '3');
INSERT INTO `tab` VALUES ('3', '222', '1');
INSERT INTO `tab` VALUES ('4', '222', '2');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `tea_id` varchar(36) NOT NULL,
  `tea_pass` varchar(36) DEFAULT NULL,
  `tea_name` varchar(10) DEFAULT NULL,
  `tea_sex` varchar(30) DEFAULT NULL,
  `tea_phone` varchar(30) DEFAULT NULL,
  `tea_comedata` varchar(30) DEFAULT NULL,
  `tea_favorable` varchar(100) DEFAULT NULL,
  `tea_words` varchar(100) DEFAULT NULL,
  `tea_remark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`tea_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('111', '111', '111', '男', '11', '2018-12-21', '吃饭', '好好学习', '天天向上');
INSERT INTO `teacher` VALUES ('222', '222', '222', '女', '222', '222', '22', '22', '2');

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `test_id` varchar(36) NOT NULL,
  `tea_id` varchar(36) DEFAULT NULL,
  `test_name` varchar(36) DEFAULT NULL,
  `test_nandu` varchar(36) DEFAULT NULL,
  `test_score` int(11) DEFAULT NULL,
  `test_total` int(11) DEFAULT NULL,
  `test_time` int(11) DEFAULT NULL,
  `test_state` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`test_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES ('9E9BA7A1E32D4FAEB90FE421D433C206', '111', '算术计算', '简单', '100', '9', '120', '完成');
INSERT INTO `test` VALUES ('B30350DE867441C980FED24DDB179158', '111', '算术计算第二次模拟', '困难', '100', '2', '120', '未完成');

-- ----------------------------
-- Table structure for test_record
-- ----------------------------
DROP TABLE IF EXISTS `test_record`;
CREATE TABLE `test_record` (
  `test_record_id` varchar(36) NOT NULL,
  `test_id` varchar(36) NOT NULL DEFAULT '',
  `tea_id` varchar(36) DEFAULT NULL,
  `test_name` varchar(36) DEFAULT NULL,
  `test_nandu` varchar(36) DEFAULT NULL,
  `test_score` int(11) DEFAULT NULL,
  `test_total` int(11) DEFAULT NULL,
  `test_time` int(11) DEFAULT NULL,
  `test_state` varchar(36) DEFAULT NULL,
  `test_deltime` date DEFAULT NULL,
  PRIMARY KEY (`test_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test_record
-- ----------------------------

-- ----------------------------
-- Table structure for test_topic
-- ----------------------------
DROP TABLE IF EXISTS `test_topic`;
CREATE TABLE `test_topic` (
  `test_topic_id` varchar(36) NOT NULL,
  `test_id` varchar(36) DEFAULT NULL,
  `top_id` varchar(36) DEFAULT NULL,
  `top_score` int(11) DEFAULT NULL,
  PRIMARY KEY (`test_topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test_topic
-- ----------------------------
INSERT INTO `test_topic` VALUES ('073A5572EE414C46BBBFF7ECC8FCE6FB', '9E9BA7A1E32D4FAEB90FE421D433C206', '43861F42CB864002BBA134CC4437581E', '11');
INSERT INTO `test_topic` VALUES ('07777F0F5A9746478A0ABEBF63294AF5', '9E9BA7A1E32D4FAEB90FE421D433C206', '050B0CE3006C44578D975B1ADA481A10', '11');
INSERT INTO `test_topic` VALUES ('320F31745C4444CB8DD1AAC52056AFF4', '9E9BA7A1E32D4FAEB90FE421D433C206', '066FCE4037A840BF9B163FEDD483DD98', '11');
INSERT INTO `test_topic` VALUES ('3804F8784FC743AFA52643C06FE28AD0', '9E9BA7A1E32D4FAEB90FE421D433C206', 'A8681A2AEBBD431AA44AE4F30BBBCFDB', '11');
INSERT INTO `test_topic` VALUES ('4FFB589E81BC41A7819D5861620162EA', '9E9BA7A1E32D4FAEB90FE421D433C206', 'B1B647DF9BC24B80A9CD44752DA82446', '11');
INSERT INTO `test_topic` VALUES ('616AF01AFB4D49C78CF94FEDECBCE394', 'B30350DE867441C980FED24DDB179158', '050B0CE3006C44578D975B1ADA481A10', '0');
INSERT INTO `test_topic` VALUES ('6660585817584BF18242D6177C27BB84', '9E9BA7A1E32D4FAEB90FE421D433C206', '6DB0BF738A554805B4E44CEDDC4381E9', '11');
INSERT INTO `test_topic` VALUES ('C5BF2F9A6C9D4526A160A98412C17055', 'B30350DE867441C980FED24DDB179158', '066FCE4037A840BF9B163FEDD483DD98', '0');
INSERT INTO `test_topic` VALUES ('CB023E910D90493F9DBC051DA0002046', '9E9BA7A1E32D4FAEB90FE421D433C206', 'C2E9118215C1490D901E26F4CA2ABAA4', '11');
INSERT INTO `test_topic` VALUES ('E8BF137B545B4BF5B885621D6C8859F5', '9E9BA7A1E32D4FAEB90FE421D433C206', 'B3851AC7B2C74962B3A5F8A0139E0B38', '11');
INSERT INTO `test_topic` VALUES ('F755870727A746F7A3667C73F6B68AC2', '9E9BA7A1E32D4FAEB90FE421D433C206', '201C738766D7404E8AE2F623D74E1EA3', '12');

-- ----------------------------
-- Table structure for topic
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic` (
  `top_id` varchar(36) NOT NULL,
  `tea_id` varchar(36) DEFAULT NULL,
  `top_type` varchar(36) DEFAULT NULL,
  `top_knowledge` varchar(36) DEFAULT NULL,
  `top_nandu` varchar(36) DEFAULT NULL,
  `top_timu` varchar(100) DEFAULT NULL,
  `top_a` varchar(50) DEFAULT NULL,
  `top_b` varchar(50) DEFAULT NULL,
  `top_c` varchar(50) DEFAULT NULL,
  `top_d` varchar(50) DEFAULT NULL,
  `top_daan` varchar(50) DEFAULT NULL,
  `top_daan_a` varchar(50) DEFAULT NULL,
  `top_daan_b` varchar(50) DEFAULT NULL,
  `top_daan_c` varchar(50) DEFAULT NULL,
  `top_daan_d` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`top_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of topic
-- ----------------------------
INSERT INTO `topic` VALUES ('050B0CE3006C44578D975B1ADA481A10', '111', '填空', '除法运算', '困难', '6/3', '2', '', '', '', '2', null, null, null, null);
INSERT INTO `topic` VALUES ('066FCE4037A840BF9B163FEDD483DD98', '111', '填空', '减法运算', '简单', '1-1', '2', '', '', '', '2', null, null, null, null);
INSERT INTO `topic` VALUES ('201C738766D7404E8AE2F623D74E1EA3', '111', '填空', '加法运算', '简单', '1+1', '2', '', '', '', '2', null, null, null, null);
INSERT INTO `topic` VALUES ('43861F42CB864002BBA134CC4437581E', '111', '填空', '加法运算', '困难', '3+3', '6', '', '', '', '6', null, null, null, null);
INSERT INTO `topic` VALUES ('6DB0BF738A554805B4E44CEDDC4381E9', '111', '填空', '加法运算', '一般', '2+2', '4', '', '', '', '4', null, null, null, null);
INSERT INTO `topic` VALUES ('A8681A2AEBBD431AA44AE4F30BBBCFDB', '111', '单选', '加法运算', '简单', '1+1', '1', '2', '3', '4', '1', null, null, null, null);
INSERT INTO `topic` VALUES ('B1B647DF9BC24B80A9CD44752DA82446', '111', '填空', '乘法运算', '简单', '2*2', '4', '', '', '', '4', null, null, null, null);
INSERT INTO `topic` VALUES ('B3851AC7B2C74962B3A5F8A0139E0B38', '111', '单选', '乘法运算', '简单', '3*3', '3', '6', '9', '12', '3', null, null, null, null);
INSERT INTO `topic` VALUES ('C2E9118215C1490D901E26F4CA2ABAA4', '111', '填空', '除法运算', '一般', '9/3', '1', '2', '3', '4', '1', null, null, null, null);
