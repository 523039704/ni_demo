<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="/course" method="post">
        <input type="hidden" name="pageSize" value="${(pager.pageSize)}">
        <input type="hidden" name="pageCurrent" value="${(pager.pageNumber)}">
    </form>
</div>
<div class="bjui-pageContent">
    <table class="table table-bordered table-hover table-striped table-top" data-selected-multi="true">
        <thead>
            <tr>
                  <th data-order-field="operation" align="center">id</th>
                <th data-order-field="name">用户名</th>
                <th>用户电话</th>
                <th>用户邮箱</th>
                <th>类型</th>
                <th>金额</th>
                <th>状态</th>
                 
                <th data-order-field="add"  align="center">操作</th>
                
            </tr>
        </thead>
        <tbody>
					<c:forEach items="${subscribe}" var="subscribe">
					<tr>
						<td >${subscribe.id}</td>
						<td>${subscribe.nickname}</td>
						<td>${subscribe.phone}</td>
						<td>${subscribe.email}</td>
						<td>
						 <c:if test="${subscribe.type  eq '1'}"> 
							募捐
						 </c:if>
					   <c:if test="${subscribe.type  eq '2'}"> 
							基金
						</c:if>
						</td>
						<td>${subscribe.price}</td>
						<td>
				       <c:if test="${subscribe.status  eq '-1'}"> 
						认领 
						</c:if>
						  <c:if test="${subscribe.status  eq '0'}"> 
						 已认领
						</c:if>
						</td>
						<td  width="200">
						  <c:if test="${subscribe.status  eq '-1'}"> 
                   			 <a href="/subscribe/update?id=${subscribe.id}" class="btn btn-green"  data-toggle="doajax" >认领</a>
                   			 </c:if>
                   			  <c:if test="${subscribe.status  eq '0'}"> 
                   			 <button>认领</button>
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