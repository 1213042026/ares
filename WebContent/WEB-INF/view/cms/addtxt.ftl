<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="/ares/static_hou/css/style.css" rel="stylesheet" type="text/css" />
<link href="/ares/static_hou/css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/ares/static_hou/js/jquery.js"></script>
<script type="text/javascript" src="/ares/static_hou/js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="/ares/static_hou/js/select-ui.min.js"></script>
<script type="text/javascript" src="/ares/static_hou/editor/kindeditor.js"></script>
<script type="text/javascript" src="/ares/static_hou/js/ajaxfileupload.js"></script>



<script type="text/javascript">
    KE.show({
        id : 'content7',
        cssPath : './index.css'
    });
  </script>
  
<script type="text/javascript">
$(document).ready(function(e) {
    $(".select1").uedSelect({
		width : 345			  
	});
	$("#mybtn").click(function(){
		//传入一个非query对象
  	 $.ajaxFileUpload({
	          url:'/ares/updataImg/img',
	         //url:basePath + "uploadApk.do?apkIntroduce="+apkIntroduce,
	          secureuri:false,   				 //是否启用安全提交,默认为false
	          dataType : 'text',                   
	          fileElementId:'apkFile',           //文件选择框的id属性
	          success:function(data){
	          	var _data = $.parseJSON($(data).text());
	         	if('fail'==_data){
	         		alert("请选择图片");
	         	}else{
	         	 $("#img").attr('src',_data.flag);
	         	 $("#TXTimg").attr('value',_data.flag);
	         	}
	         	
	          },
	          error:function(data, status, e){
	          }
		});
	});
});

</script>
</head>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="/ares/view/cms/worktop">首页</a></li>
    <li><a href="/ares/txt/select">文章</a></li>
    <li><a href="#">添加文章</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    
    <div id="usual1" class="usual"> 
    
    <div class="itab">
  	<ul> 
    <li><a href="#tab1" class="selected">文章详情</a></li> 
  	</ul>
    </div> 
    
  	<div id="tab1" class="tabson">
    
    <form action="/ares/txt/addtxt" method="post">
    	
    <ul class="forminfo">
    <li><label>文章标题<b>*</b></label>
    <input name="TXTtitle" type="text" class="dfinput" placeholder="请填写文章标题"  style="width:518px;"/></li>
    <li><label>文章描述<b>*</b></label>
    <input name="TXTdisc" type="text" class="dfinput" placeholder="请填写文章描述"  style="width:518px;"/></li>
    <li><label>文章类型<b>*</b></label>  
    <div class="vocation">
    <select class="select1" name="TXTtype">
    <option>文本</option>
    <option>图文</option>
    <option>图片</option>
    </select>
    </div>
    
    </li>
     <li><label>所属栏目<b>*</b></label>  
    <div class="vocation">
    <select class="select1" name="TXTlm" >
    <#list part_name as pname>
    <option>${pname['cms_part_name']}</option>
    </#list> 
    </select>
    </div>
    
    </li>
 
    <li><label>添加图片<b>*</b></label>
    <input type="file" id="apkFile" name="apkFile" accept="image/png,image/gif,image/jpeg"/>
    <input type="button" id="mybtn" value="上传"/>
    </li>
     
     <li>
	<input name='TXTimg' id="TXTimg" type="hidden" value="">
    <img id="img" style="width: 200px;height: 200px;margin-left:90px;"/>
   
     </li>
     
    <li><label>文章内容<b>*</b></label>
    <textarea id="content7" name="content" style="width:700px;height:250px;visibility:hidden;"></textarea>
    
    </li>
    <li><label>&nbsp;</label>
    <input name="" type="submit" class="btn" value="马上发布"/>
    </li>
    </ul>
    </form>
    </div> 
  	
	</div> 
	
	<script type="text/javascript"> 
      $("#usual1 ul").idTabs(); 
    </script>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
    </div>
</body>

</html>
