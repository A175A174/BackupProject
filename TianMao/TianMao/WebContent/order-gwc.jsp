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
			th,td{
				text-align: center;
				border: #337AB7 1px solid;
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
		</div>
		<div class="container">
			<c:if test="${fn:length(datas)==0}">
				<span class="lead" style="color: red;">购物车中无商品</span>
			</c:if>
			<c:forEach items="${datas}" var="i" varStatus="j">
				<form id="x${i.key}" onkeydown="if(event.keyCode==13){return false;}">
					<div onclick="loaditems('${i.key}')" class="btn btn-default" style="width: 100%;text-align: left;" data-toggle="collapse" href="#${i.key}">
						<span style="font-weight: bold;font-size: 1.5em;">流水号：${i.key}</span>
						<button type="button" onclick="tjdd('x${i.key}',event)" class="btn btn-primary pull-right">提交订单</button>
						<button type="button" onclick="deldd('${i.key}',event)" class="btn btn-primary pull-right">删除订单</button>
					</div>
					<div class="collapse" id="${i.key}">
						<div class="text-center" style="color: red;font-size: 1.5em;">
							运费：
							<span id="y${i.key}">0</span>
							总价：
							<input name="tradeprice" readonly id="z${i.key}"></input>
							<input name="addressid" type="hidden" value="${add[0].addressid}"></input>
							<input name="sellerid" type="hidden" value="${i.key}"></input>
						</div>
		        		<table style="width: 100%;">
		        			<thead style="width: 100%;">
		        				<th width="20%">图片</th>
		        				<th width="40%">名称</th>
		        				<th width="20%">单价</th>
		        				<th width="20%">数量</th>
		        			</thead>
		        			<tbody id="t${i.key}" style="border: #337AB7 1px solid;">
		        				<c:forEach items="${i.value}" var="x">
		        					<tr>
		        						<input type="hidden" value="${x.key}" name="pid"/>
		        						<input type="hidden" value="${i.key}"/>
		        						<td>${x.key}</td>
		        						<td></td>
		        						<td></td>
		        						<td><input name="nums" onchange="jjcc(this,'z${i.key}')" onfocus="ylsl(this)" type="number" min="1" value="${x.value}"></td>
		        					</tr>
		        				</c:forEach>
		        			</tbody>
		        		</table>
		        		<p class="lead">备注</p>
						<textarea name="userremark" class="form-control" rows="5"></textarea>
					</div>
				</form>
			</c:forEach>
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
		
		//删除购物车订单类容
		function delorderItem(t) {
			var s = $(t).parent().parent().find("input");
			$.ajax({
				type:"post",
				url:"delorderItem",
				async:true,
				data:{
					productid:s.eq(0).val(),
					sellerid:s.eq(1).val()
				},
				success:function(vs){
					if(vs==1){
						$(t).parent().parent().remove();
					}else if(vs==2){
						$("#x"+s.eq(1).val()).remove();
					}else if(vs==0){
						tusi("删除失败");
					}
				}
			});
		}
		
		//提交订单
		function tjdd(xs,e) {
			e.stopPropagation();
			if($("#order-2 table").length <= 0){
				tusi("请在个人信息中添加地址");
				return;
			}
			if($("#"+xs+" img").length <= 0){
				tusi("请先查看订单类容，确认后提交");
				return;
			}
			$.ajax({
				type:"post",
				url:"addorders",
				async:true,
				data:$("#"+xs).serialize(),
				success:function(vs){
					if(vs == 1){
						$("#"+xs).remove();
						tusi("订单提交成功");
					}else{
						tusi("提交失败,请刷新页面商品库存，所购部分商品可能库存不足");
					}
				}
			});
		}
		
		//删除购物车中订单
		function deldd(xs,e) {
			e.stopPropagation();
			$.ajax({
				type:"post",
				url:"delorders",
				async:true,
				data:{name:xs},
				success:function(vs){
					if(vs == 1){
						$("#x"+xs).remove();
						tusi("订单删除成功");
					}else{
						tusi("删除失败");
					}
				}
			});
		}
		
		//商品数量调整
		var yzs = null;
		function ylsl(t){
			yzs = t.value;
		}
		function jjcc(t,z) {
			if(t.value < 1){
				t.value = 1;
			}
			var dj = t.parentNode.previousSibling.previousSibling.innerText;
			var zj = $("#"+z).val();
			var nzj =accAdd(accSub(zj,accMul(yzs,dj)),accMul(t.value,dj));
			$("#"+z).val(nzj);
		}
		
		//加载订单详情
		function loaditems(st) {
			var sss = 0;
			if($("#t"+st+" img").length != 0){
				return;
			}
			var ls = $("#t"+st+" tr");
			$.ajax({
				type:"post",
				url:"showitem",
				async:false,
				data:$("#x"+st).serialize(),
				success:function(s){
					$("#y"+st).html(s.freight.cost);
					for (var i = 0; i < s.p.length; i++) {
						ls.eq(i).find("td").eq(0).html("<a href='product?productid="+s.p[i].productid+"'><img src='/img/"+s.pd[i].image+"' width='80px' height='80px' /></a>");
						ls.eq(i).find("td").eq(1).html(s.p[i].name);
						ls.eq(i).find("td").eq(2).html(s.p[i].discountprice);
						ls.eq(i).find("td").eq(3).find("input").attr("max",s.p[i].stock);
						ls.eq(i).find("td").eq(3).append($("<span>库存:"+s.p[i].stock+"</span>"));
						ls.eq(i).find("td").eq(3).append($("<button onclick='delorderItem(this)'>删除</button>"));
						sss = accAdd(parseFloat(sss),accMul(parseFloat(ls.eq(i).find("td").eq(3).find("input").val()),parseFloat(s.p[i].discountprice)));
					}
					sss = accAdd(parseFloat(sss),parseFloat($("#y"+st).html()));
				}
			});
			var zj = $("#z"+st);
			zj.val(sss);
		}
		
		
		$(function () {
		  $('[data-toggle="tooltip"]').tooltip();
		  var table_list = $("#order-2 table");
			table_list.eq(0).css("border-color","#FF0036");
			//收货地址调整
			table_list.click(function(){
				table_list.css("border-color","#4F9FCF");
				$(this).css("border-color","#FF0036");
				$("input[name='addressid']").val($(this).data("add"));
			});
		});
		
	</script>
</html>