<?php
namespace Admin\Logic;
use Think\Model;
class LastVisitorLogic extends Model {

	public function addVisitor($userId=0, $visitorId=0){
		if($userId == $visitorId){
			return;
		}
		
		$entity['user_id'] = $userId;
		$entity['visitor_id'] = $visitorId;
		$entity['visitor_time'] = date("Y-m-d H:i:s");

		$map['user_id'] = $userId;
		$map['visitor_id'] = $visitorId;
        $data = $this->where($map)->find();

        if(isset($data['id'])){
        	$entity['id'] = $data['id'];
        	$this->save($entity);
        }else{
        	$this->add($entity);
        }        		
	}
}