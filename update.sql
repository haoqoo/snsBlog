ALTER TABLE `wq_users`  ADD COLUMN `reg_type` INT(11) NULL DEFAULT NULL COMMENT '×¢²á·½Ê½(1ÆÕÍ¨×¢²á£¬2ÓÊÏä×¢²á£¬3µÚÈý·½ÕËºÅ)' AFTER `state`;

DROP TABLE IF EXISTS `wq_operation_sql`;
CREATE TABLE IF NOT EXISTS `wq_operation_sql` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `oper_table` varchar(50) DEFAULT NULL,
  `view_sql` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

# Dumping data for table sns.wq_operation_sql: ~2 rows (approximately)
DELETE FROM `wq_operation_sql`;
/*!40000 ALTER TABLE `wq_operation_sql` DISABLE KEYS */;
INSERT INTO `wq_operation_sql` (`id`, `oper_table`, `view_sql`) VALUES
	(1, 'comments', 'select p.title from wq_posts p, wq_comments t where p.id = t.post_id and t.id =?'),
	(2, 'post_favorites', 'select p.title from wq_posts p, wq_post_favorites t where p.id = t.post_id and t.id =?');