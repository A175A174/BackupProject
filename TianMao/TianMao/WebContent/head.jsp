<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Head</title>
		<script type="text/javascript" src="assets/js/jquery.cookie.js" ></script>
		<style type="text/css">
			#h li{
				display: inline-block;
				padding: 0px 5px;
				font-size: 0.8em;
			}
			#h li a{
				text-decoration: none;
				cursor: pointer;
				color: #999999;
			}
			#h li a:hover{
				color: #FF0036;
			}
			#h ul{
				margin: 6px 0px;
				padding: 0px;
				display: inline-block;
			}
			#h b:hover{
				cursor: pointer;
			}
		</style>
	</head>
	<body>
		<div id="h" style="background-color: #F2F2F2;color: #999999;">
			<div class="container">
				<ul>
					<c:if test="${pageContext.request.requestURL != 'http://127.0.0.1:8080/TianMao/body.jsp'}">
						<li><a href="index">天猫首页</a></li>
					</c:if>
					<c:choose>
						<c:when test="${cookie.tmname != null}">
							<li>Hi，<a href="${cookie.tmname!=null?cookie.xs!=null?'mys.jsp':'my.jsp':'login.jsp'}">${cookie.tmname.value}</a></li>
							<li><b onclick="et()">退出</b></li>
						</c:when>
						<c:otherwise>
							<li style="padding: 0px 5px 0px 0px;">喵，欢迎来到天猫</li>
							<li><a href="login.jsp">请登陆</a></li>
							<li><a href="login.jsp">免费注册</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
				<ul class="pull-right">
					<li><a href="${cookie.tmname!=null?cookie.xs!=null?'mys.jsp':'my.jsp':'login.jsp'}">我的订单</a></li>
					<c:if test="${cookie.tmname!=null}">
						<c:if test="${cookie.xs==null}">
							<li>
								<a href="gwc"><img src="assets/images/head-1.png" style="position: relative;top: -2px;"/>购物车</a>
							</li>
						</c:if>
					</c:if>
					<li style="display: none;"><a>收藏夹<span class="caret"></span></a></li>
					<li style="padding: 0;">|</li>
					<li style="display: none;">
						<a>
							<img src="assets/images/head-2.png" style="position: relative;top: -1px;"/>
							手机版
						</a>
					</li>
					<c:if test="${cookie.tmname == null}">
						<li><a href="logins.jsp">商家支持<span class="caret"></span></a></li>
					</c:if>
					<li style="padding: 0px 0px 0px 5px;"><a target="_blank" href="https://www.taobao.com">淘宝网</a></li>
				</ul>
			</div>
		</div>
	</body>
	<script>
		function et(){
			$.cookie('tmname',null,{expires: new Date()});
			$.ajax({
				type:"post",
				url:"et",
				async:false,
				data: {mux : $.cookie('mux')}
			});
			$.cookie('mux',null,{expires: new Date()});
			$.cookie('xs',null,{expires: new Date()});
			window.location.href="index";
		}
	</script>
</html>