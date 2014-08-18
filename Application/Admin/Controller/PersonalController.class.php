<?php
namespace Admin\Controller;
use Think\Controller;
class PersonalController extends Controller {	

    public function index(){
        $this->show('个人中心','utf-8');
    }

    
    public function view($id=''){
        $userId = $id;
        
        $User = M("Users");
        $map['id'] = $userId;
        $data = $User->where($map)->find();

        $this->assign("uid", $id);
        $this->assign("user", $data);
        $this->display('home');  
    }

    public function sendMsg($msg, $uid){
        $user = session('__user__');

        $UserMessages = M("UserMessages");
        $data['content'] = $msg;
        $data['to_id'] = $uid;
        $data['from_id'] = $user["id"];
        $data['create_date'] = date("Y-m-d H:i:s");
        $data['state'] = 0;
        $UserMessages->add($data);

        //D方法跨模块实例化，需要指定模块名
        $OperationLogs = D('Home/OperationLogs', 'Logic');
        $logInfoes = $OperationLogs->buildLogInfo($uid, 'user_messages', '私信', $user['id'], null);
        $OperationLogs->opLog($logInfoes);

        $ajax['success'] = true;
        $this->ajaxReturn($ajax);
    }
}