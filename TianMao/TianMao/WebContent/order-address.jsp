<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>选择收货地址</title>
		<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
		<script type="text/javascript" src="assets/js/jquery-3.3.1.min.js" ></script>
		<script type="text/javascript" src="assets/js/bootstrap.min.js" ></script>
		<link href="assets/images/icon.png" rel="shortcut icon" type="image/x-icon">
		<link href="assets/images/icon.png" rel="icon" type="image/x-icon">
		<link href="assets/images/icon.png" rel="bookmark" type="image/x-icon">
		<link rel="stylesheet" href="assets/css/bootoast.css" />
		<script type="text/javascript" src="assets/js/bootoast.js" ></script>
		<script type="text/javascript" src="assets/js/jjcc.js" ></script>
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
			<p class="lead" style="font-weight: bold;">选择收货地址(边框为红色为选中)</p>
			<c:if test="${fn:length(add)==0}">
				<span>请在个人信息中添加收货地址</span>
			</c:if>
			<c:forEach items="${add}" var="i">
				<table data-add="${i.addressid}" class="table table-condensed table-striped">
					<tr>
						<td>收货人：</td>
						<td>${i.consignee}</td>
					</tr>
					<tr>
						<td>电话：</td>
						<td>${i.phonecode}</td>
					</tr>
					<tr>
						<td>邮编：</td>
						<td>${i.postcode}</td>
					</tr>
					<tr data-toggle="tooltip" title="${i.address}">
						<td>地址：</td>
						<td>${i.address}</td>
					</tr>
				</table>
			</c:forEach>
			<div>
				<form id="dd" onkeydown="if(event.keyCode==13){return false;}">
					<p class="lead text-right">
						运费：<span id="yf">${addyf.cost}</span>
						总价：
						<input id="zj" name="tradeprice" readonly type="number" style="color: crimson;" value="${k.discountprice*datas.number+addyf.cost}">
					</p>
					<ul class="text-center well-lg">
						<li class="text-center" style="width: 20%">
							<img src="/img/${p[0].image}" width="80px" height="80px" />
						</li>
						<li style="width: 30%">
							${k.name}
						</li>
						<li style="width: 15%">
							¥ <span id="dj">${k.discountprice}</span>
						</li>
						<li style="width: 20%">
							数量<input id="num" name="number" type="number" min="1" max="${k.stock}" value="${datas.number}"/>件,库存${k.stock}件
						</li>
					</ul>
					<input type="hidden" name="sellerid" value="${k.sellerid}">
					<input type="hidden" name="productid" value="${k.productid}">
					<input type="hidden" id="addre" name="addressid" value="${add[0].addressid}">
					<button onclick="tj()" type="button" class="btn btn-primary pull-right">提交订单</button>
					<div>
						<p class="lead">备注</p>
						<textarea name="userremark" class="form-control" rows="5"></textarea>
					</div>
				</form>
			</div>
		</div>
		<jsp:include page="foot.jsp"></jsp:include>
	</body>
	<script>
		function tusi(s){
			bootoast({
				message: s,
				type: 'info',
				position: 'right-bottom',
	 			timeout: 2,
	 			icon: 'info-sign'
			});
		}
		function tj() {
			if($("table").length == 0){
				tusi("请到个人信息中添加收货地址");
				return;
			}
			$.ajax({
				type:"post",
				url:"addorder",
				async:true,
				data:$("#dd").serialize(),
				success : function(result) {
					if(result==1){
						window.location.href="my.jsp";
					}else{
						tusi("库存不足，请刷新网页或减少购买数量");
					}
				}
			});
		}
		$("#num").change(function(){
			if($("#num").val()<=0){
				$("#num").val("1");
				$("#zj").val($("#dj").text());
			}else if($("#num").val()>$("#num").attr("max")){
				$("#num").val($("#num").attr("max"));
				$("#zj").val(accMul($("#num").attr("max"),$("#dj").text()));
			}else{
				$("#zj").val(accMul($("#num").val(),$("#dj").text()));
			}
			$("#zj").val(accAdd($("#zj").val(),$("#yf").text()));
		});
		$(function () {
		  $('[data-toggle="tooltip"]').tooltip()
		});
		var table_list = $("#order-2 table");
		table_list.eq(0).css("border-color","#FF0036");
		table_list.click(function(){
			table_list.css("border-color","#4F9FCF");
			$(this).css("border-color","#FF0036");
			$("#addre").val($(this).data("add"));
		});
	</script>
</html>