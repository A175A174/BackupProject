<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Search-Max</title>
		<style type="text/css">
			#s-m ul{
				list-style: none;
				padding: 0;
				margin: 0;
			}
			#s-m li{
				display: inline-block;
			}
			#s-m input[type="text"]{
				width: 375px;
				height: 35px;
				border: #FF0036 3px solid;
				outline: none;
				padding-left: 0.5em;
			}
			#s-m a{
				width: 80px;
				height: 35px;
				background-color: #FF0036;
				color: #FFFFFF;
				border: none;
				font-size: 1.2em;
				border-radius: 0;
				position: relative;
				top: -1px;
				text-decoration: none;
			}
			#s-m a:hover {
				cursor: pointer;
			}
		</style>
	</head>
	<body>
		<div class="container" id="s-m" style="min-width: 1170px;margin-top: 20px;margin-bottom: 20px;">
			<ul>
				<li style="width: 19%;">
					<img src="assets/images/Login.png" height="20px" width="145px"/>
				</li>
				<input type="hidden" value="${u.sellercode}" id="sellerida" />
				<li style="width: 30%;"><a onclick="jrdp('${u.sellercode}')" style="background-color: #FFFFFF;color: #000000;">${u.name}(点击进入店铺)</a></li>
				<li style="width: 50%;">
					<input id="vals" type="text" placeholder="搜索 天猫 商品/品牌/店铺"/><a onclick="searchs()" class="btn">搜天猫</a>
					<a onclick="searchsbyshop()" class="btn" style="background-color: #000000;">搜本店</a>
				</li>
			</ul>
		</div>
	</body>
	<script>
		//天猫搜索
		function searchs(){
			if($("#vals").val() != ""){
				window.location.href = "search.jsp?name="+$("#vals").val();
			}else{
				window.location.href="index";
			}
		}
		//店内搜索
		function searchsbyshop(){
			if($("#vals").val() != ""){
				if($("#sellerida").val() != null && $("#sellerida").val() != ""){
					window.location.href = "search-shop.jsp?name="+$("#vals").val()+"&sellerid="+$("#sellerida").val();				
				}else{
					window.location.href = "search-shop.jsp?name="+$("#vals").val()+"&sellerid="+$("#selleridb").val();
				}
			}else{
				window.location.href="index";
			}
		}
		//进入店铺
		function jrdp(sx){
			if(sx != ""){
				window.location.href="myshop?sellerid="+sx;;
			}else{
				window.location.href="myshop?sellerid="+$("#selleridb").val();
			}
		}
	</script>
</html>