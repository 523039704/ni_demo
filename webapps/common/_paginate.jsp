<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<div class="pagelist">
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
	
		<c:if test="${currentPage <= 8}">
			<c:set var="startPage" value="1" />
		</c:if>
		
		<c:if test="${(totalPage - currentPage) < 8}">
			<c:set var="endPage" value="${totalPage}" />
		</c:if>
		
		<c:choose>
			<c:when test="${currentPage == 1}">
			 <span  class="nextPage">上一页</span> 
			</c:when>
			<c:otherwise>
			 <a href="${actionUrl}${currentPage - 1}${urlParas}?username=${param.username}&phone=${param.phone}&reservation=${param.reservation}"  class="nextPage">上一页</a> 
			</c:otherwise>
		</c:choose>
		
		<c:if test="${currentPage > 8}">
			<a href="${actionUrl}${1}${urlParas}">${1}</a>
			<a href="${actionUrl}${2}${urlParas}">${2}</a>
			<span class="gap">…</span>
		</c:if>
		<c:forEach begin="${startPage}" end="${endPage}" var="i">
			<c:choose>
				<c:when test="${currentPage == i}">
				  ${i} 
				</c:when>
				<c:otherwise>
			 	<a href="${actionUrl}${i}${urlParas}?username=${param.username}&phone=${param.phone}&reservation=${param.reservation}">${i}</a> 
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${(totalPage - currentPage) >= 8}">
			<span class="gap">…</span>
			<a href="${actionUrl}${totalPage - 1}${urlParas}">${totalPage - 1}</a>
			<a href="${actionUrl}${totalPage}${urlParas}">${totalPage}</a>
		</c:if>
		
		<c:choose>
			<c:when test="${currentPage == totalPage}">
	 		<span  class="nextPage">下一页</span> 
			</c:when>
			<c:otherwise>
		 <a href="${actionUrl}${currentPage + 1}${urlParas}?username=${param.username}&phone=${param.phone}&reservation=${param.reservation}" class="nextPage" rel="next">下一页</a> 
			</c:otherwise>
		</c:choose>
</c:if>
</div>