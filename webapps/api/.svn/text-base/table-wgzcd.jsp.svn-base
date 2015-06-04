<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="table-wgzyh.html" method="post">
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
            <div class="pull-right">
                <button type="button" class="btn-blue" data-url="ajaxDone2.html?id={#bjui-selected}" data-toggle="doajax" data-confirm-msg="确定要删除选中项吗？" data-icon="remove" title="可以在控制台(network)查看被删除ID">删除选中行</button>&nbsp;
                <div class="btn-group">
                    <button type="button" class="btn-default dropdown-toggle" data-toggle="dropdown" data-icon="copy">复选框-批量操作<span class="caret"></span></button>
                    <ul class="dropdown-menu right" role="menu">
                        <li><a href="Book1.xlsx" data-toggle="doexport" data-confirm-msg="确定要导出信息吗？">导出<span style="color: green;">全部</span></a></li>
                        <li><a href="Book1.xlsx" data-toggle="doexportchecked" data-confirm-msg="确定要导出选中项吗？" data-idname="expids" data-group="ids">导出<span style="color: red;">选中</span></a></li>
                        <li class="divider"></li>
                        <li><a href="ajaxDone2.html" data-toggle="doajaxchecked" data-confirm-msg="确定要删除选中项吗？" data-idname="delids" data-group="ids">删除选中</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </form>
</div>
<div class="bjui-pageContent">
    <table class="table table-bordered table-hover table-striped table-top" data-selected-multi="true">
        <thead>
            <tr>
                <th data-order-field="operation" align="center">类型</th>
                <th data-order-field="operation" align="center">名称</th>
                <th data-order-field="operation" align="center">URL</th>
                <th width="26"><input type="checkbox" class="checkboxCtrl" data-group="ids" data-toggle="icheck"></th>
                <th width="100">操作</th>
            </tr>
        </thead>
        <tbody>
        	<c:forEach items="${cdlist}" var="obj">
            <tr data-id="1">
                <td>${obj.type}</td>
                <td>${obj.name}</td>
                <td>${obj.url}</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="1"></td>
                <td>
                    <a href="dialog-gzyh.html" class="btn btn-default" data-toggle="dialog" data-width="800" data-height="300" data-id="dialog-mask" data-mask="true">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
<div class="bjui-pageFooter">
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
        <span>&nbsp;条，共 ${pageSize} 条</span>
    </div>
    <div class="pagination-box" data-toggle="pagination" data-total="5" data-page-size="${pageSize}" data-page-current="${pageCurrent}">
    </div>
</div>