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
		<button type="button" class="btn1" onClick="location='/function/add?channelid={dede:global.channelid/}&cid={dede:global.cid/}&dopost=addArchives';" >添加数据</button>
</div>
<form name="form2">
  <table class="tlist" >
    <thead>
   			  <tr class="title">
					<th>id</th>
					<th>名称</th>
					<th>路径</th>
					<th>操作</th>
				</tr>  
</thead>
<tbody>
 			<c:forEach items="${function.list}" var="function">
					<tr>
						<td>${function.id}</td>
						<td>${function.name}</td>
						<td>${function.path}</td>
						<td><a class="button border-blue button-little" href="#">修改</a>
							<a class="button border-yellow button-little" href="#"
							onclick="{if(confirm('确认删除?')){return true;}return false;}">删除</a>
						</td>
					</tr>
				</c:forEach>	
</tbody>    
 
</table>
			<c:set var="currentPage" value="${function.pageNumber}" />
			<c:set var="totalPage" value="${function.totalPage}" />
			<c:set var="actionUrl" value="${pageContext.request.contextPath}/course/" />
			<c:set var="urlParas" value="" />
			<%@ include file="/common/_paginate.jsp"%>
</form>
</body>
</html>