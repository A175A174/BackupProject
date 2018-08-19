<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
		<script type="text/javascript" src="assets/js/jquery-3.3.1.min.js" ></script>
		<script type="text/javascript" src="assets/js/bootstrap.min.js" ></script>
		<script type="text/javascript" src="assets/js/jquery.dataTables.min.js" ></script>
		<link rel="stylesheet" href="assets/css/jquery.dataTables.min.css" />
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
    <body>
    	<nav class="navbar navbar-default" style="background-color: #1E89E0 !important;">
			<div class="container">
				<div>
					<a href="#" class="navbar-left" style="padding: 0px 20px;">
			       		<img alt="Brand Icon" src="assets/img/ele.png" height="50px" width="50px">
			      	</a>
					<ul class="nav navbar-nav navbar-right">
						<li>
							<a href="#" style="color: #FFFFFF;">Admin</a>
						</li>
						<li>
							<a href="index" style="color: #FFFFFF;">退出</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
		<div class="container">
			<table id="table_id_example" class="display text-center">
			    <thead>
			        <tr>
			            <th>序号</th>
			            <th>用户名</th>
			            <th>店名</th>
			            <th>地址</th>
			            <th>注册时间</th>
			            <th>审核状态</th>
			            <th>操作</th>
			        </tr>
			    </thead>
			    <tbody></tbody>
			</table>
		</div>
		<hr>
		<div class="text-center">
			<a onclick="root()">所有方：XXXXXXXXX有限公司</a>
		</div>
 	</body>
 	<script>
 		function ok(s,t){
	 		$.ajax({
	 			type:"post",
	 			url:"verify",
	 			async:true,
	 			data:{
	 				id:s,
	 				verify:"1"
	 			},
	 			success : function(result) {
	 				if(result=="1"){
	 					t.parentNode.previousSibling.innerText="已通过";
	 				}
	 			}
	 		});
 		};
 		function no(s,t){
 			$.ajax({
	 			type:"post",
	 			url:"verify",
	 			async:true,
	 			data:{
	 				id:s,
	 				verify:"0"
	 			},
	 			success : function(result) {
	 				if(result=="1"){
	 					t.parentNode.previousSibling.innerText="未通过";
	 				}
	 			}
	 		});
 		};
	 	$(document).ready( function () {
	 	    $('#table_id_example').DataTable({
	 	    	data: ${AllDatas},
	 	    	columns: [
	 	            { data: 'id' },
	 	            { data: 'username' },
	 	            { data: 'shopname' },
	 	            { data: 'address' },
					{ data: 'regtime' },
					{ data: 'verify' }
	 	        ],
	 	        columnDefs: [{
					//0表示第一列，1表示第二列
	                targets: 5,
	                render: function(data, type, row, meta) {
						if(row.verify == '0'){
							return "未通过";
	                	}else{
	                		return "已通过";
	                	}
	                }
	            },
                {
                	targets: 6,
                	title: "操作",
                	sortable: false,
                	render: function(data, type, row, meta) { 
						return "<a onclick='ok("+row.id+",this)'>OK</a>&nbsp;<a onclick='no("+row.id+",this)'>NO</a>";
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