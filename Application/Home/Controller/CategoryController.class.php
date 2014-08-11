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
    	$id = $_GET['id'];
    	if(isset($id)){

    		$Albums = M("Albums");    		
    		$ablum_count = $Albums->where('category_id=%d',array($id))->count();

    		$Posts = M("Posts");
    		$post_count = $Posts->where('category_id=%d',array($id))->count();
    		$catArray = C('CATEGORY');

    		$this->assign('category',$catArray[$id]);
    		$this->assign('post_count',$post_count);
    		$this->assign('album_count',$ablum_count);
    		//$data = $Categories->find($_GET['id']);
    	}
    	$this->display(C('CATE_VIEW')."show");
    }
	
	
}