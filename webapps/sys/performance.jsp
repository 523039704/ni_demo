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
                <th>分类</th>
                <th data-order-field="sex">产品</th>
                <th data-order-field="birthday">金额</th>
                  <c:if test="${sessionScope.role  eq '4'}">
                <th data-order-field="add"  align="center">业务员应得服务费</th> 
                </c:if>
                  <c:if test="${sessionScope.role  eq '3'}">
                <th data-order-field="add"  align="center">代理商应得服务费</th> 
                <th data-order-field="birthplace">业务员</th>
                </c:if>
                  <c:if test="${sessionScope.role  eq '2'}"> 
                     <th data-order-field="add"  align="center">分公司应得服务费</th>
                <th data-order-field="add"  align="center">代理商</th>
                </c:if>
                  <c:if test="${sessionScope.role  eq '1'}"> 
                <th data-order-field="add"  align="center">总公司应得服务费</th>
                <th data-order-field="add"  align="center">分公司</th>
                </c:if>
                
                 <c:if test="${sessionScope.role  eq '4'||sessionScope.role  eq '2'||sessionScope.role  eq '3'}"> 
                <th data-order-field="add"  align="center">操作</th>
                </c:if>
            </tr>
        </thead>
        <tbody>
				<c:forEach items="${performance}" var="performance">
					<tr>
						<td>${performance.id}</td>
						<td> 
							<c:if test="${performance.ptoducti ==1}">基金产品</c:if>   
							<c:if test="${performance.ptoducti ==2}">专家课程</c:if>   
							<c:if test="${performance.ptoducti ==3}">P2P理财</c:if>   
						</td>
						<td>${performance.productid}</td>
						<td>${performance.montey}</td>
						  <c:if test="${sessionScope.role  eq '4'}"> 
						   <td>${performance.business}</td>
						</c:if>
						   <c:if test="${sessionScope.role  eq '3'}"> 
						   <td>${performance.agent}</td>
							<td>${performance.businessid}</td>
						</c:if>
						   <c:if test="${sessionScope.role  eq '2'}"> 
						   <td>${performance.filiale}</td>
							<td>${performance.agentid}</td>
						   </c:if>
						   <c:if test="${sessionScope.role  eq '1'}"> 
						<td>${performance.admin}</td>
						<td>${performance.filialeid}</td>
						</c:if>
						 <c:if test="${sessionScope.role  eq '4'}"> 
						<td>
                   			 <a class="btn btn-red" data-toggle="doajax"    href="/embody/embody_add?price=${performance.business}&id=${performance.id}&time=${performance.overdate}">提现</a>
               			 </td>
                            </c:if>
                             <c:if test="${sessionScope.role  eq '3'}"> 
						<td>
                   			 <a class="btn btn-red" data-toggle="doajax"    href="/embody/embody_add?price=${performance.agent}&id=${performance.id}&time=${performance.overdate}">提现</a>
               			 </td>
                            </c:if>
                             <c:if test="${sessionScope.role  eq '2'}"> 
						<td>
                   			 <a class="btn btn-red" data-toggle="doajax"    href="/embody/embody_add?price=${performance.filiale}&id=${performance.id}&time=${performance.overdate}">提现</a>
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