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
                <th>名字</th>
                <th>金额</th>
                <th>状态</th>
                <th data-order-field="add"  align="center">操作</th>
            </tr>
        </thead>
        <tbody>
					<c:forEach items="${embody}" var="embody">
					<tr>
						<td>${embody.id}</td>
						<td>${embody.uid}</td>
						<td>${embody.price}</td>
						<td>${embody.status}</td>
						<td>
                   			 <a href="/embody/edit?id=${embody.id}" class="btn btn-green"   data-toggle="navtab" data-id="form">编辑</a>
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
    <div class="pagination-box"  data-toggle="pagination" data-total="${pager.totalRow}" data-page-size="${pager.pageSize}" data-page-current="1">
    </div>
</div>