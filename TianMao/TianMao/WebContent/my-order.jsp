<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
		<script type="text/javascript" src="assets/js/jquery-3.3.1.min.js" ></script>
		<script type="text/javascript" src="assets/js/bootstrap.min.js" ></script>
		<script type="text/javascript" src="assets/js/PCASClass.js" ></script>
		<link rel="stylesheet" href="assets/css/bootoast.css" />
		<script type="text/javascript" src="assets/js/bootoast.js" ></script>
		<style>
			th,td{
				text-align: center;
				border: #337AB7 1px solid;
			}
			button {
				position: relative;
				top: -2.5px;
			}
		</style>
	</head>
	<body>
		<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
			    <div class="modal-content">
			    	<div class="modal-header">
			        	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			      	<h4 class="modal-title" id="myModalLabel">退货信息</h4>
			    	</div>
			    	<div class="modal-body" style="padding-bottom: 0;">
			        	<div class="well" style="padding-bottom: 0;margin-bottom: 0;">
			        		<form id="fhorder">
				        		<div class="input-group">
									<span class="input-group-addon">订单号</span>
									<input name="ordercode" id="ddh" readonly name="originalprice" type="text" class="form-control">
								</div>
								<div class="input-group">
									<span class="input-group-addon">物流类别(未收到货物请勿填写)</span>
									<input name="shipmentsname" type="text" class="form-control">
								</div>
								<div class="input-group">
									<span class="input-group-addon">物流单号(未收到货物请勿填写)</span>
									<input name="shipmentscode" type="text" class="form-control">
								</div>
							</form>
						</div>
			    	</div>
			    	<div class="modal-footer" style="padding-top: 0;">
			        	<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			        	<button onclick="wythx()" type="button" class="btn btn-primary">退货</button>
			      	</div>
			 	</div>
			</div>
		</div>
		
		<!-- 评价Modal -->
		<div class="modal fade" id="pjModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
			    <div class="modal-content">
			    	<div class="modal-header">
			        	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			      	<h4 class="modal-title" id="myModalLabel">评价</h4>
			    	</div>
			    	<div class="modal-body" style="padding-bottom: 0;">
			        	<div class="well" style="padding-bottom: 0;margin-bottom: 0;">
			        		<form id="pjwell">
			        			<div class="input-group">
									<span class="input-group-addon">订单号</span>
									<input name="ordercode" id="ddhx" readonly name="originalprice" type="text" class="form-control">
								</div>
								<div id="asd"></div>
							</form>
						</div>
			    	</div>
			    	<div class="modal-footer" style="padding-top: 0;">
			        	<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			        	<button onclick="pjx()" type="button" class="btn btn-primary">评价</button>
			      	</div>
			 	</div>
			</div>
		</div>
	
		<div class="container-fluid">
			<p class="lead">${stat}</p>
			<c:if test="${fn:length(datas)==0}">
				<span>无订单</span>
			</c:if>
			<c:forEach items="${datas}" var="i">
				<a onclick="lodingproduct('${i.ordercode}')" class="btn btn-default" style="display: block;background-color: #F1F1F1;text-align: left;" data-toggle="collapse" href="#${i.ordercode}">
					<span><fmt:formatDate value="${i.createdate}" type="both" /></span>
					<span>订单号：${i.ordercode}</span>
					<span style="color: crimson;" id="zj" class="lead">￥${i.tradeprice}</span>
					<c:if test="${i.status==4 || i.status == 5}">
						<span>收货：<fmt:formatDate value="${i.confirmdate}" type="both" /></span>
					</c:if>
					<c:if test="${i.status==2 || i.status == 1 || i.status == 4}">
						<span>pay：<fmt:formatDate value="${i.paydate}" type="both" /></span>
					</c:if>
					<c:if test="${i.status==4 || i.status==0}">
						<button onclick="del('${i.ordercode}',event,this)" type="button" class="btn btn-primary pull-right">删除</button>
					</c:if>
					<c:if test="${i.status==0}">
						<button onclick="pay('${i.ordercode}',event,this)" type="button" class="btn btn-primary pull-right">支付</button>
					</c:if>
					<c:if test="${i.status==2}">
						<button onclick="wyth('${i.ordercode}',event,this)" type="button" class="btn btn-primary pull-right">退货</button>
					</c:if>
					<c:if test="${i.status==2}">
						<button onclick="qrsh('${i.ordercode}',event,this)" type="button" class="btn btn-primary pull-right">确认收货</button>
					</c:if>
					<c:if test="${i.status==5}">
						<button onclick="pj('${i.ordercode}',event,this)" type="button" class="btn btn-primary pull-right">评价</button>
					</c:if>
				</a>
				<div class="collapse" id="${i.ordercode}">
	        		<table style="width: 100%;">
	        			<thead style="width: 100%;">
	        				<th width="20%">图片</th>
	        				<th width="40%">名称</th>
	        				<th width="20%">单价</th>
	        				<th width="20%">数量</th>
	        			</thead>
	        			<tbody style="border: #337AB7 1px solid;"></tbody>
	        		</table>
				</div>
			</c:forEach>
		</div>
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
		//评价模态框
		function pj(s,e,t) {
			e.stopPropagation();
			if($("#"+s+" table tbody tr").length>0){
				$("#asd").text("");
				$("#pjwell").append($("#"+s+" table"));
				$("#pjwell tbody tr").after($("<tr><td colspan='4'><textarea name='pjlr' class='form-control' rows='5'></textarea></td></tr>"));
			}else{
				$("#asd").text("请先查看订单类容");
			}
			$("#ddhx").val(s);
			$('#pjModal').modal('show');
		}
		//评价
		function pjx() {
			$.ajax({
				type:"post",
				url:"pjorder",
				async:true,
				data:$("#pjwell").serialize(),
				success:function(s){
					if(s==1){
						tusi("评价成功");
						var t = $("#"+$("#ddhx").val());
						t.prev().remove();
						t.remove();
						$("#ddh input").val("");
						$('#pjModal').modal('hide');
					}else{
						tusi("评价失败，请稍后重试");
					}
				}
			});
		}
		//退货模态框
		function wyth(s,e,t) {
			e.stopPropagation();
			$("#ddh").val(s);
			$('#myModal').modal('show');
		}
		//退货
		function wythx() {
			$.ajax({
				type:"post",
				url:"wyth",
				async:true,
				data:$("#fhorder").serialize(),
				success:function(s){
					if(s==1){
						tusi("退货成功，请等待商家确认");
						var t = $("#"+$("#ddh").val());
						t.prev().remove();
						t.remove();
						$("#ddh input").val("");
						$('#myModal').modal('hide');
					}else{
						tusi("退货失败，请稍后重试");
					}
				}
			});
		}
		//确认收货
		function qrsh(s,e,t) {
			e.stopPropagation();
			if(confirm("钱款将打入商户账户，无法退回，确认？")){
				$.ajax({
					type:"post",
					url:"qrsh",
					async:true,
					data:{ordercode:s},
					success:function(x){
						if(x == 1){
							tusi("确认收货成功");
							$(t).parent().next().remove();
							$(t).parent().remove();
						}else{
							tusi("确认收货失败");
						}
					}
				});
			}else{
				tusi("已取消");
			}
			
		}
		
		//删除未支付订单
		function del(s,e,t) {
			e.stopPropagation();
			if(confirm("删除后无法恢复，确认删除？")){
				$.ajax({
					type:"post",
					url:"delorder",
					async:true,
					data:{ordercode:s},
					success : function(result) {
						if(result == "1"){
							$(t).parent().next().remove();
							$(t).parent().remove();
							//window.location.reload();
						}else{
							tusi("删除失败");
						}
					}
				});
			}else{
				tusi("取消删除");
			}
		}
		//支付
		function pay(s,e,t) {
			e.stopPropagation();
			var m = window.prompt("请输入支付密码(为纯数字，默认为0)","");
			if(m != null){
				if(m == ""){
					tusi("支付密码不能为空");	
				}else{
					$.ajax({
						type:"post",
						url:"payorder",
						async:true,
						data:{
							ordercode:s,
							paypass:m
						},
						success : function(result) {
							if(result == '1'){
								window.location.reload();
							}else{
								tusi("支付密码错误或余额不足");
							}
						}
					});
				}
			}else{
				tusi("取消支付");
			}
		}
		
		function lodingproduct(s) {
			var t = $('#'+s+" tbody");
			if($('#'+s+" tbody tr").length != 0){
				return;
			}
			$.ajax({
				type:'post',
				url:'getOrderitems',
				async:true,
				data:{orderid:s},
				success : function(result) {
					if(result.express != null){
						t.parent().parent().prepend(
							"<p style='background-color: #F1F1F1;'>发货物流公司："+result.express.shipmentsname+
							"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发货物流单号："+result.express.shipmentscode+
							"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;退货物流公司："+result.add.postcode+
							"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;退货物流单号："+result.add.phonecode+
							"</p>");
					}
					t.parent().parent().prepend(
							"<p style='background-color: #F1F1F1;'>收货人："+result.add.consignee+
							"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;收货地址："+result.add.address+
							"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;邮编："+result.add.postcode+
							"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电话："+result.add.phonecode+
							"</p>");
					for (var i = 0; i < result.p.length; i++) {
						var s = $("<tr></tr>");
						var j = $("<td onclick=(window.location.href='product?productid="+result.p[i].productid+"')><img src='/img/"+result.pd[i].image+"' width='80px' height='80px'/></td>");
						s.append(j);
						j = $("<input type='hidden' name='pts' value='"+result.p[i].productid+"' />");
						s.append(j);
						j = $("<td>"+result.p[i].name+"</td>");
						s.append(j);
						j = $("<td>"+result.p[i].discountprice+"</td>");
						s.append(j);
						j = $("<td>"+result.o[i].number+"</td>");
						s.append(j);
						t.append(s);
					}
				}
			});
		}
	</script>
</html>