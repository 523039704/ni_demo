<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>拼图后台管理-后台管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pintuer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/js/pintuer.js"></script>
    <script src="${pageContext.request.contextPath}/js/respond.js"></script>
    <script src="${pageContext.request.contextPath}/js/admin.js"></script>
    <link type="image/x-icon" href="/favicon.ico" rel="shortcut icon" />
    <link href="/favicon.ico" rel="bookmark icon" />
</head>

<body>
<div class="lefter">
    <div class="logo"><a href="#" target="_blank"><img src="${pageContext.request.contextPath}/images/logo.png" alt="后台管理系统" /></a></div>
</div>
<div class="righter nav-navicon" id="admin-nav">
    <div class="mainer">
        <div class="admin-navbar">
            <span class="float-right">
            	<a class="button button-little bg-main" href="#">前台首页</a>
                <a class="button button-little bg-yellow" href="login.html">注销登录</a>
            </span>
         	 <ul class="nav nav-inline admin-nav">
					<li><a href="${pageContext.request.contextPath}/" class="icon-home"> 开始</a></li>
					<li class="active"><a href="${pageContext.request.contextPath}/user" class="icon-file-text">用户管理</a>
						<ul>
							<li ><a href="${pageContext.request.contextPath}/user">用户查询</a></li>
							<li class="active"><a href="${pageContext.request.contextPath}/user/add">用户添加</a></li>
							<li><a href="${pageContext.request.contextPath}/user">设置分组</a></li>
						</ul>
					</li>
					<li><a href="${pageContext.request.contextPath}/product" class="icon-shopping-cart"> 产品管理</a></li>
                	<li><a href="#" class="icon-user"> 我的账户</a></li>
                	<li><a href="#" class="icon-th-list"> 下载文件</a></li>
                	<li><a href="#" class="icon-th-list"> 个人中心</a></li>
				</ul>
        </div>
        <div class="admin-bread">
            <span>您好，${sessionScope.username}，欢迎您的光临。</span>
            <ul class="bread">
                <li><a href="${pageContext.request.contextPath}/" class="icon-home"> 开始</a></li>
                <li>用户添加</li>
            </ul>
        </div>
    </div>
</div>

<div class="admin">

    <div class="tab">
      	业务员添加
      <div class="tab-body">
        <br />
        <div class="tab-panel active" id="tab-set">
        	<form method="post" class="form-x" action="${pageContext.request.contextPath}/user/insert">
				<div class="form-group">
                	<div class="label"><label>业务员登录名</label></div>
                	<div class="field">
                        <div class="button-group button-group-small radio">
                             	<input type="text" class="input" id="username" name="username" size="50" placeholder="登录名称" data-validate="required:请填写业务员登录名称,integer:请输入信息" />
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="label"><label for="readme">业务员姓名</label></div>
                    <div class="field">
                       	<input type="text" class="input" id="realtname" name="realtname" size="50" placeholder="真实姓名" data-validate="required:请输入业务员的真实姓名,chinese:请输入中文" />
                    </div>
                </div>
                <div class="form-group">
                    <div class="label"><label for="sitename">业务员身份证号</label></div>
                    <div class="field">
                    	<input type="text" class="input" id="numbercard" name="numbercard" size="50" placeholder="身份证号" data-validate="required:请输入业务员的身份证号码,number:请填写正确身份证" />
                    </div>
                </div>
                <div class="form-group">
                    <div class="label"><label for="siteurl">业务员手机</label></div>
                    <div class="field">
                    	<input type="text" class="input" id="phone" name="phone" size="50" placeholder="手机号" data-validate="required:请输入业务员真实的手机号信息" maxlength="11" />
                    </div>
                </div>
                <div class="form-group">
                    <div class="label"><label for="logo">业务员Email</label></div>
                    <div class="field">
                         	<input type="text" class="input" id="email" name="email" size="50" placeholder="Email" data-validate="required:请输入业务员的邮箱信息,email:请输入正确格式" />
                    </div>
                </div>
                <div class="form-group">
                    <div class="label"><label for="title">操作类型</label></div>
                    <div class="field">
                       <select name="ope" id="ope" >
       					   <option value="-1">请选择功能</option>
   						   <option value="1">子公司</option>
 						   <option value="2">代理商</option>
 						   <option value="3">业务员</option>
						</select>
                    </div>
                </div>
                <div class="form-button"><button class="button bg-main" type="submit">提交</button></div>
            </form>
        </div>
        <div class="tab-panel" id="tab-email">邮件设置</div>
        <div class="tab-panel" id="tab-upload">上传设置</div>
        <div class="tab-panel" id="tab-visit">访问限制</div>
      </div>
    </div>
    <p class="text-right text-gray">基于<a class="text-gray" target="_blank" href="#">拼图前端框架</a>构建</p>
</div>

</body>
</html>