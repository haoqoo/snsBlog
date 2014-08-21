<?php
namespace Admin\Controller;
use Think\Controller;
class ActiveController extends Controller {	

    public function index(){
        $this->show('<style type="text/css">*{ padding: 0; margin: 0; } div{ padding: 4px 48px;} body{ background: #fff; font-family: "微软雅黑"; color: #333;font-size:24px} h1{ font-size: 100px; font-weight: normal; margin-bottom: 12px; } p{ line-height: 1.8em; font-size: 36px }</style><div style="padding: 24px 48px;"> <h1>:)</h1><p>欢迎使用 <b>ThinkPHP</b>！</p><br/>[ 您现在访问的是Admin模块的User控制器 ]</div><script type="text/javascript" src="http://tajs.qq.com/stats?sId=9347272" charset="UTF-8"></script>','utf-8');
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
    	// $this->display('getUser2');

        //echo crypt("wanjunjun", "md");
        echo "0".strval("1");

    }

    public function mailReg($mailname='') {        
        
        $User = M("Users");

        $map['username'] = $mailname;
        $u = $User->where($map)->find();
        if(isset($u["id"])){
            $ajax['success'] = true;
            return $this->ajaxReturn($ajax);
        }

        $data['username'] = $mailname;
        $data['password'] = '123';
        $data['email'] = $mailname;
        $data['state'] = '1';
        $data['reg_type'] = '2';
        $data['create_date'] = date("Y-m-d H:i:s");
        $id = $User->add($data);

        $key = base64_encode(base64_encode(md5("12"))."+".base64_encode($id.".mailactive"));
        $active_url = "http://localhost".__ROOT__."/admin/active/active?key=".$key;

        SendMail($mailname, "sns系统注册激活", "请点击下面的链接".$active_url."。来认证您的邮箱。如果您的邮箱不支持链接点击，请将以上链接地址拷贝到你的浏览器地址栏中认证。");
        
        $ajax['success'] = true;
        $this->ajaxReturn($ajax);   
    }    

    public function active($key){
        $arr = explode("+", base64_decode($key));
       
        $ids = base64_decode($arr[1]);
       
        $a2 = explode(".", base64_decode($arr[1]));
       

        $User = M("Users");
        $map['id']=$a2[0];
        $data = $User->where($map)->find();
        if($data["state"] == 2){
            $this->assign('msg', "url无效");
            return $this->display('active');
        }
       
        $createDate = new \Org\Util\Date($data["create_date"]);
        $date = new \Org\Util\Date();
        $dd = $createDate->dateDiff($date, 'h');
        if($dd > 2){
            $this->assign('msg', "url已过期，请重新注册");
            return $this->display('active');
        }
               
        $User-> where('id='.$a2[0])->setField("state", 2);

       // echo '激活成功，转入<a href="http://localhost'.__ROOT__.'">首页</a>登录';
        $this->assign('msg', '激活成功，转入<a href="http://localhost'.__ROOT__.'">首页</a>登录');
        $this->display('active');
    }

}