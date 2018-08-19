<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
		<script type="text/javascript" src="assets/js/jquery-3.3.1.min.js" ></script>
		<script type="text/javascript" src="assets/js/bootstrap.min.js" ></script>
		<link rel="stylesheet" href="assets/css/bootoast.css" />
		<script type="text/javascript" src="assets/js/bootoast.js" ></script>
	</head>
	<body>
		<div class="container-fluid">
			<div class="input-group">
					<span class="input-group-addon">余额</span>
					<input type="number" id="ye" class="form-control">
			</div>
			<button type="button" onclick="up()" class="btn btn-primary pull-right">更新</button>
			<div class="clearfix"></div>
			<div class="input-group clearfix">
					<span class="input-group-addon">原支付密码(默认为0)</span>
					<input type="password" name="pay" class="form-control">
					<span class="input-group-addon">新支付密码</span>
					<input type="password" name="pay" class="form-control">
					<span class="input-group-addon">新支付密码</span>
					<input type="password" name="pay" class="form-control">
			</div>
			<button type="button" onclick="uppaypass()" class="btn btn-primary pull-right">更新</button>
		</div>
	</body>
	<script>
		//更新支付密码
		function uppaypass() {
			var paypass = $("input[name='pay']");
			if(paypass[1].value == paypass[2].value && paypass[1].value != "" && paypass[1].value != null){
				$.ajax({
					type:"post",
					url:"upuserpasss",
					async:true,
					data:{
						oldpay:paypass[0].value,
						newpay:paypass[1].value
					},
					success:function(s){
						if(s==1){
							tusi("更新成功");
						}else{
							tusi("原密码不正确或密码不是纯数字");
						}
					}
				});
			}else{
				tusi("两次密码不一致或为空");
			}
		}
		//加载余额
		$(function(){
			$.ajax({
				type:"post",
				url:"getye",
				async:true,
				success:function(s){
					$("#ye").val(s);
				}
			});
		});
		function tusi(s){
			bootoast({
				message: s,
				type: 'info',
				position: 'right-bottom',
	 			timeout: 2,
	 			icon: 'info-sign'
			});
		}
		//更新余额
		function up(){
			var yb = $("#ye").val();
			if(yb>0){
				$.ajax({
					type:"post",
					url:"addye",
					async:true,
					data:{balance:yb},
					success:function(s){
						if(s==1){
							tusi("修改成功");
						}
					}
				});
			}else{
				tusi("金额不能小于零");
			}
		}
	</script>
</html>