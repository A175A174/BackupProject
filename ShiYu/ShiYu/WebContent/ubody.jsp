<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>FL</title>
		<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
		<script type="text/javascript" src="assets/js/jquery-3.3.1.min.js" ></script>
		<script type="text/javascript" src="assets/js/bootstrap.min.js" ></script>
		<script type="text/javascript" src="assets/js/jquery.dataTables.min.js" ></script>
		<link rel="stylesheet" href="assets/css/jquery.dataTables.min.css" />
		<!--Bootstrap3 Toast消息框插件-->
		<link rel="stylesheet" href="assets/css/bootoast.css">
		<script type="text/javascript" src="assets/js/bootoast.js"></script>
		<!--Bootstrap3 Toast消息框插件-->
		<!--cookie编辑组件-->
		<script type="text/javascript" src="assets/js/jquery.cookie.js" ></script>
		<!--cookie编辑组件-->
		<style>
			table th{
				text-align: center;
			}
			table td{
				text-align: center;
			}
			a{
				text-decoration: none !important;
			}
			a:hover{
				cursor: pointer;
			}
			#gwc{
				position: fixed;
				bottom: 50px;
				right: 0px;
			}
		</style>
	</head>
	<body style="background-color: #F7F7F7;min-width: 750px;">
		<div id="gwc" class="well" style="margin: 0px;width: 320px;height: 500px;">
			<form id="gwcx">
				<div>
					<input type="text" style="width: 280px;" id="address" name="address" placeholder="收货地址" />
					<input id="zjv" type="hidden" name="price" value="0.00" />
					<input type="hidden" name="sellerid" value="${seller.id}" />
				</div>
				<table>
					<thead>
				        <tr>
				            <th width="80px">菜名</th>
				            <th width="80px">数量</th>
				            <th width="80px">操作</th>
				            <th width="80px">价格</th>
				        </tr>
				    </thead>
				    <tbody id='tgwc'></tbody>
				</table>
			</form>
			<div class="well" style="margin: 0px;width: 320px;display: flex;position: fixed;bottom: 0px;right: 0px;padding: 10px 0px;">
				<div id="zj" style="flex: 1;" class="text-center lead">0.00</div>
				<div style="flex: 1;" class="text-center">
					<button id="jssx" class="btn btn-default">结算</button>
				</div>
			</div>
		</div>
		<div>
			<jsp:include page="head.jsp"></jsp:include>
		</div>
		<div class="container">
			<div class="well well-lg" style="background-color: #FFFFFF;">
				<img alt="no icon" class="img-circle" src="/icon/${seller.icon}" height="120" width="120">
				<span class="well well-lg lead" style="background-color: #FFFFFF;">店名：${seller.shopname}</span>
			</div>
			<div class="well well-lg" style="background-color: #FFFFFF;">
				<table id="table_id" class="display text-center">
				    <thead>
				        <tr>
				            <th>序号</th>
				            <th>菜名</th>
				            <th>价格</th>
				            <th>图片</th>
				            <th>操作</th>
				        </tr>
				    </thead>
				    <tbody></tbody>
				</table>
			</div>
		</div>
		<hr/>
		<div>
			<%@include file="footer.html"%>
		</div>
	</body>
	<script>
		$('#jssx').click(function(){
			var person = $('#address');
			if(person.val() != ""){
				$.ajax({
					type:"post",
					url:"js",
					async:true,
					data:$('#gwcx').serialize(),
					success:function(v){
						if(v == 1){
							bootoast({
								message: "订单创建成功",
								type: 'info',
								position: 'right-bottom',
					 			timeout: 2,
					 			icon: 'info-sign'
							});
							setTimeout('window.location.href = "myorder"',500);
						}else{
							bootoast({
								message: "订单创建失败",
								type: 'info',
								position: 'right-bottom',
					 			timeout: 2,
					 			icon: 'info-sign'
							});
						}
					}
				});
			}else{
				bootoast({
					message: "请填写收货地址",
					type: 'info',
					position: 'right-bottom',
		 			timeout: 2,
		 			icon: 'info-sign'
				});
			}
		});
		function jiax(t){
			var geshu = t.parentNode.previousSibling.innerText;
			var zongjia = t.parentNode.nextSibling.innerText;
			var sum = $('#zj').text();
			$('#zj').text(parseFloat(parseFloat(zongjia)/parseFloat(geshu)+parseFloat(sum)).toFixed(2));
			$('#zjv').val(parseFloat(parseFloat(zongjia)/parseFloat(geshu)+parseFloat(sum)).toFixed(2));
			t.parentNode.previousSibling.innerText = parseInt(geshu)+1;
			t.parentNode.nextSibling.innerText = parseFloat(parseFloat(zongjia)/parseFloat(geshu)*(parseFloat(geshu)+1)).toFixed(2);
			t.parentNode.parentNode.firstChild.value = t.parentNode.previousSibling.innerText;
		};
		function jian(t){
			var geshu = t.parentNode.previousSibling.innerText;
			var zongjia = t.parentNode.nextSibling.innerText;
			var sum = $('#zj').text();
			$('#zj').text(parseFloat(parseFloat(sum)-parseFloat(zongjia)/parseFloat(geshu)).toFixed(2));
			$('#zjv').val(parseFloat(parseFloat(sum)-parseFloat(zongjia)/parseFloat(geshu)).toFixed(2));
			if(geshu==1){
				t.parentNode.parentNode.remove();
			}else{
				t.parentNode.previousSibling.innerText = parseInt(geshu)-1;
				t.parentNode.nextSibling.innerText = parseFloat(parseFloat(zongjia)/parseFloat(geshu)*(parseFloat(geshu)-1)).toFixed(2);
				t.parentNode.parentNode.firstChild.value = t.parentNode.previousSibling.innerText;
			}
		};
		var x = 0;
		function xadd(id,name,price,t) {
			if($.cookie("username")!=null){
				var tgwc = $('#tgwc');
				var trs = $('#tgwc tr').filter(":contains('"+name+"')");
				if(trs.length == 0){
					var tr = $("<tr/>");
					var td = $("<input type='hidden' name='ols["+ x +"].sum' value='"+1+"'/>");
					tr.append(td);
					td = $("<input type='hidden' name='ols["+ x +"].goodsid' value='"+id+"'/>");
					tr.append(td);
					td = $("<td>"+name+"</td>")
					tr.append(td);
					td = $("<td>"+1+"</td>")
					tr.append(td);
					td = $("<td><button type='button' onclick='jiax(this)'>+</button>&nbsp;<button type='button' onclick='jian(this)'>-</button></td>")
					tr.append(td);
					td = $("<td>"+price+"</td>")
					tr.append(td);
					tgwc.prepend(tr);
					var sum = $('#zj').text();
					$('#zj').text(parseFloat(parseFloat(sum)+parseFloat(price)).toFixed(2));
					$('#zjv').val(parseFloat(parseFloat(sum)+parseFloat(price)).toFixed(2));
					x++;
				}else{
					bootoast({
						message: "此商品已加入购物车",
						type: 'info',
						position: 'right-bottom',
			 			timeout: 2,
			 			icon: 'info-sign'
					});
				}
			}else{
				bootoast({
					message: "请先登陆",
					type: 'info',
					position: 'right-bottom',
		 			timeout: 2,
		 			icon: 'info-sign'
				});
			}
		};
		$(document).ready( function () {
	 	    $('#table_id').DataTable({
	 	    	order: [[ 0, "desc" ]],
	 	    	data: ${AllGoods},
	 	    	columns: [
	 	            { data: 'id' },
	 	            { data: 'name' },
	 	            { data: 'price' },
	 	            { data: 'icon' },
	 	        ],
	 	        columnDefs: [{
	            	//0表示第一列，1表示第二列
	                targets: 3,
	                render: function(data, type, row, meta) {
							return "<img alt='No Icon' src='/icon/"+row.icon+"' height='50px' width='50px'>";
	                }
	            },
	            {
	            	targets: 4,
	            	title: "操作",
	            	sortable: false,
	            	render: function(data, type, row, meta) { 
						return "<a onclick="+'"xadd('+"'"+row.id+"','"+row.name+"','"+row.price+"'"+',this)">添加</a>';
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
		});
	</script>
</html>