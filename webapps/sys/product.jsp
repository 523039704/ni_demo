<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="/product" method="post">
        <input type="hidden" name="pageSize" value="${(pager.pageSize)}">
        <input type="hidden" name="pageCurrent" value="${(pager.pageNumber)}">
    </form>
</div>
<div class="bjui-pageContent">
    <table class="table table-bordered table-hover table-striped table-top" data-selected-multi="true">
        <thead>
            <tr>
                <th data-order-field="operation" align="center">id</th>
                <th  >产品名字</th>
                <th>期限(月)</th>
                <th>起点金额(万元)</th>
                <th>收益</th>
                <th width="100">操作</th>
            </tr>
        </thead>
        <tbody>
				<c:forEach items="${product}" var="product">
					<tr>
						<td  align="center">${product.id}</td>
						<td  >${product.name}</td>
						<td  >${product.longtime}</td>
						<td  >${product.small_mony}</td>
						<td  >${product.income}</td>
						<td  width="200">
						   <c:if test="${sessionScope.role  eq '1'}"> 
						<a  class="btn btn-default" data-toggle="navtab" data-id="form"   href="/product/edit?sid=1&id=${product.id}">修改</a>
						<a  class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？"  href="/product/delete?id=${product.id}">删</a>
						</c:if>
						<a  class="btn btn-default" data-toggle="navtab" data-id="form"   href="/product/edit?sid=0&id=${product.id}">详情</a>
						<a  class="btn btn-default" href="/order/add?id=${product.id}&ptoducti=1" data-toggle="navtab" data-id="form">认购</a>
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