/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50173
 Source Host           : localhost
 Source Database       : sns

 Target Server Type    : MySQL
 Target Server Version : 50173
 File Encoding         : utf-8

 Date: 08/12/2014 22:19:24 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `wq_album_favorites`
-- ----------------------------
DROP TABLE IF EXISTS `wq_album_favorites`;
CREATE TABLE `wq_album_favorites` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) NOT NULL COMMENT '专辑id',
  `user_id` bigint(20) NOT NULL COMMENT '关注人ID',
  `create_date` datetime DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='专辑关注';

-- ----------------------------
--  Records of `wq_album_favorites`
-- ----------------------------
BEGIN;
INSERT INTO `wq_album_favorites` VALUES ('1', '1', '1', '2014-08-12 15:09:21', '1');
COMMIT;

-- ----------------------------
--  Table structure for `wq_albums`
-- ----------------------------
DROP TABLE IF EXISTS `wq_albums`;
CREATE TABLE `wq_albums` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `discription` varchar(500) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL COMMENT '分类id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `state` int(11) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='专辑';

-- ----------------------------
--  Records of `wq_albums`
-- ----------------------------
BEGIN;
INSERT INTO `wq_albums` VALUES ('1', '测试专辑1', null, '1', '2', '2014-08-11 13:40:59', null, '1');
COMMIT;

-- ----------------------------
--  Table structure for `wq_categories`
-- ----------------------------
DROP TABLE IF EXISTS `wq_categories`;
CREATE TABLE `wq_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `state` int(2) unsigned zerofill DEFAULT NULL,
  `ablum_count` bigint(10) unsigned zerofill DEFAULT NULL,
  `post_count` bigint(10) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='分类';

-- ----------------------------
--  Records of `wq_categories`
-- ----------------------------
BEGIN;
INSERT INTO `wq_categories` VALUES ('1', '摄影', '1', null, null), ('2', '美妆服饰', '1', null, null), ('3', '美食', '1', null, null), ('4', '运动', '1', null, null), ('5', '科技生活', '1', null, null), ('6', '游戏', '1', null, null), ('7', '家居设计', '1', null, null), ('8', '宠物', '1', null, null), ('9', '音乐', '1', null, null), ('10', '汽车', '1', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `wq_comments`
-- ----------------------------
DROP TABLE IF EXISTS `wq_comments`;
CREATE TABLE `wq_comments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` tinytext NOT NULL COMMENT '内容',
  `user_id` bigint(20) NOT NULL COMMENT '评论人id',
  `post_id` bigint(20) DEFAULT NULL COMMENT '博客id',
  `create_date` datetime DEFAULT NULL COMMENT '评论时间',
  `state` int(11) DEFAULT NULL COMMENT '状态',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '被回复的评论id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='评论';

-- ----------------------------
--  Records of `wq_comments`
-- ----------------------------
BEGIN;
INSERT INTO `wq_comments` VALUES ('1', '评论test1', '1', '1', '2014-08-12 21:38:57', '1', null);
COMMIT;

-- ----------------------------
--  Table structure for `wq_operation_logs`
-- ----------------------------
DROP TABLE IF EXISTS `wq_operation_logs`;
CREATE TABLE `wq_operation_logs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `opered_id` varchar(20) NOT NULL COMMENT '被操作的id，可能是blog，user等id',
  `oper_type` varchar(20) NOT NULL COMMENT '操作类型： user_fan等',
  `oper_action` varchar(20) NOT NULL COMMENT '操作动作： add，delete等',
  `oper_date` datetime NOT NULL COMMENT '操作日期',
  `oper_user_id` bigint(20) NOT NULL COMMENT '操作人',
  `oper_notice_id` bigint(20) DEFAULT NULL COMMENT '该操作影响的用户',
  `state` int(2) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='博文，用户关注，系统信息，用户私信 等操作日志信息';

-- ----------------------------
--  Table structure for `wq_post_favorites`
-- ----------------------------
DROP TABLE IF EXISTS `wq_post_favorites`;
CREATE TABLE `wq_post_favorites` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) NOT NULL COMMENT '博客id',
  `user_id` bigint(20) NOT NULL COMMENT '收藏用户id',
  `type` int(2) NOT NULL COMMENT '1为采集，2为点赞',
  `create_date` datetime DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  KEY `post_favorite_index` (`type`,`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='博客收藏（采集）和点赞';

-- ----------------------------
--  Records of `wq_post_favorites`
-- ----------------------------
BEGIN;
INSERT INTO `wq_post_favorites` VALUES ('1', '1', '2', '1', '2014-08-12 21:09:44'), ('2', '1', '3', '1', '2014-08-12 21:10:04'), ('3', '2', '4', '2', '2014-08-12 21:11:36'), ('4', '2', '5', '1', '2014-08-12 21:11:31'), ('5', '2', '4', '1', '2014-08-12 21:13:32');
COMMIT;

-- ----------------------------
--  Table structure for `wq_posts`
-- ----------------------------
DROP TABLE IF EXISTS `wq_posts`;
CREATE TABLE `wq_posts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '作者id',
  `category_id` bigint(20) DEFAULT NULL COMMENT '分类id',
  `album_id` bigint(20) DEFAULT NULL COMMENT '专辑id',
  `title` varchar(500) DEFAULT NULL COMMENT '标题',
  `content` tinytext COMMENT '内容',
  `post_type` varchar(10) DEFAULT NULL COMMENT '类型',
  `post_link` varchar(200) DEFAULT NULL COMMENT '来源',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `state` int(11) DEFAULT NULL COMMENT '状态',
  `favorites_count` int(11) DEFAULT NULL COMMENT '冗余字段：收藏数',
  `comment_count` int(11) DEFAULT NULL COMMENT '冗余字段：评论数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='博客';

-- ----------------------------
--  Records of `wq_posts`
-- ----------------------------
BEGIN;
INSERT INTO `wq_posts` VALUES ('1', '1', '1', '1', '测试Blog1', '测试blog', null, null, '2014-08-11 14:01:22', null, '1', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `wq_sys_messages`
-- ----------------------------
DROP TABLE IF EXISTS `wq_sys_messages`;
CREATE TABLE `wq_sys_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` tinytext NOT NULL COMMENT '内容',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `state` int(11) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统消息';

-- ----------------------------
--  Table structure for `wq_user_messages`
-- ----------------------------
DROP TABLE IF EXISTS `wq_user_messages`;
CREATE TABLE `wq_user_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `from_id` bigint(20) NOT NULL COMMENT '发送人id',
  `to_id` bigint(20) NOT NULL COMMENT '收件人id',
  `content` tinytext NOT NULL COMMENT '内容',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `state` int(2) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户私信';

-- ----------------------------
--  Table structure for `wq_users`
-- ----------------------------
DROP TABLE IF EXISTS `wq_users`;
CREATE TABLE `wq_users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `aliasname` varchar(20) DEFAULT NULL COMMENT '昵称',
  `header_img` varchar(200) DEFAULT NULL COMMENT '头像url',
  `email` varchar(50) DEFAULT NULL,
  `grade` varchar(4) DEFAULT NULL COMMENT '性别： 男，女，保密',
  `born_year` varchar(4) DEFAULT NULL,
  `born_month` varchar(2) DEFAULT NULL,
  `born_day` varchar(2) DEFAULT NULL,
  `professional` varchar(2) DEFAULT NULL COMMENT '职业',
  `my_site` varchar(100) DEFAULT NULL,
  `introduce` varchar(500) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `state` int(11) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Records of `wq_users`
-- ----------------------------
BEGIN;
INSERT INTO `wq_users` VALUES ('1', '123', '123456', null, null, '123', null, null, null, null, null, null, null, null, null, null), ('2', 'jack', '123456', null, null, 'qweqwe', null, null, null, null, null, null, null, null, null, null), ('4', 'wanjujun', '123', null, null, null, null, null, null, null, null, null, null, null, null, null), ('5', 'tp', '123', null, null, null, null, null, null, null, null, null, null, null, null, null), ('6', 'admin', '123', null, null, null, null, null, null, null, null, null, null, null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `wq_users_fans`
-- ----------------------------
DROP TABLE IF EXISTS `wq_users_fans`;
CREATE TABLE `wq_users_fans` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_star` bigint(20) NOT NULL COMMENT '被关注用户id',
  `user_fan` bigint(20) NOT NULL COMMENT '关注别人的用户id',
  `create_date` datetime DEFAULT NULL COMMENT '关注时间',
  `state` int(2) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户关注';

-- ----------------------------
--  View structure for `post_comments_count`
-- ----------------------------
DROP VIEW IF EXISTS `post_comments_count`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `post_comments_count` AS select count(0) AS `num`,`wq_comments`.`post_id` AS `post_id` from `wq_comments` group by `wq_comments`.`post_id`;

-- ----------------------------
--  View structure for `post_favorites_count`
-- ----------------------------
DROP VIEW IF EXISTS `post_favorites_count`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `post_favorites_count` AS select `f`.`post_id` AS `post_id`,`f`.`type` AS `type`,count(1) AS `num` from `wq_post_favorites` `f` group by `f`.`type`,`f`.`post_id`;

SET FOREIGN_KEY_CHECKS = 1;
