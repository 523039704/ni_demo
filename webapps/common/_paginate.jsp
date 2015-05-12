<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<c:if test="${urlParas == null}">
	<c:set var="urlParas" value="" />
</c:if>
<c:if test="${(totalPage > 0) && (currentPage <= totalPage)}">
	<c:set var="startPage" value="${currentPage - 4}" />
	<c:if test="${startPage < 1}" >
		<c:set var="startPage" value="1" />
	</c:if>
	<c:set var="endPage" value="${currentPage + 4}" />
	<c:if test="${endPage > totalPage}" >
		<c:set var="endPage" value="totalPage" />
	</c:if>
	
	 <div class="panel-foot text-center">
		<c:if test="${currentPage <= 8}">
			<c:set var="startPage" value="1" />
		</c:if>
		
		<c:if test="${(totalPage - currentPage) < 8}">
			<c:set var="endPage" value="${totalPage}" />
		</c:if>
		
		<c:choose>
			<c:when test="${currentPage == 1}">
			 <ul class="pagination"  ><li class="active"><a><span class="disabled prev_page">上一页</span> </a>	</li></ul>
			</c:when>
			<c:otherwise>
			 <ul class="pagination"><li><a href="${actionUrl}${currentPage - 1}${urlParas}?username=${param.username}&phone=${param.phone}&reservation=${param.reservation}" class="prev_page">上一页</a></li></ul>
			</c:otherwise>
		</c:choose>
		
		<c:if test="${currentPage > 8}">
			<a href="${actionUrl}${1}${urlParas}">${1}</a>
			<a href="${actionUrl}${2}${urlParas}">${2}</a>
			<span class="gap">…</span>
		</c:if>
		     <ul class="pagination pagination-group">
		<c:forEach begin="${startPage}" end="${endPage}" var="i">
			<c:choose>
				<c:when test="${currentPage == i}">
				   <li class="active">	<a> ${i}</a> </li>
				</c:when>
				<c:otherwise>
				   <li >	<a href="${actionUrl}${i}${urlParas}?username=${param.username}&phone=${param.phone}&reservation=${param.reservation}">${i}</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		</ul>
		<c:if test="${(totalPage - currentPage) >= 8}">
			<span class="gap">…</span>
			<a href="${actionUrl}${totalPage - 1}${urlParas}">${totalPage - 1}</a>
			<a href="${actionUrl}${totalPage}${urlParas}">${totalPage}</a>
		</c:if>
		
		<c:choose>
			<c:when test="${currentPage == totalPage}">
		 <ul class="pagination"><li  class="active"><a >		<span class="disabled next_page">下一页</span></a></li></ul>
			</c:when>
			<c:otherwise>
		 <ul class="pagination"><li>		<a href="${actionUrl}${currentPage + 1}${urlParas}?username=${param.username}&phone=${param.phone}&reservation=${param.reservation}" class="next_page" rel="next">下一页</a></li></ul>
			</c:otherwise>
		</c:choose>
	</div>
</c:if>