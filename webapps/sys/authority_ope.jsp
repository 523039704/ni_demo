<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link href="/css/main.css" rel="stylesheet" type="text/css" />
<script src="/js/jquery-1.3.2.min.js" language="javascript" type="text/javascript"></script>


 <script>
 	$(document).ready(function() {
         var hour=$("#username1")[0].value.split(","); 
           	for(var i=0;i < hour.length;i++){    //循环
          		 $("input:checkbox[value='"+hour[i]+"']").attr('checked','true');
                    	}
 	});              	 
   		 </script>


</head>

<body>
<div class="mtitle">
  <h1>添加会员</h1>
</div>

	<form method="post"
		action="${pageContext.request.contextPath}/role/add">
		<input type='hidden' name='dopost' value='listArchives' />
		<table width='100%' border='0' cellpadding='1' cellspacing='1'
			align="center" style="margin-top: 8px">
			<tr bgcolor='#f8f8f8'>
				<td align='center'>
					<table border='0' cellpadding='0' cellspacing='0'>
						<tr>
							<td width='90' align='center'>名称</td>
							<td width='160'>
							   <span  class="input" >${names}</span>
							   <input type="hidden" name="username1" id="username1"	value="${auts}" />
							   <input type="hidden" name="ids" id="ids"	value="${ids}" />
								</td>
						</tr>

						<tr>
							<td width='90' align='center'>路径</td>
							<td width='160'>
							<c:forEach items="${authority}" var="authority">
                       		<input type="checkbox"   class="checkbox"  name="authorityid"  value="${authority.id}" />${authority.path}
                       		</c:forEach>	
								</td>
						</tr>
						<tr>
							<td></td>
							<td width='90' align='center'>
								<button class="btn1" type="submit">提交</button>
							</td>
						</tr>

					</table>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>