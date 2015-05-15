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
 
<form name="form2">
  <table class="tlist" >
    <thead>
   			  <tr class="title">
					<th>id</th>
					<th>角色名称</th>
					<th>操作</th>
				</tr>  
</thead>
<tbody>
 			<c:forEach items="${role.list}" var="role">
					<tr>
						<td>${role.id}</td>
						<td>${role.social}</td>
						<td><a class="button border-blue button-little" href="/role/authority?id=${role.id}&name=${role.social}">分配权限</a>
						</td>
					</tr>
				</c:forEach>	
</tbody>    
 
</table>
			<c:set var="currentPage" value="${role.pageNumber}" />
			<c:set var="totalPage" value="${role.totalPage}" />
			<c:set var="actionUrl" value="${pageContext.request.contextPath}/course/" />
			<c:set var="urlParas" value="" />
			<%@ include file="/common/_paginate.jsp"%>
</form>
</body>
</html>