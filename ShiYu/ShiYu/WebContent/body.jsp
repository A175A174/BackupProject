<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	div[name="shop"]{
		cursor: pointer;
	}
</style>
<div class="container">
	<div>
		<div class="pull-left" style="line-height: 48px;">
			当前位置: 武汉站 <a class="">[切换地址]</a>
		</div> 
		<div class="pull-right">
			<form class="form-inline">
		        <div class="form-group">
		          <input type="text" class="form-control" placeholder="搜索商家,美食...">
		          <button type="button" class="btn btn-default">GO!</button>
		        </div>
		    </form>
		</div>
		<div class="clearfix"></div>
	</div>
	<div class="well well-lg" style="background-color: #FFFFFF;">
		<p class="lead">商家分类：</p>
		<div class="btn-toolbar" role="toolbar">
			<div class="btn-group" role="group">
				<button type="button" class="btn btn-default">全部商家</button>
			</div>
			<div class="btn-group" role="group">
				<button type="button" class="btn btn-default">美食</button>
			</div>
			<div class="btn-group" role="group">
				<button type="button" class="btn btn-default">快餐</button>
			</div>
		</div>
	</div>
	<div class="well well-lg" style="background-color: #FFFFFF;">
		<c:forEach items="${datas}" begin="0" step="4" varStatus="i">
			<div class="row">
				<c:forEach items="${datas}" begin="${i.index}" end="${i.index+3}" var="j">
					<c:if test="${not empty j}">
						<div class="col-xs-3 text-center" onclick="k(${j.id})">
							<img src="/icon/${j.icon}" height="120" width="150"/>
							<p class="lead">${j.shopname}</p>
						</div>
					</c:if>
				</c:forEach>
    		</div>
		</c:forEach>
	</div>
</div>
<script>
	if($.cookie('shopname') != null){
		window.location.href = "myshop";
	}
	function k(id){
		window.location.href = "getshop?id="+id;
	}
</script>