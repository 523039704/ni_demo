<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
     <script>
 	$(document).ready(function() {
         var hour=$("#username1")[0].value.split(","); 
           	for(var i=0;i < hour.length;i++){    //循环
          		 $("input:checkbox[value='"+hour[i]+"']").attr('checked','true');
                    	}
 	});              	 
   		 </script>
<div class="bjui-pageContent">
    <form action="${pageContext.request.contextPath}/role/add" class="pageForm" data-toggle="validate">
        <input type="hidden" name="dialog.id" value="edce142bc2ed4ec6b623aacaf602a4de">
        <table class="table table-condensed table-hover">
            <tbody>
                <tr>
                    <td colspan="2" align="center"><h3>给：${names}——分配权限</h3></td>
                </tr>
                <tr>
                    <td>
                        <label for="j_dialog_visa" class="control-label x85">名称：</label>
                    	<input type="hidden" name="username1" id="username1"	value="${auts}" />
							<input type="hidden" name="ids" id="ids"	value="${ids}" />
								<c:forEach items="${authority}" var="authority">
                       			 <input type="checkbox" name="authorityid" id="authorityid" value="${authority.id}"  data-toggle="icheck" data-label="${authority.name}">
                       		 </c:forEach>
                    </td>
                </tr>
            </tbody>
        </table>
    </form>
</div>
<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close">关闭</button></li>
        <li><button type="submit" class="btn-default">保存</button></li>
    </ul>
</div>