<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="/ares/static_hou/css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="/ares/static_hou/js/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	

});
</script>




</head>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
 	<li><a href="/ares/view/cms/worktop">首页</a></li>
    <li><a href="/ares/txt/select">文章</a></li>
    <li><a href="#">确认文章</a></li>
    </ul>
    </div>
    
    <div class="formbody" style="margin-bottom: 100px">
    
    <div class="formtitle"><span>基本信息</span></div>
    
    <ul class="forminfo" style="margin-left: 200px">
    <li>
    	<label>文章标题</label>
    	<p style="border: 1px solid darkgray;width: 500px;margin-left: 100px;height: 30px;font-size: 20px;font-family: 楷体;">${auditingTxt['cms_news_name']}</p>
    </li>
    <li>
    	<label>所属栏目</label>
    	<p style="border: 1px solid darkgray;width: 500px;margin-left: 100px;height: 30px;font-size: 20px;font-family: 楷体;">${auditingTxt['cms_part_name']}</p>
    </li>
     <li>
    	<label>提交时间</label>
    	<p style="border: 1px solid darkgray;width: 500px;margin-left: 100px;height: 30px;font-size: 20px;font-family: 楷体;">${auditingTxt['cms_news_ptime']}</p>
    </li>
     <li>
    	<label>作者</label>
    	<p style="border: 1px solid darkgray;width: 500px;margin-left: 100px;height: 30px;font-size: 20px;font-family: 楷体;">${auditingTxt['cms_user_uname']}</p>
    </li>
     <li>
    	<label>确认状态</label>
    	<p style="border: 1px solid darkgray;width: 500px;margin-left: 100px;height: 30px;font-size: 20px;font-family: 楷体;">${auditingTxt['cms_status_word']}</p>
    </li>
     <li>
    	<label>文章图片</label>
    	<img src="${auditingTxt['cms_news_imgurl']}" style="width: 400px;height: 300px;margin-left: 50px;"/>
   	</li>
    
    <li>
    	<label>文章内容</label>
    	<textarea name="" cols="" rows="" readonly="value"
    		style="border: 1px solid darkgray;width: 500px;margin-left: 14px;height: 200px;font-size: 20px;font-family: 楷体;">
    	${auditingTxt['cms_news_content']}
    	</textarea>
   	</li>
    <li style="float: left;">
    	<label>&nbsp;</label>
    	<input id="yes_btn" type="button" class="btn" value="确认" onclick="location.href='/ares/txt/auditA?id=${auditingTxt['id']}'"/>
    	
    </li>
    <li style="position: absolute;left: 500px;">
    	<label>&nbsp;</label>
    	<input id="no_btn" type="button" class="btn" value="驳回" onclick="location.href='/ares/txt/auditB?id=${auditingTxt['id']}'"/>
    </li>
    </ul>
    
    
    </div>
</body>
</html>
