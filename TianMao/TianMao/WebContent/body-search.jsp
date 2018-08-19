<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Body-Search</title>
		<style>
			#b-s li{
				display: inline-block;
				color: #999999;
			}
			#b-s ul{
				width: 100%;
				padding: 0;
				margin: 0;
			}
			/*搜索栏下热搜关键字样式*/
			#rs li{
				padding: 4px 12px 0px 12px;
				cursor: pointer;
			}
			/*搜索框*/
			#ss input[type='text']{
				border: 2px #FF0036 solid;
				border-right: none;
				outline: none;
				padding: 5px;
				width: 493px;
				height: 40px;
				color: #000000;
				padding-left: 0.5em;
			}
			#ss a{
				background-color: #FF0036;
				border: none;
				padding: 0;
				width: 123px;
				height: 40px;
				line-height: 40px;
				color: #FFFFFF;
				font-size: 1.2em;
				font-weight: bold;
				border-radius: 0;
				position: relative;
				top: -1px;
			}
			/*横向导航栏*/
			#hd li{
				color: #333333;
				font-size: 1.2em;
				padding: 0 6px;
				cursor: pointer;
			}
			li a{
				color: #333333;
				text-decoration: none;
			}
			#hd li:hover{
				color: #FF0036;
			}
		</style>
	</head>
	<body>
		<div id="b-s">
			<div class="container">
				<div style="min-width: 1000px">
					<ul>
						<li style="width: 25%;height: 130px;float: left;">
							<img src="assets/images/Logo-480-260.png" width="240px" height="130px" />
						</li>
						<li style="width: 60%;height: 130px;padding-top: 38px;float: left;">
							<div style="height: 36px;width: 623px;" class="center-block">
								<div id="ss">
									<input id="vals" type="text" placeholder="搜索 天猫 商品/品牌/店铺"/><a onclick="searchs()" class="btn">搜索</a>
								</div>
								<div id="rs">
									<ul>
										<li style="color: #FF0036;padding-left: 0;"><a>针织衫</a></li>|
										<li><a>羽绒服</a></li>|
										<li><a>四件套</a></li>|
										<li style="color: #FF0036;"><a>电动牙刷</a></li>|
										<li><a>客厅灯</a></li>|
										<li><a>口红</a></li>|
										<li style="color: #FF0036;"><a>手机</a></li>|
										<li><a>运动鞋</a></li>|
										<li style="color: #FF0036;padding-right: 0;"><a>牛奶</a></li>
									</ul>
								</div>
							</div>
						</li>
					</ul>
					<div class="clearfix"></div>
				</div>
				<div id="hd">
					<ul>
						<li class="text-center" style="line-height: 36px;width: 18%;background-color: #FF0036;">
							<img class="pull-left" src="assets/images/head-5.png"/>
							<a style="color: #FFFFFF;font-weight: bold;text-decoration: none;">商品分类</a>
						</li>
						<li>
							<a>
								<img style="margin-bottom: 3px;" src="assets/images/head-3.png" width="100px" height="30px"/>
							</a>
						</li>
						<li>
							<a>
								<img style="margin-bottom: 3px;" src="assets/images/head-4.png" width="100px" height="30px"/>
							</a>
						</li>
						<li><a>天猫会员</a></li>
						<li><a>电器城</a></li>
						<li><a>喵鲜生</a></li>
						<li><a>医药馆</a></li>
						<li><a>营业厅</a></li>
						<li><a>魅力惠</a></li>
						<li><a>飞猪旅行</a></li>
						<li><a>苏宁易购</a></li>
					</ul>
				</div>
			</div>
		</div>
	</body>
	<script>
		$("#rs a").click(function(){
			window.location.href="search?name="+this.innerText;
		});
		$("#hd a").click(function(){
			window.location.href="search?name="+this.innerText;
		});
		function searchs(){
			if($("#vals").val() != ""){
				window.location.href = "search.jsp?name="+$("#vals").val();
			}else{
				window.location.reload();
			}
		}
	</script>
</html>