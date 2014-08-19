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
        $map['state'] = 1;
        $data = $UserMessages->where($map)->order('state')->count();
        // $this->response($data,'json');
        $ajax["count"] = $data;
        $ajax["success"] = true;
        $this->ajaxReturn($ajax);
    }

    public function getMsgList($start=0, $limit=5){
        $user = session('__user__');
        /*$UserMessages = M("UserMessages");
        $map['to_id'] = $user["id"];
        $data = $UserMessages->where($map)->order('state asc, create_date desc')->select();    
        $this->assign("messages", $data); */  
        //$this->display('userMsgList'); 

        //$result = $Model->Table('wq_user_messages um,wq_users u')->where('um.from_id=u.id')->select();
        // $start = ($start-1)*$limit;
        $Model = new \Think\Model();
        $sql = "select u.id, u.aliasname, u.header_img, um.content, um.create_date from wq_user_messages um,wq_users u where um.from_id = u.id ";
        $sql = $sql." and um.to_id = ".$user["id"];
        $sql = $sql." order by um.state asc, um.create_date desc limit ".$start.",".$limit;
        $result = $Model->query($sql); 
        $sql_count = "select count(1) c from wq_user_messages um,wq_users u where um.from_id = u.id and um.to_id = ".$user["id"];
        $count = $Model->query($sql_count);               

        //print sql
        // echo $Model->getLastSql();

        // $this->ajaxReturn($count[0]["c"]);
        $this->assign("total", $count[0]);
        $this->assign("messages", $result);
        $this->display('userMsgList');
    }

    public function getMsgFragment($start=0, $limit=5){
        $user = session('__user__');
        $Model = new \Think\Model();
        $sql = "select u.id, u.aliasname, u.header_img, um.content, um.create_date from wq_user_messages um,wq_users u where um.from_id = u.id ";
        $sql = $sql." and um.to_id = ".$user["id"];
        $sql = $sql." order by um.state asc, um.create_date desc limit ".$start.",".$limit;
        $result = $Model->query($sql); 
        
        $this->assign("messages", $result);
        $this->display('pageMsgFragment');
    }
}