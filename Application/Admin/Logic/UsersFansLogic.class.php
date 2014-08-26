<?php
namespace Admin\Logic;
use Think\Model;
class UsersFansLogic extends Model {

	public function addAttention($userId=0, $attentionId=0){
		if($userId == $attentionId){
			return;
		}
		
		$entity['user_star'] = $userId;
		$entity['user_fan'] = $attentionId;
		$entity['create_date'] = date("Y-m-d H:i:s");
		$entity['state'] = 2;

		$map['user_star'] = $userId;
		$map['user_fan'] = $attentionId;
        $data = $this->where($map)->find();

        if(isset($data['id'])){
        	$entity['id'] = $data['id'];
        	$this->save($entity);
        }else{
        	$this->add($entity);
        }        		
	}

	public function getPageCount($type=1){
    	$user = session('__user__');
        if(!isset($user)){
            return 0;
        }

       	$UsersFans = M('UsersFans');
        if($type==1){
            $map['user_fan'] = $user['id'];    
        }else{
            $map['user_star'] = $user['id'];    
        }
    	$map['state'] = 2;
    	$c = $UsersFans->where($map)->count("id");
        return $c;         
    }

    public function getPageList($page=0, $limit=10, $type=1){
        $user = session('__user__');
        if(!isset($user)){
            return null;
        }

        $UsersFans = M('UsersFans');
        if($type==1){
            $map['user_fan'] = $user['id'];    
        }else{
            $map['user_star'] = $user['id'];    
        }
        $map['state'] = 2;
        $list = $UsersFans->where($map)->page($page, $limit)->select();
        return $list;
    }
}