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
					<th>业务员</th>
					<th>代理商</th>
				</tr>  
</thead>
<tbody>
 		<c:forEach items="${performance.list}" var="performance">
					<tr>
						<td>${performance.id}</td>
						<td>${performance.uid}</td>
						<td>${performance.createdatetime}</td>
						<td>${performance.ptoducti}</td>
						<td>${performance.productid}</td>
						<td>${performance.montey}</td>
						<td>${performance.businessid}</td>
						<td>${performance.agentid}</td>
						 
					</tr>
				</c:forEach>	
</tbody>    
 
</table>
		
			<c:set var="currentPage" value="${performance.pageNumber}" />
			<c:set var="totalPage" value="${performance.totalPage}" />
			<c:set var="actionUrl" value="${pageContext.request.contextPath}/order/performance" />
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