<?php
namespace Admin\Controller;
use Think\Controller;
class UserController extends Controller {	

    public function index(){
        $this->show('<style type="text/css">*{ padding: 0; margin: 0; } div{ padding: 4px 48px;} body{ background: #fff; font-family: "微软雅黑"; color: #333;font-size:24px} h1{ font-size: 100px; font-weight: normal; margin-bottom: 12px; } p{ line-height: 1.8em; font-size: 36px }</style><div style="padding: 24px 48px;"> <h1>:)</h1><p>欢迎使用 <b>ThinkPHP</b>！</p><br/>[ 您现在访问的是Admin模块的User控制器 ]</div><script type="text/javascript" src="http://tajs.qq.com/stats?sId=9347272" charset="UTF-8"></script>','utf-8');
    }

    public function addUser(){
    	$this->display('add');    
    }

    public function saveAdd(){
    	//echo $mail;
    	//表单参数自动映射，必须用D方法实例化，原因未知
    	$User = D("Users");
		$User->create();
		$User->add();
		$this->success('操作完成','getUser.shtml');
    }

    public function getUser(){
    	$User = M("Users");
    	$data = $User->where('')->select();

    	//dump($data);
    	//echo $data;
    	//跳转到当前控制器的index方法
    	//$this->success('操作完成','index.shtml');

		//渲染模板
		//$this->display();
    	//$this->display(T('user/getUser2'));
    	$this->assign("list", $data);
    	$this->assign('name', "wanjunjun");
    	$this->display('getUser2');
    }

    public function login($username,$password){
            
            $ajax['success'] = false;
        
            $User = M("Users");
            $map['username']=$username;
            $map['password']=$password;
            $user = $User->where($map)->find(); //查询出来的是数组,一条数据库数据的数组。
            //print_r($user) ;
            //echo 'user login:'.$user['username'].'<br>';           
            if($user){
                $ajax['success'] = true;
                session('__user__',$user);             
            }
            $this->ajaxReturn($ajax);       
    }

    public function logout(){
        session(null);
        $this->redirect('/');
    }

    public function reg($code='', $username=''){
        $ajax['success'] = false;
        
        $map['username']=$username;
        $verify = new \Think\Verify();
        if($verify->check($code)){
            $ajax['success'] = true; 
            $User = M("Users");
            $data['username'] = $username;
            $data['password'] = '123';
            $data['state'] = '2';
            $data['reg_type'] = '1';
            $User->add($data);

        }else{
            $ajax['msg']  = "err_code";
            $ajax['success'] = false;
        }
        $this->ajaxReturn($ajax);   
    }

}