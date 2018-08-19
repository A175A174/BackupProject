<%@page import="com.musics.service.UserServiceImpl"%>
<%@page import="com.musics.dto.UserDto"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	UserDto user = new UserDto();
	Cookie[] cs = request.getCookies();
	if(cs != null && cs.length > 1){
		for (Cookie cookie : cs) {
			
			if("uname".equals(cookie.getName())) {
				user.setName(cookie.getValue());
				continue;
			}
			if("upass".equals(cookie.getName())) {
				user.setPass(cookie.getValue());
				continue;
			}
		}
		if(user.getName() != null && user.getPass() != null){
			if(UserServiceImpl.login(user) == null){
				for (Cookie cookie : cs) {
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}
			}
		}else{
			for (Cookie cookie : cs) {
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
		}
	}
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cloud Musics</title>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
        <link rel="stylesheet" href="assets/css/main.css" />
		<script type="text/javascript" src="assets/js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript" src="assets/js/bootstrap.min.js" ></script>
		
		<style>
			html,body{
				height: 100%;
			}
			.blur {
				background-color: rgba(20, 20, 20, 0.6);
			    /*-webkit-filter: blur(10px);
			    -o-filter:blur(10px);
			    -moz-filter: blur(10px);
			    -ms-filter: blur(10px);
			    filter: blur(10px);*/
			}
			.bimg{
				background-image: url(assets/img/bg01.jpg);
				background-repeat: no-repeat;
			}
		</style>
    </head>
    <body id="bbg" class="bimg">
    	<div class="blur" style="height: 100%;">
	    	<!--顶部面板-->
	    	<div id="head" style="height: 10%;"></div>
	    	<!--控制面板-->
	    	<div id="body" style="height: 75%;"></div>
	    	<!--底部信息-->
	    	<div id="footer" style="height: 10%;"></div>
    	</div>
 	</body>
 	<script>
 		$("#head").load("head.jsp");
 		$("#body").load("body.html");
 		$("#footer").load("footer.html");
 	</script>
</html>