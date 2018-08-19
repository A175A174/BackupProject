<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Head-Search</title>
		<style>
			#h-s ul{
				list-style: none;
			}
			#h-s li{
				display: inline-block;
			}
			#h-s input[type="text"]{
				height: 30px;
				padding: 5px 3px 5px 5px;
				margin-top: 12px;
				width: 100%;
			}
			#h-s button{
				background-color: #FE0C3F;
				border: none;
				padding: 0;
				margin: 0;
				width: 90px;
				height: 32px;
				color: #FFFFFF;
				font-size: 1.3em;
			}
			#nav a{
				display: block;
				height: 36px;
				width: 36px;
				line-height: 1em;
				background-color: #626262;
				color: #FFFFFF;
				text-decoration: none;
				cursor: pointer;
				text-align: center;
				padding-top: 4px;
				margin: 1px 0;
			}
			#nav a:hover{
				background-color: #19C8A9;
			}
		</style>
	</head>
	<body>
		<div id="h-s" style="z-index: 100;background-color: #FE0C3F;display: none;position: fixed;top: 0px;width: 100%;">
			<div class="container" style="height: 50px;min-width: 700px">
				<ul>
					<li style="width: 20%;">
						<img src="assets/images/head-6.png"/>
					</li>
					<li style="width: 50%;">
						<input id="s" type="text" placeholder="搜索 天猫 商品/品牌/店铺"/>
					</li>
					<li>
						<button id="ss" type="button">搜索</button>
					</li>
				</ul>
			</div>
		</div>
		<div id="nav" class="container" style="z-index: 100;display: none;">
			<div style="position: relative;left: -45px;">
				<div style="width: 36px;position: fixed;bottom: 20%">
					<a style="background-color: #FF0036;line-height: 36px;padding-top: 0px;">导航</a>
					<a style="display: none;">天猫超市</a>
					<a style="display: none;">天猫国际</a>
					<a onclick="hd('kw')">潮电酷玩</a>
					<a onclick="hd('ml')">美丽人生</a>
					<a onclick="hd('jj')">居家生活</a>
					<a onclick="hd('ac')">打造爱巢</a>
					<a onclick="hd('hw')">户外出行</a>
					<a onclick="hd('xh')">猜你喜欢</a>
					<a id="top" style="background-color: #ABABAB;line-height: 23px;padding-top: 0px;">
						<span class="glyphicon glyphicon-chevron-up" style="display: block;"></span>顶部
					</a>
				</div>
			</div>	
		</div>
	</body>
	<script>
		//搜索事件
		$("#ss").click(function(){
			var s = $("#s").val();
			if(s != "" && s!= null){
				window.location.href="search?name="+s;
			}
		});
		//导航（带过度动画）
		function hd(s){
		    $("html, body").animate({scrollTop: $("#"+s).offset().top-50 + "px"},200);
		}
		//回顶部（带过度动画）
		$('#top').click(function smoothscroll(){
			//window.scrollTo(0,0);
			var currentScroll = document.documentElement.scrollTop || document.body.scrollTop;
		    if (currentScroll > 0) {
		         window.requestAnimationFrame(smoothscroll);
		         window.scrollTo(0,currentScroll - (currentScroll/5));
		    }
		});
		//搜索框和导航框自动显示
		window.onscroll = function(){
			var t = document.documentElement.scrollTop || document.body.scrollTop;
			var hs = document.getElementById('h-s');
			var nav = document.getElementById('nav');
			if(t>600){
				nav.style.display="block";
			}else{
				nav.style.display="none";
			}
			if(t>900){
				hs.style.display="block";
			}else{
				hs.style.display="none";
			}
		}
	</script>
</html>