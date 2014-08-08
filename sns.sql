# --------------------------------------------------------
# Host:                         127.0.0.1
# Server version:               5.1.55-community
# Server OS:                    Win32
# HeidiSQL version:             6.0.0.3603
# Date/time:                    2014-08-08 16:59:21
# --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

# Dumping database structure for sns
DROP DATABASE IF EXISTS `sns`;
CREATE DATABASE IF NOT EXISTS `sns` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `sns`;


# Dumping structure for table sns.wq_albums
DROP TABLE IF EXISTS `wq_albums`;
CREATE TABLE IF NOT EXISTS `wq_albums` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `discription` varchar(500) DEFAULT NULL,
  `categories_id` bigint(20) DEFAULT NULL COMMENT '分类id',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `state` int(11) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='专辑';

# Dumping data for table sns.wq_albums: ~0 rows (approximately)
DELETE FROM `wq_albums`;
/*!40000 ALTER TABLE `wq_albums` DISABLE KEYS */;
/*!40000 ALTER TABLE `wq_albums` ENABLE KEYS */;


# Dumping structure for table sns.wq_categories
DROP TABLE IF EXISTS `wq_categories`;
CREATE TABLE IF NOT EXISTS `wq_categories` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `state` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='分类';

# Dumping data for table sns.wq_categories: ~10 rows (approximately)
DELETE FROM `wq_categories`;
/*!40000 ALTER TABLE `wq_categories` DISABLE KEYS */;
INSERT INTO `wq_categories` (`id`, `name`, `state`) VALUES
	(1, '摄影', 1),
	(2, '美妆服饰', 1),
	(3, '美食', 1),
	(4, '运动', 1),
	(5, '科技生活', 1),
	(6, '游戏', 1),
	(7, '家居设计', 1),
	(8, '宠物', 1),
	(9, '音乐', 1),
	(10, '汽车', 1);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论';

# Dumping data for table sns.wq_comments: ~0 rows (approximately)
DELETE FROM `wq_comments`;
/*!40000 ALTER TABLE `wq_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `wq_comments` ENABLE KEYS */;


# Dumping structure for table sns.wq_operation_logs
DROP TABLE IF EXISTS `wq_operation_logs`;
CREATE TABLE IF NOT EXISTS `wq_operation_logs` (
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

# Dumping data for table sns.wq_operation_logs: ~0 rows (approximately)
DELETE FROM `wq_operation_logs`;
/*!40000 ALTER TABLE `wq_operation_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `wq_operation_logs` ENABLE KEYS */;


# Dumping structure for table sns.wq_posts
DROP TABLE IF EXISTS `wq_posts`;
CREATE TABLE IF NOT EXISTS `wq_posts` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='博客';

# Dumping data for table sns.wq_posts: ~0 rows (approximately)
DELETE FROM `wq_posts`;
/*!40000 ALTER TABLE `wq_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `wq_posts` ENABLE KEYS */;


# Dumping structure for table sns.wq_post_favorites
DROP TABLE IF EXISTS `wq_post_favorites`;
CREATE TABLE IF NOT EXISTS `wq_post_favorites` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) NOT NULL COMMENT '博客id',
  `user_id` bigint(20) NOT NULL COMMENT '收藏用户id',
  `type` int(2) NOT NULL COMMENT '1为采集，2为点赞',
  `create_date` datetime DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='博客收藏（采集）和点赞';

# Dumping data for table sns.wq_post_favorites: ~0 rows (approximately)
DELETE FROM `wq_post_favorites`;
/*!40000 ALTER TABLE `wq_post_favorites` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户表';

# Dumping data for table sns.wq_users: ~2 rows (approximately)
DELETE FROM `wq_users`;
/*!40000 ALTER TABLE `wq_users` DISABLE KEYS */;
INSERT INTO `wq_users` (`id`, `username`, `password`, `aliasname`, `email`, `grade`, `born_year`, `born_month`, `born_day`, `professional`, `my_site`, `introduce`, `create_date`, `update_date`, `state`) VALUES
	(1, '123', '', NULL, '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(2, 'jack', '123456', NULL, 'qweqwe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户私信';

# Dumping data for table sns.wq_user_messages: ~0 rows (approximately)
DELETE FROM `wq_user_messages`;
/*!40000 ALTER TABLE `wq_user_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `wq_user_messages` ENABLE KEYS */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
