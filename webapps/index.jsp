<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>B-JUI 客户端框架</title>
<meta name="Keywords" content="B-JUI,Bootstrap,DWZ,jquery,ui,前端,框架,开源,OSC,开源框架,knaan"/>
<meta name="Description" content="B-JUI, Bootstrap for DWZ富客户端框架，基于DWZ富客户端框架修改。主要针对皮肤，编辑器，表单验证等方面进行了大量修改，引入了Bootstrap，Font Awesome，KindEditor，jquery.validationEngine，iCheck等众多开源项目。交流QQ群：232781006。"/> 
<!-- bootstrap - css -->
<link href="BJUI/themes/css/bootstrap.css" rel="stylesheet">
<!-- core - css -->
<link href="BJUI/themes/css/style.css" rel="stylesheet">
<link href="BJUI/themes/purple/core.css" id="bjui-link-theme" rel="stylesheet">
<!-- plug - css -->
<link href="BJUI/plugins/kindeditor_4.1.10/themes/default/default.css" rel="stylesheet">
<link href="BJUI/plugins/colorpicker/css/bootstrap-colorpicker.min.css" rel="stylesheet">
<link href="BJUI/plugins/niceValidator/jquery.validator.css" rel="stylesheet">
<link href="BJUI/plugins/bootstrapSelect/bootstrap-select.css" rel="stylesheet">
<link href="BJUI/themes/css/FA/css/font-awesome.min.css" rel="stylesheet">
<!--[if lte IE 7]>
<link href="BJUI/themes/css/ie7.css" rel="stylesheet">
<![endif]-->
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lte IE 9]>
    <script src="BJUI/other/html5shiv.min.js"></script>
    <script src="BJUI/other/respond.min.js"></script>
<![endif]-->
<!-- jquery -->
<script src="BJUI/js/jquery-1.7.2.min.js"></script>
<script src="BJUI/js/jquery.cookie.js"></script>
<!--[if lte IE 9]>
<script src="BJUI/other/jquery.iframe-transport.js"></script>    
<![endif]-->
<!-- BJUI.all 分模块压缩版 -->
<!-- <script src="BJUI/js/bjui-all.js"></script> -->
<!-- 以下是B-JUI的分模块未压缩版，建议开发调试阶段使用下面的版本 -->
 
<script src="BJUI/js/bjui-core.js"></script>
<script src="BJUI/js/bjui-regional.zh-CN.js"></script>
<script src="BJUI/js/bjui-frag.js"></script>
<script src="BJUI/js/bjui-extends.js"></script>
<script src="BJUI/js/bjui-basedrag.js"></script>
<script src="BJUI/js/bjui-slidebar.js"></script>
<script src="BJUI/js/bjui-contextmenu.js"></script>
<script src="BJUI/js/bjui-navtab.js"></script>
<script src="BJUI/js/bjui-dialog.js"></script>
<script src="BJUI/js/bjui-taskbar.js"></script>
<script src="BJUI/js/bjui-ajax.js"></script>
<script src="BJUI/js/bjui-alertmsg.js"></script>
<script src="BJUI/js/bjui-pagination.js"></script>
<script src="BJUI/js/bjui-util.date.js"></script>
<script src="BJUI/js/bjui-datepicker.js"></script>
<script src="BJUI/js/bjui-ajaxtab.js"></script>
<script src="BJUI/js/bjui-datagrid.js"></script>
<script src="BJUI/js/bjui-tablefixed.js"></script>
<script src="BJUI/js/bjui-tabledit.js"></script>
<script src="BJUI/js/bjui-spinner.js"></script>
<script src="BJUI/js/bjui-lookup.js"></script>
<script src="BJUI/js/bjui-tags.js"></script>
<script src="BJUI/js/bjui-upload.js"></script>
<script src="BJUI/js/bjui-theme.js"></script>
<script src="BJUI/js/bjui-initui.js"></script>
<script src="BJUI/js/bjui-plugins.js"></script>
 
<!-- plugins -->
<!-- swfupload for uploadify && kindeditor -->
<script src="BJUI/plugins/swfupload/swfupload.js"></script>
<!-- kindeditor -->
<script src="BJUI/plugins/kindeditor_4.1.10/kindeditor-all.min.js"></script>
<script src="BJUI/plugins/kindeditor_4.1.10/lang/zh_CN.js"></script>
<!-- colorpicker -->
<script src="BJUI/plugins/colorpicker/js/bootstrap-colorpicker.min.js"></script>
<!-- ztree -->
<script src="BJUI/plugins/ztree/jquery.ztree.all-3.5.js"></script>
<!-- nice validate -->
<script src="BJUI/plugins/niceValidator/jquery.validator.js"></script>
<script src="BJUI/plugins/niceValidator/jquery.validator.themes.js"></script>
<!-- bootstrap plugins -->
<script src="BJUI/plugins/bootstrap.min.js"></script>
<script src="BJUI/plugins/bootstrapSelect/bootstrap-select.min.js"></script>
<script src="BJUI/plugins/bootstrapSelect/defaults-zh_CN.min.js"></script>
<!-- icheck -->
<script src="BJUI/plugins/icheck/icheck.min.js"></script>
<!-- dragsort -->
<script src="BJUI/plugins/dragsort/jquery.dragsort-0.5.1.min.js"></script>
<!-- HighCharts -->
<script src="BJUI/plugins/highcharts/highcharts.js"></script>
<script src="BJUI/plugins/highcharts/highcharts-3d.js"></script>
<script src="BJUI/plugins/highcharts/themes/gray.js"></script>
<!-- ECharts -->
<script src="BJUI/plugins/echarts/echarts.js"></script>
<!-- other plugins -->
<script src="BJUI/plugins/other/jquery.autosize.js"></script>
<link href="BJUI/plugins/uploadify/css/uploadify.css" rel="stylesheet">
<script src="BJUI/plugins/uploadify/scripts/jquery.uploadify.min.js"></script>
<!-- init -->
<script type="text/javascript">
$(function() {
    BJUI.init({
        JSPATH       : 'BJUI/',         //[可选]框架路径
        PLUGINPATH   : 'BJUI/plugins/', //[可选]插件路径
        loginInfo    : {url:'login_timeout.jsp', title:'登录', width:400, height:200}, // 会话超时后弹出登录对话框
        statusCode   : {ok:200, error:300, timeout:301}, //[可选]
        ajaxTimeout  : 50000, //[可选]全局Ajax请求超时时间(毫秒)
        pageInfo     : {pageCurrent:'pageCurrent', pageSize:'pageSize', orderField:'orderField', orderDirection:'orderDirection'}, //[可选]分页参数
        alertMsg     : {displayPosition:'topcenter', displayMode:'slide', alertTimeout:3000}, //[可选]信息提示的显示位置，显隐方式，及[info/correct]方式时自动关闭延时(毫秒)
        keys         : {statusCode:'statusCode', message:'message'}, //[可选]
        ui           : {
                         showSlidebar     : true, //[可选]左侧导航栏锁定/隐藏
                         clientPaging     : true, //[可选]是否在客户端响应分页及排序参数
                         overwriteHomeTab : false //[可选]当打开一个未定义id的navtab时，是否可以覆盖主navtab(我的主页)
                       },
        debug        : true,    // [可选]调试模式 [true|false，默认false]
        theme        : 'purple' // 若有Cookie['bjui_theme'],优先选择Cookie['bjui_theme']。皮肤[五种皮肤:default, orange, purple, blue, red, green]
    })
    //时钟
    var today = new Date(), time = today.getTime()
    $('#bjui-date').html(today.formatDate('yyyy/MM/dd'))
    setInterval(function() {
        today = new Date(today.setSeconds(today.getSeconds() + 1))
        $('#bjui-clock').html(today.formatDate('HH:mm:ss'))
    }, 1000)
})

//菜单-事件
function MainMenuClick(event, treeId, treeNode) {
    event.preventDefault()
    
    if (treeNode.isParent) {
        var zTree = $.fn.zTree.getZTreeObj(treeId)
        
        zTree.expandNode(treeNode)
        return
    }
    
    if (treeNode.target && treeNode.target == 'dialog')
        $(event.target).dialog({id:treeNode.tabid, url:treeNode.url, title:treeNode.name})
    else
        $(event.target).navtab({id:treeNode.tabid, url:treeNode.url, title:treeNode.name, fresh:treeNode.fresh, external:treeNode.external})
}
</script>
<!-- for doc begin -->
<link type="text/css" rel="stylesheet" href="/js/syntaxhighlighter-2.1.382/styles/shCore.css"/>
<link type="text/css" rel="stylesheet" href="/js/syntaxhighlighter-2.1.382/styles/shThemeEclipse.css"/>
<script type="text/javascript" src="/js/syntaxhighlighter-2.1.382/scripts/brush.js"></script>
<link href="doc/doc.css" rel="stylesheet">
<script type="text/javascript">
$(function(){
    SyntaxHighlighter.config.clipboardSwf = '/js/syntaxhighlighter-2.1.382/scripts/clipboard.swf'
    $(document).on(BJUI.eventType.initUI, function(e) {
        SyntaxHighlighter.highlight();
    })
})
</script>
<!-- for doc end -->
</head>
<body>
    <!--[if lte IE 7]>
        <div id="errorie"><div>您还在使用老掉牙的IE，正常使用系统前请升级您的浏览器到 IE8以上版本 <a target="_blank" href="http://windows.microsoft.com/zh-cn/internet-explorer/ie-8-worldwide-languages">点击升级</a>&nbsp;&nbsp;强烈建议您更改换浏览器：<a href="http://down.tech.sina.com.cn/content/40975.html" target="_blank">谷歌 Chrome</a></div></div>
    <![endif]-->
    <header id="bjui-header">
        <div class="bjui-navbar-header">
            <button type="button" class="bjui-navbar-toggle btn-default" data-toggle="collapse" data-target="#bjui-navbar-collapse">
                <i class="fa fa-bars"></i>
            </button>
            <a class="bjui-navbar-logo" href="#"><img src="images/logo.png"></a>
        </div>
        <nav id="bjui-navbar-collapse">
            <ul class="bjui-navbar-right">
                <li class="datetime"><div><span id="bjui-date"></span><br><i class="fa fa-clock-o"></i> <span id="bjui-clock"></span></div></li>
                <li><a href="http://www.bootcss.com/" target="_blank">Bootstrap中文网</a></li>
                <li><a href="http://www.j-ui.com/" target="_blank">DWZ(j-ui)官网</a></li>
                <li><a href="#">消息 <span class="badge">4</span></a></li>
                <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">我的账户 <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="changepwd.html" data-toggle="dialog" data-id="changepwd_page" data-mask="true" data-width="400" data-height="260">&nbsp;<span class="glyphicon glyphicon-lock"></span> 修改密码&nbsp;</a></li>
                        <li><a href="#">&nbsp;<span class="glyphicon glyphicon-user"></span> 我的资料</a></li>
                        <li class="divider"></li>
                        <li><a href="/logout" class="red">&nbsp;<span class="glyphicon glyphicon-off"></span> 注销登陆</a></li>
                    </ul>
                </li>
                <li class="dropdown"><a href="#" class="dropdown-toggle theme purple" data-toggle="dropdown"><i class="fa fa-tree"></i></a>
                    <ul class="dropdown-menu" role="menu" id="bjui-themes">
                        <li><a href="javascript:;" class="theme_default" data-toggle="theme" data-theme="default">&nbsp;<i class="fa fa-tree"></i> 黑白分明&nbsp;&nbsp;</a></li>
                        <li><a href="javascript:;" class="theme_orange" data-toggle="theme" data-theme="orange">&nbsp;<i class="fa fa-tree"></i> 橘子红了</a></li>
                        <li class="active"><a href="javascript:;" class="theme_purple" data-toggle="theme" data-theme="purple">&nbsp;<i class="fa fa-tree"></i> 紫罗兰</a></li>
                        <li><a href="javascript:;" class="theme_blue" data-toggle="theme" data-theme="blue">&nbsp;<i class="fa fa-tree"></i> 青出于蓝</a></li>
                        <li><a href="javascript:;" class="theme_red" data-toggle="theme" data-theme="red">&nbsp;<i class="fa fa-tree"></i> 红红火火</a></li>
                        <li><a href="javascript:;" class="theme_green" data-toggle="theme" data-theme="green">&nbsp;<i class="fa fa-tree"></i> 绿草如茵</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
    </header>
    <div id="bjui-hnav">
        <button type="button" class="bjui-hnav-toggle btn-default" data-toggle="collapse" data-target="#bjui-hnav-navbar">
            <i class="fa fa-bars"></i>
        </button>
        <ul id="bjui-hnav-navbar">
            <li style="width:204px;"><a>欢迎您，${sessionScope.name}！</a></li>
           
            <li><a href="javascript:;" data-toggle="slidebar"><i class="fa fa-check-square-o"></i>用户管理</a>
                <ul id="bjui-hnav-tree1" class="ztree ztree_main" data-toggle="ztree" data-on-click="MainMenuClick" data-expand-all="true" data-noinit="true">
                    <li data-id="1" data-pid="0" data-faicon="th-large">用户管理</li>
                    	<c:forEach items="${sessionScope.function}" var="function">
                           <c:if test="${function.id  eq '1'}">
                    		<li data-id="10" data-pid="1" data-url="${function.path}" data-tabid="form-button" data-faicon="hand-o-up">${function.name}</li>
                    	  </c:if>
                    	    <c:if test="${function.id  eq '2'}">
                    		<li data-id="11" data-pid="1" data-url="${function.path}" data-tabid="form-button" data-faicon="hand-o-up">${function.name}</li>
                    	  </c:if>
                    	    <c:if test="${function.id  eq '3'}">
                    		<li data-id="12" data-pid="1" data-url="${function.path}" data-tabid="form-button" data-faicon="hand-o-up">${function.name}</li>
                    	  </c:if>
                    	   
                    </c:forEach>
                </ul>
            </li>
            <li><a href="javascript:;" data-toggle="slidebar"><i class="fa fa-table"></i>产品管理</a>
                <ul id="bjui-hnav-tree2" class="ztree ztree_main" data-toggle="ztree" data-on-click="MainMenuClick" data-expand-all="true" data-noinit="true">
                    <li data-id="2" data-pid="0">产品管理</li>
                    	<c:forEach items="${sessionScope.function}" var="function">
                           <c:if test="${function.id  eq '6'}">
                    		<li data-id="20" data-pid="2" data-url="${function.path}" data-tabid="table">${function.name}</li>
                   		  </c:if>
                   		   <c:if test="${function.id  eq '7'}">
                    		<li data-id="21" data-pid="2" data-url="${function.path}" data-tabid="table">${function.name}</li>
                   		  </c:if>
                   		   <c:if test="${function.id  eq '8'}">
                    		<li data-id="22" data-pid="2" data-url="${function.path}" data-tabid="table">${function.name}</li>
                   		  </c:if>
                   		   <c:if test="${function.id  eq '9'}">
                    		<li data-id="23" data-pid="2" data-url="${function.path}" data-tabid="table">${function.name}</li>
                   		  </c:if>
                   		  <c:if test="${function.id  eq '10'}">
                    		<li data-id="24" data-pid="2" data-url="${function.path}" data-tabid="table">${function.name}</li>
                   		  </c:if>
                    </c:forEach>
                </ul>
            </li>
            <li><a href="javascript:;" data-toggle="slidebar"><i class="fa fa-table"></i> 财务管理</a>
                <ul id="bjui-hnav-tree-datagrid" class="ztree ztree_main" data-toggle="ztree" data-on-click="MainMenuClick" data-expand-all="true" data-noinit="true">
                    <li data-id="3" data-pid="0">财务管理</li>
                    <c:forEach items="${sessionScope.function}" var="function">
                           <c:if test="${function.id  eq '4'}">
                    <li data-id="31" data-pid="3" data-url="${function.path}" data-tabid="datagrid-convertable">${function.name}</li>
                    </c:if>
                     <c:if test="${function.id  eq '5'}">
                    <li data-id="32" data-pid="3" data-url="${function.path}" data-tabid="datagrid-convertable">${function.name}</li>
                    </c:if>
                    </c:forEach>
                </ul>
            </li>
             <c:if test="${sessionScope.role  eq '1'||sessionScope.role  eq '100'}"> 
            <li><a href="javascript:;" data-toggle="slidebar"><i class="fa fa-plane"></i> 个人中心</a>
                <ul id="bjui-hnav-tree4" class="ztree ztree_main" data-toggle="ztree" data-on-click="MainMenuClick" data-expand-all="true" data-noinit="true">
                    <li data-id="4" data-pid="0">弹出窗口</li>
                    <li data-id="40" data-pid="4" data-url="/range" data-tabid="dialog">收益和金额列表</li>
                    <li data-id="41" data-pid="4" data-url="/range/add" data-tabid="alert">添加操作</li>
                </ul>
            </li>
            
            <li><a href="javascript:;" data-toggle="slidebar"><i class="fa fa-image"></i>系统设置</a>
                <ul id="bjui-hnav-tree5" class="ztree ztree_main" data-toggle="ztree" data-on-click="MainMenuClick" data-expand-all="true" data-noinit="true">
                    <li data-id="5" data-pid="0">系统设置</li>
                    <li data-id="51" data-pid="5" data-url="${pageContext.request.contextPath}/role" data-tabid="chart">角色预览</li>
                    <li data-id="52" data-pid="5" data-url="${pageContext.request.contextPath}/function" data-tabid="echarts">功能预览</li>
                       <c:if test="${sessionScope.role  eq '100'}"> 
                    <li data-id="53" data-pid="5" data-url="${pageContext.request.contextPath}/function/add" data-tabid="echarts">功能添加</li>
                    </c:if>
                </ul>
            </li>
            </c:if>  
            
             <li><a href="javascript:;" data-toggle="slidebar"><i class="fa fa-plane"></i> 微信管理</a>
                <ul id="bjui-hnav-tree-datagrid" class="ztree ztree_main" data-toggle="ztree" data-on-click="MainMenuClick" data-expand-all="true" data-noinit="true">
                    <li data-id="6" data-pid="0">微信管理</li>
                    <c:forEach items="${sessionScope.function}" var="function">
                        <c:if test="${function.id  eq '13'}"> 
                    <li data-id="60" data-pid="6" data-url="${function.path}" data-tabid="table-wgzyh">${function.name}</li>
                    </c:if>
                     <c:if test="${function.id  eq '14'}"> 
                    <li data-id="61" data-pid="6" data-url="${function.path}" data-tabid="table-wgzyh">${function.name}</li>
                    </c:if>
                     <c:if test="${function.id  eq '15'}"> 
                    <li data-id="62" data-pid="6" data-url="${function.path}" data-tabid="table-wgzyh">${function.name}</li>
                    </c:if>
                     <c:if test="${function.id  eq '16'}"> 
                    <li data-id="63" data-pid="6" data-url="${function.path}" data-tabid="table-wgzyh">${function.name}</li>
                    </c:if>
                    </c:forEach>
                </ul>
            </li>
        </ul>
        <form class="hnav-form">
            <div class="input-group">
                <input type="text" class="form-control" placeholder="Search...">
                <span class="input-group-btn">
                    <button class="btn btn-default" type="button"><i class="fa fa-search"></i></button>
                </span>
            </div>
        </form>
    </div>
    <div id="bjui-container" class="clearfix">
        <div id="bjui-leftside">
            <div id="bjui-sidebar-s">
                <div class="collapse"></div>
            </div>
            <div id="bjui-sidebar">
                <div class="toggleCollapse"><h2><i class="fa fa-bars"></i> 导航栏 <i class="fa fa-bars"></i></h2><a href="javascript:;" class="lock"><i class="fa fa-lock"></i></a></div>
                <div class="panel-group panel-main" data-toggle="accordion" id="bjui-accordionmenu" data-heightbox="#bjui-sidebar" data-offsety="26">
                    <div class="panel panel-default">
                        <div class="panel-heading panelContent">
                            <h4 class="panel-title"><a data-toggle="collapse" data-parent="#bjui-accordionmenu" href="#bjui-collapse0" class="active"><i class="fa fa-caret-square-o-down"></i>&nbsp;基本功能</a></h4>
                        </div>
                        <div id="bjui-collapse0" class="panel-collapse panelContent collapse in">
                            <div class="panel-body" >
                                <ul id="bjui-tree0" class="ztree ztree_main" data-toggle="ztree" data-on-click="MainMenuClick" data-expand-all="true">
                                    <li data-id="1" data-pid="0" data-faicon="th-large">用户 </li>
                                	<c:forEach items="${sessionScope.function}" var="function">
                                	    <c:if test="${function.id  eq '1'}"> 
                                   			 <li data-id="10" data-pid="1" data-url="${function.path}" data-tabid="form-button" data-faicon="hand-o-up">${function.name}</li>
                                 		</c:if>
                                		<c:if test="${function.id  eq '2'}"> 
                                   			 <li data-id="11" data-pid="1" data-url="${function.path}" data-tabid="form-button" data-faicon="hand-o-up">${function.name}</li>
                                 		</c:if>
                                 		<c:if test="${function.id  eq '3'}"> 
                                   			 <li data-id="12" data-pid="1" data-url="${function.path}" data-tabid="form-button" data-faicon="hand-o-up">${function.name}</li>
                                 		</c:if>
                                 		  
                                    </c:forEach>
                                    <li data-id="2" data-pid="0">账户</li>
                                    <c:forEach items="${sessionScope.function}" var="function">
                                	    <c:if test="${function.id  eq '4'}"> 
                                   			 <li data-id="20" data-pid="2" data-url="${function.path}" data-tabid="form-button" data-faicon="hand-o-up">${function.name}</li>
                                 		</c:if>
                                		<c:if test="${function.id  eq '5'}"> 
                                   			 <li data-id="21" data-pid="2" data-url="${function.path}" data-tabid="form-button" data-faicon="hand-o-up">${function.name}</li>
                                 		</c:if>
                                    </c:forEach>
                                    <li data-id="3" data-pid="0">产品</li>
                                    <c:forEach items="${sessionScope.function}" var="function">
                                	    <c:if test="${function.id  eq '6'}"> 
                                   			 <li data-id="30" data-pid="3" data-url="${function.path}" data-tabid="form-button" data-faicon="hand-o-up">${function.name}</li>
                                 		</c:if>
                                		<c:if test="${function.id  eq '7'}"> 
                                   			 <li data-id="31" data-pid="3" data-url="${function.path}" data-tabid="form-button" data-faicon="hand-o-up">${function.name}</li>
                                 		</c:if>
                                    </c:forEach>
                                    <li data-id="4" data-pid="0">课程</li>
                                     <c:forEach items="${sessionScope.function}" var="function">
                                	    <c:if test="${function.id  eq '8'}"> 
                                   			 <li data-id="40" data-pid="4" data-url="${function.path}" data-tabid="form-button" data-faicon="hand-o-up">${function.name}</li>
                                 		</c:if>
                                		<c:if test="${function.id  eq '9'}"> 
                                   			 <li data-id="41" data-pid="4" data-url="${function.path}" data-tabid="form-button" data-faicon="hand-o-up">${function.name}</li>
                                 		</c:if>
                                    </c:forEach>
                                    <li data-id="5" data-pid="0">P2P</li>
                                     <c:forEach items="${sessionScope.function}" var="function">
                                	    <c:if test="${function.id  eq '10'}"> 
                                   			 <li data-id="50" data-pid="5" data-url="${function.path}" data-tabid="form-button" data-faicon="hand-o-up">${function.name}</li>
                                 		</c:if>
                                    </c:forEach>
                                    <li data-id="6" data-pid="0">微信管理</li>
                                     <c:forEach items="${sessionScope.function}" var="function">
                                        <c:if test="${function.id  eq '13'}"> 
				                    <li data-id="60" data-pid="6" data-url="${function.path}" data-tabid="table-wgzyh">${function.name}</li>
				                    </c:if>
				                    <c:if test="${function.id  eq '14'}"> 
				                    <li data-id="61" data-pid="6" data-url="${function.path}" data-tabid="table-wgzyh">${function.name}</li>
				                    </c:if>
				                     <c:if test="${function.id  eq '15'}"> 
				                    <li data-id="62" data-pid="6" data-url="${function.path}" data-tabid="table-wgzyh">${function.name}</li>
				                    </c:if>
				                     <c:if test="${function.id  eq '16'}"> 
				                    <li data-id="63" data-pid="6" data-url="${function.path}" data-tabid="table-wgzyh">${function.name}</li>
				                    </c:if>
				                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                        <div class="panelFooter"><div class="panelFooterContent"></div></div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading panelContent">
                            <h4 class="panel-title"><a data-toggle="collapse" data-parent="#bjui-accordionmenu" href="#bjui-collapse1" class="" style="color:#FF1100;"><i class="fa fa-caret-square-o-right"></i>&nbsp;高级功能</a></h4>
                        </div>
                        <div id="bjui-collapse1" class="panel-collapse panelContent collapse">
                            <div class="panel-body">
                                <ul id="bjui-tree1" class="ztree ztree_main" data-toggle="ztree" data-on-click="MainMenuClick" data-expand-all="false">
                                    <li data-id="99" data-pid="0">角色</li>
                                    <li data-id="100" data-pid="99" data-url="${pageContext.request.contextPath}/role" data-tabid="doc-file">角色预览</li>
                                    <li data-id="1" data-pid="0">功能</li>
                                    <li data-id="10" data-pid="1" data-url="${pageContext.request.contextPath}/function" data-tabid="doc-base">功能预览</li>
                                    <li data-id="11" data-pid="1" data-url="${pageContext.request.contextPath}/function/add" data-tabid="doc-base">功能添加</li>
                                </ul>
                            </div>
                        </div>
                        <div class="panelFooter"><div class="panelFooterContent"></div></div>
                    </div>
                </div>
            </div>
        </div>
        <div id="bjui-navtab" class="tabsPage">
            <div class="tabsPageHeader">
                <div class="tabsPageHeaderContent">
                    <ul class="navtab-tab nav nav-tabs">
                        <li data-url="index_layout.jsp"><a href="javascript:;"><span><i class="fa fa-home"></i> #maintab#</span></a></li>
                    </ul>
                </div>
                <div class="tabsLeft"><i class="fa fa-angle-double-left"></i></div>
                <div class="tabsRight"><i class="fa fa-angle-double-right"></i></div>
                <div class="tabsMore"><i class="fa fa-angle-double-down"></i></div>
            </div>
            <ul class="tabsMoreList">
                <li><a href="javascript:;">#maintab#</a></li>
            </ul>
            <div class="navtab-panel tabsPageContent">
                <div class="navtabPage unitBox">
                    <div class="bjui-pageHeader" style="background:#FFF;">
                        <div style="padding: 0 15px;">
                            <h4>
                                B-JUI 前端框架　
                                <a target="_blank" href="#"><img border="0" src="images/group.png" alt="B-JUI前端框架-群1" title="B-JUI前端框架-群1" style="vertical-align:top;"></a>
                                <span class="label label-default" style="vertical-align:middle;">(1群已满)</span>　
                                <a target="_blank" href="#"><img border="0" src="images/group.png" alt="B-JUI前端框架-群2" title="B-JUI前端框架-群2" style="vertical-align:top;"></a>
                            </h4>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="alert alert-success" role="alert" style="margin:0 0 5px; padding:5px 15px;">
                                        <strong>B-JUI团队欢迎你!</strong>
                                        <br><span class="label label-default">开发 ：</span> <a href="http://weibo.com/xknaan" target="_blank">@萧克南 （成都锦杨）</a> <a href="http://www.topstack.cn" target="_blank">@小策一喋 （北京）</a>
                                        <br><span class="label label-default">测试 & 推广：</span> <a href="#" target="_blank">@Jack Yuan （成都锦杨）</a>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="alert alert-info" role="alert" style="margin:0 0 5px; padding:5px 15px;">
                                        <h5>官方论坛：<a href="http://www.b-jui.com/" target="_blank">http://www.b-jui.com/</a></h5>
                                        <h5>项目地址：<a href="http://git.oschina.net/xknaan/B-JUI" target="_blank">GIT</a>　<a href="http://www.oschina.net/p/bootstrap-for-DWZ" target="_blank">OSCHINA</a></h5>
                                        <h5>微博地址：<a href="http://weibo.com/xknaan" target="_blank">http://weibo.com/xknaan</a></h5>
                                        <h5>PHP整合：<a href="http://git.oschina.net/xvpindex/ewsdCMS" target="_blank">ThinkPHP整合</a></h5>
                                    </div>                                  
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>