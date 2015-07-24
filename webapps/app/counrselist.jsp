<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<meta name="format-detection" content="telephone=no"/>
<link rel="stylesheet" type="text/css" href="css/gy.css"/>
<title></title>
</head>

<body>
<div class="quanju">
<div class="kop">
<div class="dingbu">
<table width="95%" cellpadding="0" cellspacing="0" align="center">
<tr>
<td width="14%" height="8"></td>
<td width="74%"></td>
<td width="12%"></td>
</tr>
<tr>
<td width="14%"><a href="#"><img src="images/tu1.png" style="border:0px;"></a></td>
<td width="74%">购买课程</td>
<td width="12%"></td>
</tr>
<tr>
<td width="14%" height="8"></td>
<td width="74%"></td>
<td width="12%"></td>
</tr>
</table>
</div>

<div class="nei_a">
<div class="n_a">
<c:forEach items="${info}" var="course" >
<table width="100%" cellpadding="0" cellspacing="0">
<tr>
<td width="23%" height="10"></td>
<td width="62%"></td>
<td width="15%"></td>
</tr>
<tr>

<td><a href="http://22.ftezu.net/app/counrsemessager?id=${course.id}"   ><img src="${course.img}"></a></td>
<td style="border-right:solid 1px #d5d5d5;"><a href="http://22.ftezu.net/app/counrsemessager?id=${course.id}"   >课程名称：${course.name}<br/><strong>报名人数：${course.peoples}</strong>&nbsp;&nbsp;剩余名额：${course.realpeople}人</a></td>
<td style="text-align:center;"><a href="http://22.ftezu.net/app/counrsemessager?id=${course.id}"  ><span>${course.price}元</span></a></td>

</tr>
<tr>
<td height="10"></td>
<td></td>
<td></td>
</tr>
</table>
</c:forEach>
</div>




</div>
</div>

</div>
</body>
</html>