# --------------------------------------------------------
# Host:                         127.0.0.1
# Server version:               5.1.55-community
# Server OS:                    Win32
# HeidiSQL version:             6.0.0.3603
# Date/time:                    2014-08-18 17:16:58
# --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

# Dumping database structure for sns
DROP DATABASE IF EXISTS `sns`;
CREATE DATABASE IF NOT EXISTS `sns` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `sns`;


# Dumping structure for view sns.post_comments_count
DROP VIEW IF EXISTS `post_comments_count`;
# Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `post_comments_count` (
	`num` BIGINT(21) NOT NULL DEFAULT '0',
	`post_id` BIGINT(20) NULL DEFAULT NULL COMMENT '博客id'
) ENGINE=MyISAM;


# Dumping structure for view sns.post_favorites_count
DROP VIEW IF EXISTS `post_favorites_count`;
# Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `post_favorites_count` (
	`post_id` BIGINT(20) NOT NULL DEFAULT '' COMMENT '博客id',
	`type` INT(2) NOT NULL DEFAULT '' COMMENT '1为采集，2为点赞',
	`num` BIGINT(21) NOT NULL DEFAULT '0'
) ENGINE=MyISAM;


# Dumping structure for table sns.wq_albums
DROP TABLE IF EXISTS `wq_albums`;
CREATE TABLE IF NOT EXISTS `wq_albums` (
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

# Dumping data for table sns.wq_albums: ~3 rows (approximately)
DELETE FROM `wq_albums`;
/*!40000 ALTER TABLE `wq_albums` DISABLE KEYS */;
INSERT INTO `wq_albums` (`id`, `name`, `discription`, `category_id`, `user_id`, `create_date`, `update_date`, `state`) VALUES
	(2, '测试专辑2', '测试专辑2测试专辑2测试专辑2', 1, 2, '2014-08-14 10:19:41', NULL, 1),
	(4, '测试专辑4', '测试专辑4', 8, 2, '2014-08-14 10:23:07', NULL, 1),
	(5, '测试专辑5', '测试专辑5', 3, 1, '2014-08-14 16:15:26', NULL, 1);
/*!40000 ALTER TABLE `wq_albums` ENABLE KEYS */;


# Dumping structure for table sns.wq_album_favorites
DROP TABLE IF EXISTS `wq_album_favorites`;
CREATE TABLE IF NOT EXISTS `wq_album_favorites` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) NOT NULL COMMENT '专辑id',
  `user_id` bigint(20) NOT NULL COMMENT '关注人ID',
  `create_date` datetime DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='专辑关注';

# Dumping data for table sns.wq_album_favorites: ~3 rows (approximately)
DELETE FROM `wq_album_favorites`;
/*!40000 ALTER TABLE `wq_album_favorites` DISABLE KEYS */;
INSERT INTO `wq_album_favorites` (`id`, `album_id`, `user_id`, `create_date`, `state`) VALUES
	(1, 1, 1, '2014-08-12 15:09:21', 1),
	(2, 1, 1, '2014-08-14 14:42:13', 1),
	(10, 1, 2, '2014-08-14 14:58:59', 1);
/*!40000 ALTER TABLE `wq_album_favorites` ENABLE KEYS */;


# Dumping structure for table sns.wq_categories
DROP TABLE IF EXISTS `wq_categories`;
CREATE TABLE IF NOT EXISTS `wq_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `state` int(2) unsigned zerofill DEFAULT NULL,
  `ablum_count` bigint(10) unsigned zerofill DEFAULT NULL,
  `post_count` bigint(10) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='分类';

# Dumping data for table sns.wq_categories: ~11 rows (approximately)
DELETE FROM `wq_categories`;
/*!40000 ALTER TABLE `wq_categories` DISABLE KEYS */;
INSERT INTO `wq_categories` (`id`, `name`, `state`, `ablum_count`, `post_count`) VALUES
	(1, '摄影', 01, NULL, NULL),
	(2, '美妆服饰', 01, NULL, NULL),
	(3, '美食', 01, NULL, NULL),
	(4, '运动', 01, NULL, NULL),
	(5, '科技生活', 01, NULL, NULL),
	(6, '游戏', 01, NULL, NULL),
	(7, '家居设计', 01, NULL, NULL),
	(8, '宠物', 01, NULL, NULL),
	(9, '音乐', 01, NULL, NULL),
	(10, '汽车', 01, NULL, NULL),
	(11, '其他', 01, NULL, NULL);
/*!40000 ALTER TABLE `wq_categories` ENABLE KEYS */;


# Dumping structure for table sns.wq_comments
DROP TABLE IF EXISTS `wq_comments`;
CREATE TABLE IF NOT EXISTS `wq_comments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` tinytext NOT NULL COMMENT '内容',
  `user_id` bigint(20) NOT NULL COMMENT '评论人id',
  `post_id` bigint(20) DEFAULT NULL COMMENT '博客id',
  `create_date` datetime DEFAULT NULL COMMENT '评论时间',
  `state` int(11) DEFAULT NULL COMMENT '状态',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '被回复的评论id',
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='评论';

# Dumping data for table sns.wq_comments: ~2 rows (approximately)
DELETE FROM `wq_comments`;
/*!40000 ALTER TABLE `wq_comments` DISABLE KEYS */;
INSERT INTO `wq_comments` (`id`, `content`, `user_id`, `post_id`, `create_date`, `state`, `parent_id`) VALUES
	(1, '评论test1', 1, 1, '2014-08-12 21:38:57', 1, NULL),
	(2, '评论test2', 2, 1, '2014-08-13 09:21:42', 1, NULL),
	(3, '1234567', 2, 1, '2014-08-18 13:45:47', 1, NULL),
	(4, '评论test3', 2, 1, '2014-08-18 13:50:07', 1, NULL),
	(5, '评论test4', 2, 1, '2014-08-18 13:50:33', 1, NULL),
	(6, '评论test5', 2, 1, '2014-08-18 13:51:42', 1, NULL),
	(7, '评论test6', 2, 1, '2014-08-18 13:52:28', 1, NULL),
	(8, '评论测试7', 2, 1, '2014-08-18 13:55:35', 1, NULL),
	(9, '评论测试8', 2, 1, '2014-08-18 13:57:29', 1, NULL),
	(10, '评论测试9', 2, 1, '2014-08-18 13:59:00', 1, NULL),
	(11, '评论test10', 2, 1, '2014-08-18 14:00:39', 1, NULL),
	(12, '评论test11', 2, 1, '2014-08-18 14:02:22', 1, NULL),
	(13, '评论test12\n', 2, 1, '2014-08-18 14:05:00', 1, NULL),
	(14, '评论test13', 2, 1, '2014-08-18 14:14:43', 1, NULL),
	(15, '测试评论1', 2, 2, '2014-08-18 14:24:23', 1, NULL),
	(16, '测试评论，及他人回复时，写入日志。', 2, 2, '2014-08-18 15:01:52', 1, NULL);
/*!40000 ALTER TABLE `wq_comments` ENABLE KEYS */;


# Dumping structure for table sns.wq_media
DROP TABLE IF EXISTS `wq_media`;
CREATE TABLE IF NOT EXISTS `wq_media` (
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

# Dumping data for table sns.wq_media: ~0 rows (approximately)
DELETE FROM `wq_media`;
/*!40000 ALTER TABLE `wq_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `wq_media` ENABLE KEYS */;


# Dumping structure for table sns.wq_operation_logs
DROP TABLE IF EXISTS `wq_operation_logs`;
CREATE TABLE IF NOT EXISTS `wq_operation_logs` (
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='博文，用户关注，系统信息，用户私信 等操作日志信息';

# Dumping data for table sns.wq_operation_logs: ~1 rows (approximately)
DELETE FROM `wq_operation_logs`;
/*!40000 ALTER TABLE `wq_operation_logs` DISABLE KEYS */;
INSERT INTO `wq_operation_logs` (`id`, `opered_id`, `oper_table`, `oper_action`, `oper_date`, `oper_user_id`, `oper_notice_id`, `state`, `complete_date`) VALUES
	(2, '1', 'album', '关注', '2014-08-14 14:49:28', 1, 2, 1, NULL),
	(3, '16', 'comments', '评论', '2014-08-18 15:01:52', 2, 1, 1, NULL),
	(6, '3', 'user_messages', '私信', '2014-08-18 15:39:42', 6, 6, 1, NULL),
	(7, '4', 'user_messages', '私信', '2014-08-18 16:57:16', 4, 4, 1, NULL),
	(8, '5', 'user_messages', '私信', '2014-08-18 16:57:32', 4, 4, 1, NULL),
	(9, '6', 'user_messages', '私信', '2014-08-18 17:09:46', 4, 4, 1, NULL);
/*!40000 ALTER TABLE `wq_operation_logs` ENABLE KEYS */;


# Dumping structure for table sns.wq_posts
DROP TABLE IF EXISTS `wq_posts`;
CREATE TABLE IF NOT EXISTS `wq_posts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '作者id',
  `category_id` bigint(20) DEFAULT NULL COMMENT '分类id',
  `album_id` bigint(20) DEFAULT NULL COMMENT '专辑id',
  `title` varchar(500) DEFAULT NULL COMMENT '标题',
  `content` tinytext NOT NULL COMMENT '内容',
  `post_link` varchar(200) DEFAULT NULL COMMENT '来源',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `state` int(11) DEFAULT NULL COMMENT '状态',
  `favorites_count` int(11) DEFAULT NULL COMMENT '冗余字段：收藏数',
  `comment_count` int(11) DEFAULT NULL COMMENT '冗余字段：评论数',
  `has_picture` int(1) DEFAULT NULL COMMENT '1为无图片，2为有图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='博客';

# Dumping data for table sns.wq_posts: ~2 rows (approximately)
DELETE FROM `wq_posts`;
/*!40000 ALTER TABLE `wq_posts` DISABLE KEYS */;
INSERT INTO `wq_posts` (`id`, `user_id`, `category_id`, `album_id`, `title`, `content`, `post_link`, `create_date`, `update_date`, `state`, `favorites_count`, `comment_count`, `has_picture`) VALUES
	(1, 2, NULL, 2, '测试Blog1', '测试blog', NULL, '2014-08-11 14:01:22', NULL, 1, NULL, NULL, NULL),
	(2, 1, NULL, 2, '测试Blog2', '测测试Blog2试测试Blog2Blog2', NULL, '2014-08-13 15:48:14', NULL, 1, NULL, NULL, NULL),
	(3, 2, NULL, 2, '带图片的博文', '<p style="margin-top: 0px; margin-bottom: 0px; line-height: 25px; letter-spacing: 0.5px; font-size: 16px; font-style: normal; font-variant: normal; white-space: normal; word-wrap: break-word; color: rgb(102, 102, 102); font-family: Helvetica, Tahoma, Aria', '', '2014-08-18 17:06:05', NULL, 1, NULL, NULL, NULL);
/*!40000 ALTER TABLE `wq_posts` ENABLE KEYS */;


# Dumping structure for table sns.wq_post_favorites
DROP TABLE IF EXISTS `wq_post_favorites`;
CREATE TABLE IF NOT EXISTS `wq_post_favorites` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) NOT NULL COMMENT '博客id',
  `user_id` bigint(20) NOT NULL COMMENT '收藏用户id',
  `type` int(2) NOT NULL COMMENT '1为采集，2为点赞',
  `create_date` datetime DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  KEY `post_favorite_index` (`type`,`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='博客收藏（采集）和点赞';

# Dumping data for table sns.wq_post_favorites: ~5 rows (approximately)
DELETE FROM `wq_post_favorites`;
/*!40000 ALTER TABLE `wq_post_favorites` DISABLE KEYS */;
INSERT INTO `wq_post_favorites` (`id`, `post_id`, `user_id`, `type`, `create_date`) VALUES
	(1, 1, 2, 1, '2014-08-12 21:09:44'),
	(2, 1, 3, 1, '2014-08-12 21:10:04'),
	(3, 1, 4, 2, '2014-08-12 21:11:36'),
	(4, 2, 5, 1, '2014-08-12 21:11:31'),
	(5, 2, 4, 1, '2014-08-12 21:13:32');
/*!40000 ALTER TABLE `wq_post_favorites` ENABLE KEYS */;


# Dumping structure for table sns.wq_sys_messages
DROP TABLE IF EXISTS `wq_sys_messages`;
CREATE TABLE IF NOT EXISTS `wq_sys_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` tinytext NOT NULL COMMENT '内容',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `state` int(11) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统消息';

# Dumping data for table sns.wq_sys_messages: ~0 rows (approximately)
DELETE FROM `wq_sys_messages`;
/*!40000 ALTER TABLE `wq_sys_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `wq_sys_messages` ENABLE KEYS */;


# Dumping structure for table sns.wq_users
DROP TABLE IF EXISTS `wq_users`;
CREATE TABLE IF NOT EXISTS `wq_users` (
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

# Dumping data for table sns.wq_users: ~11 rows (approximately)
DELETE FROM `wq_users`;
/*!40000 ALTER TABLE `wq_users` DISABLE KEYS */;
INSERT INTO `wq_users` (`id`, `username`, `password`, `aliasname`, `header_img`, `email`, `grade`, `born_year`, `born_month`, `born_day`, `professional`, `my_site`, `introduce`, `create_date`, `update_date`, `state`, `reg_type`) VALUES
	(1, '123', '123456', '测试别名啊', NULL, '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(2, 'jack', '123456', NULL, NULL, 'qweqwe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(4, 'wanjunjun', '123', 'abc', './Uploads/wanjunjun/53f161762f824.jpg', NULL, '', '20xx', 'xx', 'x', 'it', '3', 'nb le', NULL, NULL, 2, 1),
	(5, 'tp', '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(6, 'admin', '123', '', './Uploads/admin/53f1953eb118c.jpg', NULL, '', '', '', '', '', 'a', '', NULL, NULL, NULL, NULL),
	(7, 'thinkphp', '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(8, 'aa', '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(9, 'bbb', '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1),
	(10, '258259590@qq.com', '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2),
	(11, '258259590@qq.com', '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2),
	(12, '258259590@qq.com', '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2);
/*!40000 ALTER TABLE `wq_users` ENABLE KEYS */;


# Dumping structure for table sns.wq_users_fans
DROP TABLE IF EXISTS `wq_users_fans`;
CREATE TABLE IF NOT EXISTS `wq_users_fans` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_star` bigint(20) NOT NULL COMMENT '被关注用户id',
  `user_fan` bigint(20) NOT NULL COMMENT '关注别人的用户id',
  `create_date` datetime DEFAULT NULL COMMENT '关注时间',
  `state` int(2) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户关注';

# Dumping data for table sns.wq_users_fans: ~0 rows (approximately)
DELETE FROM `wq_users_fans`;
/*!40000 ALTER TABLE `wq_users_fans` DISABLE KEYS */;
/*!40000 ALTER TABLE `wq_users_fans` ENABLE KEYS */;


# Dumping structure for table sns.wq_user_messages
DROP TABLE IF EXISTS `wq_user_messages`;
CREATE TABLE IF NOT EXISTS `wq_user_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `from_id` bigint(20) NOT NULL COMMENT '发送人id',
  `to_id` bigint(20) NOT NULL COMMENT '收件人id',
  `content` tinytext NOT NULL COMMENT '内容',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `state` int(2) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户私信';

# Dumping data for table sns.wq_user_messages: ~0 rows (approximately)
DELETE FROM `wq_user_messages`;
/*!40000 ALTER TABLE `wq_user_messages` DISABLE KEYS */;
INSERT INTO `wq_user_messages` (`id`, `from_id`, `to_id`, `content`, `create_date`, `state`) VALUES
	(3, 6, 6, 'aaaa', '2014-08-18 15:39:42', 1),
	(4, 4, 4, 'hi 1', '2014-08-18 16:57:16', 1),
	(5, 4, 4, 'hi 2', '2014-08-18 16:57:32', 2),
	(6, 4, 4, 'cc', '2014-08-18 17:09:46', 1);
/*!40000 ALTER TABLE `wq_user_messages` ENABLE KEYS */;


# Dumping structure for view sns.post_comments_count
DROP VIEW IF EXISTS `post_comments_count`;
# Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `post_comments_count`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `post_comments_count` AS select count(0) AS `num`,`wq_comments`.`post_id` AS `post_id` from `wq_comments` group by `wq_comments`.`post_id`;


# Dumping structure for view sns.post_favorites_count
DROP VIEW IF EXISTS `post_favorites_count`;
# Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `post_favorites_count`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `post_favorites_count` AS select `f`.`post_id` AS `post_id`,`f`.`type` AS `type`,count(1) AS `num` from `wq_post_favorites` `f` group by `f`.`type`,`f`.`post_id`;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
