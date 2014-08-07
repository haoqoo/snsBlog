<?php if (!defined('THINK_PATH')) exit();?> <!DOCTYPE html>
 <html>
 <head>
 	<title></title>
 	
 	<script type="text/javascript" src="/snsBlog/public/js/jquery-1.7.2.min.js"></script>
 </head>
 <body>
 	用户列表
 	<table>
 		<tr><td>id</td><td>name</td></tr>
 <?php if(is_array($list)): foreach($list as $key=>$vo): ?><tr>
 		<td><?php echo ($vo["id"]); ?></td>
 		<td><?php echo ($vo["username"]); ?></td>
 	</tr><?php endforeach; endif; ?>
</table>
<a href="/snsBlog/admin/user/add.shtml">创建用户</a>
 </body>
 </html>
 <script type="text/javascript">

 </script>