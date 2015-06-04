<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">
function validateCallback(form, callback) {  
    var $form = $(form);  
    //验证表单如果有非法字段 返回  
    if (!$form.valid()) {  
        return false;  
    }  
        //Ajax向后台提交数据  
    $.ajax({  
        type: form.method || 'POST',  
        url:$form.attr("action"),  
        //获取表单的内容数据  
        data:$form.serializeArray(),  
        dataType:"json",  
        cache: false,  
        //执行回调函数  
        success: callback || DWZ.ajaxDone,  
        error: DWZ.ajaxError  
    });  
        //保证不会通过普通表单提交  
        return false;  
}  
</script>

<div class="bjui-pageContent">
    <form action="api/saveorupdate" method="post" onsubmit="return validateCallback(this,navTabAjaxDone)" class="pageForm" data-toggle="validate">
        <table class="table table-condensed table-hover">
            <tbody>
                <tr>
                    <td colspan="2" align="center"><h3>微信配置编辑</h3></td>
                </tr>
                
                <input type="hidden" name="id" id="id" value="${dialog.id}" data-rule="required;id" size="20">
                <tr>
                    <td>
                        <label for="appId" class="control-label x90">appId：</label>
                        <input type="text" name="appId" id="appId" value="${dialog.appId}" data-rule="required;appId" size="20">
                    </td>
                    <td>
                        <label for="token" class="control-label x85">token：</label>
                        <input type="text" name="token" id="token" value="${dialog.token}" data-rule="required;token" size="20">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="appSecret" class="control-label x90">appSecret：</label>
                        <input type="text" name="appSecret" id="appSecret" value="${dialog.appSecret}" data-rule="required;appSecret" size="20">
                    </td>
                    <td>
                        <label for="encryptMessage" class="control-label x85">encryptMessage：</label>
                        <input type="text" name="encryptMessage" id="encryptMessage" value="${dialog.encryptMessage}" data-rule="required;encryptMessage" size="20">
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