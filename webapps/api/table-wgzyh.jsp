<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<div class="bjui-pageHeader">
  <%--   <form id="pagerForm" data-toggle="ajaxsearch" action="table-wgzyh.html" method="post">
        <input type="hidden" name="pageSize" value="${pageSize}">
        <input type="hidden" name="pageCurrent" value="${pageCurrent}">
        <div class="bjui-searchBar">
            <label>类型:</label>
            <select name="type" data-toggle="selectpicker">
                <option value="">全部</option>
                <option value="1">view</option>
                <option value="2">click</option>
            </select>&nbsp;
            <label>名称：</label><input type="text" value="" name="name" class="form-control" size="8">&nbsp;
            <button type="submit" class="btn-default" data-icon="search">查询</button>&nbsp;
            <a class="btn btn-orange" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">清空查询</a>
        </div>
    </form> --%>
</div>
<div class="bjui-pageContent">
    <table class="table table-bordered table-hover table-striped table-top" data-selected-multi="true">
        <thead>
            <tr>
                <th data-order-field="operation" align="center">昵称</th>
                <th data-order-field="operation" align="center">openId</th>
                <th data-order-field="operation" align="center">性别</th>
                <th data-order-field="operation" align="center">城市</th>
                <th data-order-field="operation" align="center">省份</th>
                <th data-order-field="operation" align="center">国家</th>
                <th data-order-field="operation" align="center">图像</th>
                <th data-order-field="operation" align="center">关注时间</th>
                <th data-order-field="operation" align="center">备注</th>
                <th width="100">操作</th>
            </tr>
        </thead>
        <tbody>
        	<c:forEach items="${yhlist}" var="obj">
            <tr data-id="1">
                <td>${obj.nickname}</td>
                <td>${obj.openid}</td>
                <td>${obj.sex}</td>
                <td>${obj.city}</td>
                <td>${obj.province}</td>
                <td>${obj.country}</td>
                <td><img src="${obj.headimgurl}" width="50px" height="50px"></td>
                <td>${obj.subscribe_time}</td>
                <td>${obj.remark}</td>
                <td>
                    <a href="api/getUserInfo?openId=${obj.openid}" class="btn btn-default" data-toggle="dialog" data-width="800" data-height="300" data-id="dialog-mask" data-mask="true">查看</a>
<!--                     <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a> -->
                </td>
            </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
<%-- <div class="bjui-pageFooter">
    <div class="pages">
        <span>每页&nbsp;</span>
        <div class="selectPagesize">
            <select data-toggle="selectpicker" data-toggle-change="changepagesize">
                <option value="30">30</option>
                <option value="60">60</option>
                <option value="120">120</option>
                <option value="150">150</option>
            </select>
        </div>
        <span>&nbsp;条，共${pageSize}条</span>
    </div>
    <div class="pagination-box" data-toggle="pagination" data-total="${pageSize}" data-page-size="5" data-page-current="${pageCurrent}">
    </div>
</div> --%>