<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="/product" method="post">
        <input type="hidden" name="pageSize" value="${(pager.pageSize)}">
        <input type="hidden" name="pageCurrent" value="${(pager.pageNumber)}">
        <input type="hidden" name="orderField" value="${param.orderField}">
        <input type="hidden" name="orderDirection" value="${param.orderDirection}">
        <div class="bjui-searchBar">
            <label>所属业务:</label>
            <select name="type" data-toggle="selectpicker">
                <option value="">全部</option>
                <option value="1">联络</option>
                <option value="2">住宿</option>
                <option value="3">餐饮</option>
                <option value="4">交通</option>
            </select>&nbsp;
            <label>护照号：</label><input type="text" id="customNo" value="" name="code" class="form-control" size="10">&nbsp;
            <label>客户姓名：</label><input type="text" value="" name="name" class="form-control" size="8">&nbsp;
            <input type="checkbox" id="j_table_chk" value="true" data-toggle="icheck" data-label="我的客户">
            <button type="button" class="showMoreSearch" data-toggle="moresearch" data-name="custom"><i class="fa fa-angle-double-down"></i></button>
            <button type="submit" class="btn-default" data-icon="search">查询</button>&nbsp;
            <a class="btn btn-orange" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">清空查询</a>
            <div class="pull-right">
                <button type="button" class="btn-blue" data-url="ajaxDone2.html?id={#bjui-selected}" data-toggle="doajax" data-confirm-msg="确定要删除选中项吗？" data-icon="remove" title="可以在控制台(network)查看被删除ID">删除选中行</button>&nbsp;
                <div class="btn-group">
                    <button type="button" class="btn-default dropdown-toggle" data-toggle="dropdown" data-icon="copy">复选框-批量操作<span class="caret"></span></button>
                    <ul class="dropdown-menu right" role="menu">
                        <li><a href="book1.xlsx" data-toggle="doexport" data-confirm-msg="确定要导出信息吗？">导出<span style="color: green;">全部</span></a></li>
                        <li><a href="book1.xlsx" data-toggle="doexportchecked" data-confirm-msg="确定要导出选中项吗？" data-idname="expids" data-group="ids">导出<span style="color: red;">选中</span></a></li>
                        <li class="divider"></li>
                        <li><a href="ajaxDone2.html" data-toggle="doajaxchecked" data-confirm-msg="确定要删除选中项吗？" data-idname="delids" data-group="ids">删除选中</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="bjui-moreSearch">
            <label>职业：</label><input type="text" value="" name="profession" size="15" />
            <label>&nbsp;性别:</label>
            <select name="sex" data-toggle="selectpicker">
                <option value="">全部</option>
                <option value="true">男</option>
                <option value="false">女</option>
            </select>
            <label>&nbsp;手机:</label>
            <input type="text" value="" name="mobile" size="10">
        </div>
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
                <th>起点金额(万元)</th>
                <th width="100">操作</th>
            </tr>
        </thead>
        <tbody>
				<c:forEach items="${product}" var="product">
					<tr>
						<td  "  align="center">${product.id}</td>
						<td  >${product.name}</td>
						<td  >${product.longtime}</td>
						<td  >${product.small_mony}</td>
						<td  >${product.small_mony}</td>
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