<!--新闻评论模块 -->
<#macro  newscomments>
	
	<script  id="newscomments" type="text/x-jsrender">
	  {{for  #data }}
		<div class="comment">
	    	<div class="userpic"><a><img src="/ares/static_news/images/ava_default_1.jpg" alt="" /></a></div>
	        <div class="content">
	        	<p class="name"><a>{{:usernickname}}</a></p>
	            <p class="info"><span class="date">{{:cms_disc_time}}</span></p>
	            <p class="text">{{:cms_disc_content}}</p>
	        </div>
	        <div class="clearboth"></div>
	        <div class="line_3"></div>
	       
	    </div>
	  {{/for}}	
	</script>
	<script type="text/javascript">
		var newsid=request("id");
		$(document).ready(function(){
			scomments(newsid);
		});
		function morecom(){
			var cpage=$("#morecomments").attr("value");
			cpage=parseInt(cpage)+1;
			scomments(newsid,cpage);
		}
		function scomments(_newsid,_cpage){
			$.ajax({
				 url:"/ares/report/selectcomments",
				 type:"POST",
				 data:{"newsid":_newsid,"cpage":_cpage},
				 dataType:"json",
				 success:function(data){
				 	$("#commentsrows").html("共"+data.rows+"评论");
				 	$("#morecomments").attr("value",data.cpage);
				 	if(data.cpage==data.totalpage){
				 		$("#morecomments").attr("onclick","");
				 		$("#morecomments").html("没有更多评论");
				 	}else{
				 		$("#morecomments").attr("onclick","morecom()");
				 		$("#morecomments").html("查看更多评论");
				 	}
				 	
					var html = $("#newscomments").render(data.list); 
					$("#div_comments").append(html);
						
				 }
			});
		};
		function sendcomments(){
			var comments=$("#comcontent").val();
			$.ajax({
				 url:"/ares/report/comments",
				 type:"POST",
				 data:{"newsid":newsid,"comments":comments},
				 dataType:"json",
				 success:function(data){
				 	$("#div_comments").empty();
				 	$("#comcontent").attr("value","");
					scomments(newsid);
				 }
			});
			
		}
	</script>
	<div class="block_comments" >
		<div class="block_leave_reply">
			<h3>我的回帖</h3>
			<form class="w_validation"/>
		    	<p>回帖内容</p>
		        <div class="textarea"><textarea id="comcontent" cols="1" rows="1" placeholder="在这里输入评论内容" value=""></textarea></div>
		        
		        <input type="button" class="general_button" onclick="sendcomments()" value="点赞" />
		    </form>
		</div> 
		<h2 id="commentsrows"></h2>
	   	<div id="div_comments">
	   		
	   	</div>
	    <div style="width:200px;height:20px;height-line:20px;margin:0 auto;margin-top:10px">
	    	<a href="javascript:void(0)" class="control" id="morecomments" value="" onclick="" style="color:black"></a>
	    </div>
	    
	</div>
	
	<div class="separator" style="height:30px;"></div>
	
	
</#macro>	