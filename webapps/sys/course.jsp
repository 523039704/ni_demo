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
                <th data-order-field="name">课程名称</th>
                <th>起购日期</th>
                <th>截止日期</th>
                <th>金额</th>
                <th>地区</th>
                <th>费率</th>
                <th data-order-field="add"  align="center">操作</th>
            </tr>
        </thead>
        <tbody>
					<c:forEach items="${course}" var="course">
					<tr>
						<td >${course.id}</td>
						<td>${course.name}</td>
						<td>${course.createdatetime}</td>
						<td>${course.coursedatetime}</td>
						<td>${course.price}</td>
						<td>${course.peoples}</td>
						<td>${course.service}</td>
						<td  width="200">
						   <c:if test="${sessionScope.role  eq '1'}"> 
                   			 <a href="/course/edit?sid=1&id=${course.id}" class="btn btn-green"  data-toggle="navtab" data-id="form" >编辑</a>
                  			 <a href="/course/delete?id=${course.id}" class="btn btn-red" data-toggle="doajax"  >删</a>
                   			 </c:if>
                   			 <a href="/course/edit?sid=0&id=${course.id}" class="btn btn-green"  data-toggle="navtab" data-id="form" >详情</a>
                   			 <a  class="btn btn-default" href="/order/add?id=${course.id}&ptoducti=2" data-toggle="navtab" data-id="form">认购</a>
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