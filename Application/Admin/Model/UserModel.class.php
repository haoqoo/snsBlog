<?php
namespace Admin\Model;
use Think\Model;
class UsersModel extends Model {
	protected $_map = array(
		'name' =>'username', // 把表单中name映射到数据表的username字段
 		'mail' =>'email' // 把表单中的mail映射到数据表的email字段
 	);
}