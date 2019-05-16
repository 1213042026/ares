<!--头条模块  -->
<#macro  topnews divid partid>
<script  id="thetmp1" type="text/x-jsrender">
  {{for  #data }}
	   <li>
	    	<div class="slide">
	            <a href="/ares/view/news/newscontent?id={{:id}}"><img src="{{:cms_news_imgurl}}" alt="" style="height: 280px;width: 610px;" /></a>
	            <div class="caption">
	                <a href="/ares/view/news/newscontent?id={{:id}}"><p class="title">{{:cms_news_name}}</p>
	                <p>{{:cms_news_disc}}</p>
	            	</a>
	            </div>
	        </div>
	    </li>
   {{/for}}	
</script>
<script type="text/javascript">
	$(document).ready(function(){
		$.ajax({
			 url:"/ares/report/selectnews",
			 type:"GET",
			 data:{"partid":${partid}},
			 dataType:"json",
			 success:function(data){
				var html = $("#thetmp1").render(data); 
				$("#${divid}").append(html);
				$('#home_slider').flexslider({
					animation : 'slide',
					controlNav : true,
					directionNav : true,
					animationLoop : true,
					slideshow : false,
					useCSS : false
			});
					
			 }
		});
	});
</script>
<div class="block_special_topic">
	<div class="type"><p>时事要闻：</p></div>
    <div class="title"><p></p></div>
</div>
<div class="block_home_slider">
	
    <div class="separator" style="height:17px;"></div>
    <div id="home_slider" class="flexslider">
         <ul class="slides" id="${divid}">
                          	
     	</ul>
    </div>
                            
    
</div>
<div class="line_2" style="margin:34px 0px 28px;"></div>
	 	
</#macro>	