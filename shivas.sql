/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50508
Source Host           : localhost:3306
Source Database       : shivas

Target Server Type    : MYSQL
Target Server Version : 50508
File Encoding         : 65001

Date: 2012-05-05 01:27:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `accounts`
-- ----------------------------
DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nickname` varchar(255) NOT NULL,
  `question` varchar(255) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `rights` tinyint(1) NOT NULL,
  `banned` tinyint(1) NOT NULL,
  `community` int(11) NOT NULL,
  `points` int(11) NOT NULL,
  `subscription_end` datetime NOT NULL,
  `connected` tinyint(1) NOT NULL,
  `channels` varchar(255) NOT NULL DEFAULT 'i*#$p%',
  `last_connection` datetime NOT NULL,
  `last_address` varchar(15) NOT NULL,
  `nb_connections` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_name_index` (`name`) USING BTREE,
  UNIQUE KEY `accounts_nickname_index` (`nickname`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of accounts
-- ----------------------------
INSERT INTO `accounts` VALUES ('1', 'test', 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3', '[TEST]Blackrush', 'DELETE?', 'DELETE', '1', '0', '0', '0', '2013-05-03 13:43:59', '1', '!#$%*:?i', '0000-00-00 00:00:00', '', '0');

-- ----------------------------
-- Table structure for `players`
-- ----------------------------
DROP TABLE IF EXISTS `players`;
CREATE TABLE `players` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `breed_id` int(11) NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `skin` smallint(6) NOT NULL,
  `size` smallint(6) NOT NULL,
  `color1` int(11) NOT NULL,
  `color2` int(11) NOT NULL,
  `color3` int(11) NOT NULL,
  `level` smallint(6) NOT NULL,
  `experience` bigint(20) NOT NULL,
  `map_id` int(11) NOT NULL,
  `cell` smallint(6) NOT NULL,
  `orientation` tinyint(4) NOT NULL,
  `stat_points` smallint(6) NOT NULL,
  `spell_points` smallint(6) NOT NULL,
  `energy` int(11) NOT NULL,
  `life` int(11) NOT NULL,
  `action_points` smallint(6) NOT NULL,
  `movement_points` smallint(6) NOT NULL,
  `vitality` smallint(6) NOT NULL,
  `wisdom` smallint(6) NOT NULL,
  `strength` smallint(6) NOT NULL,
  `intelligence` smallint(6) NOT NULL,
  `chance` smallint(6) NOT NULL,
  `agility` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `players_name_index` (`name`) USING BTREE,
  KEY `players_owner_id_fk` (`owner_id`),
  CONSTRAINT `players_owner_id_fk` FOREIGN KEY (`owner_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of players
-- ----------------------------