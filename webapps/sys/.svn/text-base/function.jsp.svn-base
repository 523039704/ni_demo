<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="/function" method="post">
        <input type="hidden" name="pageSize" value="${(pager.pageSize)}">
        <input type="hidden" name="pageCurrent" value="${(pager.pageNumber)}">
    </form>
</div>
<div class="bjui-pageContent">
    <table class="table table-bordered table-hover table-striped table-top" data-selected-multi="true">
        <thead>
            <tr>
                  <th data-order-field="operation" align="center">id</th>
                <th data-order-field="name">名称</th>
                <th>路径</th>
                <th data-order-field="add"  align="center">操作</th>
            </tr>
        </thead>
        <tbody>
					<c:forEach items="${function}" var="function">
					<tr>
						<td>${function.id}</td>
						<td>${function.name}</td>
						<td>${function.path}</td>
						<td>
                   			 <a href="/function/edit?id=${function.id}" class="btn btn-green"  data-toggle="navtab" data-id="form">编辑</a>
                   			  <c:if test="${sessionScope.role  eq '100'}"> 
                  			 <a href="/function/delete?id=${function.id}" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                  			 </c:if>
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