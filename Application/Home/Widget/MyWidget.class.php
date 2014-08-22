<?php 
	namespace Home\Widget;
	use Think\Controller;
	class MyWidget extends Controller {

		//专辑查询统计
		public function searchAlbumCount($keyword)
		{
			$Albums = M('Albums');
			$map['name'] = array('like','%'.$keyword.'%');
			$map['discription'] = array('like','%'.$keyword.'%');
			$map['_logic'] = 'OR';			
			$count = $Albums->where($map)->count();
			//echo $Albums->getLastSql();		
			return isset($count)?$count:0;
		}

		//文章查询统计
		public function searchPostCount($keyword)
		{
			$Posts = M('Posts');
			$map['title'] = array('like','%'.$keyword.'%');
			$map['content'] = array('like','%'.$keyword.'%');
			$map['_logic'] = 'OR';			
			$count = $Posts->where($map)->count();
			//echo $Albums->getLastSql();		
			return isset($count)?$count:0;
		}

		//用户专辑统计
		public function albumCount($user_id){
			$Albums = M('Albums');
			$count = $Albums->where('user_id=%d',array($user_id))->count();
			return isset($count)?$count:0;
		}

		//用户收藏,赞 文章统计
		public function userPostFavoritesCount($user_id=0,$type)
		{
			$PostFavorites = M('PostFavorites');	
	 		$count = $PostFavorites->where('type=%d and user_id=%d',array($type,$user_id))->count();
	 		return isset($count)?$count:0;
		}

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
			$val = $user[$field];
			if($field=='header_img'){
				if(empty($val)){//默认头像
					$val = C('USER_HEADER');
				}
			}
			return $val;
	 	}

	 	//通过post_id获取img
	 	public function getImgByPostId($post_id){
	 		$PostImgs = M('PostImgs');
	 		$img = $PostImgs->where('post_id=%d',array($post_id))->limit(1)->find();
	 		return $img['img_val'];
	 	}

	 	//专辑列表 上图片
	 	public function getImg4Album($album_id){
	 		$Model = new \Think\Model();
	 		$sql ='select * from '.
					'(select pi.* from wq_post_imgs pi, wq_posts  p where p.album_id = '.$album_id
						.' and pi.post_id = p.id order by create_date limit 20) as im'.
					' order by rand() limit 4';
	 		$results = $Model->query($sql);
	 		//echo $Model->getLastSql();
	 		
	 		$this->assign('img_list',$results);
        	$this->display('Category:album_img');
	 	}

	 	//查询用户操作文章日志
	    public function getPostLog(){
	        $user = session('__user__');
	        
	        $Logs = M("OperationLogs");
	        $map['oper_notice_id'] = $user["id"];
	        $data = $Logs->where($map)->select();
	        // return $data;
	        $this->assign('logList',$data);
	        // $this->display('Index:log_list');
	        $this->display('./Public/common/log_list.html');
	    }

	    public function getPostTitle($id=0, $table=''){
	    	$t = "wq_".$table;
	    	$Model = new \Think\Model();
	    	$sql = "select p.title from wq_posts p, ".$t." t where p.id = t.post_id and t.id =".$id;
	    	$title = $Model->query($sql); 
	    	return $title[0]["title"];
	    }

	    public function getLogTitle($id=0, $table=''){
	    	$OperationSql = M("OperationSql");
	        $map['oper_table'] = $table;
	        $data = $OperationSql->where($map)->find();
	        $sql = $data["view_sql"];
	        $sql = str_replace("?", $id, $sql);
	        $Model = new \Think\Model();
	        $title = $Model->query($sql); 
	        return $data["field_name"].'<a class="noAlName">'.$title[0]["title"].'</a>';
	    }
	   
	}