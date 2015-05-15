<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理</title>

<script src="/js/jquery-1.3.2.min.js" language="javascript" type="text/javascript"></script>
<script src="/js/frame.js" language="javascript" type="text/javascript"></script>
<link href="/css/frame.css" rel="stylesheet" type="text/css" />

</head>
<body class="showmenu">
<div class="pagemask"></div>
<iframe class="iframemask"></iframe>
<div class="head">
<div class="top_logo"> <img src="/images/login_logo.png"   height="50" width="100" /> </div>
    <div class="top_link">
      <ul>
	    <li class="welcome">administrator</li>
		<li class="menuact"><a href="#" id="togglemenu">隐藏菜单</a></li>
        <li><a href="sys_cache_up.jsp" target="main">更新缓存</a></li>
        <li><a href="../index.jsp?upcache=1" target="_blank">网站首页</a></li>     
        <li><a href="exit.jsp" target="_top">[退出]</a></li>
		
      </ul>
      <div class="quick"> <a href="#" class="ac_qucikmenu" id="ac_qucikmenu">快捷方式</a> <a href="#" class="ac_qucikadd" id="ac_qucikadd"></a> </div>
    </div>

    <div class="nav" id="nav">
      <ul>
              <li><a class="thisclass" href="index_body.jsp" _for="common" target="main">常用操作</a></li>
              <li><a href="/user" _for="content" target="main">用户管理</a></li>
              <li><a href="/product" _for="member" target="main">产品管理</a></li>
              <li><a href="/function" _for="authority" target="main">权限设置</a></li>
              <li><a href="${pageContext.request.contextPath}/order" _for="order" target="main">我的账户</a></li>
              <li><a href="sys_info.jsp" _for="qita" target="main">个人中心</a></li>
      </ul>
    </div>
</div><!-- header end -->

<div class="left">
<div class="menu" id="menu">
<div id="items_common">
<dl id="dl_items_1_1">
<dt>常用操作</dt>
<dd>
<ul>
<li><a href="index_body.jsp" target="main">管理首页</a></li> 
</ul>
</dd>
</dl>
</div><!-- Item End -->

<div id="items_content">
<dl id="dl_items_1_2">
  <dt>会员管理</dt>
    <dd>
     <ul>
	  <li><a href="/user" target="main">会员预览</a></li>
      <li><a href="/user" target="main">设置分组</a></li>
	</ul>
  </dd>
</dl>
</div>

<div id="items_member">
<dl id="dl_items_1_3">
        <dt>产品管理</dt>
        <dd>
<ul>
<li><a href="/product" target="main">产品</a></li>
<li><a href="/course" target="main">课程</a></li>
<li><a href="/product" target="main">P2P</a></li>
</ul>
</dd>
</dl>

</div>

<div id="items_authority">
<dl id="dl_items_1_4">
        <dt>权限管理</dt>
        <dd>
          <ul>
<li><a href="/function" target="main">功能预览</a></li>
<li><a href="/role" target="main">角色预览</a></li>
</ul>
</dd>
</dl>
</div>

<div id="items_order">
<dl id="dl_items_1_5">
        <dt>我的账户</dt>
        <dd>
          <ul>
<li><a href="${pageContext.request.contextPath}/order" target="main">账户信息</a></li>
<li><a href="${pageContext.request.contextPath}/order/performance" target="main">业绩统计</a></li>
</ul>
</dd>
</dl>
</div>

<div id="items_qita">
<dl id="dl_items_1_6">
        <dt>个人中心</dt>
        <dd>
          <ul>
<li><a href="templets_main.jsp" target="main">默认模板管理</a></li>
<li><a href="templets_tagsource.jsp" target="main">标签源码管理</a></li>
<li><a href="mytag_main.jsp" target="main">自定义宏标记</a></li>
<li><a href="mytag_tag_guide.jsp" target="main">智能标记向导</a></li>
</ul>
</dd>
</dl>
</div>
</div>
</div><!-- left end -->

<div class="right">
  <div class="main">
    <iframe id="main" name="main" frameborder="0" src="index_body.jsp"></iframe>
  </div>
</div><!-- right end -->

<div class="qucikmenu" id="qucikmenu">
  <ul>
<li><a href="content_list.jsp" target="main">数据列表</a></li>
<li><a href="catalog_main.jsp" target="main">栏目管理</a></li>
<li><a href="sys_info.jsp" target="main">修改系统参数</a></li>
  </ul>
</div><!-- qucikmenu end -->
</body>
</jspl>
