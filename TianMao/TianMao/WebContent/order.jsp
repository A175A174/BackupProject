<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
		<script type="text/javascript" src="assets/js/jquery-3.3.1.min.js" ></script>
		<script type="text/javascript" src="assets/js/bootstrap.min.js" ></script>
		<link href="assets/images/icon.png" rel="shortcut icon" type="image/x-icon">
		<link href="assets/images/icon.png" rel="icon" type="image/x-icon">
		<link href="assets/images/icon.png" rel="bookmark" type="image/x-icon">
		<style type="text/css">
			#order-1 ul{
				list-style: none;
				padding: 0;
				margin: 0;
			}
			#order-1 li{
				display: inline-block;
			}
			#order-1 input[type="text"]{
				width: 375px;
				height: 35px;
				border: #FF0036 3px solid;
				outline: none;
				padding-left: 0.5em;
			}
			#order-1 button{
				width: 80px;
				height: 34px;
				background-color: #FF0036;
				color: #FFFFFF;
				border: none;
				font-size: 1.2em;
			}
			#order-2 ul{
				list-style: none;
				padding: 0;
				margin: 0;
			}
			#order-2 li{
				display: inline-block;
			}
			#order-2 table{
				table-layout: fixed;
				width: 30%;
				display: inline-block;
				cursor: pointer;
				border: solid 2px #4F9FCF;
			}
			#order-2 tr td:first-child{
				width: 25%;
				text-align: right;
				font-weight: bold;
			}
			#order-2 tr td:last-child{
				width: 75%;
				overflow: hidden;
				text-overflow: ellipsis;
				word-break: keep-all;
				white-space: nowrap;
				color: #319D5A;
			}
		</style>
	</head>
	<body>
		<jsp:include page="head.jsp"></jsp:include>
		<div class="container" id="order-1" style="margin-top: 20px;margin-bottom: 20px;">
			<ul>
				<li style="width: 54%;padding-left: 30px">
					<img src="assets/images/Login.png" height="20px" width="145px"/>
				</li>
				<li style="width: 45%;">
					<input type="text" placeholder="搜索 天猫 商品/品牌/店铺"/><button>搜天猫</button>
				</li>
			</ul>
		</div>
		<div class="container" id="order-2">
			<p class="lead" style="font-weight: bold;">选择收货地址</p>
			<c:forEach begin="0" end="5">
				<table class="table table-condensed table-striped">
					<tr>
						<td>收货人：</td>
						<td>qwaaaaaaaaaaaaaaaaaaaawwwwwwwwwaaaaaaaaaaae</td>
					</tr>
					<tr>
						<td>电话：</td>
						<td>qwe</td>
					</tr>
					<tr>
						<td>邮编：</td>
						<td>qwe</td>
					</tr>
					<tr>
						<td>地址：</td>
						<td>qwe</td>
					</tr>
				</table>
			</c:forEach>
			<div>
				商品
			</div>
		</div>
		<jsp:include page="foot.jsp"></jsp:include>
	</body>
	<script>
		var table_list = $("#order-2 table");
		table_list.eq(0).css("border-color","#FF0036");
		table_list.click(function(){
			table_list.css("border-color","#4F9FCF");
			$(this).css("border-color","#FF0036");
		});
	</script>
</html>