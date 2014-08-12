<?php
namespace Home\Controller;
use Think\Controller;
class AlbumController extends Controller {

	public function show(){
		$id = $_GET['id'];
		if(isset($id)){
			$catArray = C('CATEGORY');
			$Albums = M('Albums');
			$album = $Albums->where("id=%d",array($id))->find();
			$category_id = $album['category_id'];

			$AlbumFavorites = M('AlbumFavorites');
			$favorites_count = $AlbumFavorites->where('album_id=%d',array($album['id']))->count(); 

			$Posts = M('Posts');
			$post_count = $Posts->where('album_id=%d',array($album['id']))->count(); 
			$post_list = $Posts->where('album_id=%d',array($album['id']))->limit(0,30);

			//判断专辑是否是当前登录用户的
			$is_my_album = false;
			$user = session('__user__');
			if($user){
				$count = $Albums->where('id=%d and user_id=%d',array($id,$user['id']))->count();
				if($count&&$count>0)$is_my_album=true; 
			}
			
			//
			
			$Users = new \Admin\Model\UsersModel();
			$user = $Users->where('id=%d',array($album[user_id]))->find();

			$this->assign('category',$catArray[$category_id]);
			$this->assign('album',$album);
			$this->assign('favorites_count',isset($favorites_count)?$favorites_count:0);
			$this->assign('post_list',$post_list);
			$this->assign('post_count',isset($post_count)?$post_count:0);
			$this->assign('is_my_album',$is_my_album);
			$this->assign('user',$user);
		}
		$this->display(C('ALBUM_VIEW')."show");
	}
}