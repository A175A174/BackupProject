<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
		<script type="text/javascript" src="assets/js/jquery-3.3.1.min.js" ></script>
		<script type="text/javascript" src="assets/js/bootstrap.min.js" ></script>
		<script type="text/javascript" src="assets/js/PCASClass.js" ></script>
	</head>
	<body>
		<div class="container-fluid">
			<form id="ar">
				<div class="input-group">
					<span class="input-group-addon">收货地址</span>
					<select name="Province" class="form-control"></select>
					<span class="input-group-addon"></span>
					<select name="City" class="form-control"></select>
					<span class="input-group-addon"></span>
					<select name="aress" class="form-control"></select>
					<span class="input-group-addon">门牌号</span>
					<input type="text" id="ass" class="form-control">
					<input type="hidden" name="address" id="as" />
				</div>
				<div class="input-group" style="padding-top: 10px">
					<span class="input-group-addon">收货人</span>
					<input name="consignee" type="text" class="form-control">
					<span class="input-group-addon">邮编</span>
					<input name="postcode" type="number" class="form-control">
					<span class="input-group-addon">电话</span>
					<input name="phonecode" type="number" class="form-control">
				</div>
			</form>
			<button type="button" onclick="add()" class="btn btn-default pull-right">保存</button>
			<div class="clearfix"></div>
			<c:forEach items="${adress}" var="i">
				<div>
					<button class="btn btn-default" onclick="del(${i.addressid},this)">删除</button>
					<fieldset disabled style="margin-bottom: 10px">
						<div class="input-group">
							<span class="input-group-addon">收货地址</span>
							<input value="${i.address}" type="text" class="form-control disabled">
						</div>
						<div class="input-group">
							<span class="input-group-addon">收货人</span>
							<input value="${i.consignee}" type="text" class="form-control">
							<span class="input-group-addon">邮编</span>
							<input value="${i.postcode}" type="number" class="form-control">
							<span class="input-group-addon">电话</span>
							<input value="${i.phonecode}" type="tel" class="form-control">
						</div>
					</fieldset>
				</div>
			</c:forEach>
		</div>
	</body>
	<script>
		function add() {
			var s = $(":selected");
			$("#as").val(s[0].value+s[1].value+s[2].value+$("#ass").val());
			$.ajax({
				type:"post",
				url:"addaddress",
				async:true,
				data:$("#ar").serialize(),
				success:function(s){
					if(s==1){
						window.location.reload();
					}
				}
			});
		}
		function del(s,t) {
			if(confirm("删除后无法恢复，确认删除？")){
				$.ajax({
					type:"post",
					url:"deladdress",
					async:true,
					data:{addressid:s},
					success:function(r){
						if(r == 1){
							t.parentNode.remove();
						}
					}
				});
			}else{
				
			}
		}
		//省、市、地区提示信息选项的值为空字符串
	    new PCAS("Province","City","aress","","","");
	</script>
</html>