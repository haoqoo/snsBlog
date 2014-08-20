<?php
namespace Home\Controller;
use Think\Controller;

class PostController extends Controller {

	public function detail() {
		$id = $_GET['id'];
		if (isset($id)) {
			$catArray    = C('CATEGORY');
			$Posts       = M('Posts');
			$post        = $Posts->where('id=%d', array($id))->find();
			$category_id = $post['category_id'];
			$album_id    = $post['album_id'];
			$post_others = $Posts->where('album_id=%d and id <> %d', array($album_id, $id))->limit(6)->select();//专辑里其他文章
			$Albums      = M('Albums');
			$album       = $Albums->where('id=%d', array($album_id))->find();

			//判断博客是否是当前登录用户的
			$is_my_post = false;
			$user       = session('__user__');
			if ($user) {
				$count                                 = $Posts->where('id=%d and user_id=%d', array($id, $user['id']))->count();
				if ($count && $count > 0) {$is_my_post = true;
				}
			}

			//评论
			$Comments     = M('Comments');
			$comment_list = $Comments->where('post_id=%d', array($id))->limit(0, 30)->select();

			$this->assign('post', $post);
			$this->assign('album_name', $album['name']);
			//$this->assign('category',$catArray[$category_id]);
			$this->assign('is_my_post', $is_my_post);
			$this->assign('post_others', $post_others);
			$this->assign('comment_list', $comment_list);
		}
		$this->display(C('POST_VIEW')."detail");
	}

	public function wookmarkAjax($page_no, $post_id) {
		$page_num = ($page_no-1)*20;
		$Comments = M("Comments");
		$comments = $Comments->where('post_id=%d', array($post_id))->limit($page_num, 30)->select();
		$this->assign('comment_list', $comments);
		$this->display(C('POST_VIEW')."comment_wookmark");
	}

	public function add() {
		$user   = session('__user__');
		$Albums = M('Albums');
		$albums = $Albums->where('user_id=%d', array($user['id']))->select();
		$this->assign('albums', $albums);
		$this->display(C('POST_VIEW')."add_edit");
	}

	public function edit() {
		$id   = $_GET['id'];
		$user = session('__user__');
		if (isset($id)) {
			//$catArray    = C('CATEGORY');
			$Post        = M('Posts');
			$post        = $Post->where('id=%d', array($id))->find();
			$category_id = $post['category_id'];
			// $this->assign('cate_id', $category_id);
			// $this->assign('category', $catArray[$category_id]);
			$Albums = M('Albums');
			$albums = $Albums->where('user_id=%d', array($user['id']))->select();
			$this->assign('albums', $albums);
			$this->assign('post', $post);
		}
		if ($user['id'] == $post['user_id']) {//判断是否是自己专辑
			$this->display(C('POST_VIEW')."add_edit");
		} else {
			$this->display(C('POST_VIEW')."detail");
		}

	}

	public function save_update() {
		$id      = $_POST['id'];
		$content = $_POST['content'];
		$Post    = M('Posts');
		$Post->create($_POST);
		if (!empty($id)) {
			$Post->save();
		} else {
			$Post->state       = 1;
			$Post->create_date = date("Y-m-d H:i:s");
			$id                = $Post->add();
		}

		//对文章内容进行正则img，抓取img

		//需更新Posts表里的has_picture;
		$Post->create();
		$Post->id = $id;

		$PostImgs = M('PostImgs');
		$PostImgs->where('post_id=%d', array($id))->delete();//删除post_imgs表对应的post_id
		preg_match_all('/<\s*img\s+[^>]*?src\s*=\s*(\'|\")(.*?)\\1[^>]*?\/?\s*>/i', $content, $match);
		//对匹配的img src的值，存入数据库
		$has_picture = 1;
		if (isset($match) && sizeof($match) > 0) {
			foreach ($match as $key => $imgs) {
				if ($key == 2) {
					foreach ($imgs as $k => $img_val) {
						//echo $img_val;
						$PostImgs->create();
						$PostImgs->post_id = $id;
						$PostImgs->img_val = $img_val;
						$PostImgs->add();
					}
					if (sizeof($imgs) > 0) {
						$has_picture = 2;
					}
				}
			}
		}
		$Post->has_picture = $has_picture;
		$Post->save();
		$this->redirect('album/'.$_POST['album_id']);

	}

	public function delete() {
		$user  = session('__user__');
		$id    = $_GET['id'];
		$Posts = M('Posts');
		$post  = $Posts->where('id=%d', array($id))->find();

		if ($user['id'] == $post['user_id']) {
			$Posts->where('id=%d', array($id))->delete();
			$this->redirect('album/'.$post['album_id']);
		} else {
			$this->redirect('post/'.$post['id']);
		}
	}

	//文章评论
	public function comment() {
		$user     = session('__user__');
		$Comments = M('Comments');
		$Comments->create($_POST);
		$Comments->user_id     = $user['id'];
		$Comments->state       = 1;
		$Comments->create_date = date("Y-m-d H:i:s");

		$vo['user_id']     = $user['id'];
		$vo['content']     = $Comments->content;
		$vo['create_date'] = $Comments->create_date;
		$id                = $Comments->add();
		$vo['id']          = $id;

		$Post    = M('Posts');
		$user_id = $Post->where('id=%d', array($_POST['post_id']))->getField('user_id');
		if ($user[id] != $user_id) {
			$OperationLogs = D('OperationLogs', 'Logic');
			$logInfoes     = $OperationLogs->buildLogInfo($id, 'comments', '评论', $user['id'], $user_id);
			$OperationLogs->opLog($logInfoes);
		}

		$comment_list[] = $vo;
		$this->assign('comment_list', $comment_list);
		$this->display(C('POST_VIEW')."comment_wookmark");
	}

	//赞，收藏
	public function favorites()
	{
		$state = "repeat";
		$user     = session('__user__');
		$PostFavorites = M('PostFavorites');
		$count = $PostFavorites->where('type=%d and post_id = %d and user_id=%d ',array($_POST['type'],$_POST['post_id'],$user['id']))
								->count();
		if(empty($count)){
			$PostFavorites->create($_POST);
			$PostFavorites->user_id     = $user['id'];
			
			$PostFavorites->create_date = date("Y-m-d H:i:s");
			$PostFavorites->add();
			$state = "add";
		}
		$this->ajaxReturn($state);
		
	}

}