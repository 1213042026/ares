<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>文章管理</title>
<link href="/ares/static_hou/css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="/ares/static_hou/js/jquery.js"></script>

<script type="text/javascript">
$(document).ready(function(){
  $(".click").click(function(){
  $(".tip").fadeIn(200);
  });
  
  $(".tiptop a").click(function(){
  $(".tip").fadeOut(200);
});

  $(".sure").click(function(){
  $(".tip").fadeOut(100);
});

  $(".cancel").click(function(){
  $(".tip").fadeOut(100);
});

});
</script>


</head>


<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="/ares/view/cms/worktop">首页</a></li>
    <li><a href="#">文章列表</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    <div class="tools">
    
    	<ul class="toolbar1">
        <li class="click"><span><img src="/ares/static_hou/img/t01.png" /></span>
        	<a href="/ares/txt/tjtxt">添加</a>
        </li>
        <li class="click"><span><img src="/ares/static_hou/img/t02.png" /></span>确认</li>
        <li class="click"><span><img src="/ares/static_hou/img/t03.png" /></span>删除</li>
      </ul>
      
      <form action="/ares/txt/selectBycondition" method="post">
      <ul  class="toolbar2">
	     <li>
	  			<p>标 题:</p>
				<input  name="keyword" type="text"/>
		</li>
		 <li>
				<input  class="sub_input" type="submit" value="查询">
		</li>
      </ul>  
       </form>  
     
    
    </div>
    
    
   <h1>没有找到相关的文章</h1>
    
    
    </div>
</body>
</html>
