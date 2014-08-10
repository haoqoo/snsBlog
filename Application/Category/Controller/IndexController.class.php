<?php
namespace Category\Controller;
use Think\Controller;
class IndexController extends Controller {		

    public function index(){    	
        $this->display(C('CATE_VIEW')."main"); //C('CATE_VIEW') 在Common/Conf里定义
    }

    public function show(){
    	echo 'eeeee';
    }
    
}