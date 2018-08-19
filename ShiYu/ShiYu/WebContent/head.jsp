<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
	h4:hover{
		cursor: pointer;
	}
</style>

<!-- 登陆注册Modal -->
<div class="modal fade" id="mModal" tabindex="-1" role="dialog" aria-labelledby="注册框">
  <div class="modal-dialog" role="document" aria-hidden="true">
    <div class="modal-content">
    	<div class="modal-header text-center">
        	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
        		<span aria-hidden="true">&times;</span>
        	</button>
        	<div style="display: flex;">
        		<h4 class="modal-title lead" id="m1" style="flex: 1;color: #1E89E0;">登陆</h4>
    			<h4 class="modal-title lead" id="m2" style="flex: 1;">注册</h4>
        	</div>
    	</div>
    	<div class="modal-body">
    		<div class="text-center">
    			<img src="assets/img/ele.bmp" style="padding-bottom: 15px;"/>
    		</div>
    		<form class="form-signin" data-toggle="validator" id="logdiv">
	        	<div class="form-group">
					<div class="input-group input-group-lg">
				  		<span class="input-group-addon">账号</span>
						<input type="text" name="username" class="form-control" placeholder="enter account" aria-describedby="basic-username">
					</div>
				</div>
				<div class="form-group">
					<div class="input-group input-group-lg">
				  		<span class="input-group-addon">密码</span>
						<input type="password" name="password" class="form-control" placeholder="enter password" aria-describedby="basic-password">
					</div>
				</div>
				<div class="form-group" style="visibility: hidden;">
					<div class="input-group input-group-lg">
				  		<span class="input-group-addon"></span>
						<input type="password" class="form-control">
					</div>
				</div>
			</form>
    		<form class="form-signin" data-toggle="validator" id="regdiv" style="display: none;">
	        	<div class="form-group">
					<div class="input-group input-group-lg">
				  		<span class="input-group-addon">账号</span>
						<input type="text" name="username" class="form-control" placeholder="enter account" aria-describedby="basic-username">
					</div>
				</div>
				<div class="form-group">
					<div class="input-group input-group-lg">
				  		<span class="input-group-addon">密码</span>
						<input type="password" name="password" class="form-control" placeholder="enter password" aria-describedby="basic-password">
					</div>
				</div>
				<div class="form-group">
					<div class="input-group input-group-lg">
				  		<span class="input-group-addon">确认密码</span>
				  		<input type="password" name="password" class="form-control" placeholder="enter password" aria-describedby="basic-password">
					</div>
				</div>
			</form>
    	</div>
    	<div class="modal-footer">
        	<button type="button" id="register" class="btn btn-success">登陆</button>
        	<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      	</div>
    </div>
  </div>
</div>

<!-- 商家注册Modal -->
<div class="modal fade" id="sModal" tabindex="-1" role="dialog" aria-labelledby="注册框">
  <div class="modal-dialog" role="document" aria-hidden="true">
    <div class="modal-content">
    	<div class="modal-header text-center">
        	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
        		<span aria-hidden="true">&times;</span>
        	</button>
        	<div style="display: flex;">
        		<h4 class="modal-title lead" id="s1" style="flex: 1;color: #1E89E0;">商家登陆</h4>
    			<h4 class="modal-title lead" id="s2" style="flex: 1;">商家注册</h4>
        	</div>
    	</div>
    	<div class="modal-body">
    		<form class="form-signin" data-toggle="validator" id="slogdiv">
	        	<div class="form-group">
					<div class="input-group input-group-lg">
				  		<span class="input-group-addon">账号</span>
						<input type="text" name="username" class="form-control" placeholder="enter account" aria-describedby="basic-username">
					</div>
				</div>
				<div class="form-group">
					<div class="input-group input-group-lg">
				  		<span class="input-group-addon">密码</span>
						<input type="password" name="password" class="form-control" placeholder="enter password" aria-describedby="basic-password">
					</div>
				</div>
			</form>
    		<form class="form-signin" data-toggle="validator" id="sregdiv" style="display: none;" enctype="multipart/form-data">
	        	<div class="form-group">
					<div class="input-group input-group-lg">
				  		<span class="input-group-addon">账号</span>
						<input type="text" name="username" class="form-control" placeholder="enter account" aria-describedby="basic-username">
					</div>
				</div>
				<div class="form-group">
					<div class="input-group input-group-lg">
				  		<span class="input-group-addon">密码</span>
						<input type="password" name="password" class="form-control" placeholder="enter password" aria-describedby="basic-password">
					</div>
				</div>
				<div class="form-group">
					<div class="input-group input-group-lg">
				  		<span class="input-group-addon">确认密码</span>
				  		<input type="password" name="password" class="form-control" placeholder="enter password" aria-describedby="basic-password">
					</div>
				</div>
				<div class="form-group">
					<div class="input-group input-group-lg">
				  		<span class="input-group-addon">店铺名称</span>
				  		<input type="text" name="shopname" class="form-control" placeholder="enter shop name" aria-describedby="basic-password">
					</div>
				</div>
				<div class="form-group">
					<div class="input-group input-group-lg">
						<span class="input-group-addon">店铺Logo</span>
    					<input name="myicon" type="file" class="form-control" accept="image/jpeg, image/gif, image/x-png">
					</div>
				</div>
			</form>
    	</div>
    	<div class="modal-footer">
        	<button type="button" id="sregister" class="btn btn-success">登陆</button>
        	<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      	</div>
    </div>
  </div>
</div>

<nav class="navbar navbar-default" style="background-color: #1E89E0 !important;">
	<div class="container">
		<div>
			<a href="#" class="navbar-left" style="padding: 0px 20px;">
	       		<img alt="Brand Icon" src="assets/img/ele.png" height="50px" width="50px">
	      	</a>
			<ul class="nav navbar-nav">
				<li style="background-color: #006BC7;">
					<a href="index" style="color: #FFFFFF;">首页</a>
				</li>
				<c:if test="${cookie.username ne null || cookie.shopname ne null}">
		  			<li>
						<a id="myorder" style="color: #FFFFFF;">我的订单</a>
					</li>
				</c:if>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<c:choose>
					<c:when test="${cookie.username ne null}">
						<li>
							<a href="#" style="color: #FFFFFF;">${cookie.username.value}</a>
						</li>
						<li>
							<a onclick="exit()" style="color: #FFFFFF;">退出</a>
						</li>
					</c:when>
					<c:when test="${cookie.shopname ne null}">
						<li style="padding: 0px 20px;">
				       		<img alt="No Icon" class="img-circle" src="/icon/${cookie.icon.value}" height="50px" width="50px">
				      	</li>
						<li>
							<a href="#" style="color: #FFFFFF;">${cookie.shopname.value}</a>
						</li>
						<li>
							<a onclick="exit()" style="color: #FFFFFF;">退出</a>
						</li>
					</c:when>
					<c:otherwise>
						<li><span style="color: #FFFFFF;font-size: 20px;padding-top: 12px;" class="glyphicon glyphicon-user"></span></li>
						<li>
							<a data-toggle="modal" href="#mModal" style="color: #FFFFFF;">登陆/注册</a>
						</li>
						<li>
							<a data-toggle="modal" href="#sModal" style="color: #FFFFFF;">我是商家</a>
						</li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
</nav>

<script>
	$('#myorder').click(function(){
		if($.cookie('shopname') != null){
			window.location.href = 'smyorder';
		}else if($.cookie('username') != null){
			window.location.href = 'myorder';
		}
	});
	//登陆
	$('#m1').click(function(){
		$('#m2').css({'flex':'1','color':'#000000'});
		$('#m1').css({'flex':'1','color':'#1E89E0'});
		$('#register').text('登陆');
		$('#logdiv').show();
		$('#regdiv').hide();
	});
	//注册
	$('#m2').click(function(){
		$('#m2').css({'flex':'1','color':'#1E89E0'});
		$('#m1').css({'flex':'1','color':'#000000'});
		$('#register').text('注册');
		$('#logdiv').hide();
		$('#regdiv').show();
	});
	//商家登陆
	$('#s1').click(function(){
		$('#s2').css({'flex':'1','color':'#000000'});
		$('#s1').css({'flex':'1','color':'#1E89E0'});
		$('#sregister').text('登陆');
		$('#slogdiv').show();
		$('#sregdiv').hide();
	});
	//商家注册
	$('#s2').click(function(){
		$('#s2').css({'flex':'1','color':'#1E89E0'});
		$('#s1').css({'flex':'1','color':'#000000'});
		$('#sregister').text('注册');
		$('#slogdiv').hide();
		$('#sregdiv').show();
	});
	
	//注册登陆事件
	$('#register').click(function(){
		if($('#register').text() == '注册'){
			var pass = document.getElementsByName("password");
			if(pass[1].value == pass[2].value){
				$.ajax({
					type:"post",
					url:"reg",
					async:true,
					data: $('#regdiv').serialize(),
					success : function(result) {
						bootoast({
							message: result==1?"注册成功":"服务器繁忙",
							type: 'info',
							position: 'right-bottom',
				 			timeout: 2,
				 			icon: 'info-sign'
						});
						if (result==1) {
							$("#mModal").modal("hide");
							//清空from表单
							$('#regdiv')[0].reset();
						}
					}
				});
			}else{
				bootoast({
					message: "两次密码不一致！",
					type: 'info',
					position: 'right-bottom',
		 			timeout: 2,
		 			icon: 'info-sign'
				});
			}
		}else{
			$.ajax({
				type:"post",
				url:"log",
				async:true,
				data: $('#logdiv').serialize(),
				success : function(result) {
					if (result==1) {
						$("#mModal").modal("hide");
						//清空from表单
						$('#logdiv')[0].reset();
					}
					bootoast({
						message: result==1?'登陆成功':'服务器繁忙',
						type: 'info',
						position: 'right-bottom',
			 			timeout: 2,
			 			icon: 'info-sign'
					});
					setTimeout('window.location.reload()',500);
				}
			});
		}
	});
	//商家注册登陆事件
	$('#sregister').click(function(){
		if($('#sregister').text() == '注册'){
			var pass = document.getElementsByName("password");
			if(pass[4].value == pass[5].value){
				$.ajax({
					type:"post",
					url:"sreg",
					async:true,
					cache: false,
					processData: false,
					contentType: false,
					data: new FormData($('#sregdiv').get(0)),
					success : function(result) {
						bootoast({
							message: result==1?"注册成功":"服务器繁忙",
							type: 'info',
							position: 'right-bottom',
				 			timeout: 2,
				 			icon: 'info-sign'
						});
						if (result==1) {
							$("#sModal").modal("hide");
							//清空from表单
							$('#sregdiv')[0].reset();
						}
					}
				});
			}else{
				bootoast({
					message: "两次密码不一致！",
					type: 'info',
					position: 'right-bottom',
		 			timeout: 2,
		 			icon: 'info-sign'
				});
			}
		}else{
			$.ajax({
				type:"post",
				url:"slog",
				async:true,
				data: $('#slogdiv').serialize(),
				success : function(result) {
					if (result==1) {
						$("#sModal").modal("hide");
						//清空from表单
						$('#slogdiv')[0].reset();
					}
					if(result==1){
						window.location.href = "myshop";
					}else{
						bootoast({
							message: '服务器繁忙',
							type: 'info',
							position: 'right-bottom',
				 			timeout: 2,
				 			icon: 'info-sign'
						});
					}
				}
			});
		}
	});
	//退出事件
	function exit(){
		$.cookie('icon','null',{expires: new Date()});
		$.cookie('username','null',{expires: new Date()});
		$.cookie('shopname','null',{expires: new Date()});
		$.cookie('userid','null',{expires: new Date()});
		bootoast({
			message: "已退出",
			type: 'info',
			position: 'right-bottom',
 			timeout: 2,
 			icon: 'info-sign'
		});
		setTimeout('window.location.href = "index";',500);
	}
</script>