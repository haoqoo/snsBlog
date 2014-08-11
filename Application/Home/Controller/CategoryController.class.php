<?php
namespace Home\Controller;
use Think\Controller;
class CategoryController extends Controller {

    public function index(){

    	$Categories = M("Categories");
    	$datas = $Categories->select();	
        $this->display(C('CATE_VIEW')."main");		
    }

    public function show(){
    	
    	//$Categories = M("Categories");
    	if(isset($_GET['id'])){
    		//$data = $Categories->find($_GET['id']);
    	}
    	$this->display(C('CATE_VIEW')."show");
    }
	
	
}