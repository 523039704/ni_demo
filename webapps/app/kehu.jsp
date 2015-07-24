<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<div class="touxiang"><img src="${(user.headimgurl)}" width="80px" height="80px"></div>
<div class="xi">
<h2>会员ID：${(user.user_id)}</h2>
<h2>昵称：${(user.nickname)}</h2>
<h2>加入时间：${(user.subscribe_time)}</h2>
<h2>身份：客户</h2>
</div>
<div class="clear"></div>
</div>
<div class="biao_a">
<table width="95%" cellpadding="0" cellspacing="0" align="center">
<tr>
<td height="10"></td>
<td></td>
</tr>
<tr>
<td>我的投资金额：0.00</td>
<td style="text-align:right;"><a href="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxf4d5687f651cbe90&redirect_uri=http://22.ftezu.net/app/sqdls&response_type=code&scope=snsapi_base&state=1#wechat_redirect">申请成为</a></td>
</tr>
<tr>
<td height="10"></td>
<td></td>
</tr>
</table>
</div>
<div class="nei_a">
<div class="anniu">
<ul>
<li><a href="http://22.ftezu.net/"><img src="images/tu7.png" style="border:0px;"></a></li>
<li><a href="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxf4d5687f651cbe90&redirect_uri=http://22.ftezu.net/app/subscribe&response_type=code&scope=snsapi_base&state=1#wechat_redirect"><img src="images/tu8.png" style="border:0px;"></a></li>
<li><a href="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxf4d5687f651cbe90&redirect_uri=http://22.ftezu.net/app/counrse&response_type=code&scope=snsapi_base&state=1#wechat_redirect"><img src="images/tu9.png" style="border:0px;"></a></li>
</ul>
<div class="clear"></div>
</div>
</div>
</div>
</div>
</body>
</html>
