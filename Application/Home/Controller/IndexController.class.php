<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends Controller {
    public function index(){
        $this->display('home');		
    }
	
	public function ver() {  
        $Verify = new \Think\Verify();  
        $Verify->entry();  
    }  
}