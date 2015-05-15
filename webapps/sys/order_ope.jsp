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

		<script type="text/javascript">
	$(document).ready(function() {
		$("#address").val($("#address1")[0].value);
	});
</script>
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
					<li ><a href="${pageContext.request.contextPath}/user" class="icon-file-text">用户管理</a>	</li>
					<li ><a href="${pageContext.request.contextPath}/product" class="icon-shopping-cart"> 产品管理</a>
					</li>
                	<li ><a href="${pageContext.request.contextPath}/order" class="icon-user"> 我的账户</a>
                	<ul>
						<li><a href="${pageContext.request.contextPath}/order">账户管理</a></li>
					</ul>
                	</li>
                	<li><a href="${pageContext.request.contextPath}/function" class="icon-th-list"> 个人中心</a></li>
				</ul>
        </div>
        <div class="admin-bread">
            <span>您好，${sessionScope.username}，欢迎您的光临。</span>
            <ul class="bread">
                <li><a href="${pageContext.request.contextPath}/" class="icon-home"> 开始</a></li>
                <li>认购添加</li>
            </ul>
        </div>
    </div>
</div>

<div class="admin">

    <div class="tab">
      	认购添加
      <div class="tab-body">
        <br />
        <div class="tab-panel active" id="tab-set">
        	<form method="post" class="form-x" action="${pageContext.request.contextPath}/order/insert">
				<div class="form-group">
                	<div class="label"><label>客户名称</label></div>
                	<div class="field">
                        <div class="button-group button-group-small radio">
								<input type="hidden" name="address1" id="address1"	value="${param.ptoducti}" />
                             	<input type="text" class="input" id="username" name="username" size="31" placeholder="用户名称" data-validate="required:请填写登陆名称" />
                        </div>
                    </div>
                </div>
                  <div class="form-group">
                    <div class="label"><label for="siteurl">购买类型:</label></div>
                    <div class="label">	  
                    	<select class="input"  name="address" id="address"  >
       					   <option value="">购买类型</option>
   						   <option value="1">基金</option>
 						   <option value="2">课程</option>
 						   <option value="3">P2P理财</option>
						</select>
					</div>   <div class="label"></div>
				 </div>
                <div class="form-group">
                    <div class="label"><label for="sitename">产品名称</label></div>
                    <div class="label">
                    	<input type="text" class="input" id="numbercard" name="numbercard"  value="${(messager.name)}"  readonly />
                    	<input type="hidden" class="input" id="numbercard" name="numbercard"  value="${(messager.id)}" />
                    </div><div class="label"></div>
                </div>
                <div class="form-group">
                    <div class="label"><label for="siteurl">金额</label></div>
                    <div class="label">
                    	<input type="text" class="input" id="phone" name="phone" size="50" placeholder="金额" data-validate="required:请输入购买金额数" maxlength="11" />
                    </div><div class="label"></div>
                </div>
                
                <div class="form-group">
                    <div class="label"><label for="title">状态</label></div>
                   <div class="label">	  
                    	<select class="input"  name="address" id="address" >
       					   <option value="">状态</option>
   						   <option value="1">已付款</option>
 						   <option value="2">未付款</option>
						</select>
					</div><div class="label"></div>
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