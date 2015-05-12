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
						<li><a href="${pageContext.request.contextPath}/product">产品查询</a></li>
						<li><a href="${pageContext.request.contextPath}/product/add">产品添加</a></li>
						<li  class="active"><a href="${pageContext.request.contextPath}/course">课程查看</a></li>
						<li><a href="${pageContext.request.contextPath}/course/add">课程添加</a></li>
						<li><a href="${pageContext.request.contextPath}/product">p2p查看</a></li>
					</ul>
					</li>
                	<li><a href="course" class="icon-user"> 我的账户</a></li>
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
<input type="hidden" name="username1" id="username1"	value="${param.username}" />
<input type="hidden" name="phone1" id="phone1"	value="${param.phone}" />
<input type="hidden" name="reservation1" id="reservation1"	value="${param.reservation}" />
	<div class="admin">
		<div class="panel admin-panel">
			<div class="panel-head">
				<strong>产品列表</strong>
			</div>
			 
			<table class="table table-hover">
				<tr>
					<th>id</th>
					<th>课程名称</th>
					<th>起购日期</th>
					<th>截止日期</th>
					<th>金额</th>
					<th>人数</th>
					<th>费率</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${course.list}" var="course">
					<tr>
						<td>${course.id}</td>
						<td>${course.name}</td>
						<td>${course.createdatetime}</td>
						<td>${course.coursedatetime}</td>
						<td>${course.price}</td>
						<td>${course.peoples}</td>
						<td>${course.service}</td>
						<td><a class="button border-blue button-little" href="#">修改</a>
							<a class="button border-yellow button-little" href="#"
							onclick="{if(confirm('确认删除?')){return true;}return false;}">删除</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		 
			<c:set var="currentPage" value="${course.pageNumber}" />
			<c:set var="totalPage" value="${course.totalPage}" />
			<c:set var="actionUrl" value="${pageContext.request.contextPath}/course/" />
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