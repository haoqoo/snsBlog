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

 Date: 08/18/2014 21:26:25 PM
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='专辑关注';

-- ----------------------------
--  Records of `wq_album_favorites`
-- ----------------------------
BEGIN;
INSERT INTO `wq_album_favorites` VALUES ('1', '1', '1', '2014-08-12 15:09:21', '1'), ('2', '1', '1', '2014-08-14 14:42:13', '1'), ('10', '1', '2', '2014-08-14 14:58:59', '1');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='专辑';

-- ----------------------------
--  Records of `wq_albums`
-- ----------------------------
BEGIN;
INSERT INTO `wq_albums` VALUES ('2', '测试专辑2', '测试专辑2测试专辑2测试专辑2', '1', '2', '2014-08-14 10:19:41', null, '1'), ('4', '测试专辑4', '测试专辑4', '8', '2', '2014-08-14 10:23:07', null, '1'), ('5', '测试专辑5', '测试专辑5', '3', '1', '2014-08-14 16:15:26', null, '1');
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='分类';

-- ----------------------------
--  Records of `wq_categories`
-- ----------------------------
BEGIN;
INSERT INTO `wq_categories` VALUES ('1', '摄影', '1', null, null), ('2', '美妆服饰', '1', null, null), ('3', '美食', '1', null, null), ('4', '运动', '1', null, null), ('5', '科技生活', '1', null, null), ('6', '游戏', '1', null, null), ('7', '家居设计', '1', null, null), ('8', '宠物', '1', null, null), ('9', '音乐', '1', null, null), ('10', '汽车', '1', null, null), ('11', '其他', '1', null, null);
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
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='评论';

-- ----------------------------
--  Records of `wq_comments`
-- ----------------------------
BEGIN;
INSERT INTO `wq_comments` VALUES ('1', '评论test1', '1', '1', '2014-08-12 21:38:57', '1', null), ('2', '评论test2', '2', '1', '2014-08-13 09:21:42', '1', null), ('3', '1234567', '2', '1', '2014-08-18 13:45:47', '1', null), ('4', '评论test3', '2', '1', '2014-08-18 13:50:07', '1', null), ('5', '评论test4', '2', '1', '2014-08-18 13:50:33', '1', null), ('6', '评论test5', '2', '1', '2014-08-18 13:51:42', '1', null), ('7', '评论test6', '2', '1', '2014-08-18 13:52:28', '1', null), ('8', '评论测试7', '2', '1', '2014-08-18 13:55:35', '1', null), ('9', '评论测试8', '2', '1', '2014-08-18 13:57:29', '1', null), ('10', '评论测试9', '2', '1', '2014-08-18 13:59:00', '1', null), ('11', '评论test10', '2', '1', '2014-08-18 14:00:39', '1', null), ('12', '评论test11', '2', '1', '2014-08-18 14:02:22', '1', null), ('13', '评论test12\n', '2', '1', '2014-08-18 14:05:00', '1', null), ('14', '评论test13', '2', '1', '2014-08-18 14:14:43', '1', null), ('15', '测试评论1', '2', '2', '2014-08-18 14:24:23', '1', null), ('16', '测试评论，及他人回复时，写入日志。', '2', '2', '2014-08-18 15:01:52', '1', null);
COMMIT;

-- ----------------------------
--  Table structure for `wq_media`
-- ----------------------------
DROP TABLE IF EXISTS `wq_media`;
CREATE TABLE `wq_media` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '所属者',
  `origin_name` varchar(100) DEFAULT NULL COMMENT '文件原先的名称',
  `sys_name` varchar(100) DEFAULT NULL COMMENT '文件在系统中的名称',
  `upload_folder` varchar(200) DEFAULT NULL COMMENT '文件目录',
  `create_date` datetime DEFAULT NULL COMMENT '传教时间',
  `type` int(1) DEFAULT NULL COMMENT '1为博客，2为用户图像',
  `state` int(1) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='媒体库';

-- ----------------------------
--  Table structure for `wq_operation_logs`
-- ----------------------------
DROP TABLE IF EXISTS `wq_operation_logs`;
CREATE TABLE `wq_operation_logs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `opered_id` varchar(20) DEFAULT NULL COMMENT '被操作的id，可能是blog，user等id',
  `oper_table` varchar(20) DEFAULT NULL COMMENT '对应的表名的后缀',
  `oper_action` varchar(20) DEFAULT NULL COMMENT '操作动作',
  `oper_date` datetime DEFAULT NULL COMMENT '操作日期',
  `oper_user_id` bigint(20) DEFAULT NULL COMMENT '操作人',
  `oper_notice_id` bigint(20) DEFAULT NULL COMMENT '该操作影响的用户',
  `state` int(2) DEFAULT NULL COMMENT '状态 1未读，2已读',
  `complete_date` datetime DEFAULT NULL COMMENT '已读时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='博文，用户关注，系统信息，用户私信 等操作日志信息';

-- ----------------------------
--  Records of `wq_operation_logs`
-- ----------------------------
BEGIN;
INSERT INTO `wq_operation_logs` VALUES ('2', '1', 'album', '关注', '2014-08-14 14:49:28', '1', '2', '1', null), ('3', '16', 'comments', '评论', '2014-08-18 15:01:52', '2', '1', '1', null), ('6', '3', 'user_messages', '私信', '2014-08-18 15:39:42', '6', '6', '1', null), ('7', '4', 'user_messages', '私信', '2014-08-18 16:57:16', '4', '4', '1', null), ('8', '5', 'user_messages', '私信', '2014-08-18 16:57:32', '4', '4', '1', null), ('9', '6', 'user_messages', '私信', '2014-08-18 17:09:46', '4', '4', '1', null);
COMMIT;

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
INSERT INTO `wq_post_favorites` VALUES ('1', '1', '2', '1', '2014-08-12 21:09:44'), ('2', '1', '3', '1', '2014-08-12 21:10:04'), ('3', '1', '4', '2', '2014-08-12 21:11:36'), ('4', '2', '5', '1', '2014-08-12 21:11:31'), ('5', '2', '4', '1', '2014-08-12 21:13:32');
COMMIT;

-- ----------------------------
--  Table structure for `wq_post_imgs`
-- ----------------------------
DROP TABLE IF EXISTS `wq_post_imgs`;
CREATE TABLE `wq_post_imgs` (
  `post_id` bigint(20) NOT NULL,
  `img_val` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='抽取文章里的图片\n';

-- ----------------------------
--  Records of `wq_post_imgs`
-- ----------------------------
BEGIN;
INSERT INTO `wq_post_imgs` VALUES ('3', '<img src=\"http://marklodato.github.io/visual-git-guide/basic-usage.svg\" height=\"312\" width=\"728\" />'), ('3', '<img src=\"http://marklodato.github.io/visual-git-guide/basic-usage.svg\" height=\"312\" width=\"728\"/>');
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
  `content` text NOT NULL COMMENT '内容',
  `post_link` varchar(200) DEFAULT NULL COMMENT '来源',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `state` int(11) DEFAULT NULL COMMENT '状态',
  `favorites_count` int(11) DEFAULT NULL COMMENT '冗余字段：收藏数',
  `comment_count` int(11) DEFAULT NULL COMMENT '冗余字段：评论数',
  `has_picture` int(1) DEFAULT NULL COMMENT '1为无图片，2为有图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='博客';

-- ----------------------------
--  Records of `wq_posts`
-- ----------------------------
BEGIN;
INSERT INTO `wq_posts` VALUES ('1', '2', null, '2', '测试Blog1', '测试blog', null, '2014-08-11 14:01:22', null, '1', null, null, null), ('2', '1', null, '2', '测试Blog2', '测测试Blog2试测试Blog2Blog2', null, '2014-08-13 15:48:14', null, '1', null, null, null), ('3', '2', null, '2', '带图片的博文', '<p>									</p><p>									</p><p>									</p><p>									</p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><h2 id=\"basic-usage\" style=\"color: rgb(0, 0, 0); font-family: Times; font-style: normal; font-variant: normal; line-height: normal; white-space: normal;\">基本用法</h2><div class=\"center\" style=\"text-align: center; color: rgb(0, 0, 0); font-family: Times; font-size: medium; font-style: normal; font-variant: normal; line-height: normal; white-space: normal;\"><img src=\"http://marklodato.github.io/visual-git-guide/basic-usage.svg\" height=\"312\" width=\"728\"/></div><p style=\"color: rgb(0, 0, 0); font-family: Times; font-size: medium; font-style: normal; font-variant: normal; line-height: normal; white-space: normal;\">上面的四条命令在工作目录、暂存目录(也叫做索引)和仓库之间复制文件。</p><ul style=\"color: rgb(0, 0, 0); font-family: Times; font-size: medium; font-style: normal; font-variant: normal; line-height: normal; white-space: normal;\"><li><code>git add&nbsp;<em>files</em></code>&nbsp;把当前文件放入暂存区域。</li><li><code>git commit</code>&nbsp;给暂存区域生成快照并提交。</li><li><code>git reset --&nbsp;<em>files</em></code>&nbsp;用来撤销最后一次<code>git add&nbsp;<em>files</em></code>，你也可以用<code>git reset</code>&nbsp;撤销所有暂存区域文件。</li><li><code>git checkout --&nbsp;<em>files</em></code>&nbsp;把文件从暂存区域复制到工作目录，用来丢弃本地修改。</li></ul><p style=\"color: rgb(0, 0, 0); font-family: Times; font-size: medium; font-style: normal; font-variant: normal; line-height: normal; white-space: normal;\">你可以用&nbsp;<code>git reset -p</code>,&nbsp;<code>git checkout -p</code>, or&nbsp;<code>git add -p</code>进入交互模式。</p><p style=\"color: rgb(0, 0, 0); font-family: Times; font-size: medium; font-style: normal; font-variant: normal; line-height: normal; white-space: normal;\">也可以跳过暂存区域直接从仓库取出文件或者直接提交代.</p><p style=\"color: rgb(0, 0, 0); font-family: Times; font-size: medium; font-style: normal; font-variant: normal; line-height: normal; white-space: normal;\"><br/></p><p style=\"color: rgb(0, 0, 0); font-family: Times; font-size: medium; font-style: normal; font-variant: normal; line-height: normal; white-space: normal;\"><span style=\"color: rgb(0, 0, 0); font-family: Times; font-size: medium; font-style: normal; font-variant: normal; line-height: normal; white-space: normal;\">&gt;&nbsp;</span><img src=\"http://marklodato.github.io/visual-git-guide/basic-usage.svg\" height=\"312\" width=\"728\" style=\"color: rgb(0, 0, 0); font-family: Times; font-size: medium; font-style: normal; font-variant: normal; line-height: normal; white-space: normal;\"/></p><h2 id=\"basic-usage\" style=\"color: rgb(0, 0, 0); font-family: Times; font-style: normal; font-variant: normal; line-height: normal; white-space: normal;\"><br/></h2><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p>									</p><p>									</p><p>									</p><p>									</p>', '', '2014-08-18 17:06:05', null, '1', null, null, null);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='用户私信';

-- ----------------------------
--  Records of `wq_user_messages`
-- ----------------------------
BEGIN;
INSERT INTO `wq_user_messages` VALUES ('3', '6', '6', 'aaaa', '2014-08-18 15:39:42', '1'), ('4', '4', '4', 'hi 1', '2014-08-18 16:57:16', '1'), ('5', '4', '4', 'hi 2', '2014-08-18 16:57:32', '2'), ('6', '4', '4', 'cc', '2014-08-18 17:09:46', '1');
COMMIT;

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
  `state` int(11) DEFAULT NULL COMMENT '状态(1未激活，2激活)',
  `reg_type` int(11) DEFAULT NULL COMMENT '注册方式(1普通注册，2邮箱注册，3第三方账号)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Records of `wq_users`
-- ----------------------------
BEGIN;
INSERT INTO `wq_users` VALUES ('1', '123', '123456', '测试别名啊', null, '123', null, null, null, null, null, null, null, null, null, null, null), ('2', 'jack', '123456', null, null, 'qweqwe', null, null, null, null, null, null, null, null, null, null, null), ('4', 'wanjunjun', '123', 'abc', './Uploads/wanjunjun/53f161762f824.jpg', null, '', '20xx', 'xx', 'x', 'it', '3', 'nb le', null, null, '2', '1'), ('5', 'tp', '123', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('6', 'admin', '123', '', './Uploads/admin/53f1953eb118c.jpg', null, '', '', '', '', '', 'a', '', null, null, null, null), ('7', 'thinkphp', '123', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('8', 'aa', '123', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('9', 'bbb', '123', null, null, null, null, null, null, null, null, null, null, null, null, '1', '1'), ('10', '258259590@qq.com', '123', null, null, null, null, null, null, null, null, null, null, null, null, '1', '2'), ('11', '258259590@qq.com', '123', null, null, null, null, null, null, null, null, null, null, null, null, '1', '2'), ('12', '258259590@qq.com', '123', null, null, null, null, null, null, null, null, null, null, null, null, '2', '2');
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
