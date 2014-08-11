<?php
namespace Home\Controller;
use Think\Controller;
class CategoryController extends Controller {
    public function index(){
    	$Categories = M("Categories");
    	$datas = $Categories->select();	
        $this->display(C('CATE_VIEW')."main");		
    }
	
	
}