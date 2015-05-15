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
					<th>用户名称</th>
					<th>购买日期</th>
					<th>分类</th>
					<th>产品</th>
					<th>金额</th>
					<th>费率</th>
					<th>状态</th>
					<th>业务员</th>
					<th>操作</th>
				</tr>  
</thead>
<tbody>
 			<c:forEach items="${order.list}" var="order">
					<tr>
						<td>${order.id}</td>
						<td>${order.uid}</td>
						<td>${order.createdatetime}</td>
						<td>${order.ptoducti}</td>
						<td>${order.productid}</td>
						<td>${order.montey}</td>
						<td>${order.serviceid}</td>
						<td>${order.status}</td>
						<td>${order.businessid}</td>
						<td>
							<a class="button border-yellow button-little" href="#"  onclick="return false" >审核</a>
						</td>
					</tr>
				</c:forEach>	
</tbody>    
 
</table>
			<c:set var="currentPage" value="${order.pageNumber}" />
			<c:set var="totalPage" value="${order.totalPage}" />
			<c:set var="actionUrl" value="${pageContext.request.contextPath}/order/" />
			<c:set var="urlParas" value="" />
			<%@ include file="/common/_paginate.jsp"%>
</form>
<!--  搜索表单  -->
<%-- <form name='form3' action='/user'  method="post">
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
</form> --%>

</body>
</html>