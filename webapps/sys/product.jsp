<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title>拼图后台管理-后台管理</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pintuer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/js/pintuer.js"></script>
<script src="${pageContext.request.contextPath}/js/respond.js"></script>
<script src="${pageContext.request.contextPath}/js/admin.js"></script>
 
<link type="image/x-icon" href="/favicon.ico" rel="shortcut icon" />
<link href="/favicon.ico" rel="bookmark icon" />



		<script type="text/javascript">
	$(document).ready(function() {
		$("#address").val($("#address1")[0].value);
	});
</script>
</head>

<body>
	<div class="lefter">
		<div class="logo">
			<a href="#" target="_blank"><img src="${pageContext.request.contextPath}/images/logo.png"
				alt="后台管理系统" /></a>
		</div>
	</div>
	<div class="righter nav-navicon" id="admin-nav">
		<div class="mainer">
			<div class="admin-navbar">
				<span class="float-right"> <a
					class="button button-little bg-main" href="#">前台首页</a> <a
					class="button button-little bg-yellow" href="login.jsp">注销登录</a>
				</span>
				<ul class="nav nav-inline admin-nav">
					<li><a href="${pageContext.request.contextPath}/" class="icon-home"> 开始</a></li>
					<li ><a href="${pageContext.request.contextPath}/user" class="icon-file-text">用户管理</a></li>
					<li class="active" ><a href="${pageContext.request.contextPath}/product" class="icon-shopping-cart"> 产品管理</a>
					<ul>
						<li class="active"><a href="${pageContext.request.contextPath}/product">产品查询</a></li>
						<li><a href="${pageContext.request.contextPath}/product/add">产品添加</a></li>
						<li><a href="${pageContext.request.contextPath}/course">课程查看</a></li>
						<li><a href="${pageContext.request.contextPath}/course/add">课程添加</a></li>
						<li><a href="${pageContext.request.contextPath}/product">p2p查看</a></li>
					</ul>
					</li>
                	<li><a href="#" class="icon-user"> 我的账户</a></li>
                	<li><a href="#" class="icon-th-list"> 下载文件</a></li>
                	<li><a href="#" class="icon-th-list"> 个人中心</a></li>
				</ul>
			</div>
			<div class="admin-bread">
				<span>您好，${sessionScope.username}，欢迎您的光临。</span>
				<ul class="bread">
					<li><a href="${pageContext.request.contextPath}/" class="icon-home"> 开始</a></li>
					 
					<li>产品管理</li>
				</ul>
			</div>
		</div>
	</div>
<input type="hidden" name="address1" id="address1"	value="${param.address}" />
	<div class="admin">
		<div class="panel admin-panel">
			<div class="panel-head">
				<strong>产品列表</strong>
			</div>
			<div class="padding border-bottom">
			 <form method="post" class="form-x" action="${pageContext.request.contextPath}/product">
                <div class="form-group">
                    <div class="label"><label for="siteurl">地区:</label></div>
                    <div class="label">	  
                    <select name="address" id="address" >
       					   <option value="">请选择地区</option>
   						   <option value="11">北京</option>
 						   <option value="12">上海</option>
 						   <option value="13">深圳</option>
						</select></div>
	                <div class="label"> <button type="submit" class="btn btn-primary">提交</button></div>
			 </div>
            </form>
			</div>
			<table class="table table-hover">
				<tr>
					<th>id</th>
					<th>产品名称</th>
					<th>期限（月）</th>
					<th>起点金额（万元）</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${product.list}" var="product">
					<tr>
						<td>${product.id}</td>
						<td>${product.product_name}</td>
						<td>${product.product_long}</td>
						<td>${product.small_mony}</td>
						<td><a class="button border-blue button-little" href="#">修改</a>
							<a class="button border-yellow button-little" href="#"
							onclick="{if(confirm('确认删除?')){return true;}return false;}">删除</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		 
			<c:set var="currentPage" value="${product.pageNumber}" />
			<c:set var="totalPage" value="${product.totalPage}" />
			<c:set var="actionUrl" value="${pageContext.request.contextPath}/product/" />
			<c:set var="urlParas" value="" />
			<%@ include file="/common/_paginate.jsp"%>
		</div>
		<br />
		<p class="text-right text-gray">
			基于<a class="text-gray" target="_blank" href="#">拼图前端框架</a>构建
		</p>
	</div>

</body>
</html>