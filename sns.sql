-- MySQL dump 10.13  Distrib 5.1.55, for Win32 (ia32)
--
-- Host: localhost    Database: sns
-- ------------------------------------------------------
-- Server version	5.1.55-community

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary table structure for view `post_comments_count`
--

DROP TABLE IF EXISTS `post_comments_count`;
/*!50001 DROP VIEW IF EXISTS `post_comments_count`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `post_comments_count` (
  `num` bigint(21),
  `post_id` bigint(20)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `post_favorites_count`
--

DROP TABLE IF EXISTS `post_favorites_count`;
/*!50001 DROP VIEW IF EXISTS `post_favorites_count`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `post_favorites_count` (
  `post_id` bigint(20),
  `type` int(2),
  `num` bigint(21)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `wq_album_favorites`
--

DROP TABLE IF EXISTS `wq_album_favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wq_album_favorites` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) NOT NULL COMMENT '专辑id',
  `user_id` bigint(20) NOT NULL COMMENT '关注人ID',
  `create_date` datetime DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='专辑关注';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wq_album_favorites`
--

LOCK TABLES `wq_album_favorites` WRITE;
/*!40000 ALTER TABLE `wq_album_favorites` DISABLE KEYS */;
INSERT INTO `wq_album_favorites` VALUES (1,1,1,'2014-08-12 15:09:21',1),(2,1,1,'2014-08-14 14:42:13',1),(10,1,2,'2014-08-14 14:58:59',1),(11,2,2,'2014-08-19 15:37:29',1);
/*!40000 ALTER TABLE `wq_album_favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wq_albums`
--

DROP TABLE IF EXISTS `wq_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='专辑';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wq_albums`
--

LOCK TABLES `wq_albums` WRITE;
/*!40000 ALTER TABLE `wq_albums` DISABLE KEYS */;
INSERT INTO `wq_albums` VALUES (2,'测试专辑2','测试专辑2测试专辑2测试专辑2',1,2,'2014-08-14 10:19:41',NULL,1),(4,'测试专辑4','测试专辑4',8,2,'2014-08-14 10:23:07',NULL,1),(5,'测试专辑5','测试专辑5',3,1,'2014-08-14 16:15:26',NULL,1),(6,'美妆服饰专辑1','美妆服饰专辑1',2,2,'2014-08-19 16:33:05',NULL,1);
/*!40000 ALTER TABLE `wq_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wq_categories`
--

DROP TABLE IF EXISTS `wq_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wq_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `state` int(2) unsigned zerofill DEFAULT NULL,
  `ablum_count` bigint(10) unsigned zerofill DEFAULT NULL,
  `post_count` bigint(10) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wq_categories`
--

LOCK TABLES `wq_categories` WRITE;
/*!40000 ALTER TABLE `wq_categories` DISABLE KEYS */;
INSERT INTO `wq_categories` VALUES (1,'摄影',01,NULL,NULL),(2,'美妆服饰',01,NULL,NULL),(3,'美食',01,NULL,NULL),(4,'运动',01,NULL,NULL),(5,'科技生活',01,NULL,NULL),(6,'游戏',01,NULL,NULL),(7,'家居设计',01,NULL,NULL),(8,'宠物',01,NULL,NULL),(9,'音乐',01,NULL,NULL),(10,'汽车',01,NULL,NULL),(11,'其他',01,NULL,NULL);
/*!40000 ALTER TABLE `wq_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wq_comments`
--

DROP TABLE IF EXISTS `wq_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wq_comments`
--

LOCK TABLES `wq_comments` WRITE;
/*!40000 ALTER TABLE `wq_comments` DISABLE KEYS */;
INSERT INTO `wq_comments` VALUES (1,'评论test1',1,1,'2014-08-12 21:38:57',1,NULL),(2,'评论test2',2,1,'2014-08-13 09:21:42',1,NULL),(3,'1234567',2,1,'2014-08-18 13:45:47',1,NULL),(4,'评论test3',2,1,'2014-08-18 13:50:07',1,NULL),(5,'评论test4',2,1,'2014-08-18 13:50:33',1,NULL),(6,'评论test5',2,1,'2014-08-18 13:51:42',1,NULL),(7,'评论test6',2,1,'2014-08-18 13:52:28',1,NULL),(8,'评论测试7',2,1,'2014-08-18 13:55:35',1,NULL),(9,'评论测试8',2,1,'2014-08-18 13:57:29',1,NULL),(10,'评论测试9',2,1,'2014-08-18 13:59:00',1,NULL),(11,'评论test10',2,1,'2014-08-18 14:00:39',1,NULL),(12,'评论test11',2,1,'2014-08-18 14:02:22',1,NULL),(13,'评论test12\n',2,1,'2014-08-18 14:05:00',1,NULL),(14,'评论test13',2,1,'2014-08-18 14:14:43',1,NULL),(15,'测试评论1',2,2,'2014-08-18 14:24:23',1,NULL),(16,'测试评论，及他人回复时，写入日志。',2,2,'2014-08-18 15:01:52',1,NULL);
/*!40000 ALTER TABLE `wq_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wq_hot_keys`
--

DROP TABLE IF EXISTS `wq_hot_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wq_hot_keys` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `hot_key` varchar(200) DEFAULT NULL COMMENT '关键词',
  `hot` int(10) DEFAULT NULL COMMENT '频率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='搜索关键字';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wq_hot_keys`
--

LOCK TABLES `wq_hot_keys` WRITE;
/*!40000 ALTER TABLE `wq_hot_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `wq_hot_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wq_media`
--

DROP TABLE IF EXISTS `wq_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wq_media`
--

LOCK TABLES `wq_media` WRITE;
/*!40000 ALTER TABLE `wq_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `wq_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wq_operation_logs`
--

DROP TABLE IF EXISTS `wq_operation_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='博文，用户关注，系统信息，用户私信 等操作日志信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wq_operation_logs`
--

LOCK TABLES `wq_operation_logs` WRITE;
/*!40000 ALTER TABLE `wq_operation_logs` DISABLE KEYS */;
INSERT INTO `wq_operation_logs` VALUES (2,'2','albums','关注','2014-08-14 14:49:28',1,2,1,NULL),(3,'16','comments','评论','2014-08-18 15:01:52',2,1,1,NULL),(6,'3','user_messages','私信','2014-08-18 15:39:42',6,6,1,NULL),(7,'4','user_messages','私信','2014-08-18 16:57:16',4,4,1,NULL),(8,'5','user_messages','私信','2014-08-18 16:57:32',4,4,1,NULL),(9,'6','user_messages','私信','2014-08-18 17:09:46',4,4,1,NULL),(12,'2','posts','赞','2014-08-22 09:01:51',1,1,1,NULL),(13,'2','posts','收藏','2014-08-22 09:01:54',1,1,1,NULL),(14,'1','posts','赞','2014-08-22 09:01:57',1,2,1,NULL);
/*!40000 ALTER TABLE `wq_operation_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wq_operation_sql`
--

DROP TABLE IF EXISTS `wq_operation_sql`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wq_operation_sql` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `oper_table` varchar(50) DEFAULT NULL,
  `view_sql` varchar(150) DEFAULT NULL,
  `field_name` varchar(50) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wq_operation_sql`
--

LOCK TABLES `wq_operation_sql` WRITE;
/*!40000 ALTER TABLE `wq_operation_sql` DISABLE KEYS */;
INSERT INTO `wq_operation_sql` VALUES (1,'comments','select p.title from wq_posts p, wq_comments t where p.id = t.post_id and t.id =?','博文','/post/?'),(3,'posts','select p.title from wq_posts p  where p.id =?','博文','/post/?'),(4,'albums','select t.name title from wq_albums t where t.id = ?','专辑','/album/?');
/*!40000 ALTER TABLE `wq_operation_sql` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wq_post_favorites`
--

DROP TABLE IF EXISTS `wq_post_favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wq_post_favorites` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) NOT NULL COMMENT '博客id',
  `user_id` bigint(20) NOT NULL COMMENT '收藏用户id',
  `type` int(2) NOT NULL COMMENT '1为收藏，2为点赞',
  `create_date` datetime DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  KEY `post_favorite_index` (`type`,`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='博客收藏（采集）和点赞';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wq_post_favorites`
--

LOCK TABLES `wq_post_favorites` WRITE;
/*!40000 ALTER TABLE `wq_post_favorites` DISABLE KEYS */;
INSERT INTO `wq_post_favorites` VALUES (14,2,2,1,'2014-08-20 16:19:45'),(15,2,1,2,'2014-08-22 09:01:51'),(16,2,1,1,'2014-08-22 09:01:54'),(17,1,1,2,'2014-08-22 09:01:57'),(18,6,2,0,'2014-08-22 17:02:37');
/*!40000 ALTER TABLE `wq_post_favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wq_post_imgs`
--

DROP TABLE IF EXISTS `wq_post_imgs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wq_post_imgs` (
  `post_id` bigint(20) NOT NULL,
  `img_val` varchar(500) NOT NULL,
  KEY `post_id` (`post_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='抽取文章里的图片\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wq_post_imgs`
--

LOCK TABLES `wq_post_imgs` WRITE;
/*!40000 ALTER TABLE `wq_post_imgs` DISABLE KEYS */;
INSERT INTO `wq_post_imgs` VALUES (3,'http://marklodato.github.io/visual-git-guide/basic-usage.svg'),(3,'http://marklodato.github.io/visual-git-guide/basic-usage.svg'),(5,'http://localhost/snsBlog/Public/umEditorUploads/20140820/14085157515127.jpg');
/*!40000 ALTER TABLE `wq_post_imgs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wq_posts`
--

DROP TABLE IF EXISTS `wq_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='博客';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wq_posts`
--

LOCK TABLES `wq_posts` WRITE;
/*!40000 ALTER TABLE `wq_posts` DISABLE KEYS */;
INSERT INTO `wq_posts` VALUES (1,2,NULL,2,'测试Blog1','&lt;p&gt;									&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n									测试blog&lt;/p&gt;&lt;p&gt;sadfasdfsadfasdf&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;									&lt;/p&gt;','','2014-08-11 14:01:22',NULL,1,NULL,NULL,1),(2,1,NULL,2,'测试Blog2','测测试Blog2试测试Blog2Blog2',NULL,'2014-08-13 15:48:14',NULL,1,NULL,NULL,1),(3,2,NULL,2,'带图片的博文','&lt;p&gt;									&lt;/p&gt;&lt;p&gt;									&lt;/p&gt;&lt;p&gt;									&lt;/p&gt;&lt;p&gt;									&lt;/p&gt;&lt;p&gt;									&lt;/p&gt;&lt;p&gt;									&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;h2 id=&quot;basic-usage&quot; style=&quot;color: rgb(0, 0, 0); font-family: Times; font-style: normal; font-variant: normal; line-height: normal; white-space: normal;&quot;&gt;基本用法&lt;/h2&gt;&lt;div class=&quot;center&quot; style=&quot;text-align: center; color: rgb(0, 0, 0); font-family: Times; font-size: medium; font-style: normal; font-variant: normal; line-height: normal; white-space: normal;&quot;&gt;&lt;img src=&quot;http://marklodato.github.io/visual-git-guide/basic-usage.svg&quot; height=&quot;312&quot; width=&quot;728&quot;/&gt;&lt;/div&gt;&lt;p style=&quot;color: rgb(0, 0, 0); font-family: Times; font-size: medium; font-style: normal; font-variant: normal; line-height: normal; white-space: normal;&quot;&gt;上面的四条命令在工作目录、暂存目录(也叫做索引)和仓库之间复制文件。&lt;/p&gt;&lt;ul style=&quot;color: rgb(0, 0, 0); font-family: Times; font-size: medium; font-style: normal; font-variant: normal; line-height: normal; white-space: normal;&quot;&gt;&lt;li&gt;&lt;code&gt;git add&amp;nbsp;&lt;em&gt;files&lt;/em&gt;&lt;/code&gt;&amp;nbsp;把当前文件放入暂存区域。&lt;/li&gt;&lt;li&gt;&lt;code&gt;git commit&lt;/code&gt;&amp;nbsp;给暂存区域生成快照并提交。&lt;/li&gt;&lt;li&gt;&lt;code&gt;git reset --&amp;nbsp;&lt;em&gt;files&lt;/em&gt;&lt;/code&gt;&amp;nbsp;用来撤销最后一次&lt;code&gt;git add&amp;nbsp;&lt;em&gt;files&lt;/em&gt;&lt;/code&gt;，你也可以用&lt;code&gt;git reset&lt;/code&gt;&amp;nbsp;撤销所有暂存区域文件。&lt;/li&gt;&lt;li&gt;&lt;code&gt;git checkout --&amp;nbsp;&lt;em&gt;files&lt;/em&gt;&lt;/code&gt;&amp;nbsp;把文件从暂存区域复制到工作目录，用来丢弃本地修改。&lt;/li&gt;&lt;/ul&gt;&lt;p style=&quot;color: rgb(0, 0, 0); font-family: Times; font-size: medium; font-style: normal; font-variant: normal; line-height: normal; white-space: normal;&quot;&gt;你可以用&amp;nbsp;&lt;code&gt;git reset -p&lt;/code&gt;,&amp;nbsp;&lt;code&gt;git checkout -p&lt;/code&gt;, or&amp;nbsp;&lt;code&gt;git add -p&lt;/code&gt;进入交互模式。&lt;/p&gt;&lt;p style=&quot;color: rgb(0, 0, 0); font-family: Times; font-size: medium; font-style: normal; font-variant: normal; line-height: normal; white-space: normal;&quot;&gt;也可以跳过暂存区域直接从仓库取出文件或者直接提交代.&lt;/p&gt;&lt;p style=&quot;color: rgb(0, 0, 0); font-family: Times; font-size: medium; font-style: normal; font-variant: normal; line-height: normal; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(0, 0, 0); font-family: Times; font-size: medium; font-style: normal; font-variant: normal; line-height: normal; white-space: normal;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: Times; font-size: medium; font-style: normal; font-variant: normal; line-height: normal; white-space: normal;&quot;&gt;&amp;gt;&amp;nbsp;&lt;/span&gt;&lt;img src=&quot;http://marklodato.github.io/visual-git-guide/basic-usage.svg&quot; height=&quot;312&quot; width=&quot;728&quot; style=&quot;color: rgb(0, 0, 0); font-family: Times; font-size: medium; font-style: normal; font-variant: normal; line-height: normal; white-space: normal;&quot;/&gt;&lt;/p&gt;&lt;h2 id=&quot;basic-usage&quot; style=&quot;color: rgb(0, 0, 0); font-family: Times; font-style: normal; font-variant: normal; line-height: normal; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/h2&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;									&lt;/p&gt;&lt;p&gt;									&lt;/p&gt;&lt;p&gt;									&lt;/p&gt;&lt;p&gt;									&lt;/p&gt;&lt;p&gt;									&lt;/p&gt;&lt;p&gt;									&lt;/p&gt;','','2014-08-18 17:06:05',NULL,1,NULL,NULL,2),(4,2,NULL,2,'文章文章文章1234','&lt;p&gt;文章文章文章1234文章文章文章1234文章文章文章1234文章文章文章1234																		&lt;/p&gt;','','2014-08-19 10:54:05',NULL,1,NULL,NULL,1),(5,2,NULL,2,'带图片的博文2','&lt;p&gt;&lt;img src=&quot;http://localhost/snsBlog/Public/umEditorUploads/20140820/14085157515127.jpg&quot; _src=&quot;http://localhost/snsBlog/Public/umEditorUploads/20140820/14085157515127.jpg&quot;/&gt;\r\n																		&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;测试图片&lt;/p&gt;','','2014-08-20 14:23:07',NULL,1,NULL,NULL,2),(6,2,NULL,2,'aaaa','aaa&lt;p&gt;\r\n																		&lt;/p&gt;','','2014-08-22 17:02:37',NULL,1,NULL,NULL,1);
/*!40000 ALTER TABLE `wq_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wq_sys_messages`
--

DROP TABLE IF EXISTS `wq_sys_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wq_sys_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` tinytext NOT NULL COMMENT '内容',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `state` int(11) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统消息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wq_sys_messages`
--

LOCK TABLES `wq_sys_messages` WRITE;
/*!40000 ALTER TABLE `wq_sys_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `wq_sys_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wq_user_messages`
--

DROP TABLE IF EXISTS `wq_user_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wq_user_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `from_id` bigint(20) NOT NULL COMMENT '发送人id',
  `to_id` bigint(20) NOT NULL COMMENT '收件人id',
  `content` tinytext NOT NULL COMMENT '内容',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `state` int(2) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='用户私信';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wq_user_messages`
--

LOCK TABLES `wq_user_messages` WRITE;
/*!40000 ALTER TABLE `wq_user_messages` DISABLE KEYS */;
INSERT INTO `wq_user_messages` VALUES (3,6,6,'aaaa','2014-08-18 15:39:42',1),(4,4,4,'hi 1','2014-08-18 16:57:16',2),(5,4,4,'hi 2','2014-08-18 16:57:32',2),(6,4,4,'cc','2014-08-18 17:09:46',2);
/*!40000 ALTER TABLE `wq_user_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wq_users`
--

DROP TABLE IF EXISTS `wq_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wq_users`
--

LOCK TABLES `wq_users` WRITE;
/*!40000 ALTER TABLE `wq_users` DISABLE KEYS */;
INSERT INTO `wq_users` VALUES (1,'123','123456','测试别名啊',NULL,'123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL),(2,'jack','123456','昵称c测试12345','./Uploads/jack/53f310b3255f3.jpg','qweqwe@163.com','男','','','','','','',NULL,NULL,2,NULL),(4,'wanjunjun','123','abc123456','./Uploads/wanjunjun/53f40485a9d09.jpg','w@qq.com','','','','','it','abc','nb le',NULL,NULL,2,1),(5,'tp','123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL),(6,'admin','123','','./Uploads/admin/53f1953eb118c.jpg',NULL,'','','','','','a','',NULL,NULL,2,NULL),(7,'thinkphp','123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL),(8,'aa','123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL),(16,'bbb','123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1),(19,'fasd','123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-08-20 15:01:34',NULL,1,2),(25,'wanjunjun2','123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-08-21 09:14:03',NULL,2,1),(41,'258259590@qq.com','123',NULL,NULL,'258259590@qq.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-08-21 10:21:24',NULL,1,2);
/*!40000 ALTER TABLE `wq_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wq_users_fans`
--

DROP TABLE IF EXISTS `wq_users_fans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wq_users_fans` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_star` bigint(20) NOT NULL COMMENT '被关注用户id',
  `user_fan` bigint(20) NOT NULL COMMENT '关注别人的用户id',
  `create_date` datetime DEFAULT NULL COMMENT '关注时间',
  `state` int(2) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户关注';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wq_users_fans`
--

LOCK TABLES `wq_users_fans` WRITE;
/*!40000 ALTER TABLE `wq_users_fans` DISABLE KEYS */;
/*!40000 ALTER TABLE `wq_users_fans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `post_comments_count`
--

/*!50001 DROP TABLE IF EXISTS `post_comments_count`*/;
/*!50001 DROP VIEW IF EXISTS `post_comments_count`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `post_comments_count` AS select count(0) AS `num`,`wq_comments`.`post_id` AS `post_id` from `wq_comments` group by `wq_comments`.`post_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `post_favorites_count`
--

/*!50001 DROP TABLE IF EXISTS `post_favorites_count`*/;
/*!50001 DROP VIEW IF EXISTS `post_favorites_count`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `post_favorites_count` AS select `f`.`post_id` AS `post_id`,`f`.`type` AS `type`,count(1) AS `num` from `wq_post_favorites` `f` group by `f`.`type`,`f`.`post_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-08-22 17:13:14
