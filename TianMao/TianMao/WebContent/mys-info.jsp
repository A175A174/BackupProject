<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
		<script type="text/javascript" src="assets/js/jquery-3.3.1.min.js" ></script>
		<script type="text/javascript" src="assets/js/bootstrap.min.js" ></script>
		<link rel="stylesheet" href="assets/css/bootoast.css" />
		<script type="text/javascript" src="assets/js/bootoast.js" ></script>
	</head>
	<body>
		<div class="container-fluid">
			<form id="upimgf" style="display: none;" enctype="multipart/form-data">
       			<input name="icon" id="upimg" type="file">
       		</form>
       		<p class="lead">余额：<span id="ye"></span></p>
       		<button style="width: 100%;" type="button" onclick="up()" class="btn btn-primary">更新我的信息</button>
       		<h3>公告 <span class="label label-default">New</span></h3>
			<textarea name="notice" id="notice" class="form-control" rows="3"></textarea>
			<h3>运费 <span class="label label-default">New</span></h3>
			<input name="cost" type="number" id="yf" class="form-control"/>
			<h3>横幅 <span class="label label-default">New</span></h3>
			<img alt="none" id="hf" name="banner" width="100%">
		</div>
	</body>
	<script>
		$(function(){
			$.ajax({
				type:"post",
				url:"gts",
				async:true,
				success : function(result) {
					if(result != null){
						$("#hf").attr("src","/img/"+result.banner);
						$("#notice").text(result.notice);
						$("#yf").val(result.name);
						$("#ye").text(result.balance);
					}
				}
			});
		});
		function tusi(s){
			bootoast({
				message: s,
				type: 'info',
				position: 'right-bottom',
	 			timeout: 2,
	 			icon: 'info-sign'
			});
		}
		function up() {
			$.ajax({
				type:"post",
				url:"ups",
				async:true,
				data:{
					banner:$("#hf").attr("src"),
					notice:$("#notice").val(),
					cost:$("#yf").val()
				},
				success : function(result) {
					if(result == 1){
						tusi("更新成功");
					}else{
						tusi("更新失败");
					}
				}
			});
		}
		$("#hf").click(function(){
			$("#upimg").click();
		});
		$("#upimg").change(function(){
			$.ajax({
				type:"post",
				url:"upimg",
				async:true,
				cache: false,
				processData: false,
				contentType: false,
				data: new FormData($('#upimgf').get(0)),
				success : function(result) {
					if(result != 0){
						$("#hf").attr("src","/img/"+result);
					}else{
						tusi("图片上传失败");
					}
				}
			});
		});
	</script>
</html>