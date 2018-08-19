<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Search-Min</title>
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
			}
		</style>
	</head>
	<body>
		<div class="container" id="s-m" style="margin-top: 20px;margin-bottom: 20px;">
			<ul>
				<li style="width: 50%;">
					<img src="assets/images/Login.png" height="20px" width="145px"/>
				</li>
				<li style="width: 49%;">
					<input id="vals" value="${param.name}" type="text" placeholder="搜索 天猫 商品/品牌/店铺"/><a onclick="searchs()" class="btn">搜天猫</a>
				</li>
			</ul>
		</div>
	</body>
	<script>
		function searchs(){
			if($("#vals").val() != ""){
				window.location.href = "search.jsp?name="+$("#vals").val();
			}else{
				window.location.href="index";
			}
		}
	</script>
</html>