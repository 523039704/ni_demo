<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   
<div class="bjui-pageContent">
    <form action="${pageContext.request.contextPath}/role/update" class="pageForm" data-toggle="validate">
        <input type="hidden" name="dialog.id" value="edce142bc2ed4ec6b623aacaf602a4de">
        <table class="table table-condensed table-hover">
            <tbody>
                <tr>
                    <td> 
						<input type=hidden id="sid" name="sid" value="${id}">  
                        <label for="j_custom_color" class="control-label x85">角色名称：</label>
                        <input type="text" name="social" id="social"  value="${(role.social)}" data-rule="required"  size="15"  >
                    </td>
                </tr>
                <tr>
                    
                    <td>
						 
                        <label for="j_custom_color" class="control-label x85">对应的服务费率：</label>
                        <input type="text" name="serve" id="serve"  value="${(role.serve)}" data-rule="required"  size="15"  >
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