<?php 
namespace Home\TagLib;
use Think\Template\TagLib;

 class MyTag extends TagLib{
 	protected $tags   =  array(
 			'postCommentCount'=>array('attr'=>'post_id','close'=>0),
 			'postFavoritesCount'=>array('attr'=>'post_id,type','close'=>0)
 		);

 	public function _postCommentCount($tag,$content){
 		$Comments = M('Comments');
 		$post_id =$this->$tag['post_id'];

 		$count = $Comments->where('post_id=%d',array($post_id))->count();
 		return isset($count)?$count:0;
 	}

 	//type:1为采集，2为点赞
 	public function _postFavoritesCount($tag,$content){
 		$PostFavorites = M('PostFavorites');
 		$type = $tag['type'];
 		$post_id = $tag['post_id'] ; 		
 		$count = $PostFavorites->where('type=%d and post_id=%d',array($type,$post_id))->count();
 		return isset($count)?$count:0;
 	}
 }