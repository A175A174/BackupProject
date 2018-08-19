<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>${k.name}</title>
		<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
		<script type="text/javascript" src="assets/js/jquery-3.3.1.min.js" ></script>
		<script type="text/javascript" src="assets/js/bootstrap.min.js" ></script>
		<script type="text/javascript" src="assets/js/jquery.cookie.js" ></script>
		<script type="text/javascript" src="assets/js/bootoast.js" ></script>
		<link rel="stylesheet" href="assets/css/bootoast.css" />
		<link href="assets/images/icon.png" rel="shortcut icon" type="image/x-icon">
		<link href="assets/images/icon.png" rel="icon" type="image/x-icon">
		<link href="assets/images/icon.png" rel="bookmark" type="image/x-icon">
		<script type="text/javascript" src="assets/js/jquery.dataTables.min.js" ></script>
		<link rel="stylesheet" href="assets/css/jquery.dataTables.min.css" />
		<style>
			#product-2 ul{
				list-style: none;
				padding: 0;
				margin: 0;
			}
			#product-2 li{
				float: left;
			}
			#product-2 li div img{
				margin: 10px 10px;
			}
			th{
				text-align: center;
			}
		</style>
	</head>
	<body style="min-width: 1200px;">
		<jsp:include page="head.jsp"></jsp:include>
		<jsp:include page="search-max.jsp"></jsp:include>
		<div style="min-width: 1170px;margin-bottom: 10px;">
			<img src="/img/${u.banner}" height="120px" width="100%"/>
		</div>
		<div style="min-width: 1170px;" class="container" id="product-2">
			<ul style="padding: 0 10%;">
				<li style="width: 430px;">
					<img src="/img/${kp[0].image}" height="418px" width="418px"/>
					<div class="text-center" style="display: none;">
						<img src="assets/images/item/item3.jpg" height="60px" width="60px"/>
						<img src="assets/images/item/item3.jpg" height="60px" width="60px"/>
						<img src="assets/images/item/item3.jpg" height="60px" width="60px"/>
						<img src="assets/images/item/item3.jpg" height="60px" width="60px"/>
					</div>
				</li>
				<li style="width: 50%;margin-left: 25px">
					<p style="font-weight: bold;font-size: 1.5em;">${k.name}</p>
					<span style="color: #FF0036;">${k.title}</span>
					<div style="padding-left: 1em;margin-top: 10px;background-color: #ECEBEB;height: 110px;">
						<div style="padding-top: 10px;font-size: 1.5em;">
							<span>价格&nbsp;¥&nbsp;&nbsp;&nbsp;</span>
							<span style="text-decoration: line-through;">${k.originalprice}</span>
						</div>
						<div style="margin-top: 10px;font-size: 2.5em;color: #FF0036;">
							<span>促销价&nbsp;¥&nbsp;&nbsp;&nbsp;</span>
							<span>${k.discountprice}</span>
						</div>
					</div>
					<p style="margin-top: 20px;font-size: 1.5em;">从${u.address}发货，运费：<span style="color: red;">${addyf.cost}</span></p>
					<div style="margin-top: 20px;">
						数量<input id="num" type="number" min="1" max="${k.stock}" value="1"/>件,库存${k.stock}件
					</div>
					<div style="margin-top: 50px;margin-left: 50px;">
						<c:choose>
							<c:when test="${k.stock<=0}">
								<p class="lead" style="color: red;">已售空</p>
							</c:when>
							<c:otherwise>
								<button id="pay" data-id="${k.productid}" style="height: 40px;width: 180px;border: #FF0036 1px solid;background-color: #FFEDED;color: #FF0036;">立即购买</button>
								<button onclick="addgwc(${k.productid})" style="height: 40px;width: 180px;background-color: #FF0036;color: #FFFFFF;border: none;">加入购物车</button>
							</c:otherwise>
						</c:choose>
					</div>
				</li>
			</ul>
		</div>
		<div class="container" style="min-width: 1170px;">
			<div>
				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">
				    <li role="presentation" class="active"><a href="#home" data-toggle="tab">商品详情</a></li>
				    <li role="presentation" onclick="hqpl('${k.productid}')"><a href="#profile" data-toggle="tab">累计评价</a></li>
				</ul>
				<!-- Tab panes -->
				<div class="tab-content">
				    <div role="tabpanel" style="margin-top: 20px;" class="tab-pane active" id="home">
				    	<div class="well">
				    		${k.introduce}
				    	</div>
				    	<div>
				    		<c:forEach items="${kp}" begin="1" var="i">
				    			<img src="/img/${i.image}" width="100%" />
				    		</c:forEach>
				    	</div>
				    </div>
				    <div role="tabpanel" style="margin-top: 20px;" class="tab-pane" id="profile">
		    			<table id="pllb" class="display text-center">
						    <thead>
						        <tr>
						            <th>昵称</th>
						            <th>类容</th>
						            <th>时间</th>
						        </tr>
						    </thead>
						    <tbody></tbody>
						</table>
				    </div>
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
		
		/**************************************时间格式化处理************************************/
		function dateFtt(fmt,date)   
		{ //author: meizz   
		  var o = {   
		    "M+" : date.getMonth()+1,                 //月份   
		    "d+" : date.getDate(),                    //日   
		    "h+" : date.getHours(),                   //小时   
		    "m+" : date.getMinutes(),                 //分   
		    "s+" : date.getSeconds(),                 //秒   
		    "q+" : Math.floor((date.getMonth()+3)/3), //季度   
		    "S"  : date.getMilliseconds()             //毫秒   
		  };   
		  if(/(y+)/.test(fmt))   
		    fmt=fmt.replace(RegExp.$1, (date.getFullYear()+"").substr(4 - RegExp.$1.length));   
		  for(var k in o)   
		    if(new RegExp("("+ k +")").test(fmt))   
		  fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));   
		  return fmt;   
		}
		
		//获取评论
		function hqpl(id){
			if($("#pllb tbody tr").length > 0){
				return;
			}
			$.ajax({
				type:"post",
				url:"getproducttl",
				async:true,
				data:{productid:id},
				success:function(value){
					$('#pllb').DataTable({
			 	    	data: value,
			 	    	columns: [
			 	    		{ data: 'userid' },
			 	            { data: 'contention' },
			 	            { data: 'createdate' },
			 	        ],
			 	        columnDefs: [{
			            	//0表示第一列，1表示第二列
			                targets: 2,
			                render: function(data, type, row, meta) {
			                	return dateFtt("yyyy-MM-dd hh:mm:ss",new Date(row.createdate));
			                }
			            }],
			 	    	language: {
							"sProcessing": "处理中...",
							"sLengthMenu": "显示 _MENU_ 项结果",
							"sZeroRecords": "没有匹配结果",
							"sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
							"sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
							"sInfoFiltered": "(由 _MAX_ 项结果过滤)",
							"sInfoPostFix": "",
							"sSearch": "搜索:",
							"sUrl": "",
							"sEmptyTable": "表中数据为空",
							"sLoadingRecords": "载入中...",
							"sInfoThousands": ",",
							"oPaginate": {
								"sFirst": "首页",
								"sPrevious": "上页",
								"sNext": "下页",
								"sLast": "末页"
							},
							"oAria": {
								"sSortAscending": ": 以升序排列此列",
								"sSortDescending": ": 以降序排列此列"
							}
						}
			 	    });
				}
			});
		}
		//添加购物车
		function addgwc(s) {
			var xs = $.cookie('xs');
			if(xs != null){
				tusi("商家不允许购买，请使用普通用户账号");
			}else if($.cookie('mux') != null){
				var num = $("#num").val();
				$.ajax({
					type:"post",
					url:"addgwc",
					async:true,
					data:{
						num:num,
						productid:s
					},
					success:function(x){
						if( x == "1"){
							tusi("添加成功");
						}else{
							tusi("添加失败");
						}
					}
				});
			}else{
				tusi("请先登录");
			}
		}
		//计算总价
		$("#num").change(function(){
			if($("#num").val()<=0){
				$("#num").val("1");
			}else if($("#num").val()>$("#num").attr("max")){
				$("#num").val($("#num").attr("max"));
			}
		});
		$("#pay").click(function(){
			var xs = $.cookie('xs');
			if(xs != null){
				tusi("商家不允许购买，请使用普通用户账号");
			}else if($.cookie('mux') != null){
				window.location.href="selectAddress?productid="+$("#pay").data("id")+"&number="+$("#num").val();
			}else{
				tusi("请先登录");
			}
		});
	</script>
</html>