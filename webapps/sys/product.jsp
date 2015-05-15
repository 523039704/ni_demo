<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>文档管理</title>
<link href="/css/main.css" rel="stylesheet" type="text/css" />
<script src="/js/jquery-1.3.2.min.js" language="javascript" type="text/javascript"></script>

		<script type="text/javascript">
	$(document).ready(function() {
		$("#address").val($("#address1")[0].value);
	});
</script>
</head>
<body>
<div class="mtitle">
  <h1>数据管理</h1>
</div>
<div class="tform">
		<button type="button" class="btn1" onClick="location='/product/add?channelid={dede:global.channelid/}&cid={dede:global.cid/}&dopost=addArchives';" >添加数据</button>
</div>
<form name="form2">
  <table class="tlist" >
    <thead>
   			  <tr class="title">
					<th>id</th>
					<th>产品名称</th>
					<th>期限（月）</th>
					<th>起点金额（万元）</th>
					<th>操作</th>
				</tr>  
</thead>
<tbody>
 			<c:forEach items="${product.list}" var="product">
					<tr>
						<td>${product.id}</td>
						<td>${product.name}</td>
						<td>${product.longtime}</td>
						<td>${product.small_mony}</td>
						<td>
							<a class="button border-blue button-little" href="#">修改</a>
							<a class="button border-red button-little" href="#"	onclick="{if(confirm('确认删除?')){return true;}return false;}">删除</a>
							<a class="button border-black button-little" href="#">详情</a>
							<a class="button border-black button-little" href="${pageContext.request.contextPath}/order/add?id=${product.id}&ptoducti=1">认购</a>
						</td>
					</tr>
				</c:forEach>
</tbody>    
 
</table>
			<c:set var="currentPage" value="${product.pageNumber}" />
			<c:set var="totalPage" value="${product.totalPage}" />
			<c:set var="actionUrl" value="${pageContext.request.contextPath}/product/" />
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
          <td width='90' align='center'>地区:：</td>
          <td width='160'>
       		 <select name="address" id="address" >
       				   <option value="">请选择地区</option>
   					   <option value="11">北京</option>
 					   <option value="12">上海</option>
 					   <option value="13">深圳</option>
			</select>

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