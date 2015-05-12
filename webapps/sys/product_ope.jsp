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
					<li><a href="${pageContext.request.contextPath}/user" class="icon-file-text">用户管理</a>
					 
					</li>
					<li  class="active"><a href="${pageContext.request.contextPath}/product" class="icon-shopping-cart"> 产品管理</a>
					<ul>
						<li><a href="${pageContext.request.contextPath}/product">产品查询</a></li>
						<li class="active"><a href="${pageContext.request.contextPath}/product/add">产品添加</a></li>
						<li><a href="${pageContext.request.contextPath}/course">课程查看</a></li>
						<li><a href="${pageContext.request.contextPath}/course/add">课程添加</a></li>
						<li><a href="${pageContext.request.contextPath}/product">p2p查看</a></li>
					</ul>
					</li>
                	<li><a href="#" class="icon-user"> 我的账户</a></li>
                	<li><a href="#" class="icon-th-list"> 下载文件</a></li>
                	<li><a href="#" class="icon-th-list"> 个人中心</a></li>
				</ul>
        </div>
        <div class="admin-bread">
            <span>您好，${sessionScope.username}，欢迎您的光临。</span>
            <ul class="bread">
                <li><a href="${pageContext.request.contextPath}/" class="icon-home"> 开始</a></li>
                <li>产品添加</li>
            </ul>
        </div>
    </div>
</div>

<div class="admin">
    <div class="tab">
      	产品添加
      <div class="tab-body">
        <br />
        <div class="tab-panel active" id="tab-set">
        	<form method="post" class="form-x" action="${pageContext.request.contextPath}/product/insert">
				<div class="form-group">
                	<div class="label"><label>产品名称</label></div>
                	<div class="field">
                        <div class="button-group button-group-small radio">
                             	<input type="text" class="input" id="username" name="username" size="50" placeholder="产品名称" data-validate="required:请填写产品名称" />
                        </div>
                    </div>
                </div>
                 <div class="form-group">
                    <div class="label"><label for="readme">起购日期</label></div>
                    <div class="field">
                       	<input type="text" class="input" id="realtname" name="realtname" size="50" placeholder="起购日期" data-validate="required:请输入起购日期" />
                    </div>
                </div>
                <div class="form-group">
                    <div class="label"><label for="sitename">截止日期</label></div>
                    <div class="field">
                    	<input type="text" class="input" id="numbercard" name="numbercard" size="50" placeholder="截止日期" data-validate="required:请输入截止日期" />
                    </div>
                </div>
                <div class="form-group">
                    <div class="label"><label for="readme">期限</label></div>
                    <div class="field">
                       	<input type="text" class="input" id="realtname" name="realtname" size="50" placeholder="期限" data-validate="required:请输入此产品" />
                    </div>
                </div>
                <div class="form-group">
                    <div class="label"><label for="sitename">起点金额</label></div>
                    <div class="field">
                    	<input type="text" class="input" id="numbercard" name="numbercard" size="50" placeholder="最低金额数" data-validate="required:请输入最少认购金额" />
                    </div>
                </div>
                 <div class="form-group">
                    <div class="label"><label for="siteurl">地区:</label></div>
                    <div class="field">	  
                    	<select class="input"  name="address" id="address" >
       					   <option value="">请选择地区</option>
   						   <option value="11">北京</option>
 						   <option value="12">上海</option>
 						   <option value="13">深圳</option>
						</select>
					</div>
				 </div>
				 
				 
				  <div class="form-group">
                    <div class="label"><label for="siteurl">服务收益选择:</label></div>
                    <div class="label">	  
                    	<select class="input"  name="address" id="address" >
       					   <option value="">金额范围</option>
   						   <option value="11">北京</option>
 						   <option value="12">上海</option>
 						   <option value="13">深圳</option>
						</select>
					</div>
					
					 <div class="label">	  
                    	<select class="input"  name="address" id="address" >
       					   <option value="">收益</option>
   						   <option value="11">北京</option>
 						   <option value="12">上海</option>
 						   <option value="13">深圳</option>
						</select>
					</div>
					
					 <div class="label">	  
                    	<select class="input"  name="address" id="address" >
       					   <option value="">服务费率</option>
   						   <option value="11">北京</option>
 						   <option value="12">上海</option>
 						   <option value="13">深圳</option>
						</select>
					</div>
				 </div>
				   <div class="form-group">
                    <div class="label"><label for="siteurl"> </label></div>
                    <div class="label">	  
                    	<select class="input"  name="address" id="address" >
       					   <option value="">金额范围</option>
   						   <option value="11">北京</option>
 						   <option value="12">上海</option>
 						   <option value="13">深圳</option>
						</select>
					</div>
					
					 <div class="label">	  
                    	<select class="input"  name="address" id="address" >
       					   <option value="">收益</option>
   						   <option value="11">北京</option>
 						   <option value="12">上海</option>
 						   <option value="13">深圳</option>
						</select>
					</div>
					
					 <div class="label">	  
                    	<select class="input"  name="address" id="address" >
       					   <option value="">服务费率</option>
   						   <option value="11">北京</option>
 						   <option value="12">上海</option>
 						   <option value="13">深圳</option>
						</select>
					</div>
				 </div>
				   <div class="form-group">
                    <div class="label"><label for="siteurl"></label></div>
                    <div class="label">	  
                    	<select class="input"  name="address" id="address" >
       					   <option value="">金额范围</option>
   						   <option value="11">北京</option>
 						   <option value="12">上海</option>
 						   <option value="13">深圳</option>
						</select>
					</div>
					
					 <div class="label">	  
                    	<select class="input"  name="address" id="address" >
       					   <option value="">收益</option>
   						   <option value="11">北京</option>
 						   <option value="12">上海</option>
 						   <option value="13">深圳</option>
						</select>
					</div>
					
					 <div class="label">	  
                    	<select class="input"  name="address" id="address" >
       					   <option value="">服务费率</option>
   						   <option value="11">北京</option>
 						   <option value="12">上海</option>
 						   <option value="13">深圳</option>
						</select>
					</div>
				 </div>
				   <div class="form-group">
                    <div class="label"><label for="siteurl"></label></div>
                    <div class="label">	  
                    	<select class="input"  name="address" id="address" >
       					   <option value="">金额范围</option>
   						   <option value="11">北京</option>
 						   <option value="12">上海</option>
 						   <option value="13">深圳</option>
						</select>
					</div>
					
					 <div class="label">	  
                    	<select class="input"  name="address" id="address" >
       					   <option value="">收益</option>
   						   <option value="11">北京</option>
 						   <option value="12">上海</option>
 						   <option value="13">深圳</option>
						</select>
					</div>
					
					 <div class="label">	  
                    	<select class="input"  name="address" id="address" >
       					   <option value="">服务费率</option>
   						   <option value="11">北京</option>
 						   <option value="12">上海</option>
 						   <option value="13">深圳</option>
						</select>
					</div>
				 </div>
				 
				 
                <div class="form-group">
                    <div class="label"><label for="siteurl">产品详情</label></div>
                     <div class="field">
                    	<textarea class="input" rows="5" cols="50" id="servce" name="email" placeholder="请填写产品详情" data-validate="required:请填写产品详情"></textarea>
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