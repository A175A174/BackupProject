<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--**********
*播放器头部页面
**********-->

<!--滑动验证插件-->
<link rel="stylesheet" href="css/unlock.css" />
<script type="text/javascript" src="js/unlock.js" ></script>
<!--滑动验证插件-->

<!--cookie编辑组件-->
<script type="text/javascript" src="assets/js/jquery.cookie.js" ></script>

<!--Material design风格浮动按钮插件-->
<link href="css/mfb.min.css" rel="stylesheet">
<script src="js/mfb.min.js"></script>
<!--Material design风格浮动按钮插件-->

<!--Bootstrap3 Toast消息框插件-->
<link rel="stylesheet" href="css/bootoast.css">
<script type="text/javascript" src="js/bootoast.js"></script>
<!--Bootstrap3 Toast消息框插件-->

<!-- 注册Modal -->
<div class="modal fade" id="regModal" tabindex="-1" role="dialog" aria-labelledby="注册框">
  <div class="modal-dialog" role="document" aria-hidden="true">
    <div class="modal-content">
    	<div class="modal-header">
        	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
        		<span aria-hidden="true">&times;</span>
        	</button>
    		<h4 class="modal-title" id="myModalLabel">注册</h4>
    	</div>
    	<div class="modal-body">
    		<form class="form-signin" data-toggle="validator">
	        	<div class="form-group">
					<div class="input-group input-group-lg">
				  		<span class="input-group-addon">账号</span>
						<input type="text" id="rusername" class="form-control" placeholder="enter account" aria-describedby="basic-username">
					</div>
				</div>
				<div class="form-group">
					<div class="input-group input-group-lg">
				  		<span class="input-group-addon">密码</span>
						<input type="password" id="rpassword" class="form-control" placeholder="enter password" aria-describedby="basic-password">
					</div>
				</div>
				<div class="form-group">
					<div class="input-group input-group-lg">
				  		<span class="input-group-addon">确认密码</span>
				  		<input type="password" id="rpasswordr" class="form-control" placeholder="enter password" aria-describedby="basic-password">
					</div>
				</div>
			</form>
    	</div>
    	<div class="modal-footer">
        	<button type="button" id="register" class="btn btn-primary">注册</button>
        	<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      	</div>
    </div>
  </div>
</div>

<!-- 登陆Modal -->
<div class="modal fade" id="logModal" tabindex="-1" role="dialog" aria-labelledby="登陆框">
  <div class="modal-dialog" role="document" aria-hidden="true">
    <div class="modal-content">
    	<div class="modal-header">
        	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
        		<span aria-hidden="true">&times;</span>
        	</button>
    		<h4 class="modal-title" id="myModalLabel">登陆</h4>
    	</div>
    	<div class="modal-body">
    		<form class="form-signin">
	    		<div class="form-group">
					<div class="input-group input-group-lg">
						<span class="input-group-addon">账号</span>
						<input type="text" id="lusername" class="form-control" placeholder="enter account" aria-describedby="basic-username">
					</div>
				</div>
				<div class="form-group">
					<div class="input-group input-group-lg">
						<span class="input-group-addon">密码</span>
						<input type="password" id="lpassword" class="form-control" placeholder="enter password" aria-describedby="basic-password">
					</div>
				</div>
				<div class="form-group">
					<div class="input-group input-group-lg">
						<span class="input-group-addon">验证码</span>
						<div id="hdcode"></div>
						<input id="code" type="hidden" value="0"/>
						<!--<input type="text" id="code" style="width: 340px;" class="form-control" placeholder="enter code" aria-describedby="basic-username">
						<img src="assets/img/3.jpg" width="100px" height="46px" style="margin: 0px 20px;"/>-->
					</div>
				</div>
		        <div class="form-group checkbox text-right">
		        	<label>
		        		<input id="checkbox" type="checkbox" value="1"> 七天免登陆
		        	</label>
		        </div>
	      	</form>
    	</div>
    	<div class="modal-footer">
        	<button type="button" id="login" class="btn btn-default btn-primary">登陆</button>
        	<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      	</div>
    </div>
  </div>
</div>

<!-- 个人信息Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="登陆框">
  <div class="modal-dialog" role="document" aria-hidden="true">
    <div class="modal-content">
    	<div class="modal-header">
        	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
        		<span aria-hidden="true">&times;</span>
        	</button>
    		<h4 class="modal-title" id="myModalLabel">我的信息</h4>
    	</div>
    	<div class="modal-body">
    		<form id="my" class="form-signin" enctype="multipart/form-data">
    			<div class="form-group">
					<div class="input-group input-group-lg">
						<span class="input-group-addon">账号</span>
						<input value="${cookie.uname.value}" name="myname" type="text" readonly class="form-control" aria-describedby="basic-username">
					</div>
				</div>
    			<div class="form-group">
					<div class="input-group input-group-lg">
						<span class="input-group-addon">原密码</span>
						<input type="password" name="myoldpassword" id="myoldpassword" class="form-control" aria-describedby="basic-password">
					</div>
				</div>
				<div class="form-group">
					<div class="input-group input-group-lg">
						<span class="input-group-addon">新密码</span>
						<input type="password" id="mynewpassword" class="form-control" aria-describedby="basic-password">
					</div>
				</div>
				<div class="form-group">
					<div class="input-group input-group-lg">
						<span class="input-group-addon">确认新密码</span>
						<input type="password" name="mynewpasswordr" id="mynewpasswordr" class="form-control" aria-describedby="basic-password">
					</div>
				</div>
				<div class="form-group">
					<div class="input-group input-group-lg">
						<img class="center-block img-circle" src="/icon/${cookie.uicon.value}" height="100px" width="100px"/>
						<span class="input-group-addon">修改头像</span>
    					<input id="myicon" name="myicon" style="margin-bottom: 25px;" type="file" class="form-control" accept="image/jpeg, image/gif, image/x-png">
					</div>
				</div>
	      	</form>
    	</div>
    	<div class="modal-footer">
        	<button type="button" id="myupdate" class="btn btn-default btn-primary">修改</button>
        	<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      	</div>
    </div>
  </div>
</div>

<!--导航栏-->
<nav class="navbar navbar-default" style="margin-bottom: 0px;background: none;border-width: 0px;">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example" style="margin-top:12px;">
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		    </button>
		    <c:if test="${cookie.uicon ne null}">
	  			<a data-toggle="modal" href="#myModal">
	  				<img alt="Brand" class="img-circle" src="/icon/${cookie.uicon.value}" style="height: 80px;width: 80px;margin: 10px 0px 0px 10px;">
	  			</a>
		    </c:if>
		    <!--logo-->
		    <c:if test="${cookie.uicon eq null}">
	  			<a id="logo" title="未设置头像，点击用户名可设置" data-placement="top">
	  				<img alt="Brand" class="img-circle" src="assets/img/logo.jpg" style="height: 80px;width: 80px;margin: 10px 0px 0px 10px;">
	  			</a>
		    </c:if>
		</div><!--class="navbar-header"-->
		<div class="hidden-xs">
			<c:if test="${cookie.uname ne null}">
				<a data-toggle="modal" href="#myModal">
			  		<p class="navbar-text" style="color: #FFFFFF;font-size: 30px;margin-top: 30px">${cookie.uname.value}</p>
		  		</a>
			</c:if>
			<!--登陆Material design风格浮动按钮特效-->
        	<ul id="menu" class="mfb-component--tr mfb-zoomin" data-mfb-toggle="hover">
				<li>
					<a href="#" class="mfb-component__button--main">
						<i class="mfb-component__main-icon--resting glyphicon glyphicon-user"></i>
						<i class="mfb-component__main-icon--active glyphicon glyphicon glyphicon-heart"></i>
					</a>
					<ul class="mfb-component__list">
						<c:choose>
							<c:when test="${cookie.uname eq null}">
								<li>
									<a data-toggle="modal" href="#logModal" data-mfb-label="登陆" class="mfb-component__button--child">
										<i class="mfb-component__child-icon glyphicon glyphicon-plane"></i>
									</a>
								</li>
								<li>
									<a data-toggle="modal" href="#regModal" data-mfb-label="注册" class="mfb-component__button--child">
										<i class="mfb-component__child-icon glyphicon glyphicon-text-width"></i>
									</a>
								</li>
							</c:when>
							<c:otherwise>
								<li>
									<a onclick="uexit()" data-mfb-label="退出" class="mfb-component__button--child">
										<i class="mfb-component__child-icon glyphicon glyphicon-off"></i>
									</a>
								</li>
							</c:otherwise>
						</c:choose>
					</ul>
				</li>
			</ul><!--登陆Material design风格浮动按钮特效-->
		</div>
		<div class="collapse navbar-collapse" id="bs-example">
			<ul class="nav navbar-nav navbar-right visible-xs-inline">
				<c:choose>
					<c:when test="${cookie.uname eq null}">
						<li><a data-toggle="modal" href="#logModal" style="color: #FFFFFF;">登陆</a></li>
	        			<li><a data-toggle="modal" href="#regModal" style="color: #FFFFFF;">注册</a></li>
					</c:when>
					<c:otherwise>
						<li  onclick="uexit()"><a data-toggle="modal" href="#regModal" style="color: #FFFFFF;">退出</a></li>
					</c:otherwise>
				</c:choose>
  			</ul>
		</div><!--class="collapse navbar-collapse"-->
	</div><!--class="container-fluid"-->
</nav>

<script>
	
	$(function(){
		//滑块验证插件初始化
		$("#hdcode").slideToUnlock({
			successFunc : function() {$("#code").val(1);},//成功解锁后的回调函数
			height : 46,//滑块的高度
			width : 475,//滑块的宽度
			textColor : '#fff',//文字的颜色
			text : '请滑动来验证',//未解锁的文字
			succText : '验证成功',//解锁成功后的文字
			succTextColor : '#fff',//解锁成功后显示的文字颜色
			succColor : '#f60',//解锁成功后的颜色
			bgColor : '#aaa',//滑块的背景颜色
			handleColor : '#fff',//滑块手柄的颜色
			progressColor : '#bca'//progress的颜色
			
		});
		//提示初始化
		$('#logo').tooltip();
	});

	//注册登陆回车事件
	$("#rpasswordr").keyup(function(event){
		if(event.keyCode ==13){
	    	$("#register").trigger("click");
		}
	});
	$("#checkbox").keyup(function(event){
		if(event.keyCode ==13){
			$("#login").trigger("click");
		}
	});
	
	//注册逻辑
	$("#register").on("click",function(){
		$("#register").attr("disabled",true);//防止重复提交
		if($("#rusername").val().length < 3){
			bootoast({
			    message: "用户名不能少于三位！",
				type: 'info',
				position: 'right-bottom',
	 			timeout: 2,
	 			icon: 'info-sign'
			});
		}else if($("#rpassword").val() != $("#rpasswordr").val() || $("#rpassword").val().length < 6){
			bootoast({
			    message: "密码不一致或密码少于六位！",
				type: 'info',
				position: 'right-bottom',
	 			timeout: 2,
	 			icon: 'info-sign'
			});
		} else{
			$.ajax({
				type : "post",
				url : "register",
				async : false,
				data : {
					name : $("#rusername").val(),
					pass : $("#rpassword").val()
				},
				success : function(msg){
					if(msg == 1){
						$("#regModal").modal("hide");
						bootoast({
						    message: "注册成功！<br>" + $("#rusername").val(),
							type: 'success',
							position:'right-bottom',
				 			timeout: 2,
				 			icon: 'ok-sign'
						});
						$("#logModal").modal("show");
					}else{
						bootoast({
						    message: "注册失败，用户名已存在！",
							type: 'warning',
							position:'right-bottom',
							timeout: 2,
							icon: 'exclamation-sign'
						});
					}
					
				},
				error : function(){
					bootoast({
					    message: "服务器繁忙！",
						type: 'info',
						position: 'right-bottom',
			 			timeout: 2,
			 			icon: 'info-sign'
					});
				}
			});
		}
		$("#register").attr('disabled',false);
	});
	
	//登陆逻辑
	$('#login').on('click',function(){
		$("#login").attr('disabled',true);//防止重复提交
		if($("#lusername").val().length==0 || $("#lpassword").val().length==0){
			bootoast({
			    message: "用户名或密码不能为空！",
				type: 'info',
				position: 'right-bottom',
	 			timeout: 2,
	 			icon: 'info-sign'
			});
		}else if($("#code").val() == 0){
			bootoast({
			    message: "请滑动验证！",
				type: 'info',
				position: 'right-bottom',
	 			timeout: 2,
	 			icon: 'info-sign'
			});
		}else{
			$.ajax({
				type : "post",
				url : "login",
				async : false,
				data : {
					name : $("#lusername").val(),
					pass : $("#lpassword").val(),
					checkbox : $("#checkbox").is(":checked") ? 1 : 0
				},
				success : function(msg){
					if(msg == 0){
						bootoast({
							message: "用户名或密码错误！",
							type: 'info',
							position: 'right-bottom',
				 			timeout: 2,
				 			icon: 'info-sign'
						});
					}else{
						bootoast({
						    message: "你好！" + $("#lusername").val(),
							type: 'success',
							position:'right-bottom',
				 			timeout: 2,
				 			icon: 'ok-sign'
						});
						$("#logModal").modal("hide");
						//局部加载jsp
						setTimeout("$('#head').load('head.jsp')",200);
						setTimeout("$('#body').load('body.html')",250);
					}
				},
				error : function(){
					bootoast({
						message: "服务器繁忙！",
						type: 'info',
						position: 'right-bottom',
			 			timeout: 2,
			 			icon: 'info-sign'
					});
				}
			});
		}
		$("#login").attr('disabled',false);
		//刷新当前页面
		//window.location.reload();
	});
	
	//退出
	function uexit(){
		//document.cookie='user=值;[expires=失效时间;path=设置地址;domain=域名;secure]'
		//encodeURIComponent('李')中文编码
		//var reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
		//document.cookie.match(reg)
		
		//expires：（Number|Date）有效期；设置一个整数时，单位是天；也可以设置一个日期对象作为Cookie的过期日期；
		//path：（String）创建该Cookie的页面路径；
		//domain：（String）创建该Cookie的页面域名；
		//secure：（Booblean）如果设为true，那么此Cookie的传输会要求一个安全协议，例如：HTTPS；
		//alert(document.cookie);
		
		$.cookie('upass','null',{expires: new Date()});
		$.cookie('uid','null',{expires: new Date()});
		$.cookie('uname','null',{expires: new Date()});
		$.cookie('uicon','null',{expires: new Date()});
		//局部加载jsp
		setTimeout("$('#head').load('head.jsp')",200);
		setTimeout("$('#body').load('body.html')",210);
		bootoast({
		    message: "已退出！",
			type: 'info',
			position: 'right-bottom',
 			timeout: 2,
 			icon: 'info-sign'
		});
	}
	
	//更新个人信息
	$('#myupdate').click(function(){
		var pass = $("#myoldpassword");
		var npass = $("#mynewpassword");
		var npassr = $("#mynewpasswordr");
		if(pass.val().length < 6 || npass.val().length < 6 || npassr.val().length < 6){
			bootoast({
				message: "密码不能少于六位！",
				type: 'info',
				position: 'right-bottom',
	 			timeout: 2,
	 			icon: 'info-sign'
			});
		}else if(npass.val() != npassr.val()){
			bootoast({
				message: "两次密码不一致！",
				type: 'info',
				position: 'right-bottom',
	 			timeout: 2,
	 			icon: 'info-sign'
			});
		}else{
			$("#myupdate").attr('disabled',true);
			$.ajax({
				type:"post",
				url:"updateuserinfo",
				cache: false,//上传文件不需要缓存。
				async:false,
				data: new FormData($("#my").get(0)),
				processData: false,//data值是FormData对象，不需要对数据做处理。
				contentType: false,//由<form>表单构造的FormData对象已经声明了属性enctype="multipart/form-data"
				success : function(msg){
					if(msg == 0){
						bootoast({
							message: "个人信息修改失败！",
							type: 'info',
							position: 'right-bottom',
				 			timeout: 2,
				 			icon: 'info-sign'
						});
					}else{
						bootoast({
						    message: "修改成功，下次需重新登陆！",
							type: 'success',
							position:'right-bottom',
				 			timeout: 2,
				 			icon: 'ok-sign'
						});
						$("#myModal").modal("hide");
						$.cookie("uicon",msg,{expires: 7});
						setTimeout("$('#head').load('head.jsp')",200);
						setTimeout("$('#body').load('body.html')",210);
					}
					$("#myupdate").attr('disabled',false);
				},
				error : function(){
					bootoast({
						message: "服务器繁忙！",
						type: 'info',
						position: 'right-bottom',
			 			timeout: 2,
			 			icon: 'info-sign'
					});
					$("#myupdate").attr('disabled',false);
				}
			});
		}
	});
</script>