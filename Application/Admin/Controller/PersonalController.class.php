<?php
namespace Admin\Controller;
use Think\Controller;
class PersonalController extends Controller {	

    public function index(){
        $this->show('个人中心','utf-8');
    }

    
    public function view($id='',$type=''){
        $userId = $id;
        
        $User = M("Users");
        $map['id'] = $userId;
        $data = $User->where($map)->find();

        $this->assign("uid", $id);
        $this->assign("person", $data);

        //记录最近访客
        $user = session('__user__');
        if(isset($user)){
            $LastVisitor = D('LastVisitor', 'Logic');
            $LastVisitor->addVisitor($id, $user['id']);    
        }
        

       // $type =$_GET('type');
        if($type=='zhan'){
             $this->display('home_zhan');   
        }elseif ($type=='album') {
             $this->display('home_album'); 
        }else{
           $this->display('home');  
        }
         
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

    public function getMsgList($start=0, $read=1){
        $user = session('__user__');
       
        $Model = new \Think\Model();
        $sql_count = "select count(1) c from wq_user_messages um,wq_users u where um.from_id = u.id and um.to_id = ".$user["id"]." and um.state = ".$read;
        $count = $Model->query($sql_count);               

        //print sql
        // echo $Model->getLastSql();

        // $this->ajaxReturn($count[0]["c"]);
        $this->assign("read", $read);
        $this->assign("total", $count[0]);
        $this->assign("messages", $result);
        $this->display('userMsgList');
    }

    public function getMsgFragment($start=0, $limit=5, $read=1){
        $user = session('__user__');
        $Model = new \Think\Model();
        $sql = "select u.id, u.aliasname, u.header_img,um.id mid, um.content, um.create_date from wq_user_messages um,wq_users u where um.from_id = u.id ";
        $sql = $sql." and um.to_id = ".$user["id"]." and um.state = ".$read;
        $sql = $sql." order by um.state asc, um.create_date desc limit ".$start.",".$limit;
        $result = $Model->query($sql); 
        
        $this->assign("messages", $result);
        if($read == 1){
            $this->display('pageMsgFragment');
        }else{
            $this->display('pageMsgFragment2');
        }
        
    }

    //更新私信为已读状态
    public function updateUserMsgState($ids=''){
        $idarr = explode(",",$ids);
        
        $UserMessages = M("UserMessages");
        for($i=0; $i < count($idarr); $i++){
            // echo $idarr[$i]."<br>";
            $UserMessages-> where('id='.$idarr[$i])->setField('state',2);
        }
        // $this->success('操作完成','getMsgList.shtml',0);
        $this->redirect('/admin/personal/getMsgList');
    }


    public function getLogList($read=1, $tab=''){
        $sql_ext = "";
        if(!empty($tab)){
            $sql_ext = " and t.oper_table ='".$tab."'";
        }
        $read=1;
        $user = session('__user__');
       
        $Model = new \Think\Model();
        $sql_count = "select count(1) c from wq_operation_logs t,wq_users u where t.oper_table <> 'user_messages' and t.oper_user_id = u.id and t.oper_notice_id = ".$user["id"]." and t.state = ".$read;
        $sql_count = $sql_count.$sql_ext;
        $count = $Model->query($sql_count);               
        
        $this->assign("read", $read);
        $this->assign("total", $count[0]);
        $this->assign("logs", $result);
        $this->assign("tab", $tab);
        $this->display('userLogList');
    }

    public function getLogFragment($read=1, $tab='', $start=0, $limit=5){
        $sql_ext = "";
        if(!empty($tab)){
            $sql_ext = " and t.oper_table ='".$tab."'";
        }
        $read=1;
        $user = session('__user__');
        $Model = new \Think\Model();
        $sql = "select u.id, u.aliasname, u.header_img,t.id mid, t.opered_id rid, t.oper_date, t.oper_table,oper_action from wq_operation_logs t,wq_users u where t.oper_table <> 'user_messages' and t.oper_user_id = u.id ";
        $sql = $sql." and t.oper_notice_id = ".$user["id"]." and t.state = ".$read;
        $sql = $sql.$sql_ext;
        $sql = $sql." order by t.state asc, t.oper_date desc limit ".$start.",".$limit;
        $result = $Model->query($sql); 
        
        $this->assign("logs", $result);
        $this->display('pageLogFragment');
        
    }

    //更新日志为已读状态
    public function updateLogState($ids=''){
        $idarr = explode(",",$ids);
        
        $OperationLogs = M("OperationLogs");
        for($i=0; $i < count($idarr); $i++){
            // echo $idarr[$i]."<br>";
            $OperationLogs-> where('id='.$idarr[$i])->setField('state',2);
        }
        // $this->success('操作完成','getMsgList.shtml',0);
        $this->redirect('/admin/personal/getLogList');
    }
    

    //加关注
    public function addAttention($id=0){
        $user = session('__user__');
        if(isset($user)){
            $UsersFans = D('UsersFans', 'Logic');
            $UsersFans->addAttention($id, $user['id']);    
        }
        $this->redirect('/admin/personal/view', array('id' => $id));
    }

    public function getAttentionList($type=1){
        $UsersFans = D('UsersFans', 'Logic');

        $c = $UsersFans->getPageCount($type);
        $this->assign("total", $c);
        $this->assign("type", $type);
        $this->display('attentionList');
    }

    public function getAttentionPage($page=1, $limit=10, $type=1){
        $UsersFans = D('UsersFans', 'Logic');

        $list = $UsersFans->getPageList($page, $limit, $type);
        $this->assign("list", $list);
        if($type == 1){
            $this->display('pageAttentionFragment');
        }else{
            $this->display('pageAttentionFragment2');
        }
        
    }

    //取消关注
    public function updateAttentionState($ids=''){
        $idarr = explode(",",$ids);
        
        $UsersFans = M("UsersFans");
        for($i=0; $i < count($idarr); $i++){
            // echo $idarr[$i]."<br>";
            $UsersFans-> where('id='.$idarr[$i])->setField('state',1);
        }
        // $this->success('操作完成','getMsgList.shtml',0);
        $this->redirect('/admin/personal/getAttentionList');
    }
}