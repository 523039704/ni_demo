<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
<div class="kop" style="position:relative;">
<div class="dingbu">
<table width="95%" cellpadding="0" cellspacing="0" align="center">
<tr>
<td width="12%" height="8"></td>
<td width="76%"></td>
<td width="12%"></td>
</tr>
<tr>
<td width="12%"><a href="#"><img src="images/tu1.png" style="border:0px;"></a></td>
<td width="76%">个人中心</td>
<td width="12%"></td>
</tr>
<tr>
<td width="12%" height="8"></td>
<td width="76%"></td>
<td width="12%"></td>
</tr>
</table>
</div>
<div class="xinxi">
<div class="touxiang"><img src="${user.headimgurl}" width="80px" height="80px"></div>
<div class="xi">
<h2>会员ID：533937</h2>
<h2>昵称：${user.nickname}</h2>
<h2>加入时间：${user.subscribe_time}</h2>
<h2>上级公司：XXXX有限公司</h2>
<h2>身份：业务员</h2>
</div>
<div class="clear"></div>
</div>
<div class="biao">
<table width="95%" cellpadding="0" cellspacing="0" align="center">
<tr>
<td height="10"></td>
<td></td>
</tr>
<tr>
<td style=" border-right:solid 1px #909fa1;">客户数量：0</td>
<td>我的业绩：0.00</td>
</tr>
<tr>
<td height="10"></td>
<td></td>
</tr>
</table>
</div>
<div class="nei_a">
<div class="n_a">
<table width="100%" cellpadding="0" cellspacing="0">
<tr>
<td width="100%" height="100%"></td>
</tr>
<tr>
<td><img src="/qrcode/${user.openid}.jpg" width="100px" height="100px"></td>

</tr>
<tr>
<td height="10"></td>
<td></td>
<td></td>
</tr>
</table>
</div>


</div>
</div>
<div class="dibu" style="position:absolute; top:93%; position:fixed; _top: expression(eval(document.documentElement.scrollTop)+110px); z-index:1000;">
<ul>
<li><a href="app/index"><img src="images/tu4.png" style="border:0px;"></a></li>
<li><a href="app/sqdls?openid=${user.openid}"><img src="images/tu5.png" style="border:0px;"></a></li>
<li><a href="api/getUserInfo?openid=${user.openid}"><img src="images/tu6.png" style="border:0px;"></a></li>
</ul>
<div class="clear"></div>
</div>
</div>
</body>
</html>
