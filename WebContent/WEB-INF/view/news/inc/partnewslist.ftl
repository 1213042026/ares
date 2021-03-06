<!--分栏目新闻列表  -->
<#macro  partnewslist>
	<script  id="partnewslist" type="text/x-jsrender">
	  {{for  #data }}
			<article class="block_topic_post" onmouseover="init_pic_hover()" style="height:300px">
	              <p class="title"><a href="/ares/view/news/newscontent?id={{:id}}">{{:cms_news_name}}</a></p>
	              <div class="f_pic"><a href="/ares/view/news/newscontent?id={{:id}}" class="general_pic_hover scale"><img src="{{:cms_news_imgurl}}" alt="" style="height: 130px;width: 250px;"/></a></div>
	              <p class="text">{{:cms_news_disc}}</p>
	              <div class="info">
	                   <div class="date"><p>{{:cms_news_ptime}}</p></div>                
	                   <div class="r_part">
	                   		<div class="category"><p><a>{{:cms_part_name}}</a></p></div>
	                        <a class="views">{{:cms_news_hits}}</a>
	                   </div>
	             </div>
       		</article>
		
	   {{/for}}	
	</script>
	<script type="text/javascript">
		var partid=request("id")
		$(document).ready(function(){
			bypage(partid);
		});
		function  firstpage(){
			bypage(partid);
		}
		function  lastpage(){
			var last=$("#lastnewspage").attr("value");
			bypage(partid,last);
		}
		function  previouspage(){
			var cpage=$("#cpage").attr("value");
			cpage=parseInt(cpage)-1;
			bypage(partid,cpage);
		}
		function  nextpage(){
			
			var cpage=$("#cpage").attr("value");
			cpage=parseInt(cpage)+1;
			bypage(partid,cpage);
			
		}
		function  bypage(_partid,_cpage){
			$.ajax({
					 url:"/ares/report/partnewslist",
					 type:"GET",
					 data:{"partid":_partid,"cpage":_cpage},
					 dataType:"json",
					 success:function(data){
					 	$("#cpage").text("当前位于第"+data.cpage+"页");
					 	$("#cpage").attr("value",data.cpage);
					 	$("#totalpage").text("共"+data.totalpage+"页");
					 	$("#rows").text("共"+data.rows+"条");
					 	$("#lastnewspage").attr("value",data.totalpage);
					 	var tpage=parseInt(data.totalpage);
					 	if(data.cpage!=1){
					 		$("#previouspage").attr("onclick","previouspage()");
					 		$("#previouspage").attr("href","#");
					 		$("#previouspage").attr("style","color:black");
					 	}else{
					 		$("#previouspage").attr("onclick","");
					 		$("#previouspage").attr("href","javascript:void(0)");
					 		$("#previouspage").attr("style","color:grey");
					 	}
					 	if(data.cpage!=tpage){
					 		$("#nextpage").attr("style","color:black");
					 		$("#nextpage").attr("onclick","nextpage()");
					 		$("#nextpage").attr("href","#");
					 	}else{
					 		$("#nextpage").attr("onclick","");
					 		$("#nextpage").attr("href","javascript:void(0)");
					 		$("#nextpage").attr("style","color:grey");
					 		
					 	}

						
						var html = $("#partnewslist").render(data.list); 
						$("#partlist").empty();
						$("#partlist").append(html);	
					 }
				});
		}
		
		
		
	</script>
	<div class="block_topic_news" id="partlist">
                             
    </div>
    
    <div class="line_2" style="margin:25px 0px 25px;"></div>
    
    
        
    <div class="block_top_menu">
    	<ul>
        	<li>
        		<a href="javascript:void(0)" onclick="firstpage()" class="open_popup" style="color:black">首页</a>
        	</li>
            <li>
            	<a href="javascript:void(0)" style="color:black" id="totalpage"></a>
            	</li>
            <li>
            	<a href="javascript:void(0)" style="color:black" id="rows"></a>
            </li>
            <li>
            	<a href="javascript:void(0)" style="color:black" id="cpage" value=""></a>
            </li>
            <li>
            	<a href="javascript:void(0)" onclick="lastpage()" class="open_popup" style="color:black" id="lastnewspage" value="">尾页</a>
            </li>
            <li>
            	<a href="" onclick="" id="previouspage" style="">上一页</a>
            </li>
            <li>
            	<a href="" onclick="" id="nextpage" style="">下一页</a>
            </li>
        </ul>
    </div>
    
    <div class="clearboth"></div>
    
        
        
    		
</#macro>	