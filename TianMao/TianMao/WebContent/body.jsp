<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>天猫tmall.com--理想生活上天猫</title>
		<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
		<script type="text/javascript" src="assets/js/jquery-3.3.1.min.js" ></script>
		<script type="text/javascript" src="assets/js/bootstrap.min.js" ></script>
		<link href="assets/images/icon.png" rel="shortcut icon" type="image/x-icon">
		<link href="assets/images/icon.png" rel="icon" type="image/x-icon">
		<link href="assets/images/icon.png" rel="bookmark" type="image/x-icon">
		<style>
			.container{
				padding: 0 !important;
			}
		</style>
	</head>
	<body style="min-width: 1170px;">
		<jsp:include page="head.jsp"></jsp:include>
		<jsp:include page="head-navigation.jsp"></jsp:include>
		
		<jsp:include page="body-search.jsp"></jsp:include>
		<jsp:include page="body-banner.jsp"></jsp:include>
		<jsp:include page="body-type.jsp"></jsp:include>
		
		<jsp:include page="foot.jsp"></jsp:include>
	</body>
</html>