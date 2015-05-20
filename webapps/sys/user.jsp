<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="/user" method="post">
        <input type="hidden" name="pageSize" value="${(pager.pageSize)}">
        <input type="hidden" name="pageCurrent" value="${(pager.pageNumber)}"> 
        <div class="bjui-searchBar">
            <label>客户姓名：</label><input type="text" value="" name="name" class="form-control" size="8">&nbsp;
            <button type="submit" class="btn-default" data-icon="search">查询</button>&nbsp;
            <a class="btn btn-orange" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">清空查询</a>
        </div>
    </form>
</div>
<div class="bjui-pageContent">
    <table class="table table-bordered table-hover table-striped table-top" data-selected-multi="true"id="table1">
        <thead>
            <tr>
                <th data-order-field="operation" align="center">id</th>
                <th data-order-field="name">登陆名字</th>
                <th>简称</th>
                <th>电话</th>
                <th data-order-field="sex">注册时间</th>
                <th data-order-field="birthday">拥有的人数</th>
                <th data-order-field="birthplace">角色</th>
                <th data-order-field="add"  align="center">有无申请</th>
                <th width="100">操作</th>
            </tr>
        </thead>
        <tbody>
			<c:forEach items="${blogPage}" var="blog">
					<tr>
						<td>${blog.admin_id}</td>
						<td>${blog.adminname}</td>
						<td>${blog.nickname}</td>
						<td>${blog.phone}</td>
						<td>${blog.add_time}</td>
						<td><a data-toggle="navtab" data-id="form"  href="${pageContext.request.contextPath}/user?id=${blog.admin_id}">拥有的人数：${blog.amount}</a></td>
						<td> 
							<c:if test="${blog.role ==1}">系统管理者</c:if>     
							<c:if test="${blog.role ==2}"> 分公司</c:if>     
							<c:if test="${blog.role ==3}"> 分销商</c:if>     
							<c:if test="${blog.role ==4}"> 业务员</c:if>     
							<c:if test="${blog.role ==5}"> 普通用户</c:if>     
						</td>
						<td>
						<c:if test="${blog.apply ==0}">无</c:if>   
						<c:if test="${blog.apply ==1}">有</c:if>   
						</td>
						<td>
						<a class="btn btn-default" data-toggle="navtab" data-id="form"   href="/user/edit?id=${blog.admin_id}">修改</a><%-- 
						<a class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？"  href="/user/delete?id=${blog.admin_id}">删</a> --%>
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