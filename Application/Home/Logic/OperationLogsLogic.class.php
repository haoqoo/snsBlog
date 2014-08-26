<?php
namespace Home\Logic;
use Think\Model;
class OperationLogsLogic extends Model {
 
	/**
	 * 参数$logInfo对应$logInfo['oper_table']，$logInfo['opered_id']，$logInfo['oper_action']，$logInfo['oper_date']
	 * 等，key值为wq_operation_logs的字段
	 */
	public function opLog($logInfo=array()){	
		
		if(sizeof($logInfo)>0){
			$this->create($logInfo);
			$this->add();
		}
	}

	public function buildLogInfo($opered_id,$oper_table,$oper_action,$oper_user_id,$oper_notice_id){
		$logInfo = array();
		$logInfo['opered_id']=$opered_id;
		$logInfo['oper_table']=$oper_table;
		$logInfo['oper_action']=$oper_action;
		$logInfo['oper_user_id']=$oper_user_id;
		$logInfo['oper_notice_id']=$oper_notice_id;
		$logInfo['oper_date']=date('Y-m-d H:i:s');
		$logInfo['state']=1;//未读
		return $logInfo;
	}

}