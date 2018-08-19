<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>${u.name}</title>
		<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
		<script type="text/javascript" src="assets/js/jquery-3.3.1.min.js" ></script>
		<script type="text/javascript" src="assets/js/bootstrap.min.js" ></script>
		<link href="assets/images/icon.png" rel="shortcut icon" type="image/x-icon">
		<link href="assets/images/icon.png" rel="icon" type="image/x-icon">
		<link href="assets/images/icon.png" rel="bookmark" type="image/x-icon">
	</head>
	<body>
		<jsp:include page="head.jsp"></jsp:include>
		<jsp:include page="search-max.jsp"></jsp:include>
		<div class="container well">
			公告：${u.notice}
		</div>
		<div style="min-width: 1170px;margin-bottom: 10px;">
			<img src="/img/${u.banner}" height="120px" width="100%"/>
		</div>
		<div class="container">
			<c:forEach items="${datas}" var="i">
				<a href="product?productid=${i.productid}" style="display: inline-block;width: 19.6%;background-color: #FFFFFF;margin-bottom: 20px;">
					<img src="/img/${i.introduce}" width="100%"/>
					<div class="text-center" style="overflow: hidden;height: 40px;margin: 8px 25%;color: #666666;font-size: 1.2em;">
						${i.name}
					</div>
					<div class="text-center" style="color: #FF0070;font-size: 1.5em;">${i.discountprice}</div>
				</a>
			</c:forEach>
		</div>
		<jsp:include page="foot.jsp"></jsp:include>
	</body>
</html>