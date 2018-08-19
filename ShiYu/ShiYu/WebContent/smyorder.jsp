<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>我的订单</title>
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
		</style>
    </head>
    <body>
    	<!-- Modal -->
		<div class="modal fade" id="mModal" tabindex="-1" role="dialog" aria-labelledby="注册框">
		  <div class="modal-dialog" role="document" aria-hidden="true">
		    <div class="modal-content">
		    	<div class="modal-header text-center">
		        	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		        		<span aria-hidden="true">&times;</span>
		        	</button>
		    	</div>
		    	<div class="modal-body">
		    		<table id="tt" class="display text-center">
		    			<thead>
					        <tr>
					            <th>名字</th>
					            <th>价格</th>
					            <th>图片</th>
					            <th>数量</th>
					        </tr>
					    </thead>
					    <tbody></tbody>
		    		</table>
		    	</div>
		    </div>
		  </div>
		</div>
    	<div>
			<jsp:include page="head.jsp"></jsp:include>
		</div>
		<div class="container">
			<div class="well well-lg" style="background-color: #FFFFFF;">
				<span class="well well-lg lead" style="background-color: #FFFFFF;">钱包：${yes}</span>
			</div>
			<div class="well well-lg" style="background-color: #FFFFFF;">
				<table id="tables" class="display text-center">
				    <thead>
				        <tr>
				            <th>序号</th>
				            <th>价格</th>
				            <th>地址</th>
				            <th>状态</th>
				            <th>时间</th>
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
 		$('#mModal').on('hide.bs.modal', function () {
 			location.reload();
 		});
 		function ckxq(sid){
 			$.ajax({
 				type:"post",
 				url:"xq",
 				async:true,
 				data:{
 					id:sid
 				},
 				success:function(vs){
 					$('#tt').DataTable({
			 	    	data: JSON.parse(vs),
			 	    	columns: [
			 	            { data: 'name' },
			 	            { data: 'price' },
			 	            { data: 'icon' },
			 	            { data: 'sum' }
			 	        ],
			 	        columnDefs: [{
			            	//0表示第一列，1表示第二列
			                targets: 2,
			                render: function(data, type, row, meta) {
			                	return "<img alt='No Icon' src='/icon/"+row.icon+"' height='50px' width='50px'>";
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
 					$('#mModal').modal('show');
 				}
 			});
 		}
	 	$(document).ready( function () {
	 	    $('#tables').DataTable({
	 	    	order: [[ 0, "desc" ]],
	 	    	data: ${AllOrders},
	 	    	columns: [
	 	            { data: 'id' },
	 	            { data: 'price' },
	 	            { data: 'address' },
	 	            { data: 'state' },
	 	            { data: 'currentime' }
	 	        ],
	 	        columnDefs: [{
	            	//0表示第一列，1表示第二列
	                targets: 3,
	                render: function(data, type, row, meta) {
	                	return "已支付";
	                }
	            },
	            {
	                targets: 4,
	                render: function(data, type, row, meta) {
	                	return "<jsp:useBean id='myDate' class='java.util.Date'/><c:set target='${myDate}' property='time' value='"+row.currentime+"'/><fmt:formatDate value='${myDate}' type='both' />";
	                }
	            },
	            {
	            	targets: 5,
	            	title: "操作",
	            	sortable: false,
	            	render: function(data, type, row, meta) {
	            		return "<button class='btn' onclick='ckxq("+row.id+")'>详情</button>";
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