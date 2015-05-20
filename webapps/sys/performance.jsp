<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="/order/performance" method="post">
        <input type="hidden" name="pageSize" value="${(pager.pageSize)}">
        <input type="hidden" name="pageCurrent" value="${(pager.pageNumber)}">
    </form>
</div>
<div class="bjui-pageContent">
    <table class="table table-bordered table-hover table-striped table-top" data-selected-multi="true">
        <thead>
            <tr>
                  <th data-order-field="operation" align="center">id</th>
                <th data-order-field="name">用户名称</th>
                <th>购买日期</th>
                <th>分类</th>
                <th data-order-field="sex">产品</th>
                <th data-order-field="birthday">金额</th>
                  <c:if test="${sessionScope.role  eq '3'}"> 
                <th data-order-field="birthplace">业务员</th>
                </c:if>
                  <c:if test="${sessionScope.role  eq '2'}"> 
                <th data-order-field="add"  align="center">代理商</th>
                </c:if>
                  <c:if test="${sessionScope.role  eq '1'}"> 
                <th data-order-field="add"  align="center">分公司</th>
                </c:if>
            </tr>
        </thead>
        <tbody>
				<c:forEach items="${performance}" var="performance">
					<tr>
						<td>${performance.id}</td>
						<td>${performance.nickname}</td>
						<td>${performance.createdatetime}</td>
						<td>${performance.ptoducti}</td>
						<td>${performance.productid}</td>
						<td>${performance.montey}</td>
						   <c:if test="${sessionScope.role  eq '3'}"> 
						<td>${performance.businessid}</td>
						</c:if>
						   <c:if test="${sessionScope.role  eq '2'}"> 
						<td>${performance.agentid}</td>
						   </c:if>
						   <c:if test="${sessionScope.role  eq '1'}"> 
						<td>${performance.filialeid}</td>
						</c:if>
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