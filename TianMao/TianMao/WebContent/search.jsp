<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>${param.name}</title>
		<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
		<script type="text/javascript" src="assets/js/jquery-3.3.1.min.js" ></script>
		<script type="text/javascript" src="assets/js/bootstrap.min.js" ></script>
		<link href="assets/images/icon.png" rel="shortcut icon" type="image/x-icon">
		<link href="assets/images/icon.png" rel="icon" type="image/x-icon">
		<link href="assets/images/icon.png" rel="bookmark" type="image/x-icon">
		<script type="text/javascript" src="assets/js/jquery.dataTables.min.js" ></script>
		<link rel="stylesheet" href="assets/css/jquery.dataTables.min.css" />
		<style>
			th{
				text-align: center;
			}
		</style>
	</head>
	<body>
		<input type="hidden" value="${param.name}" id="valo" />
		<jsp:include page="head.jsp"></jsp:include>
		<jsp:include page="search-min.jsp"></jsp:include>
		<div class="container">
			<div class="btn-group" style="display: none;">
				<button type="button" class="btn btn-default">价格</button>
				<button type="button" class="btn btn-default">销量</button>
				<input style="height: 34px;width: 40px;" type="text">
				-
				<input style="height: 34px;width: 40px;" type="text">
				<button style="float: right;" type="button" class="btn btn-default">确定</button>
			</div>
			<hr style="border-top: solid 2px #FF0036"/>
			<!--<c:forEach begin="0" end="19">
				<a style="display: inline-block;width: 19.6%;background-color: #FFFFFF;margin-bottom: 20px;">
					<img src="assets/images/item/item5.jpg" width="100%"/>
					<div style="overflow: hidden;height: 40px;margin: 8px 25%;color: #666666;font-size: 1.2em;">
						Mountainsmith MS Covert LX 旅行系列包 0870037
					</div>
					<div class="text-center" style="color: #FF0070;font-size: 1.5em;">￥283</div>
				</a>
			</c:forEach>-->
			<table id="tabl" class="display text-center">
			    <thead>
			        <tr>
			            <th>图片</th>
			            <th>名称</th>
			            <th>价格</th>
			            <th>累计销量</th>
			        </tr>
			    </thead>
			    <tbody></tbody>
			</table>
		</div>
		<nav class="text-center" style="display: none;">
			<ul class="pagination">
			    <li>
			    	<a href="#" aria-label="Previous">
			        	<span aria-hidden="true">&laquo;</span>
			    	</a>
			    </li>
			    <li class="active"><a href="#">1</a></li>
			    <li><a href="#">2</a></li>
			    <li><a href="#">3</a></li>
			    <li><a href="#">4</a></li>
			    <li><a href="#">5</a></li>
			    <li>
			    	<a href="#" aria-label="Next">
			        	<span aria-hidden="true">&raquo;</span>
			    	</a>
			    </li>
			</ul>
		</nav>
		<div style="margin-bottom: 20px;">
				<img class="center-block" src="assets/images/end.png"/>
		</div>
		<jsp:include page="foot.jsp"></jsp:include>
	</body>
	<script>
		$(function () {
			$.ajax({
				type:"post",
				url:"search",
				async:true,
				data:{name:$("#valo").val()},
				success:function(value){
					$('#tabl').DataTable({
			 	    	data: value,
			 	    	columns: [
			 	    		{ data: 'introduce' },
			 	            { data: 'name' },
			 	            { data: 'discountprice' },
			 	            { data: 'originalprice' },
			 	        ],
			 	        columnDefs: [{
			            	//0表示第一列，1表示第二列
			                targets: 0,
			                render: function(data, type, row, meta) {
			                	return "<a href='product?productid="+row.productid+"'><img alt='No Icon' src='/img/"+row.introduce+"' height='80px' width='80px'><a/>";
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
		});
	</script>
</html>