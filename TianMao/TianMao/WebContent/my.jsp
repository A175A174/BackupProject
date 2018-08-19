<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>My</title>
		<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
		<script type="text/javascript" src="assets/js/jquery-3.3.1.min.js" ></script>
		<script type="text/javascript" src="assets/js/bootstrap.min.js" ></script>
		<link href="assets/images/icon.png" rel="shortcut icon" type="image/x-icon">
		<link href="assets/images/icon.png" rel="icon" type="image/x-icon">
		<link href="assets/images/icon.png" rel="bookmark" type="image/x-icon">
		<link rel="stylesheet" href="assets/css/bootoast.css" />
		<script type="text/javascript" src="assets/js/bootoast.js" ></script>
		<script type="text/javascript" src="assets/js/jquery.cookie.js" ></script>
		<style>
			#my>div{
				float: left;
			}
			#my a{
				display: block;
				width: 100%;
				margin: 5px 0;
				text-decoration: none;
			}
			#my a:hover {
				cursor: pointer;
			}
		</style>
	</head>
	<script>
		if($.cookie('tmname') == null || $.cookie('mux') == null){
			window.location.href="index";
		}
	</script>
	<body>
		<jsp:include page="head.jsp"></jsp:include>
		<jsp:include page="search-min.jsp"></jsp:include>
		<div class="container" id="my">
			<div style="width: 20%;">
				<a class="btn btn-danger" href="my-info.jsp" target="mys">
					我的信息
				</a>
				<a class="btn btn-danger" data-toggle="collapse" href="#myorder">
					我的订单
				</a>
				<div class="collapse" id="myorder">
					<div class="well" style="margin-bottom: 0;">
						<ul class="list-group" style="margin-bottom: 0;">
							<li class="list-group-item">
								<span class="badge" style="display: none;">184</span>
								<a href="myorder?status=0" target="mys">待支付</a>
							</li>
							<li class="list-group-item">
								<span class="badge" style="display: none;">13</span>
								<a href="myorder?status=1" target="mys">待发货</a>
							</li>
							<li class="list-group-item">
								<span class="badge" style="display: none;">14</span>
								<a href="myorder?status=2" target="mys">待收货</a>
							</li>
							<li class="list-group-item">
								<span class="badge" style="display: none;">14</span>
								<a href="myorder?status=5" target="mys">待评价</a>
							</li>
							<li class="list-group-item">
								<span class="badge" style="display: none;">14</span>
								<a href="myorder?status=3" target="mys">退款/售后</a>
							</li>
							<li class="list-group-item">
								<span class="badge" style="display: none;">224</span>
								<a href="myorder?status=4" target="mys">已完成</a>
							</li>
						</ul>
					</div>
				</div>
				<a class="btn btn-danger" href="getaddress" target="mys">
					收货地址管理
				</a>
			</div>
			<div style="width: 80%;">
				<div class="embed-responsive embed-responsive-16by9">
					<iframe id="mys" name="mys" class="embed-responsive-item" src="my-info.jsp"></iframe>
				</div>
			</div>
		</div>
		<jsp:include page="foot.jsp"></jsp:include>
	</body>
</html>