<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Body-Type</title>
		<style>
			#b-t dl{
				margin-bottom: 10;
				min-width: 1000px;
			}
			#b-t dt{
				display: inline-block;
				margin-top: 20px;
				font-size: 1.2em;
			}
			#b-t dd{
				display: inline-block;
				margin-right: 10px;
			}
			#b-t dd a{
				cursor: pointer;
				color: #000000;
			}
			#b-t ul{
				list-style: none;
				padding: 0;
				margin: 0;
				height: 618px;
				min-width: 1170px;
			}
			#b-t li{
				float: left;
			}
			#b-t li a{
				display: inline-block;
				text-decoration: none;
				height: 49%;
				width: 24%;
				background-color: #FFFFFF;
				margin: 3px;
				padding: 11px;
			}
			#b-t li a img{
				height: 185px;
				width: 185px;
			}
			#b-t li a div{
				height: 42px;
				overflow: hidden;
				text-align: center;
				margin: 8px 25%;
				color: #333333;
				font-size: 1.2em;
			}
			#b-t li a div:last-child{
				color: #FF0070;
				width: 185px;
				height: auto;
				margin: 10px 0;
				width: 185px;
				font-size: 1.5em;
			}
		</style>
	</head>
	<body>
		<div id="b-t" style="background-color: #F5F5F5;min-width: 1200px;">
			<div class="container">
				<!----------------------------------------------------------->
				<div id="kw">
					<dl>
						<dd style="background-color: #0AA6E8;width: 0.5%;height: 1.2em;position: relative;bottom: -2px;"/>
						<dt style="width: 50.5%;">
							潮电酷玩
							<span style="font-size: 0.8em;">ELECTRONICS</span>
						</dt>
						<dd><a>手机</a></dd>
						<dd><a>iPhone</a></dd>
						<dd><a>相机</a></dd>
						<dd><a>数码配件</a></dd>
						<dd><a>影音电玩</a></dd>
						<dd><a>生活电器</a></dd>
						<dd><a>个人护理</a></dd>
						<dd><a>电脑硬件</a></dd>
						<dd style="margin-right: 0px;"><a>笔记本</a></dd>
					</dl>
					<div>
						<ul>
							<li style="width: 22%;">
								<img src="assets/images/type/type2-1.jpg" width="235px" height="618px"/>
							</li>
							<li style="width: 78%;">
								<c:forEach items="${k1}" var="i" varStatus="j">
									<a href="product?productid=${i.productid}">
										<img src="/img/${kp1[j.index][0].image}"/>
										<div>${i.name}</div>
										<div>￥ ${i.discountprice}</div>
									</a>
								</c:forEach>
							</li>
						</ul>
					</div>
				</div>
				<!----------------------------------------------------------->
				<div id="ml">
					<dl>
						<dd style="background-color: #EA5F8D;width: 0.5%;height: 1.2em;position: relative;bottom: -2px;"/>
						<dt style="width: 50.5%;">
							美丽人生
							<span style="font-size: 0.8em;">FASHION BEAUTY</span>
						</dt>
						<dd><a>连衣裙</a></dd>
						<dd><a>T恤男</a></dd>
						<dd><a>美容护肤</a></dd>
						<dd><a>休闲男鞋</a></dd>
						<dd><a>黄金项链</a></dd>
						<dd><a>单鞋</a></dd>
						<dd><a>女包</a></dd>
						<dd><a>文胸</a></dd>
						<dd style="margin-right: 0px;"><a>大牌腕表</a></dd>
					</dl>
					<div>
						<ul>
							<li style="width: 22%;">
								<img src="assets/images/type/type3-2.jpg" width="235px" height="618px"/>
							</li>
							<li style="width: 78%;">
								<c:forEach items="${k2}" var="i" varStatus="j">
									<a href="product?productid=${i.productid}">
										<img src="/img/${kp2[j.index][0].image}"/>
										<div>${i.name}</div>
										<div>￥ ${i.discountprice}</div>
									</a>
								</c:forEach>
							</li>
						</ul>
					</div>
				</div>
				<!----------------------------------------------------------->
				<div style="margin: 20px 0;overflow: hidden;">
					<img style="position: relative;left: -225px;" src="assets/images/Sutb-1.jpg" height="90px">
				</div>
				<!----------------------------------------------------------->
				<div id="jj">
					<dl>
						<dd style="background-color: #00B262;width: 0.5%;height: 1.2em;position: relative;bottom: -2px;"/>
						<dt style="width: 43.5%;">
							居家生活
							<span style="font-size: 0.8em;">GROCERY &amp; HEALTH</span>
						</dt>
						<dd><a>零食</a></dd>
						<dd><a>牛奶</a></dd>
						<dd><a>居家饰品</a></dd>
						<dd><a>保健品</a></dd>
						<dd><a>保温杯</a></dd>
						<dd><a>常用药</a></dd>
						<dd><a>热门图书</a></dd>
						<dd><a>洗发水</a></dd>
						<dd><a>卫生巾</a></dd>
						<dd><a>家庭清洁</a></dd>
						<dd style="margin-right: 0px;"><a>狗粮</a></dd>
					</dl>
					<div>
						<ul>
							<li style="width: 22%;">
								<img src="assets/images/type/type4-1.jpg" width="235px" height="618px"/>
							</li>
							<li style="width: 78%;">
								<c:forEach items="${k3}" var="i" varStatus="j">
									<a href="product?productid=${i.productid}">
										<img src="/img/${kp3[j.index][0].image}"/>
										<div>${i.name}</div>
										<div>￥ ${i.discountprice}</div>
									</a>
								</c:forEach>
							</li>
						</ul>
					</div>
				</div>
				<!----------------------------------------------------------->
				<div id="ac">
					<dl>
						<dd style="background-color: #F15453;width: 0.5%;height: 1.2em;position: relative;bottom: -2px;"/>
						<dt style="width: 50.5%;">
							打造爱巢
							<span style="font-size: 0.8em;">HOME</span>
						</dt>
						<dd><a>家具</a></dd>
						<dd><a>大家电</a></dd>
						<dd><a>四件套</a></dd>
						<dd><a>健康电器</a></dd>
						<dd><a>厨房电器</a></dd>
						<dd><a>吸顶灯</a></dd>
						<dd><a>平板电视</a></dd>
						<dd><a>装修设计</a></dd>
						<dd style="margin-right: 0px;"><a>跑步机</a></dd>
					</dl>
					<div>
						<ul>
							<li style="width: 22%;">
								<img src="assets/images/type/type5-1.jpg" width="235px" height="618px"/>
							</li>
							<li style="width: 78%;">
								<c:forEach items="${k4}" var="i" varStatus="j">
									<a href="product?productid=${i.productid}">
										<img src="/img/${kp4[j.index][0].image}"/>
										<div>${i.name}</div>
										<div>￥ ${i.discountprice}</div>
									</a>
								</c:forEach>
							</li>
						</ul>
					</div>
				</div>
				<!----------------------------------------------------------->
				<div style="margin: 20px 0;overflow: hidden;">
					<img style="position: relative;left: -225px;" src="assets/images/Sutb-3.jpg" height="90px">
				</div>
				<!----------------------------------------------------------->
				<div id="hw">
					<dl>
						<dd style="background-color: #19C8A9;width: 0.5%;height: 1.2em;position: relative;bottom: -2px;"/>
						<dt style="width: 65.5%;">
							户外出行
							<span style="font-size: 0.8em;">OUTDOORS &amp; AUTOMOTIVE</span>
						</dt>
						<dd><a>车秒贷</a></dd>
						<dd><a>皮肤衣</a></dd>
						<dd><a>运动鞋</a></dd>
						<dd><a>4s保养</a></dd>
						<dd><a>行车记录仪</a></dd>
						<dd style="margin-right: 0px;"><a>轮胎</a></dd>
					</dl>
					<div>
						<ul>
							<li style="width: 22%;">
								<img src="assets/images/type/type6-1.jpg" width="235px" height="618px"/>
							</li>
							<li style="width: 78%;">
								<c:forEach items="${k5}" var="i" varStatus="j">
									<a href="product?productid=${i.productid}">
										<img src="/img/${kp5[j.index][0].image}"/>
										<div>${i.name}</div>
										<div>￥ ${i.discountprice}</div>
									</a>
								</c:forEach>
							</li>
						</ul>
					</div>
				</div>
				<!----------------------------------------------------------->
				<div id="xh" style="margin: 20px 0;text-align: center;">
					<p style="font-size: 1.2em;color: #979797;">
						———
						<span style="color: #FD363C;font-size: 1.5em;position: relative;top: 8px;" class="glyphicon glyphicon-heart-empty"></span>
						猜你喜欢
						———
					</p>
				</div>
				<div>
					<c:forEach begin="0" end="4">
						<a style="display: inline-block;width: 19.6%;background-color: #FFFFFF;margin-bottom: 20px;">
							<img src="assets/images/item/item5.jpg" width="100%"/>
							<div style="overflow: hidden;height: 40px;margin: 8px 25%;color: #666666;font-size: 1.2em;">
								Mountainsmith MS Covert LX 旅行系列包 0870037
							</div>
							<div class="text-center" style="color: #FF0070;font-size: 1.5em;">￥283</div>
						</a>
					</c:forEach>
				</div>
				<!----------------------------------------------------------->
				<div style="margin-bottom: 20px;">
					<img class="center-block" src="assets/images/end.png"/>
				</div>
			</div>
		</div>
	</body>
	<script>
		$("dd a").click(function(){
			window.location.href="search?name="+this.innerText;
		});
	</script>
</html>