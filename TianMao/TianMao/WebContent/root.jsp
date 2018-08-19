<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Root</title>
		<script type="text/javascript" src="assets/js/jquery-3.3.1.min.js" ></script>
		<script type="text/javascript" src="assets/js/bootstrap.min.js" ></script>
		<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
		<script type="text/javascript" src="assets/js/jquery.dataTables.min.js" ></script>
		<link rel="stylesheet" href="assets/css/jquery.dataTables.min.css" />
		<style>
			th{
				text-align: center;
			}
		</style>
	</head>
	<body>
		<input type="hidden" value="${param.root}" id="valo" />
		<div class="well text-center">商家审核管理</div>
		<div class="container">
			<table id="root" class="display text-center">
			    <thead>
			        <tr>
			            <th>UUID</th>
			            <th>名称</th>
			            <th>状态</th>
			            <th>操作</th>
			        </tr>
			    </thead>
			    <tbody></tbody>
			</table>
		</div>
	</body>
	<script>
		$(function() {
			if($("#valo").val() == "root"){
				$.ajax({
					type:"post",
					url:"root",
					async:true,
					success:function(value){
						$('#root').DataTable({
				 	    	data: value,
				 	    	columns: [
				 	    		{ data: 'sellercode' },
				 	            { data: 'name' },
				 	            { data: 'isdel' },
				 	        ],
				 	        columnDefs: [{
				            	//0表示第一列，1表示第二列
				                targets: 2,
				                render: function(data, type, row, meta) {
				                	if(row.isdel==1){
				                		return "<span style='color: red;'>未通过</span>";
				                	}else{
				                		return "<span style='color: green;'>已通过</span>";
				                	}
				                }
				            },{
				            	//0表示第一列，1表示第二列
				                targets: 3,
				                render: function(data, type, row, meta) {
				                	if(row.isdel==1){
				                		return "<button onclick='ok(this)'>允许</button>";
				                	}else{
				                		return "<button onclick='no(this)'>禁止</button>";
				                	}
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
		});
		function ok(t) {
			var xx = $(t).parent().parent().find("td");
			$.ajax({
				type:"post",
				url:"shseller",
				async:true,
				data:{
					sellercode:xx.eq(0).text(),
					isdel:"0"
				},
				success:function(sx){
					if(sx==1){
						xx.eq(2).html("<span style='color: green;'>已通过</span>");
						xx.eq(3).html("<button onclick='no(this)'>禁止</button>");
					}
				}
			});
		}
		function no(t) {
			var xx = $(t).parent().parent().find("td");
			$.ajax({
				type:"post",
				url:"shseller",
				async:true,
				data:{
					sellercode:xx.eq(0).text(),
					isdel:"1"
				},
				success:function(sx){
					if(sx==1){
						xx.eq(2).html("<span style='color: red;'>未通过</span>");
						xx.eq(3).html("<button onclick='ok(this)'>允许</button>");
					}
				}
			});
		}
	</script>
</html>