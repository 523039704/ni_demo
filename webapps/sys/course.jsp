<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>文档管理</title>
<link href="/css/main.css" rel="stylesheet" type="text/css" />
<script src="/js/jquery-1.3.2.min.js" language="javascript" type="text/javascript"></script>
</head>
<body>
<div class="mtitle">
  <h1>数据管理</h1>
</div>
<div class="tform">
		<button type="button" class="btn1" onClick="location='/course/add?channelid={dede:global.channelid/}&cid={dede:global.cid/}&dopost=addArchives';" >添加数据</button>
</div>
<form name="form2">
  <table class="tlist" >
    <thead>
   			  <tr class="title">
					<th>id</th>
					<th>课程名称</th>
					<th>起购日期</th>
					<th>截止日期</th>
					<th>金额</th>
					<th>人数</th>
					<th>费率</th>
					<th>操作</th>
				</tr>  
</thead>
<tbody>
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
							<a class="button border-black button-little" href="${pageContext.request.contextPath}/order/add?id=${course.id}&ptoducti=2">认购</a>
						</td>
					</tr>
				</c:forEach>	
</tbody>    
 
</table>
			<c:set var="currentPage" value="${course.pageNumber}" />
			<c:set var="totalPage" value="${course.totalPage}" />
			<c:set var="actionUrl" value="${pageContext.request.contextPath}/course/" />
			<c:set var="urlParas" value="" />
			<%@ include file="/common/_paginate.jsp"%>
</form>
</body>
</html>