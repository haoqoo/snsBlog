<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends Controller {
    public function index(){
        $this->display('home');		
    }
	
	public function ver($id='') {  
		$config = array(  
		    'imageH' => 40, // 验证码图片高度  
		    'imageW' => 120, // 验证码图片宽度  
		    'fontSize' => 15,
		    'length' => 4
		);
        $Verify = new \Think\Verify($config);  
        //$Verify = D("Verify"); 
         
        $Verify->entry($id);  
    }  

    public function sendm() {  
    	header('Content-Type:text/html;charset=utf-8');
		//echo "send mail";
		//SendMail("258259590@qq.com","邮件标题1","邮件正文1:<a href=\"http://www.baidu.com\">active</a>");
        //sm(); 
        echo "中文测试success ";
        echo base64_encode("12.mailactive");
        echo "<br>";
        echo base64_decode("MzM0ZmI0MzY5YTUyZWRhYzVmM2IzZmZmZmM5Y2Y2MjA=");
        echo "<br>";	
        echo md5("12");
        echo "<br>";	
        echo base64_encode(md5("wanjunjun"));
    }
}