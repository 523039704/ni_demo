<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="/role" method="post">
        <input type="hidden" name="pageSize" value="${(pager.pageSize)}">
        <input type="hidden" name="pageCurrent" value="${(pager.pageNumber)}">
    </form>
</div>
<div class="bjui-pageContent">
    <table class="table table-bordered table-hover table-striped table-top" data-selected-multi="true">
        <thead>
            <tr>
                <th data-order-field="operation" align="center">id</th>
                <th data-order-field="name">角色名称</th>
                <th data-order-field="name">服务费率</th>
                <th width="100">操作</th>
            </tr>
        </thead>
        <tbody>
				<c:forEach items="${role}" var="role">
					<tr>
						<td>${role.id}</td>
						<td>${role.social}</td>
						<td>${role.serve}</td>
						<td  width="200">
						<a  class="btn btn-default" data-toggle="navtab" data-id="form"  href="/role/edit?rid=${role.id}">修改</a>
						<a class="btn btn-default" data-toggle="dialog" data-width="800" data-height="400" data-id="dialog" href="/role/authority?id=${role.id}&name=${role.social}">分配权限</a>
						</td>
					</tr>
				</c:forEach>
        </tbody>
    </table>
</div>
<div class="bjui-pageFooter">
    <div class="pages">
        <span>&nbsp;共 ${pager.totalRow} 条</span>
    </div>
    <div class="pagination-box" data-toggle="pagination" data-total="${pager.totalRow}" data-page-size="${pager.pageSize}" data-page-current="1">
    </div>
</div>