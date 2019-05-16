<!--分栏目头条模块 -->
<#macro  partHeadline  >
	<script type="text/javascript">
		var partid=request("id");
		$(document).ready(function(){
		$.ajax({
			 url:"/ares/report/partHeadline",
			 type:"GET",
			 data:{"partid":partid},
			 dataType:"json",
			 success:function(data){
					$(".headlinetitle").html(data.cms_part_name);
					$("#tout").html(data.cms_news_name);
					$("#tout").attr("href","/ares/view/news/newscontent?id="+data.id);
					$("#touurl").attr("href","/ares/view/news/newscontent?id="+data.id);
					$("#toutime").html(data.cms_news_ptime);
					$("#touhits").html(data.cms_news_hits);
					$("#toudisc").html(data.cms_news_disc);
					$("#partheadlineimg").attr("src",data.cms_news_imgurl);
			 }
		});
	});
	</script>
	<div class="block_breadcrumbs">
    	<div class="text"><p>您所在的位置:</p></div>
        
        <ul>
        	<li><a href="/ares/view/news/aresindex">首页</a></li>
            <li class="headlinetitle"></li>
        </ul>
    </div>
    <div class="separator" style="height:20px;"></div>
    
    <h2 class="headlinetitle"></h2>
    
    
    <div class="line_4" style="margin:0px 0px 18px;"></div>
    
    <article class="block_topic_post_feature">
    	<div class="f_pic"><a href="" class="general_pic_hover scale" id="touurl"><img id="partheadlineimg" src="" style="height: 170px;width: 280px;" alt="" /></a></div>
        
        <div class="content">
        	<p class="title"><a href="" id="tout"></a></p>
            
            <div class="info">
            	<div class="date"><p id="toutime"></p></div>
                
                <div class="r_part">
                	<div class="category"><p><a class="headlinetitle"></a></p></div>
                    <a  class="views" id="touhits"></a>
                </div>
            </div>
                
            <p class="text" id="toudisc"></p>
        </div>
        
        <div class="clearboth"></div>
    </article>
    
    <div class="line_2" style="margin:21px 0px 21px;"></div>		
</#macro>	