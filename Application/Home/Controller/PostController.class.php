<?php
namespace Home\Controller;
use Think\Controller;
class PostController extends Controller {

    public function show(){
        $id = $_GET['id'];
        if(isset($id)){
        	$catArray = C('CATEGORY');
        	$Posts = M('Posts');
        	$post = $Posts->where('id=%d',array($id))->find();
        	$category_id = $post['category_id']; 
        	$album_id = $post['album_id'];
        	$post_others = $Posts->where('album_id=%d and id <> %d',array($album_id,$id))->limit(6)->select();//专辑里其他文章
        	$Albums = M('Albums');
        	$album = $Albums->where('id=%d',array($album_id))->find();


        	//判断博客是否是当前登录用户的
			$is_my_post = false;
			$user = session('__user__');
			if($user){
				$count = $Posts->where('id=%d and user_id=%d',array($id,$user['id']))->count();
				if($count&&$count>0)$is_my_post=true; 
			}

			//评论
			$Comments = M('Comments');
			$comment_list = $Comments->where('post_id=%d',array($id))->limit(0,30)->select();

			
			$this->assign('post',$post);
			$this->assign('album_name',$album['name']);
			//$this->assign('category',$catArray[$category_id]);
        	$this->assign('is_my_post',$is_my_post);
        	$this->assign('post_others',$post_others);
        	$this->assign('comment_list',$comment_list);
        }
        $this->display(C('POST_VIEW')."show");
    }

    public function  wookmarkAjax($page_no,$post_id){
        $page_num = ($page_no-1)*20;
        $Comments = M("Comments");  
        $comments = $Comments->where('post_id=%d',array($post_id))->limit($page_num,30)->select(); 
        $this->assign('comment_list',$comments);
        $this->display(C('POST_VIEW')."comment_wookmark");
    }
}