<?php 
namespace Home\TagLib;
use Think\Template\TagLib;

 class MyTag extends TagLib{
 	protected $tags   =  array(
 			'postCommentCount'=>array('attr'=>'postId','close'=>0)
 		);

 	public function _postCommentCount(){

 	}
 }