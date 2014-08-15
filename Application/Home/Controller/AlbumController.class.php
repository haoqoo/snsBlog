<?php
namespace Home\Controller;
use Think\Controller;

class AlbumController extends Controller {

	public function show() {
		$id = $_GET['id'];
		if (isset($id)) {
			$catArray    = C('CATEGORY');
			$Albums      = M('Albums');
			$album       = $Albums->where("id=%d", array($id))->find();
			$category_id = $album['category_id'];

			$AlbumFavorites  = M('AlbumFavorites');
			$favorites_count = $AlbumFavorites->where('album_id=%d', array($album['id']))->count();

			$Posts      = M('Posts');
			$post_count = $Posts->where('album_id=%d', array($album['id']))->count();
			$post_list  = $Posts->where('album_id=%d', array($album['id']))->limit(0, 30)->select();

			//判断专辑是否是当前登录用户的
			$is_my_album = false;
			$user        = session('__user__');
			if ($user) {
				$count                                  = $Albums->where('id=%d and user_id=%d', array($id, $user['id']))->count();
				if ($count && $count > 0) {$is_my_album = true;
				}
			}

			//查找专辑创建人
			$Users = new \Admin\Model\UsersModel();
			$user  = $Users->where('id=%d', array($album[user_id]))->find();

			$this->assign('category', $catArray[$category_id]);
			$this->assign('album', $album);
			$this->assign('favorites_count', isset($favorites_count)?$favorites_count:0);
			$this->assign('post_list', $post_list);
			$this->assign('post_count', isset($post_count)?$post_count:0);
			$this->assign('is_my_album', $is_my_album);
			$this->assign('user', $user);

		}
		$this->display(C('ALBUM_VIEW')."show");
	}

	//ajax
	public function wookmarkAjax($page_no, $album_id) {
		$page_num = ($page_no-1)*20;
		$Posts    = M("Posts");
		$posts    = $Posts->where('album_id=%d', array($album_id))->limit($page_num, 30)->select();
		$this->assign('post_list', $posts);
		$this->display(C('ALBUM_VIEW')."post_wookmark");
	}

	public function add($cate) {
		$this->assign('cate_id', $cate);
		$this->display(C('ALBUM_VIEW')."add_edit");
	}

	public function edit() {
		$id   = $_GET['id'];
		$user = session('__user__');
		if (isset($id)) {
			$catArray    = C('CATEGORY');
			$Albums      = M('Albums');
			$album       = $Albums->where('id=%d', array($id))->find();
			$category_id = $album['category_id'];
			$this->assign('cate_id', $category_id);
			$this->assign('category', $catArray[$category_id]);
			$this->assign('album', $album);
		}
		if ($user['id'] == $album['user_id']) {//判断是否是自己专辑
			$this->display(C('ALBUM_VIEW')."add_edit");
		} else {
			$this->display(C('ALBUM_VIEW')."detail");
		}

	}

	public function save_update() {
		$id    = $_POST['id'];
		$Album = M('Albums');
		$Album->create($_POST);
		if (!empty($id)) {
			$Album->save();
		} else {
			$Album->state       = 1;
			$Album->create_date = date("Y-m-d H:i:s");
			$result             = $Album->add();
			$id                 = $result;
		}

		$this->redirect('album/'.$id);

	}

	public function delete($cate_id) {
		$user   = session('__user__');
		$id     = $_GET['id'];
		$Albums = M('Albums');
		$album  = $Albums->where('id=%d', array($id))->find();
		if (isset($id) && ($user['id'] == $album['user_id'])) {
			if (isset($album) && sizeof($album) > 0) {
				$Albums->where('id=%d', array($id))->delete();
				$Posts = M('Posts');
				$Posts->where('album_id=%d', array($id))->setField('album_id', null);
			}
		}
		if ($user['id'] == $album['user_id']) {
			$this->redirect('cate/'.$id);

		} else {

			$this->assign('album', $album);
			$this->display(C('ALBUM_VIEW')."detail");
		}
	}

	//关注
	public function favorites() {
		$album_id  = $_GET['album_id'];
		$user      = session('__user__');
		$Favorites = M('AlbumFavorites');
		$count     = $Favorites->where('user_id=%d and album_id=%d', array($user['id'], $album_id))->count();

		if (empty($count)) {
			$favorites['album_id']    = $album_id;
			$favorites['user_id']     = $user['id'];
			$favorites['create_date'] = date("Y-m-d H:i:s");
			$favorites['state']       = 1;
			$Favorites->create($favorites);
			$Favorites->add();

			//操作日志
			$Albums = M('Albums');
			$album  = $Albums->where('id=%d', array($album_id))->find();
			if (isset($album) && sizeof($album) > 0) {
				if ($user[id] != $album['user_id']) {
					$OperationLogs = D('OperationLogs', 'Logic');
					$logInfoes     = $OperationLogs->buildLogInfo($album_id, 'album', '关注', $user['id'], $album['user_id']);
					$OperationLogs->opLog($logInfoes);
				}
			}
		}
		$ajax['success'] = true;
		$this->ajaxReturn($ajax);
	}
}