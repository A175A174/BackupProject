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
			a{
				text-decoration: none !important;
			}
			a:hover{
				cursor: pointer;
			}
		</style>
	</head>
	<body style="background-color: #F7F7F7;min-width: 750px;">
		<!-- 商家注册Modal -->
		<div class="modal fade" id="gModal" tabindex="-1" role="dialog" aria-labelledby="注册框">
		  <div class="modal-dialog" role="document" aria-hidden="true">
		    <div class="modal-content">
		    	<div class="modal-header text-center">
		        	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		        		<span aria-hidden="true">&times;</span>
		        	</button>
		        	<h4 class="modal-title lead">添加菜品</h4>
		    	</div>
		    	<div class="modal-body">
		    		<form class="form-signin" data-toggle="validator" id="addGoods" enctype="multipart/form-data">
			        	<div class="form-group">
							<div class="input-group input-group-lg">
						  		<span class="input-group-addon">菜名</span>
								<input type="text" name="name" class="form-control" aria-describedby="basic-username">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group input-group-lg">
						  		<span class="input-group-addon">价格</span>
								<input type="number" name="price" class="form-control" aria-describedby="basic-password">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group input-group-lg">
								<span class="input-group-addon">样图</span>
		    					<input name="myicon" type="file" class="form-control" accept="image/jpeg, image/gif, image/x-png">
							</div>
						</div>
					</form>
		    	</div>
		    	<div class="modal-footer">
		        	<button type="button" id="add" class="btn btn-success">添加</button>
		        	<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		      	</div>
		    </div>
		  </div>
		</div>
		<div>
			<jsp:include page="head.jsp"></jsp:include>
		</div>
		<div class="container">
			<div class="well well-lg" style="background-color: #FFFFFF;">
				<div class="btn-group">
					<button data-toggle="modal" href="#gModal" type="button" class="btn btn-default">增加商品</button>
				</div>
				<div class="btn-group">
					<span class="lead">钱包：${yes}</span>
				</div>
			</div>
			<div class="well well-lg" style="background-color: #FFFFFF;">
				<table id="table_id" class="display text-center">
				    <thead>
				        <tr>
				            <th>序号</th>
				            <th>菜名</th>
				            <th>价格</th>
				            <th>图片</th>
				            <th>状态</th>
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
		$('#add').click(function(){
			$.ajax({
				type:"post",
				url:"addGoods",
				async:true,
				cache: false,
				processData: false,
				contentType: false,
				data: new FormData($('#addGoods').get(0)),
				success : function(result) {
					if(result=="1"){
						window.location.reload();
					}
				}
			});
		});
		function ok(s,t){
	 		$.ajax({
	 			type:"post",
	 			url:"gverify",
	 			async:true,
	 			data:{
	 				id:s,
	 				ishide:"0"
	 			},
	 			success : function(result) {
	 				if(result=="1"){
	 					t.parentNode.previousSibling.innerText="已上架";
	 				}
	 			}
	 		});
		};
		function no(s,t){
			$.ajax({
	 			type:"post",
	 			url:"gverify",
	 			async:true,
	 			data:{
	 				id:s,
	 				ishide:"1"
	 			},
	 			success : function(result) {
	 				if(result=="1"){
	 					t.parentNode.previousSibling.innerText="未上架";
	 				}
	 			}
 			});
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
	 	           	{ data: 'ishide' }
	 	        ],
	 	        columnDefs: [{
					//0表示第一列，1表示第二列
	                targets: 4,
	                render: function(data, type, row, meta) {
						if(row.ishide == '1'){
							return "未上架";
	                	}else{
	                		return "已上架";
	                	}
	                }
	            },
	            { 
	                targets: 3,
	                render: function(data, type, row, meta) {
							return "<img alt='No Icon' src='/icon/"+row.icon+"' height='50px' width='50px'>";
	                }
	            },
	            {
	            	targets: 5,
	            	title: "操作",
	            	sortable: false,
	            	render: function(data, type, row, meta) { 
						return "<a onclick='ok("+row.id+",this)'>上架</a>&nbsp;<a onclick='no("+row.id+",this)'>下架</a>";
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
		})
	</script>
</html>