<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="/css/main.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
body{background:#fff;margin:0;padding:0;color:#333;}
h1{float:left;width:410px;margin:20px;display:inline;}
h1 img{float:left;}
h1 span{float:right;width:290px;height:47px;background:#ebebeb;font:22px/46px "黑体";text-indent:20px;}
.login-body{margin-top:50px;height:392px;width:100%;background:url(images/lor_bg.gif) repeat-x;}
.login-con{width:450px;height:392px;background:url(images/login_bg.gif) no-repeat;margin:0 auto;}
.login{float:right;width:290px;margin-right:20px;display:inline}
.login li{float:left;width:100%;margin-bottom:20px;}
.login label{float:left;width:100%;font-size:14px;margin-bottom:3px;}
.login input{float:left;padding:4px 2px;margin:0}
.submit{float:left;border:none;width:70px; height:28px;background:transparent url(images/lg_buttom.gif) no-repeat;cursor: pointer;font-size:14px;color:#fff;font-weight:bold;}
-->
</style>
</head>
<body>
<div class="login-body">
<div class="login-con">
<h1><img src="/images/login_logo.png" height="50" width="100" alt="管理后台" /><span>后台管理中心</span></h1>
<div class="login">
 <form action="/login" method="post" name="form1">
            <ul>
              <li><label>用户名：</label>
                <input type="text" class="text" name="name" style="_width:208px;"/>
              </li>
              <li><label>密   码：</label>
                <input type="password" class="text" name="password" style="_width:208px;"/>
              </li>
              <li> 
              <input type="submit" onclick="this.form.submit();" class="submit" value="登录" name="sm1"/></li>
            </ul>
 </form>  
</div>
            
</div>
</div>
</body>
</html>
