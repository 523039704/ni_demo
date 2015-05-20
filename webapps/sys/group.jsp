<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
 
//删除回调
$('#tabledit1').on('afterdelete.bjui.tabledit', function(e) {
    var $tbody = $(e.relatedTarget)
    
    console.log('你删除了一条数据，还有['+ $tbody.find('> tr').length +']条数据！')
})
</script>
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="/group" method="post">
         <input type="hidden" name="pageSize" value="${(pager.pageSize)}">
         <input type="hidden" name="pageCurrent" value="${(pager.pageNumber)}">
        <div class="bjui-searchBar">
            <div class="alert alert-info search-inline"><i class="fa fa-info-circle"></i> 双击行可编辑</div>&nbsp;
        </div>
    </form>
</div>
<div class="bjui-pageContent">
    <form action="/group/ope" id="j_custom_form" class="pageForm" data-toggle="validate" method="post">
        <table id="tabledit1" class="table table-bordered table-hover table-striped table-top" data-toggle="tabledit" data-initnum="0" data-action="/group/ope" data-single-noindex="true">
            <thead>
                <tr data-idname="customList[#index#].id">
                    <th title="id"><input type="text" name="id" class="no" data-rule="required" value="" size="2"></th>
                    <th title="组名"><input type="text" name="name" data-rule="required" value="" size="5"></th>
                    <th title="组长名字"></th>
                    <th title="组员人数"></th>
                    <th title="" data-addtool="true" width="100">
                        <a href="javascript:;" class="btn btn-green" data-toggle="dosave">保存</a>
                        <a href="/group" class="btn btn-red row-del" data-confirm-msg="确定要删除该行信息吗？">删</a>
                    </th>
                </tr>
            </thead>
            <tbody>
            	<c:forEach items="${group}" var="group">
                <tr>
                    <td data-id-val="1">${group.id}</td>
                    <td>${group.name}</td>
                    <td>${group.groupid}</td>
                    <td>${group.people}</td>
                    <td data-noedit="true">
                        <button type="button" class="btn-green" data-toggle="doedit">编辑</button>
               <%--          <a href="/group/delete?id=${group.id}" class="btn btn-red row-del" data-confirm-msg="确定要删除该行信息吗？">删</a> --%>
                    </td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
    </form>
</div>
<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">取消</button></li>
        <li><button type="submit" class="btn-default" data-icon="save">全部保存</button></li>
    </ul>
     <div class="pages">
        <span>&nbsp;共 ${pager.totalRow} 条</span>
    </div>
    <div class="pagination-box" data-toggle="pagination" data-total="${pager.totalRow}" data-page-size="${pager.pageSize}" data-page-current="1">
    </div>
</div>