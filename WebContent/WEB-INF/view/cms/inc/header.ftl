
	<div class="top" >
		<div class="topleft">
		   	 <a href="/ares/view/cms/main" target="_parent"><img src="/ares/static_hou/img/tu.jpg" title="系统" /></a>
		</div>
		<ul class="nav">
			<li><a href="/ares/view/cms/worktop" target="rightFrame"><img src="/ares/static_hou/img/icon01.png" title="工作台" id="worktop_a" /><h2>工作台</h2></a></li>
			<li><a href="/ares/view/cms/main?type=lmgl&frameurl=/ares/inc/cms/viewcolunmright"><img src="/ares/static_hou/img/icon02.png" title="栏目管理" /><h2>栏目管理</h2></a></li>
			<li><a href="/ares/view/cms/main?type=wzgl&frameurl=/ares/txt/select" ><img src="/ares/static_hou/img/icon03.png" title="文章管理" /><h2>文章管理</h2></a></li>
			<li><a href="/ares/user/select" target="rightFrame" id="user_a"><img src="/ares/static_hou/img/icon04.png" title="用户管理" /><h2>用户管理</h2></a></li>
			<li><a href="/ares/data/select" target="rightFrame" id="worktop_b"><img src="/ares/static_hou/img/icon05.png" title="数据" /><h2>数据</h2></a></li>
		</ul>
		<div class="topright">    
			<ul>
				<li><a href="/ares/view/news/aresindex">【查看首页】</a></li>
				<li><a href="/ares/login/logincmsout">退出</a></li>
			</ul>
			<div class="user">
				<a href="/ares/user/selectuserImf?id=${loginUser['id']}" target="rightFrame"><span>${loginUser['cms_user_nickname']}</span></a>
				<a href="/ares/message/selectall" target="rightFrame">
					<i>宝贵意见</i>
				    <b id="messagerows"></b>
				</a>
				
			   	
			</div>    
		</div>
	</div>
