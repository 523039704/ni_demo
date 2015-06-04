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
                <th data-order-field="name">最小金额值</th>
                <th>最大金额值</th>
                <th>收益率</th>
                <th align="center">操作</th>
            </tr>
        </thead>
        <tbody>
					<c:forEach items="${range}" var="range">
					<tr>
						<td>${range.id}</td>
						<td>${range.amount_min}</td>
						<td>${range.amount_max}</td>
						<td>${range.income}</td>
						<td>
                   			 <a href="/range/edit?id=${range.id}" class="btn btn-green" data-toggle="navtab" data-id="form" >编辑</a>
							 <a class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？"  href="/range/delete?id=${range.id}">删</a>
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