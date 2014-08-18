<?php
return array(
	//'配置项'=>'配置值'
	'URL_HTML_SUFFIX'      => 'shtml',
	'URL_CASE_INSENSITIVE' => false, //url不区分大小写，针对linux系统
	'DB_TYPE'              => 'mysql', // 数据库类型
	'DB_HOST'              => '192.168.1.62', // 服务器地址
	'DB_NAME'              => 'sns', // 数据库名
	'DB_USER'              => 'root', // 用户名
	'DB_PWD'               => '123456', // 密码
	'DB_PORT'              => 3306, // 端口
	'DB_PREFIX'            => 'wq_', // 数据库表前缀
	'DB_CHARSET'           => 'utf8', //

	//'配置项'=>'配置值'
	// 开启路由
	'URL_ROUTER_ON'   => true,
	'URL_ROUTE_RULES' => array(
		'cate/wookmarkAjax' => 'Home/Category/wookmarkAjax',
		'cate/wookmarkPostAjax' => 'Home/Category/wookmarkPostAjax',
		'cate/:id\d/post'   => 'Home/Category/show_post',
		'cate/:id\d'        => 'Home/Category/show_album',
		'cate'              => 'Home/Category/index',

		'album/wookmarkAjax' => 'Home/Album/wookmarkAjax',
		'album/add'          => 'Home/Album/add',
		'album/saveAjax'     => 'Home/Album/saveAjax',
		'album/save_update'  => 'Home/Album/save_update',
		'album/edit/:id\d'   => 'Home/Album/edit',
		'album/favorites'    => 'Home/Album/favorites',
		'album/delete/:id\d' => 'Home/Album/delete',
		'album/:id\d'        => 'Home/Album/detail',

		'post/wookmarkAjax' => 'Home/Post/wookmarkAjax',
		'post/add'          => 'Home/Post/add',
		'post/save_update'  => 'Home/Post/save_update',
		'post/comment' => 'Home/Post/comment',
		'post/edit/:id\d'   => 'Home/Post/edit',
		'post/delete/:id\d' => 'Home/Post/delete',
		'post/:id\d'        => 'Home/Post/detail',

	),

	//分类
	'CATEGORY' => array(
		'1'  => '摄影',
		'2'  => '美妆服饰',
		'3'  => '美食',
		'4'  => '运动',
		'5'  => '科技生活',
		'6'  => '游戏',
		'7'  => '家居设计',
		'8'  => '宠物',
		'9'  => '音乐',
		'10' => '汽车',
		'11' => '其他',
	),

	//view 路径文件夹
	'CATE_VIEW'  => 'Home@/Category/', //对应Category模块
	'ALBUM_VIEW' => 'Home@/Album/', //对应Album模块
	'POST_VIEW'  => 'Home@/Post/', //对应POST模块

	// 预先加载的标签库
	'TAGLIB_PRE_LOAD' => 'Home\\TagLib\\MyTag',

	'MAIL_ADDRESS'   => 'wanjunjun@sina.com', // 邮箱地址
	'MAIL_SMTP'      => 'smtp.sina.com', // 邮箱SMTP服务器
	'MAIL_LOGINNAME' => 'wanjunjun@sina.com', // 邮箱登录帐号
	'MAIL_PASSWORD'  => 'wcr0603', // 邮箱密码
	'MAIL_SENDER'    => 'sns', //发件人名字

);