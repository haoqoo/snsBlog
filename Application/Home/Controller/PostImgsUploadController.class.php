<?php
namespace Home\Controller;
use Think\Controller;

class PostImgsUploadController extends Controller {

	public function upload()
	{
		// $user = session('__user__');
		// $upload = new \Think\Upload();// 实例化上传类
  //       $upload->maxSize = 1024000 ;// 设置附件上传大小
  //       $upload->exts = array('jpg', 'gif', 'png', 'jpeg');// 设置附件上传类型
  //       $upload->rootPath = './Public/';
  //       $upload->savePath = './umEditorUploads/'.$user["username"].'/'; // 设置附件上传目录
  //       $upload->saveName = array('uniqid',''); 
  //       $upload->subName = ''; 
  //        // 上传文件
  //       $info = $upload->upload();

		 $user = session('__user__');

		//上传配置
    	$config = array(  
    		"savePath" => "./Public/umEditorUploads/" ,    
	        "maxSize" => 1000 ,                   //允许的文件最大尺寸，单位KB
	        "allowFiles" => array( ".gif" , ".png" , ".jpg" , ".jpeg" , ".bmp" )  //允许的文件格式
    	);
    	 $Path = './Public/umEditorUploads/';

	    //背景保存在临时目录中
	    $config[ "savePath" ] = $Path;
    	//import('Lib.UmEditor.Uploader');
    	$up =  new \Lib\UmEditor\Uploader( "upfile" , $config );
	    $type = $_REQUEST['type'];
	    $callback=$_GET['callback'];

	    $info = $up->getFileInfo();
	    /**
	     * 返回数据
	     */
	    if($callback) {
	        echo '<script>'.$callback.'('.json_encode($info).')</script>';
	    } else {
	        echo json_encode($info);
	    }

     
	}
	
}

