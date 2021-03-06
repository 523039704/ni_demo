<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="/order" method="post">
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
                <th>金额</th>
                <th>期限</th>
                <th>总公司服务费</th>
                <th>分公司服务费</th>
                <th>代理商服务费</th>
                <th>业务员服务费</th>
                <th>状态</th>
                <th>业务员</th>
                   <c:if test="${sessionScope.role  eq '100'||sessionScope.role  eq '200'||sessionScope.role  eq '300'}"> 
                <th data-order-field="add"  align="center">操作</th>
                </c:if>
            </tr>
        </thead>
        <tbody>
				<c:forEach items="${order}" var="order">
					<tr>
						<td>${order.id}</td>
						<td>${order.nickname}</td>
						<td>${order.createdatetime}</td>
						<td> 
							<c:if test="${order.ptoducti ==1}">基金产品</c:if>   
							<c:if test="${order.ptoducti ==2}">专家课程</c:if>   
							<c:if test="${order.ptoducti ==3}">P2P理财</c:if>   
						</td>
						<td>${order.productid}</td>
						<td>${order.montey}</td>
						<td>${order.longtime}</td>
						<td>${order.admin}</td>
						<td>${order.filiale}</td>
						<td>${order.agent}</td>
						<td>${order.business}</td>
						<td>
							<c:if test="${order.status ==0}">未付款</c:if>   
							<c:if test="${order.status ==1}">已付款</c:if>   
							<c:if test="${order.status ==2}">审核通过</c:if>   
							<c:if test="${order.status ==-1}">审核失败</c:if>   
						
						</td>
						<td>${order.businessid}</td>
						   <c:if test="${sessionScope.role  eq '100'||sessionScope.role  eq '200'||sessionScope.role  eq '300'}"> 
						<td>
                   			 <a class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要修改此行状态吗？"  href="#">审核</a>
               			 </td>
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