<?php
return array(
	//'配置项'=>'配置值'
	'URL_HTML_SUFFIX' => 'shtml',
	'URL_CASE_INSENSITIVE'  => false, //url不区分大小写，针对linux系统
	'DB_TYPE' => 'mysql', // 数据库类型
 	'DB_HOST' => '192.168.1.62', // 服务器地址
 	'DB_NAME' => 'sns', // 数据库名
 	'DB_USER' => 'root', // 用户名
 	'DB_PWD' => '123456', // 密码
 	'DB_PORT' => 3306, // 端口
 	'DB_PREFIX' => 'wq_', // 数据库表前缀
	'DB_CHARSET'=> 'utf8', //

	//'配置项'=>'配置值'
	// 开启路由
	 'URL_ROUTER_ON'=>true, 
	 'URL_ROUTE_RULES'=>array(
	 	'cate/:id\d'=>'Home/Category/show',  
     	'cate'=> 'Home/Category/index'
     	 
	 ),

	 //分类
	 'CATEGORY' => array(
	 		'1' => '摄影',
	 		'2' => '美妆服饰',
	 		'3' => '美食',
	 		'4' => '运动',
	 		'5' => '科技生活',
	 		'6' => '游戏',
	 		'7' => '家居设计',
	 		'8' => '宠物',
	 		'9' => '音乐',
	 		'10' => '汽车'
	 	),

	//view 路径文件夹
	'CATE_VIEW' => 'Home@/category/' //d对应Category模块
);