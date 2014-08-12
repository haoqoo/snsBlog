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

            $catArray = C('CATEGORY');

    		$Albums = M("Albums");    		
    		$ablum_count = $Albums->where('category_id=%d',array($id))->count();

    		$Posts = M("Posts");
    		$post_count = $Posts->where('category_id=%d',array($id))->count();
    		
            $ablums = $Albums->where('category_id=%d',array($id))->limit(0,30)->select();


            $this->assign('category_id',$id);
    		$this->assign('category',$catArray[$id]);
    		$this->assign('post_count',isset($post_count)?$post_count:0);
    		$this->assign('album_count',isset($ablum_count)?$ablum_count:0);
    		$this->assign('album_list',$ablums);
    	}
    	$this->display(C('CATE_VIEW')."show");
    }

    public function wookmarkAjax($page_no,$category_id){
        $page_num = ($page_no-1)*20;
        $Albums = M("Albums");  
        $ablums = $Albums->where('category_id=%d',array($category_id))->limit( $page_num,30)->select(); 
        $this->assign('album_list',$ablums);
        $this->display(C('CATE_VIEW')."album_wookmark");
    }
	
	
}