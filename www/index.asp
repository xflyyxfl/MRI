<!DOCTYPE html>
<!--HTML5 doctype-->
<html>

    <head>

        <title>NMR虚拟教学实验</title>
		
        <meta http-equiv="Content-type" content="text/html; charset=utf-8">
		
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0">
		
        <meta name="apple-mobile-web-app-capable" content="yes" />
        <meta http-equiv="Pragma" content="no-cache">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
		
		
		
        <link rel="stylesheet" type="text/css" href="style/icons.css" /><!-- 图标样式 -->
        <link rel="stylesheet" type="text/css" href="style/af.ui.css" /><!-- 基本样式 -->

        
		<script type="text/javascript" charset="utf-8" src="script/common.min.js"></script>
		
		
		<script type="text/javascript" charset="utf-8" src="script/af.plugins.min.js"></script>
		

        <script type="text/javascript">
            
           
			var webRoot = "./";
           
			$.ui.animateHeaders=false;		//禁用头部切换动画。使页面看起来更流畅
            $.ui.useOSThemes=false;			//关闭自动选择皮肤
			$.ui.autoLaunch = false;		//关闭自动初始化
            $.ui.openLinksNewTab = false;	//禁止新标签页打开链接
            $.ui.splitview=false; 			//分割视图 主要作用在平板的情况，如果开启的话，平板会默认展开侧边菜单
			$.ui.resetScrollers=false;		//详细页面回到列表页时，页面不回到顶部
           

            var init = function init() {//这种方式可以更好的控制框架初始化
				//这里设置了2秒的延时
				setTimeout(function(){
					$.ui.launch();
				},2000)
			};
			document.addEventListener("DOMContentLoaded", init, false);
			
			//toggle类似效果封装
			function showHide(obj, objToHide) {
                var el = $("#" + objToHide)[0];

                if (obj.className == "expanded") {
                    obj.className = "collapsed";
                } else {
                    obj.className = "expanded";
                }
                $(el).toggle();
            }
			
			
			//桌面模拟触摸事件，仅作测试用！【打包发布请删除】，此js库会导致部分事件响应两次！
            if (!((window.DocumentTouch && document instanceof DocumentTouch) || 'ontouchstart' in window)) {
                var script = document.createElement("script");
                script.src = "plugins/af.desktopBrowsers.js";
                var tag = $("head").append(script);
            }
			
			
			
			//  sessionstorage 与  localStorage 的区别在于  （两个方式的存储容量一般都为 5M 大小，基本上足够使用了）
			//  sessionstorage 关闭浏览器就清除了。是一个临时储存的数据
			//  localStorage  是一个趋于永久的缓存数据，不手动清除，就一直存在
			
			//写入sessionstorage缓存 关闭浏览器自动清除
			function setSS(key,data){
				sessionStorage.setItem(key,data);
			}

			//读取sessionstorage缓存
			function getSS(key){
				return sessionStorage.getItem(key);
			}

			//设置缓存数据
			function setLS(key,data){
				console.log( key + '已写入缓存' );
				localStorage.setItem(key,data);
			}

			//读取缓存数据
			function getLS(key){
				return localStorage.getItem(key);
			}

			//获取时间戳的方法
			function getTimestamp(){
				var timestamp1 =Date.parse(new Date());
				return timestamp1/1000;
			}
			
			
			//这里写一个检测 缓存是否过期的方法
			//这里应该还能优化一下，获取数据需要优先判断是否有网络，如果有网络再比对数据的时间戳，无网络就一直获取缓存
			function ls_data(){
				
				//这里的作用为获取 localStorage 缓存的数据。
				//第一个第二个 getLS 是直接获取
				//第三个 为先获取当前的时间 然后获取 写入缓存的时间的出来的数值如果小于 86400S （一天，可以自己设置） 的话就直接从缓存中拿去数据
				if( getLS("ls_data") && getLS("ls_data_time") && ( getTimestamp() - getLS("ls_data_time") ) < 86400 ){
				
					var ls_htmls = getLS("ls_data");
					$("#wrap_id").append( ls_htmls );
				
				}else{ //反之如果 写入缓存的时间的出来的数值如果 大于 86400S  的话，就重新从网络中获取数据,并更新到缓存
						
				
					$.jsonP({
						url:"http://www.qdkf.net/jsonp.php?func=test&callback=?",/*json数据请求地址*/
						success:function(data){	//请求成功
							//coding...
							var htmls = ''; //定义一个变量存放数据
							var jsondata = data['data'];//[]里面的是json的数组名
							
							//我们以一个最简单的循环为栗子
							for( var i=0; i<jsondata.length; i++ ){
								htmls +=" <li><a href='#'>" + "文章ID=" + jsondata[i].cid + "标题：" + jsondata[i].title +  "</a></li>";
							}
							
							$("#jsdata").append( htmls ); 	//直接写入数据。也可以使 html() 
							
							console.log('数据获取成功');
							
							//正确插入数据之后将数据写入缓存之中
							//第一个参数为自定义的 key 值，可以理解为数据的名称
							//第二个参数为存储数据的 变量名 （ 或 函数 ）
							setLS('ls_data',htmls );
							setLS('ls_data_time', getTimestamp() );
							//注意，写入数据之后还要写入一个数据插入时间
							
						},
						error:function(){		//请求失败
							//失败的话也可以做一些处理。
							//将错误信息输出到页面之类的
							console.log('数据请求失败，请联系开发人员');
						}
					})
					
				}
				
			}
			
			function check_nmr1(){
				if(confirm("实验一有完成吗？")){return true;}
				return false;
			};
			
			function m(a_){
				
				$.ui.showMask(a_);
				setTimeout($.ui.hideMask,2000);
				
			}
                
        </script>
		
		<!-- 使用appcan打包的话请引入下面的js ，此js为 appcan 核心js  -->
		
		<!-- <script type="text/javascript" src=" appcan的js目录/zy_control.js"></script> -->

</head>


<body>
	
	
	<!-- 可以给 #afui写样式应用皮肤 -->
	<div id="afui" class="bb">
	
		<!-- 如果没有执行 $.ui.launch();的话，那么会一直显示该启动页直到使用  $.ui.launch(); 初始化完成 -->
		<div id="splashscreen" class='ui-loader heavy'>
			<br />
			<br />
			<span class='ui-icon ui-icon-loading spin'></span>
			<br />
			<br />
			<h1>请稍等，加载初始化</h1>
						
			<br />
			<br />
            <br />
			<br />
            <br />
			<br />
			<h1>上海培云教育科技有限公司</h1>
		</div>
		
		<!-- 默认公用头部 -->
		<!-- 如果需要使用不同的头部 需要使用 <header></header> 标签并指定 id -->
<!--		<div id="header">
			<a id='menubadge' onclick='af.ui.toggleSideMenu()' class='menuButton'></a>
		</div>-- xfl mask it-->
		
        			
				<!-- 内容有两种方式写入 -->
				<!-- 第一种直接写在  panel 里面 -->
				<!-- 比如这样 -->
       
        
        
		
		<!-- 内容区域 所有的内容必须在这区域内 -->
		<div id="content">
        
  
			
			
			<!-- 这里是面板 -->
			<!-- 面板是jqmobi的重点，我们的内容都放在面板中 -->
			<!-- 面板为一个样式为 panel 的 div <div class="panel"></div> -->
			<!-- data-title 可以控制顶部标题显示的内容 -->
			<!-- selected="true" 默认选中,只能存在一个,即默认第一个载入的面板 -->
			<!-- data-load="function" 面板加载时使用的函数 -->
			<!-- data-unload="function" 面板退出的时候（切换到别的页面的时候）使用的函数 -->
			<!-- data-tab="ID" 控制默认底部菜单高亮 -->
			<!-- data-defer="xx.html" 异步加载的页面  -->
			<!-- data-transition="" 可选参数为 slide\up\down\pop\flip\fade  页面转场动画效果  作用于A连接上-->
			<!-- data-nav="navid" 控制侧边菜单 可选参数 ID或者 none(不显示) -->
			<!-- data-header="headerid" 控制头部菜单 可选参数 ID或者none(不显示) -->
			<!-- data-footer="footerid" 控制底部菜单 可选参数 ID或者none(不显示) -->
			
			<!-- 这里是一个最基本的数据请求方式 -->
			<script type="text/javascript">
				
				function loadedPanel(){
					//$.ui.showMask('加载数据中'); //调用一下载入图案
					$.jsonP({
						url:"http://www.qdkf.net/jsonp.php?func=test&callback=?",/*json数据请求地址*/
						success:function(data){	//请求成功
							
							var htmls = ''; //定义一个变量存放数据
							var jsondata = data['data'];//[]里面的是json的数组名
							
							//我们以一个最简单的循环为栗子
							for( var i=0; i<jsondata.length; i++ ){
								htmls +=" <li><a href='#'>" + "文章ID=" + jsondata[i].cid + "标题：" + jsondata[i].title +  "</a></li>";
							}
							
							$("#jsdata").append( htmls ); 	//直接写入数据。也可以使 html() 方法 或者别的
							
							$.ui.hideMask(); //数据加载完毕需要清除掉载入动画
						},
						error:function(){		//请求成失败
							$.ui.hideMask(); //数据加载完毕需要清除掉载入动画
							alert('数据请求失败，请联系开发人员');
						}
					})
				}
				
			</script>
			
	<div title='NMR虚拟教学实验学生登录系统' id="main" class="panel" selected="true" data-load="loadedPanel" data-unload="check_nmr1" data-tab="navbar_home">
				<!-- 内容有两种方式写入 -->
				<!-- 第一种直接写在  panel 里面 -->
				<!-- 比如这样 -->
                <br>
<form method="post" action="demoform.asp">
      <div data-role="fieldcontain">
        <label for="student_name">姓名：</label>
        <input type="text" name="student_name" id="student_name" data-inline="true">   
        
         <label for="student_num">学号：</label>
        <input type="text" name="student_num" id="student_num">
        
        <label for="student_pwd">密码：</label>
        <input type="password" name="student_pwd" id="student_pwd" placeholder="如果忘记了请联系..">
      </div>
      <input type="submit"  value="提交"  style="position:absolute" onClick="m('xfl')"></form>

			</div>

			
			<!-- 这里为了便于管理加载到另外一个页面上 -->

			
		</div>
					<div id="page" class="panel" data-defer="page.html" data-header="page_header" data-footer="page_footer"></div>
			
		<!-- 默认公用页脚 -->
		<!-- 如果需要使用不同的页脚 需要使用 <footer></footer> 标签并指定 id -->
		<div id="navbar">
			<a href="#main" id='navbar_home' class='icon home' data-transition="up">主页<!-- <span class='af-badge lr'>3</span>--></a>
			<a href="#page" id='navbar_js' class="icon target" data-transition="down">实验一</a>
			<a href="#page" id='navbar_ui' class="icon picture" data-transition="pop">实验二</a>
			<a href="#page" id='navbar_plugins' class="icon key" data-transition="fade">测试</a>
		</div>
		
		<!-- 这是一个不一样的头部 -->
		<header id="page_header">
			<a  class='backButton button'>Back</a>
                <h1>射频中心频率的确定</h1>
            <a class="button icon settings" style="float:right">Button</a>
		</header>
		
		<!-- 这是一个不一样的脚部 -->
		<footer id="page_footer">
			<a href="#main" id='navbar_home' class='icon home'  data-transition="down">主页 <!--<span class='af-badge lr'>3</span>--></a>
			<a href="#page" id='navbar_js' class="icon target" data-transition="slide">实验一</a>
		</footer>
		
		<!-- 左侧边栏 -->
		<nav>
			<p>左侧边栏</p>
		</nav>
		
		<!-- 右侧边栏 -->
		<aside>
			<p>右侧边栏</p>
		</aside>
		
	</div>
	
	
	

	
</body>
</html>



