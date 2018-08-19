<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>FL</title>
		<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
		<script type="text/javascript" src="assets/js/jquery-3.3.1.min.js" ></script>
		<script type="text/javascript" src="assets/js/bootstrap.min.js" ></script>
		<!--Bootstrap3 Toast消息框插件-->
		<link rel="stylesheet" href="assets/css/bootoast.css">
		<script type="text/javascript" src="assets/js/bootoast.js"></script>
		<!--Bootstrap3 Toast消息框插件-->
		<!--cookie编辑组件-->
		<script type="text/javascript" src="assets/js/jquery.cookie.js" ></script>
		<!--cookie编辑组件-->
	</head>
	<body style="background-color: #F7F7F7;min-width: 750px;">
		<div>
			<jsp:include page="head.jsp"></jsp:include>
		</div>
		<div>
			<jsp:include page="body.jsp"></jsp:include>
		</div>
		<hr/>
		<div>
			<%@include file="footer.html"%>
		</div>
	</body>
</html>