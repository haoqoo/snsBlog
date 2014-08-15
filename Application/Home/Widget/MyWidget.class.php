<?php 
	namespace Home\Widget;
	use Think\Controller;
	class MyWidget extends Controller {

	    public function postCommentCount($post_id){
	        $Comments = M('Comments');
 			//$post_id =$this->$tag['post_id'];

 			$count = $Comments->where('post_id=%d',array($post_id))->count();
 			return isset($count)?$count:0;
	    }

	    //type:1为采集，2为点赞
	 	public function postFavoritesCount($post_id,$type){
	 		$PostFavorites = M('PostFavorites');	
	 		$count = $PostFavorites->where('type=%d and post_id=%d',array($type,$post_id))->count();
	 		return isset($count)?$count:0;
	 	}

	 	//获取用户表里字段的值
	 	public function getUserVal($user_id,$field='username'){
	 		$Users = new \Admin\Model\UsersModel();
			$user = $Users->where('id=%d',array($user_id))->find();
			return $user[$field];
	 	}
	}