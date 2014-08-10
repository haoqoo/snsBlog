<?php
return array(
	//'配置项'=>'配置值'
	'URL_HTML_SUFFIX' => 'shtml',
	'URL_CASE_INSENSITIVE'  => true, //url不区分大小写，针对linux系统
	'DB_TYPE' => 'mysql', // 数据库类型
 	'DB_HOST' => '127.0.0.1', // 服务器地址
 	'DB_NAME' => 'sns', // 数据库名
 	'DB_USER' => 'root', // 用户名
 	'DB_PWD' => '123456', // 密码
 	'DB_PORT' => 3306, // 端口
 	'DB_PREFIX' => 'wq_', // 数据库表前缀
	'DB_CHARSET'=> 'utf8', //

	//'配置项'=>'配置值'
	// 开启路由
	// 'URL_ROUTER_ON'=>true, 
	// 'URL_ROUTE_RULES'=>array(
 //    	'cate'=> 'Home/categories/index'    
	// )

	//view 路径文件夹
	'CATE_VIEW' => 'Category@/category/' //d对应Category模块
);