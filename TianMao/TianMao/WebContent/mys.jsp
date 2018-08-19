<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Mys</title>
		<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
		<script type="text/javascript" src="assets/js/jquery-3.3.1.min.js" ></script>
		<script type="text/javascript" src="assets/js/bootstrap.min.js" ></script>
		<link href="assets/images/icon.png" rel="shortcut icon" type="image/x-icon">
		<link href="assets/images/icon.png" rel="icon" type="image/x-icon">
		<link href="assets/images/icon.png" rel="bookmark" type="image/x-icon">
		<link rel="stylesheet" href="assets/css/bootoast.css" />
		<script type="text/javascript" src="assets/js/bootoast.js" ></script>
		<script type="text/javascript" src="assets/js/jquery.cookie.js" ></script>
		<style>
			#my>div{
				float: left;
			}
			#my a{
				display: block;
				width: 100%;
				margin: 5px 0;
			}
		</style>
	</head>
	<script>
		if($.cookie('tmname') == null || $.cookie('mux') == null){
			window.location.href="index";
		}
	</script>
	<body>
		<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
			    <div class="modal-content">
			    	<div class="modal-header">
			        	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			      	<h4 class="modal-title" id="myModalLabel">添加商品</h4>
			    	</div>
			    	<div class="modal-body" style="padding-bottom: 0;">
			        	<div class="well" style="padding-bottom: 0;margin-bottom: 0;">
			        		<form id="upimgf" style="display: none;" enctype="multipart/form-data">
			        			<input name="icon" id="upimg" type="file">
			        		</form>
			        		<form id="product">
								<div class="input-group">
									<span class="input-group-addon">原价格</span>
									<input name="originalprice" type="number" min="0" class="form-control">
									<span class="input-group-addon">促销价格</span>
									<input name="discountprice" type="number" min="0" class="form-control">
									<span class="input-group-addon">库存</span>
									<input name="stock" type="number" min="0" class="form-control">
								</div>
								<div class="input-group">
									<span class="input-group-addon">商品名</span>
									<input name="name" type="text" class="form-control">
									<span class="input-group-addon">类别</span>
									<select name="lb" id="lb" class="form-control"></select>
									<input type="hidden" id="sel" name="categoryid" value="">
								</div>
								<div class="input-group">
									<span class="input-group-addon">小标题</span>
									<input name="title" type="text" class="form-control">
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
								    	<h3 class="panel-title">文字描述</h3>
									</div>
									<div class="panel-body">
										<textarea name="introduce" class="form-control" rows="5"></textarea>
									</div>
								</div>
								<div class="panel panel-default" style="padding-bottom: 0;">
									<div class="panel-heading">
								    	<h3 class="panel-title">
								    		<button onclick="addIcon()" type="button" class="btn btn-default">图片描述</button>
								    		<span>第一张为商品图片，后面为描述图片(双击删除，点击替换)</span>
								    	</h3>
									</div>
									<div id="imgs" class="panel-body" style="padding-bottom: 0;"></div>
								</div>
							</form>
						</div>
			    	</div>
			    	<div class="modal-footer" style="padding-top: 0;">
			        	<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			        	<button onclick="addProduct()" type="button" class="btn btn-primary">添加</button>
			      	</div>
			 	</div>
			</div>
		</div>
		<jsp:include page="head.jsp"></jsp:include>
		<jsp:include page="search-min.jsp"></jsp:include>
		<div class="container" id="my">
			<div style="width: 20%;">
				<a class="btn btn-danger" href="mys-info.jsp" target="mys">
					我的信息
				</a>
				<a class="btn btn-danger" data-toggle="collapse" href="#myorder">
					我的订单
				</a>
				<div class="collapse" id="myorder">
					<div class="well" style="margin-bottom: 0;">
						<ul class="list-group" style="margin-bottom: 0;">
							<li class="list-group-item">
								<a href="mysorder?status=1" target="mys">待发货</a>
							</li>
							<li class="list-group-item">
								<a href="mysorder?status=2" target="mys">待收货</a>
							</li>
							<li class="list-group-item">
								<a href="mysorder?status=5" target="mys">待评价</a>
							</li>
							<li class="list-group-item">
								<span style="display: none;" class="badge">14</span>
								<a href="mysorder?status=3" target="mys">退款/售后</a>
							</li>
							<li class="list-group-item">
								<a href="mysorder?status=4" target="mys">已完成</a>
							</li>
						</ul>
					</div>
				</div>
				<a class="btn btn-danger" href="getProduct" target="mys">
					我的商品
				</a>
				<a class="btn btn-danger" href="#myModal" data-toggle="modal">
					添加商品
				</a>
			</div>
			<div style="width: 80%;">
				<div class="embed-responsive embed-responsive-16by9">
					<iframe id="mys" name="mys" class="embed-responsive-item" src="mys-info.jsp"></iframe>
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
		$(function(){
			//分类选择
			$("#lb").change(function(){
				$("#sel").val($(":selected").val());
			});
			//添加分类
			$.ajax({
				type:"post",
				url:"getCategorys",
				async:true,
				success: function(result){
					var opt = null;
					for (var i = 0; i < result.length; i++) {
						opt = $("<option></option>");
						opt.text(result[i].name);
						opt.val(result[i].id);
						$("#lb").append(opt);
					}
					$("#sel").val($(":selected").val());
				}
			});
		});
		//添加商品
		function addProduct() {
			$.ajax({
				type:"post",
				url:"addProduct",
				async:true,
				data: $("#product").serialize(),
				success: function(result){
					if(result == 1){
						window.location.reload();
					}else{
						tusi("添加失败");
					}
				}
			});
		}
		//添加图片
		var oldimg = null;
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
						if(oldimg != null){
							oldimg.attr("src","/img/"+result);
							oldimg[0].nextSibling.value = result;
							oldimg = null;
						}else{
							var img = $("<img/>").attr("src","/img/"+result);
							img.css("width","80px");
							img.css("height","80px");
							img.attr("onclick","thIcon(this)");
							img.attr("ondblclick","delimg(this)");
							$("#imgs").append(img);
							img = $("<input/>").attr("value",result);
							img.attr("name","imgg");
							img.attr("type","hidden");
							$("#imgs").append(img);
						}
					}else{
						tusi("图片上传失败");
					}
				}
			});
		});
		function addIcon(){
			$("#upimg").click();
		}
		//双击删除图片
		var del = null;
		function delimg(t) {
			if(del){
				window.clearTimeout(del)
				del = null;
			}
			oldimg = $(t);
			$.post({
				url:"delChaheImg",
				data: {path : oldimg.attr("src")}
			})
			t.nextSibling.remove();
			t.remove();
			oldimg = null;
		}
		//单机替换图片
		function thIcon(t){
			if(del){
				window.clearTimeout(del)
				del = null;
			}
			del = window.setTimeout(function(){
				if($(t).attr("src") != null){
					oldimg = $(t);
					$.post({
						url:"delChaheImg",
						data: {path : oldimg.attr("src")}
					})
				}
				$("#upimg").click();
			},300);
		}
	</script>
</html>