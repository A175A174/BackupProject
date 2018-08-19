<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Body-Banner</title>
	</head>
	<style>
		#b-b hr{
			margin: 0;
			border: #FF0036 1px solid;
		}
		#b-b ul{
			list-style: none;
			padding: 0;
			margin: 0;
		}
		#b-b li{
			padding: 5.5px 0;
			color: #FFFFFF;
		}
		#b-b li:hover{
			background-color: #1BA261;
		}
		#b-b a{
			color: #FFFFFF;
		}
		#b-fenleixiangqing ~ div{
			left: 18%;
			position: absolute;
			background-color: rgba(250, 250, 250, 0.9);
			height: 523px;
			width: 82%;
			display: none;
		}
	</style>
	<body>
		<div id="b-b">
			<hr/>
			<div class="container" style="position: relative;z-index: 100;">
				<!--分类-->
				<ul id="b-fenlei" style="position: absolute;width: 18%;background-color: rgba(20, 20, 20, 0.6);">
					<c:forEach begin="0" end="15">
						<li>
							<span class="glyphicon glyphicon-globe"></span>
							<span>&nbsp;&nbsp;&nbsp;</span>
							<a>女装</a>/
							<a>内衣</a>
						</li>
					</c:forEach>
				</ul>
				<!--分类详情-->
				<div id="b-fenleixiangqing" style="display: none;"></div>
				<c:forEach begin="0" end="15">
					<div>
						<dl class="dl-horizontal">
							<dt>品牌推荐</dt>
							<dd>安踏</dd>
							<dd>安踏</dd>
							<dd>安踏</dd>
							<dd>安踏</dd>
							<dd>安踏</dd>
							<dd>安踏</dd>
						</dl>
					</div>
				</c:forEach>
			</div>
			<!--轮播图-->
			<div style="background-color: #EBEBEB;height: 523px;">
				<div class="container" style="height: 523px;">
					<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
						<!-- Indicators -->
						<ol class="carousel-indicators">
						    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
						    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
						    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
						</ol>
					
						<!-- Wrapper for slides -->
						<div class="carousel-inner" role="listbox">
						    <div class="item active">
						    	<img src="assets/images/banner/banner-4.jpg" style="height: 523px;" width="100%"/>
						    	<div class="carousel-caption"></div>
						    </div>
						    <div class="item">
						    	<img src="assets/images/banner/banner-2.jpg" style="height: 523px;" width="100%"/>
						    	<div class="carousel-caption"></div>
					    	</div>
					    	<div class="item">
						    	<img src="assets/images/banner/banner-3.jpg" style="height: 523px;" width="100%"/>
						    	<div class="carousel-caption"></div>
					    	</div>
						</div>
					
						<!-- Controls -->
						<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
						    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						    <span class="sr-only">Previous</span>
						</a>
						<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
						    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						    <span class="sr-only">Next</span>
						</a>
					</div>
				</div>
			</div>
		</div>
	</body>
	<script>
		var li_list = document.querySelectorAll("#b-fenlei li");
		var div_list = document.querySelectorAll("#b-fenleixiangqing ~ div");
		for (var i = 0; i < li_list.length; i++) {
			li_list[i].index=i;
			li_list[i].onmouseover=function(){//移入事件
				div_list[this.index].style.display="block";
			};
			li_list[i].onmouseout=function(){//移出事件
				div_list[this.index].style.display="none";
			};
		}
		for (var i = 0; i < div_list.length; i++) {
			div_list[i].index=i;
			div_list[i].onmouseover=function(){
				div_list[this.index].style.display="block";
			};
			div_list[i].onmouseout=function(){
				div_list[this.index].style.display="none";
			};
		}
	</script>
</html>