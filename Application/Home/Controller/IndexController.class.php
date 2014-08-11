<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends Controller {
    public function index(){
        $this->display('home');		
    }
	
	public function ver() {  
		$config = array(  
		    'imageH' => 30, // 验证码图片高度  
		    'imageW' => 100, // 验证码图片宽度  
		    'fontSize' => 15,
		    'length' => 4
		);
        $Verify = new \Think\Verify($config);  
        //$Verify = D("Verify"); 
         
        $Verify->entry();  
    }  
}