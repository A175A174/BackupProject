<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
       		<c:if test="${fn:length(datas)==0}">
				<span>未添加商品</span>
			</c:if>
			<c:forEach items="${datas}" var="i" varStatus="d">
				<a onclick="lodingImg(${i.productid})" class="btn btn-default" style="display: block;" data-toggle="collapse" href="#${d.count}">
					<div class="lead pull-left" style="display: inline-block;margin-bottom: 0;">${d.count}</div>
					<div class="lead center-block" style="display: inline-block;margin-bottom: 8px;">${i.name}</div>
					<div class="pull-right" style="display: inline-block;">
						<button onclick="upProduct(${i.productid},event,this)" type="button" class="btn btn-primary">更新</button>
						<button onclick="delProduct(${i.productid},event,this)" type="button" class="btn btn-primary">${i.isdel == 1?'上架':'下架'}</button>
						<button onclick="delProduct(${i.productid},event,this)" type="button" class="btn btn-danger">删除</button>
					</div>
				</a>
				<div class="collapse" id="${d.count}">
					<div class="well" style="margin-bottom: 0;">
		        		<form id="product-${i.productid}">
		        			<input name="productid" value="${i.productid}" type="hidden">
							<div class="input-group">
								<span class="input-group-addon">原价格</span>
								<input name="originalprice" type="number" min="0" value="${i.originalprice}" class="form-control">
								<span class="input-group-addon">促销价格</span>
								<input name="discountprice" type="number" min="0" value="${i.discountprice}" class="form-control">
								<span class="input-group-addon">库存</span>
								<input name="stock" type="number" min="0" value="${i.stock}" class="form-control">
							</div>
							<div class="input-group">
								<span class="input-group-addon">商品名</span>
								<input name="name" type="text" value="${i.name}" class="form-control">
								<span class="input-group-addon">类别</span>
								<select onchange="selcate(this,${i.productid})" class="form-control"></select>
								<input type="hidden" id="sel-${i.productid}" name="categoryid" value="">
							</div>
							<div class="input-group">
								<span class="input-group-addon">小标题</span>
								<input name="title" type="text" value="${i.title}" class="form-control">
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
							    	<h3 class="panel-title">文字描述</h3>
								</div>
								<div class="panel-body">
									<textarea name="introduce" class="form-control" rows="5">${i.introduce}</textarea>
								</div>
							</div>
							<div class="panel panel-default" style="padding-bottom: 0;">
								<div class="panel-heading">
							    	<h3 class="panel-title">
							    		<button onclick="addIcon('imgs-${i.productid}')" type="button" class="btn btn-default">图片描述</button>
							    		<span>第一张为商品图片，后面为描述图片(双击删除，点击替换)</span>
							    	</h3>
								</div>
								<div id="imgs-${i.productid}" class="panel-body" style="padding-bottom: 0;"></div>
							</div>
						</form>
					</div>
				</div>
			</c:forEach>
		</div>
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
		function delProduct(s,e,t) {
			e.stopPropagation();
			if(t.innerText == "下架"){
				$.ajax({
					type:"post",
					url:"delProduct",
					async:true,
					data:{
						productid:s,
						isdel:1
					},
					success: function(result){
						if(result==1){
							t.innerText = "上架";
						}
					}
				});
				return;
			}
			if(t.innerText == "上架"){
				$.ajax({
					type:"post",
					url:"delProduct",
					async:true,
					data:{
						productid:s,
						isdel:0
					},
					success: function(result){
						if(result==1){
							t.innerText = "下架";
						}
					}
				});
				return;
			}
			if(t.innerText=="删除"){
				$.ajax({
					type:"post",
					url:"delProduct",
					async:true,
					data:{
						productid:s,
						isdel:2
					},
					success: function(result){
						if(result==1){
							t.parentNode.parentNode.nextSibling.remove();
							t.parentNode.parentNode.remove();
						}
					}
				});
				return;
			}
		}
		//更新商品类别
		function selcate(t,s) {
			$("#sel-"+s).val(t.selectedIndex+1);
		}
		//更新商品
		function upProduct(s,e) {
			e.stopPropagation();
			$.ajax({
				type:"post",
				url:"upProduct",
				async:true,
				data: $("#product-"+s).serialize(),
				success: function(result){
					if(result == 1){
						tusi("更新成功");
					}else{
						tusi("更新失败");
					}
				}
			});
		}
		//添加图片
		var oldimg = null;//替换图片临时缓存
		var addimgdiv = null;
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
							$("#"+addimgdiv).append(img);
							img = $("<input/>").attr("value",result);
							img.attr("name","imgg");
							img.attr("type","hidden");
							$("#"+addimgdiv).append(img);
							addimgdiv = null;
						}
					}else{
						tusi("图片上传失败");
					}
				}
			});
		});
		function addIcon(s){
			addimgdiv = s;
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
//					$.post({
//						url:"delChaheImg",
//						data: {path : oldimg.attr("src")}
//					})
					$("#upimg").click();
				}
			},300);
		}
		//加载商品图片和类别
		function lodingImg(s) {
			if($("#imgs-"+s).children().length != 0){
				return;
			}
			$.ajax({
				type:"post",
				url:"getImg",
				async:true,
				data:{productid:s},
				success: function(result){
					var img = null;
					for (var i = 0; i < result.length; i++) {
						img = $("<img/>").attr("src","/img/"+result[i].image);
						img.css("width","80px");
						img.css("height","80px");
						img.attr("onclick","thIcon(this)");
						img.attr("ondblclick","delimg(this)");
						$("#imgs-"+s).append(img);
						img = $("<input/>").attr("value",result[i].image);
						img.attr("name","imgg");
						img.attr("type","hidden");
						$("#imgs-"+s).append(img);
					}
				}
			});
			$.ajax({
				type:"post",
				url:"getCategoryvalue",
				async:true,
				data:{productid:s},
				success: function(result){
					$("#sel-"+s).val(result.categoryid);
					var sss = $("#sel-"+s).prev().children();
					sss.selected = false;
					sss[result.categoryid-1].selected = true;
				}
			});
		}
		$(function(){
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
						$("select").append(opt);
					}
				}
			});
		});
	</script>
</html>