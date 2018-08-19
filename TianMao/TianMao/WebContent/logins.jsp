<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>理想生活上天猫</title>
		<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
		<script type="text/javascript" src="assets/js/jquery-3.3.1.min.js" ></script>
		<script type="text/javascript" src="assets/js/bootstrap.min.js" ></script>
		<script type="text/javascript" src="assets/js/PCASClass.js" ></script>
		<link href="assets/images/icon2.ico" rel="shortcut icon" type="image/x-icon">
		<link href="assets/images/icon2.ico" rel="icon" type="image/x-icon">
		<link href="assets/images/icon2.ico" rel="bookmark" type="image/x-icon">
		<link rel="stylesheet" href="assets/css/bootoast.css" />
		<script type="text/javascript" src="assets/js/bootoast.js" ></script>
		<style>
			#lg button{
				height: 42px;
				width: 300px;
				background-color: #FF335E;
				font-weight: bold;
				font-size: 1.2em;
				border: none;
				color: #FFFFFF;
			}
			#lg p{
				font-size: 1.3em;
				font-weight: bold;
				margin-top: 20px;
			}
			#lg a{
				text-decoration: none;
				cursor: pointer;
			}
			#lg a:hover {
				color: #FF0036 !important;
			}
			#lg select{
				width: 32%;
				margin-bottom: 20px;
			}
			.input-group{
				margin: 20px 0;
			}
		</style>
	</head>
	<body>
		<div class="container">
			<div style="height: 88px;">
				<img style="margin-top: 31px;" src="assets/images/Login.png" width="190px" height="27px"/>
			</div>
		</div>
		<div id="lg" style="background-color: #F5F5F5;height: 600px;">
			<div class="container" style="padding-top: 100px;padding-right: 30px;">
				<div style="height: 400px;width: 350px;background-color: #FFFFFF;padding: 26px;float: right;">
					<p id="lg-title">商户登陆</p>
					<form id="userxx">
						<div class="input-group">
							<span class="input-group-addon glyphicon glyphicon-user"></span>
							<input name="name" type="text" class="form-control" placeholder="会员名/邮箱/手机号">
						</div>
						<div class="input-group">
							<span class="input-group-addon glyphicon glyphicon-lock"></span>
							<input name="password" type="password" class="form-control" placeholder="密码">
						</div>
						<div id="cfpass" class="input-group" style="display: none;">
							<span class="input-group-addon glyphicon glyphicon-lock"></span>
							<input type="password" class="form-control" placeholder="重复密码">
						</div>
						<div id="address" style="display: none;">
							<select name="Province"></select>
					        <select name="City"></select>
					        <select name="address"></select>
						</div>
					</form>
					<button id="dltm">登 陆</button>
					<p style="text-align: right;">
						<a onclick="log()" style="color: #6C6C6C;">商户登陆</a>
						<a onclick="reg()" style="color: #6C6C6C;">免费注册</a>
					</p>
				</div>
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
		$("#dltm").click(function(){
			var pass = $("input[type='password']");
			var name = $("input[type='text']");
			if(this.innerText == "登 陆"){
				if(pass.eq(0).val() != "" && name.eq(0).val() != ""){
					$.ajax({
						type:"post",
						url:"logs",
						async:true,
						data:$("#userxx").serialize(),
						success : function(result) {
							if(result == 1){
								window.location.href="index";
							}else{
								tusi("登陆失败,密码错误或在审核中");
							}
						}
					});
				}else{
					tusi("密码或用户名为空");
				}
			}else if(this.innerText == "注 册"){
				if(pass.eq(0).val() == pass.eq(1).val() && pass.eq(0).val() != "" && name.eq(0).val() != ""){
					var as = document.getElementsByName("address")[0].childNodes;
					if(as[0].innerText != "请选择地区" || as[0].innerText != "市辖区"){
						$.ajax({
							type:"post",
							url:"regs",
							async:true,
							data:$("#userxx").serialize(),
							success : function(result) {
								if(result == 1){
									log();
								}
								tusi(result==1?"注册成功":"用户名已存在或用户名太长");
							}
						});
					}else{
						tusi("请选择地区");
					}
				}else{
					tusi("密码不一致或用户名为空");
				}
			}
		});
    	//省、市、地区提示信息选项的值为空字符串
        new PCAS("Province","City","address","","","");
    	
		$("#fx").css("display","none");
		$("#f div").css("background-color","#FFFFFF");
		$("#f a").css("color","#000000");
		$("#f li").css("color","#000000");
		function reg(){
			$("#userxx input").val("");
			$("#lg-title").text("商户注册");
			$("#cfpass").css("display","");
			$("#address").css("display","");
			$("#dltm").text("注 册");
		}
		function log(){
			$("#userxx input").val("");
			$("#lg-title").text("商户登陆");
			$("#cfpass").css("display","none");
			$("#address").css("display","none");
			$("#dltm").text("登 陆");
		}
	</script>
</html>