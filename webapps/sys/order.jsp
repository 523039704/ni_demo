<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="/order" method="post">
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
                <th data-order-field="name">用户名称</th>
                <th>购买日期</th>
                <th>分类</th>
                <th data-order-field="sex">产品</th>
                <th data-order-field="birthday">金额</th>
                <th data-order-field="birthday">费率</th>
                <th data-order-field="birthday">状态</th>
                <th data-order-field="birthplace">业务员</th>
                   <c:if test="${sessionScope.role  eq '2'||sessionScope.role  eq '3'}"> 
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
						<td>${order.serviceid}</td>
						<td>
							<c:if test="${order.status ==0}">未付款</c:if>   
							<c:if test="${order.status ==1}">已付款</c:if>   
							<c:if test="${order.status ==2}">审核通过</c:if>   
							<c:if test="${order.status ==-1}">审核失败</c:if>   
						
						</td>
						<td>${order.businessid}</td>
						<td>
						   <c:if test="${sessionScope.role  eq '2'||sessionScope.role  eq '3'}"> 
                   			 <a href="#" class="btn btn-green" data-toggle="navtab" data-id="form" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="编辑-孙悟空">审核</a>
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