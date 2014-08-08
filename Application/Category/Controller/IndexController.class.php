<?php
namespace Category\Controller;
use Think\Controller;
class IndexController extends Controller {		

    public function index(){    	
        $this->display(C('CATE_VIEW')."cate");
    }


     
}