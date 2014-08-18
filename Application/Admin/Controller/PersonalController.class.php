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
        $this->assign("person", $data);
        $this->display('home');  
    }

    public function sendMsg($msg, $uid){
        $user = session('__user__');

        $UserMessages = M("UserMessages");
        $data['content'] = $msg;
        $data['to_id'] = $uid;
        $data['from_id'] = $user["id"];
        $data['create_date'] = date("Y-m-d H:i:s");
        $data['state'] = 1;
        $mid = $UserMessages->add($data);

        //D方法跨模块实例化，需要指定模块名
        $OperationLogs = D('Home/OperationLogs', 'Logic');
        $logInfoes = $OperationLogs->buildLogInfo($mid, 'user_messages', '私信', $user['id'], $uid);
        $OperationLogs->opLog($logInfoes);

        $ajax['success'] = true;
        $this->ajaxReturn($ajax);
    }

    public function getMsg(){
        $user = session('__user__');
        $UserMessages = M("UserMessages");
        $map['to_id'] = $user["id"];
        $data = $UserMessages->where($map)->order('state')->count();
        // $this->response($data,'json');
        $ajax["count"] = $data;
        $ajax["success"] = true;
        $this->ajaxReturn($ajax);
    }
}