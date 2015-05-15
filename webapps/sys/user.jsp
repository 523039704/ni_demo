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
		<button type="button" class="btn1" onClick="location='/user/add?channelid={dede:global.channelid/}&cid={dede:global.cid/}&dopost=addArchives';" >添加数据</button>
</div>
<form name="form2">
  <table class="tlist" >
    <thead>
   			  <tr class="title">
					<th align="left">id</th>
					<th align="left">登陆名字</th>
					<th align="left">简称</th>
					<th align="left">电话</th>
					<th align="left">注册时间</th>
					<th align="left">拥有的人数</th>
					<th align="left">角色</th>
					<th align="left">有无申请</th>
					<th align="left">操作</th>
				</tr>  
</thead>
<tbody>
 			<c:forEach items="${blogPage.list}" var="blog">
					<tr>
						<td>${blog.admin_id}</td>
						<td>${blog.adminname}</td>
						<td>${blog.nickname}</td>
						<td>${blog.phone}</td>
						<td>${blog.add_time}</td>
						<td><a  href="${pageContext.request.contextPath}/user?id=${blog.admin_id}">${blog.amount}</a></td>
						<td>${blog.role}</td>
						<td>${blog.apply}</td>
						<td>
						<a class="button border-blue button-little" href="#">修改</a>
						<a class="button border-yellow button-little" href="#"onclick="{if(confirm('确认删除?')){return true;}return false;}">删除</a>
						</td>
					</tr>
				</c:forEach>	
</tbody>    
 
</table>
			<c:set var="username" value="${param.username}" />
			<c:set var="phone" value="${param.phone}" />
			<c:set var="reservation" value="${param.reservation}" />
			<c:set var="currentPage" value="${blogPage.pageNumber}" />
			<c:set var="totalPage" value="${blogPage.totalPage}" />
			<c:set var="actionUrl" value="${pageContext.request.contextPath}/user/" />
			<c:set var="urlParas" value="" />
			<%@ include file="/common/_paginate.jsp"%>
</form>
<!--  搜索表单  -->
<form name='form3' action='/user'  method="post">
<input type='hidden' name='dopost' value='listArchives' />
<table width='100%'  border='0' cellpadding='1' cellspacing='1' align="center" style="margin-top:8px">
  <tr bgcolor='#f8f8f8'>
    <td align='center'>
      <table border='0' cellpadding='0' cellspacing='0'>
        <tr>
          <td width='90' align='center'>用户名：</td>
          <td width='160'>
          <input type="text" class="input" id="username" name="username"   value="${param.username}"  />
        </td>
        <td width='70'>
        	 手机号：
        </td>
        <td width='160'>
       	 <input type="text"  class="txt" style='width:150px'  id="phone" name="phone" value="${param.phone}"  />
        </td>
        <td width='110'>
    		注册时间 
      	</td>
      	 <td width='110'>
    		<input type="text"   name="reservation" id="reservation"	value="${param.reservation}"    />	 
      	</td>
        <td>
          <button type="submit" class="btn1">搜索</button>
        </td>
       </tr>
      </table>
    </td>
  </tr>
</table>
</form>

</body>
</html>