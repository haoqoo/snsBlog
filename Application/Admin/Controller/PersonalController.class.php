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

    public function getMsgCount(){
        $user = session('__user__');
        $UserMessages = M("UserMessages");
        $map['to_id'] = $user["id"];
        $data = $UserMessages->where($map)->order('state')->count();
        // $this->response($data,'json');
        $ajax["count"] = $data;
        $ajax["success"] = true;
        $this->ajaxReturn($ajax);
    }

    public function getMsgList(){
        $user = session('__user__');
        $UserMessages = M("UserMessages");
        $map['to_id'] = $user["id"];
        $data = $UserMessages->where($map)->order('state asc, create_date desc')->select();    
        $this->assign("messages", $data);   
        //$this->display('userMsgList'); 

        //$result = $Model->Table('wq_user_messages um,wq_users u')->where('um.from_id=u.id')->select();

        $Model = new \Think\Model();
        $sql = "select u.id, u.header_img, um.content, um.create_date from wq_user_messages um,wq_users u where um.from_id = u.id ";
        $sql = $sql." and um.to_id = ".$user["id"];
        $result = $Model->query($sql);
        
        // ->field('u.id , u.header_img, um.content, um.create_date')
        // ->order('u.id desc' )
        // ->limit(5)
        


        $this->ajaxReturn($result);
    }
}