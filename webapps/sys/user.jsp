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
<link href="${pageContext.request.contextPath}/datetime/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/datetime/font-awesome.min.css"rel="stylesheet">
<link rel="stylesheet" type="text/css" media="all" href="${pageContext.request.contextPath}/datetime/daterangepicker-bs3.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/datetime/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/datetime/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/datetime/moment.js">	</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/datetime/daterangepicker.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#username").val($("#username1")[0].value);
		$("#phone").val($("#phone1")[0].value);
		$("#reservation").val($("#reservation1")[0].value);
	});
</script>
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
					<li><a href="/" class="icon-home"> 开始</a></li>
					<li class="active"><a href="${pageContext.request.contextPath}/user" class="icon-file-text">用户管理</a>
						<ul>
							<li class="active"><a href="${pageContext.request.contextPath}/user">用户查询</a></li>
							<li><a href="${pageContext.request.contextPath}/user/add">用户添加</a></li>
							<li><a href="${pageContext.request.contextPath}/user">设置分组</a></li>
						</ul>
					</li>
					<li><a href="${pageContext.request.contextPath}/product" class="icon-shopping-cart"> 产品管理</a></li>
                	<li><a href="#" class="icon-user"> 我的账户</a></li>
                	<li><a href="#" class="icon-th-list"> 下载文件</a></li>
                	<li><a href="#" class="icon-th-list"> 个人中心</a></li>
				</ul>
			</div>
			<div class="admin-bread">
				<span>您好，${sessionScope.username}，欢迎您的光临。</span>
				<ul class="bread">
					<li><a href="${pageContext.request.contextPath}/" class="icon-home"> 开始</a></li>
					 
					<li>用户查询</li>
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
				<strong>内容列表</strong>
			</div>
			<div class="padding border-bottom">
			 <form method="post" class="form-x" action="${pageContext.request.contextPath}/user">
                <div class="form-group">
                    <div class="label"><label for="siteurl">用户名:</label></div>
                    <div class="label">	<input type="text" class="input" id="username" name="username"   placeholder="请填写用户名"  /></div>
                    <div class="label"><label for="siteurl">手机号</label></div>
                    <div class="label">	<input type="text" class="input" id="phone" name="phone"   placeholder="请填写手机号"  /></div>
             </div>
               <div class="form-group">
                    <div class="label"><label for="siteurl">注册时间</label></div>
                    <div class="label">	 
				<input type="text"   name="reservation" id="reservation"	 class="form-control"  readOnly="true"    />
					<script type="text/javascript">
						$(document).ready(function() {
							$('#reservation').daterangepicker({
								format: 'YYYY-MM-DD'
							},
							function(start, end, label) {
								console.log(start.toISOString(), end.toISOString(), label);
							});
						});
					</script>
				 </div>
                <div class="label">   <button type="submit" class="btn btn-primary">提交</button></div>
			 </div>
            </form>
			</div>
			<table class="table table-hover">
				<tr>
					<th>id</th>
					<th>名字</th>
					<th>电话</th>
					<th>注册时间</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${blogPage.list}" var="blog">
					<tr>
						<td>${blog.admin_id}</td>
						<td>${blog.adminname}</td>
						<td>${blog.phone}</td>
						<td>${blog.add_time}</td>
						<td><a class="button border-blue button-little" href="#">修改</a>
							<a class="button border-yellow button-little" href="#"
							onclick="{if(confirm('确认删除?')){return true;}return false;}">删除</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<c:set var="username" value="${param.username}" />
			<c:set var="phone" value="${param.phone}" />
			<c:set var="reservation" value="${param.reservation}" />
			<c:set var="currentPage" value="${blogPage.pageNumber}" />
			<c:set var="totalPage" value="${blogPage.totalPage}" />
			<c:set var="actionUrl" value="${pageContext.request.contextPath}/user/" />
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